package com.welisit.crowd.util;

import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.common.comm.ResponseMessage;
import com.aliyun.oss.model.PutObjectResult;
import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.google.gson.Gson;
import com.welisit.crowd.constant.CrowdConstant;

public class CrowdUtil {
	
	/**
	 * 专门负责上传文件到OSS服务器的工具方法
	 * @param endpoint			OSS参数
	 * @param accessKeyId		OSS参数
	 * @param accessKeySecret	OSS参数
	 * @param inputStream		要上传的文件的输入流
	 * @param bucketName		OSS参数
	 * @param bucketDomain		OSS参数
	 * @param originalName		要上传的文件的原始文件名
	 * @return	包含上传结果以及上传的文件在OSS上的访问路径
	 */
	public static ResultEntity<String> uploadFileToOss(
			String endpoint, 
			String accessKeyId, 
			String accessKeySecret,
			InputStream inputStream,
			String bucketName,
			String bucketDomain,
			String originalName) {
		
		// 创建OSSClient实例。
		OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
		
		// 生成上传文件的目录
		String folderName = new SimpleDateFormat("yyyyMMdd").format(new Date());
		
		// 生成上传文件在OSS服务器上保存时的文件名
		// 原始文件名：beautfulgirl.jpg
		// 生成文件名：wer234234efwer235346457dfswet346235.jpg
		// 使用UUID生成文件主体名称
		String fileMainName = UUID.randomUUID().toString().replace("-", "");
		
		// 从原始文件名中获取文件扩展名
		String extensionName = originalName.substring(originalName.lastIndexOf("."));
		
		// 使用目录、文件主体名称、文件扩展名称拼接得到对象名称
		String objectName = folderName + "/" + fileMainName + extensionName;
		
		try {
			// 调用OSS客户端对象的方法上传文件并获取响应结果数据
			PutObjectResult putObjectResult = ossClient.putObject(bucketName, objectName, inputStream);
			
			// 从响应结果中获取具体响应消息
			ResponseMessage responseMessage = putObjectResult.getResponse();
			
			// 根据响应状态码判断请求是否成功
			if(responseMessage == null) {
				
				// 拼接访问刚刚上传的文件的路径
				String ossFileAccessPath = bucketDomain + "/" + objectName;
				
				// 当前方法返回成功
				return ResultEntity.successWithData(ossFileAccessPath);
			} else {
				// 获取响应状态码
				int statusCode = responseMessage.getStatusCode();
				
				// 如果请求没有成功，获取错误消息
				String errorMessage = responseMessage.getErrorResponseAsString();
				
				// 当前方法返回失败
				return ResultEntity.failed("当前响应状态码="+statusCode+" 错误消息="+errorMessage);
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			// 当前方法返回失败
			return ResultEntity.failed(e.getMessage());
		} finally {
			
			if(ossClient != null) {
				
				// 关闭OSSClient。
				ossClient.shutdown();
			}
		}
		
	}
	
	
	/**
	 * 阿里云发送短信服务 发送验证码
	 * @param accessKeyId 阿里云服务的认证keyId和秘钥
	 * @param accessSecret
	 * @param sendDomain 阿里云短信服务域名
	 * @param phoneNumbers 发送手机号
	 * @param signName 短信签名
	 * @param templateCode 模板CODE
	 * @param templateParam 模板参数 json字符串
	 * @return
	 */
	public static ResultEntity<String> sendCodeByShortMessage(
			String accessKeyId,
			String accessSecret,
			String sendDomain,
			String phoneNumbers,
			String signName,
			String templateCode
			){
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessSecret);
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        request.setSysMethod(MethodType.POST);
        request.setSysDomain(sendDomain);
        request.setSysVersion("2017-05-25");
        request.setSysAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", phoneNumbers);
        request.putQueryParameter("SignName", signName);
        request.putQueryParameter("TemplateCode", templateCode);
        
		// 生成随机验证码
		StringBuilder builder = new StringBuilder();
		for(int i = 0; i < 4; i++) {
			int random = (int) (Math.random() * 10);
			builder.append(random);
		}
		
		String code = builder.toString();
		
		// 封装验证码参数
		Map<String,String> paramMap = new HashMap<>();
		paramMap.put("code", code);
		String templateParam = new Gson().toJson(paramMap);
        
        request.putQueryParameter("TemplateParam", templateParam);
        try {
            CommonResponse response = client.getCommonResponse(request);
            if(response.getHttpStatus() == 200) {
            	String returnData = response.getData();
            	HashMap<String,String> returnDataMap = new Gson().fromJson(returnData, HashMap.class);
            	String returnCode = returnDataMap.get("Code");
            	String message = returnDataMap.get("Message");
            	if("OK".equals(returnCode)) {
            		// 成功返回验证码
            		return ResultEntity.successWithData(code);
            	}else {
            		return ResultEntity.failed(message);
            	}
            }
            return ResultEntity.failed("短信服务响应错误: " + response.getHttpStatus());
        } catch (ServerException e) {
            e.printStackTrace();
            return ResultEntity.failed("短信服务错误:" + e.getErrMsg());
        } catch (ClientException e) {
            e.printStackTrace();
            return ResultEntity.failed("短信发送错误:" + e.getErrMsg());
        }
	}
	
	/**
	 * 判断请求类型是否为ajax
	 * @param request
	 * @return
	 */
	public static boolean judgeRequestType(HttpServletRequest request) {
		// 1.获取请求消息头信息
		String acceptInformation = request.getHeader("Accept");
		String xRequestInformation = request.getHeader("X-Requested-With");
		
		// 2.检查并返回
		return
		(
		acceptInformation != null
		&&
		acceptInformation.contains("application/json")
		)
		||
		(
		xRequestInformation != null
		&&
		xRequestInformation.equals("XMLHttpRequest")
		);
	}
	
	/**
	 * 对明文字符串进行md5加密
	 * @param source 传入的明文字符串
	 * @return
	 */
	public static String md5(String source) {
		
		// 1. 判断source是否有效
		if(source == null || source.length() == 0) {
			
			throw new RuntimeException(CrowdConstant.MESSAGE_STRING_INVALIDATE);
		}
		
		// 3. 获取MessageDigest对象
		String algorithm = "md5";
		try {
			MessageDigest digest = MessageDigest.getInstance(algorithm);
			
			// 4. 获取明文字符串的字节数组
			byte[] input = source.getBytes();
			
			// 5. 加密
			byte[] output = digest.digest(input);
			
			// 6. 创建BigInteger对象存放加密后的字节数组
			int signum = 1;
			BigInteger bigInteger = new BigInteger(signum, output);
			
			// 7. 按照16进制将bigInteger转换为字符串
			int radix = 16;
			String encoded = bigInteger.toString(radix).toUpperCase();
			
			return encoded;
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
}
