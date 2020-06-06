package com.welisit.crowd.service.api;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.welisit.crowd.entity.Role;

public interface RoleService {

	/**
	 * 分页
	 * @param keyword 搜索关键词
	 * @param pageNum 页码
	 * @param pageSize 每页记录数
	 * @return
	 */
	PageInfo<Role> getPageInfo(String keyword, Integer pageNum, Integer pageSize);

	void saveRole(Role role);

	void updateRole(Role role);

	void removeRole(List<Integer> roleIdList);

	/**
	 * 获取已分配的角色
	 * @param adminId
	 * @return
	 */
	List<Role> getAssignedRole(Integer adminId);

	List<Role> getUnAssignedRole(Integer adminId);
}
