package com.welisit.crowd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.welisit.crowd.constant.CrowdConstant;
import com.welisit.crowd.entity.Role;
import com.welisit.crowd.entity.RoleExample;
import com.welisit.crowd.entity.RoleExample.Criteria;
import com.welisit.crowd.mapper.RoleMapper;
import com.welisit.crowd.service.api.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleMapper roleMapper;

	@Override
	public PageInfo<Role> getPageInfo(String keyword, Integer pageNum, Integer pageSize) {
		// 1. 调用pageHelper的静态方法开启分页功能
		PageHelper.startPage(pageNum, pageSize);

		// 2. 执行查询
		List<Role> list = roleMapper.selectRoleByKeyword(keyword);

		// 3. 封装到PageInfo对象中
		return new PageInfo<>(list, CrowdConstant.PARAM_PAGE_NAV_NUM);
	}

	@Override
	public void saveRole(Role role) {
		roleMapper.insert(role);
	}

	@Override
	public void updateRole(Role role) {
		roleMapper.updateByPrimaryKey(role);
	}

	@Override
	public void removeRole(List<Integer> roleIdList) {
		RoleExample example = new RoleExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(roleIdList);
		roleMapper.deleteByExample(example);
	}

	@Override
	public List<Role> getAssignedRole(Integer adminId) {
		return roleMapper.selectAssignedRole(adminId);
	}

	@Override
	public List<Role> getUnAssignedRole(Integer adminId) {
		return roleMapper.selectUnAssignedRole(adminId);
	}

}
