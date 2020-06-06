package com.welisit.crowd.constant;

/**
 * 用常量管理属性名和异常信息
 * @author Welisit
 *
 */
public class CrowdConstant {
	public static final String ATTR_NAME_EXCEPTION = "exception";
	
	public static final String MESSAGE_LOGIN_FAILED = "抱歉！账号或密码错误！请重新输入";
	public static final String MESSAGE_LOGIN_ACCT_ALREADY_IN_USE = "抱歉！这个账号已经被使用了";
	public static final String MESSAGE_ACCESS_FORBIDEN = "请登录以后访问！";
	public static final String MESSAGE_STRING_INVALIDATE = "字符串不合法！不能为空";
	public static final String MESSAGE_SYSTEM_ERROR_LOGIN_NOT_UNIQUE = "系统错误：登录账号不唯一！";
	
	public static final String MESSAGE_CODE_NOT_EXISTS = "验证码已过期！请检查手机号是否正确或重新发送！";
	public static final String MESSAGE_CODE_INVALID = "验证码不正确！";
	
	public static final String MESSAGE_HEADER_PIC_UPLOAD_FAILED = "头图上传失败！";
	public static final String MESSAGE_HEADER_PIC_EMPTY = "头图不可为空！";
	public static final String MESSAGE_DETAIL_PIC_EMPTY = "详情图片不可为空！";
	public static final String MESSAGE_DETAIL_PIC_UPLOAD_FAILED = "详情图片上传失败！";

	public static final String ATTR_NAME_LOGIN_ADMIN = "loginAdmin";
	public static final String ATTR_NAME_LOGIN_MEMBER = "loginMember";
	
	public static final String ATTR_NAME_TEMPLE_PROJECT = "tempProject";

	public static final String ATTR_NAME_PAGE_INFO = "pageInfo";
	public static final String ATTR_NAME_MESSAGE = "message";
	/**
	 * 分页导航栏页数
	 */
	public static final Integer PARAM_PAGE_NAV_NUM = 5;

	public static final String REDIS_CODE_PREFIX = "REDIS_CODE_PREFIX_";




	
}
