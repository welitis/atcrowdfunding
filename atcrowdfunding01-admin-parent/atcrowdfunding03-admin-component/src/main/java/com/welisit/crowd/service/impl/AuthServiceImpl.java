package com.welisit.crowd.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.welisit.crowd.entity.Auth;
import com.welisit.crowd.mapper.AuthMapper;
import com.welisit.crowd.service.api.AuthService;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private AuthMapper authMapper;

	@Override
	public List<Auth> getAll() {
		return authMapper.selectByExample(null);
	}

	@Override
	public List<Integer> getAssignedAuthIdByRoleId(Integer roleId) {
		return authMapper.selectAssignedAuthIdByRoleId(roleId);
	}

	@Override
	public void saveRoleAuthRelathinship(Map<String, List<Integer>> map) {
		// 1.获取roleId 的值
		List<Integer> roleIdList = map.get("roleId");
		Integer roleId = roleIdList.get(0);
		// 2.删除旧关联关系数据
		authMapper.deleteOldRelationship(roleId);
		// 3.获取authIdList
		List<Integer> authIdList = map.get("authIdArray");
		// 4.判断authIdList 是否有效
		if (authIdList != null && authIdList.size() > 0) {
			authMapper.insertNewRelationship(roleId, authIdList);
		}
	}

	@Override
	public List<String> getAuthNameByAdminId(Integer adminId) {
		return authMapper.selectAuthNameByAdminId(adminId);
	}
}
