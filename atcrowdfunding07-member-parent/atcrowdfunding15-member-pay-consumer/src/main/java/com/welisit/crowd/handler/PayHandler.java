package com.welisit.crowd.handler;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.welisit.crowd.api.MySQLRemoteService;
import com.welisit.crowd.config.PayProperties;
import com.welisit.crowd.entity.vo.OrderProjectVO;
import com.welisit.crowd.util.ResultEntity;

@Controller
public class PayHandler {
	
	@Autowired
	private PayProperties payProperties;
	
	@Autowired
	private MySQLRemoteService mySQLRemoteService;
	
	private Logger logger = LoggerFactory.getLogger(PayHandler.class);
	
	@RequestMapping("/notify")
	public void notifyUrlMethod(HttpServletRequest request) throws UnsupportedEncodingException, AlipayApiException {
		
		//获取支付宝POST过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		
		boolean signVerified = AlipaySignature.rsaCheckV1(
				params, 
				payProperties.getAlipayPublicKey(), 
				payProperties.getCharset(), 
				payProperties.getSignType()); //调用SDK验证签名
	
		//——请在这里编写您的程序（以下代码仅作参考）——
		
		/* 实际验证过程建议商户务必添加以下校验：
		1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
		2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
		3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
		4、验证app_id是否为该商户本身。
		*/
		if(signVerified) {//验证成功
			//商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
			//交易状态
			String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
			
			logger.info("out_trade_no="+out_trade_no);
			logger.info("trade_no="+trade_no);
			logger.info("trade_status="+trade_status);
			
		}else {//验证失败
			//调试用，写文本函数记录程序运行情况是否正常
			//String sWord = AlipaySignature.getSignCheckContentV1(params);
			//AlipayConfig.logResult(sWord);
			
			logger.info("验证失败");
		}
		
	}
	
	@ResponseBody
	@RequestMapping("/return")
	public String returnUrlMethod(HttpServletRequest request, HttpSession session) throws AlipayApiException, UnsupportedEncodingException {
		// 获取支付宝GET过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		
		boolean signVerified = AlipaySignature.rsaCheckV1(
				params, 
				payProperties.getAlipayPublicKey(), 
				payProperties.getCharset(), 
				payProperties.getSignType()); //调用SDK验证签名
	
		// ——请在这里编写您的程序（以下代码仅作参考）——
		if(signVerified) {
			// 商户订单号
			String orderNum = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
			// 支付宝交易号
			String payOrderNum = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
			// 付款金额
			String orderAmount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
			
			// 保存到数据库
			// 1.从Session域中获取OrderVO对象
			OrderVO orderVO = (OrderVO) session.getAttribute("orderVO");
			
			// 2.将支付宝交易号设置到OrderVO对象中
			orderVO.setPayOrderNum(payOrderNum);
			
			// 3.发送给MySQL的远程接口
			ResultEntity<String> resultEntity = mySQLRemoteService.saveOrderRemote(orderVO);
			logger.info("Order save result="+resultEntity.getResult());
			
			return "trade_no:"+payOrderNum+"<br/>out_trade_no:"+orderNum+"<br/>total_amount:"+orderAmount;
		}else {
			
			// 页面显示信息：验签失败
			return "验签失败";
			
		}
	}
	
	// 这里必须加@ResponseBody注解，让当前方法的返回值成为响应体，在浏览器界面上显示支付宝支付界面
	@ResponseBody
	@RequestMapping("/generate/order")
	public String generateOrder(HttpSession session, OrderVO orderVO) throws AlipayApiException {
		
		// 1.从Session域获取orderProjectVO对象
		OrderProjectVO orderProjectVO = (OrderProjectVO) session.getAttribute("orderProjectVO");
		
		// 2.将orderProjectVO对象和orderVO对象组装到一起
		orderVO.setOrderProjectVO(orderProjectVO);
		
		// 3.生成订单号并设置到orderVO对象中
		// ①根据当前日期时间生成字符串
		String time = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// ②使用UUID生成用户ID部分
		String user = UUID.randomUUID().toString().replace("-", "").toUpperCase();
	
		// ③组装
		String orderNum = time + user;
		
		// ④设置到OrderVO对象中
		orderVO.setOrderNum(orderNum);
		
		// 4.计算订单总金额并设置到orderVO对象中
		Double orderAmount = (double) (orderProjectVO.getSupportPrice() * orderProjectVO.getReturnCount() + orderProjectVO.getFreight());
		orderVO.setOrderAmount(orderAmount);
		
		// ※将OrderVO对象存入Session域
		session.setAttribute("orderVO", orderVO);
		
		// 5.调用专门封装好的方法给支付宝接口发送请求
		return sendRequestToAliPay(orderNum, orderAmount, orderProjectVO.getProjectName(), orderProjectVO.getReturnContent());
		
	}
	
	/**
	 * 为了调用支付宝接口专门封装的方法
	 * @param outTradeNo	外部订单号，也就是商户订单号，也就是我们生成的订单号
	 * @param totalAmount	订单的总金额
	 * @param subject		订单的标题，这里可以使用项目名称
	 * @param body			商品的描述，这里可以使用回报描述
	 * @return				返回到页面上显示的支付宝登录界面
	 * @throws AlipayApiException
	 */
	private String sendRequestToAliPay(String outTradeNo, Double totalAmount, String subject, String body) throws AlipayApiException {
		//获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(
				payProperties.getGatewayUrl(), 
				payProperties.getAppId(), 
				payProperties.getMerchantPrivateKey(), 
				"json", 
				payProperties.getCharset(), 
				payProperties.getAlipayPublicKey(), 
				payProperties.getSignType());
		
		//设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(payProperties.getReturnUrl());
		alipayRequest.setNotifyUrl(payProperties.getNotifyUrl());
		
		alipayRequest.setBizContent("{\"out_trade_no\":\""+ outTradeNo +"\"," 
				+ "\"total_amount\":\""+ totalAmount +"\"," 
				+ "\"subject\":\""+ subject +"\"," 
				+ "\"body\":\""+ body +"\"," 
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		
		//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
		//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
		//		+ "\"total_amount\":\""+ total_amount +"\"," 
		//		+ "\"subject\":\""+ subject +"\"," 
		//		+ "\"body\":\""+ body +"\"," 
		//		+ "\"timeout_express\":\"10m\"," 
		//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
		
		//请求
		return alipayClient.pageExecute(alipayRequest).getBody();
		
	}

}
