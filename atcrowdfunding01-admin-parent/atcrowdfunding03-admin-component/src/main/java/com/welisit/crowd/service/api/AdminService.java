package com.welisit.crowd.service.api;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.welisit.crowd.entity.Admin;

public interface AdminService {
	void saveAdmin(Admin admin);

	List<Admin> getAll();

	/**
	 * 账户登录
	 * @param loginAcct 账户名
	 * @param userPswd 密码
	 * @return 查询到的用户
	 */
	Admin getAdminByLoginAcct(String loginAcct, String userPswd);
	
	Admin getAdminByLoginAcct(String loginAcct);
	
	/**
	 * 分页
	 * @param keyword 搜索关键词
	 * @param pageNum 页码
	 * @param pageSize 每页记录数
	 * @return
	 */
	PageInfo<Admin> getPageInfo(String keyword, Integer pageNum, Integer pageSize);

	/**
	 * 删除admin用户
	 * @param id
	 */
	void removeAdmin(Integer id);

	/**
	 * 通过id获取用户
	 * @param id
	 * @return
	 */
	Admin getAdminById(Integer id);

	/**
	 * 更新用户
	 * @param admin
	 */
	void updateAdmin(Admin admin);

	/**
	 * 保存用户角色关系
	 * @param adminId
	 * @param roleIdList
	 */
	void saveAdminRoleRelationship(Integer adminId, List<Integer> roleIdList);
	
}
