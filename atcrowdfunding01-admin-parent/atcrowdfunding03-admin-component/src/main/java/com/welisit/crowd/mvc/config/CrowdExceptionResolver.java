package com.welisit.crowd.mvc.config;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.welisit.crowd.constant.CrowdConstant;
import com.welisit.crowd.exception.AccessForbiddenException;
import com.welisit.crowd.exception.LoginAcctAlreadyInUseException;
import com.welisit.crowd.exception.LoginAcctAlreadyInUseForUpdateException;
import com.welisit.crowd.exception.LoginFailedException;
import com.welisit.crowd.util.CrowdUtil;
import com.welisit.crowd.util.ResultEntity;

/**
 * 公共异常处理类
 * @author Welisit
 *
 */
@ControllerAdvice
public class CrowdExceptionResolver {
	
	/**
	 * 解析登录名已存在 异常
	 * @param exception
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ExceptionHandler(value = { LoginAcctAlreadyInUseForUpdateException.class })
	public ModelAndView resolveLoginAcctAlreadyInUseForUpdateException(Exception exception, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String viewName = "admin-edit";
		return commonResolveException(exception, request, response, viewName);
	}
	
	/**
	 * 解析登录名已存在 异常
	 * @param exception
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ExceptionHandler(value = { LoginAcctAlreadyInUseException.class })
	public ModelAndView resolveLoginAcctAlreadyInUseException(Exception exception, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String viewName = "admin-add";
		return commonResolveException(exception, request, response, viewName);
	}
	
	/**
	 * 解析访问拒绝异常
	 * @param exception
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ExceptionHandler(value = { AccessForbiddenException.class })
	public ModelAndView resolveAccessForbiddenException(Exception exception, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String viewName = "admin-login";
		return commonResolveException(exception, request, response, viewName);
	}
	
	/**
	 * 解析登录失败异常
	 * @param exception
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ExceptionHandler(value = { LoginFailedException.class })
	public ModelAndView resolveLoginFailedException(Exception exception, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String viewName = "admin-login";
		return commonResolveException(exception, request, response, viewName);
	}
	
	@ExceptionHandler(value = { AccessDeniedException.class })
	public ModelAndView resolveAccessDeniedException(Exception exception, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String viewName = "system-error";
		return commonResolveException(exception, request, response, viewName);
	}

	@ExceptionHandler(value = { ArithmeticException.class })
	public ModelAndView resolveMathException(Exception exception, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// 指定错误页面即可
		String viewName = "system-error";
		return commonResolveException(exception, request, response, viewName);
	}

	/**
	 * 核心的异常解析器
	 * @param exception 捕获的异常
	 * @param request 判断请求是ajax还是普通请求
	 * @param response 通过响应对象返回json数据
	 * @param viewName 视图名称，指定响应视图
	 * @return
	 * @throws IOException 
	 */
	private ModelAndView commonResolveException(
			Exception exception,
			HttpServletRequest request,
			HttpServletResponse response,
			String viewName) throws IOException {
		// 1. 判断当前请求类型
		boolean judgeResult = CrowdUtil.judgeRequestType(request);

		// 2. 如果是ajax请求，返回json数据
		if (judgeResult) {
			// 2.1 获取异常信息
			String message = exception.getMessage();

			// 2.2 创建返回实体对象
			ResultEntity<Object> resultEntity = ResultEntity.failed(message);

			// 2.3 将返回对象转换为json格式
			String json = new Gson().toJson(resultEntity);

			// 2.4 返回结果json
			response.getWriter().write(json);

			return null;
		}
		// 3. 如果是普通请求，返回错误页面
		ModelAndView mv = new ModelAndView();
		mv.addObject(CrowdConstant.ATTR_NAME_EXCEPTION, exception);
		mv.setViewName(viewName);
		return mv;
	}
}
