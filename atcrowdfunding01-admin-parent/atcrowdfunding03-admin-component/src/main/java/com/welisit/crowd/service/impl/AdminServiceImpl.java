package com.welisit.crowd.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.welisit.crowd.constant.CrowdConstant;
import com.welisit.crowd.entity.Admin;
import com.welisit.crowd.entity.AdminExample;
import com.welisit.crowd.entity.AdminExample.Criteria;
import com.welisit.crowd.exception.LoginAcctAlreadyInUseException;
import com.welisit.crowd.exception.LoginAcctAlreadyInUseForUpdateException;
import com.welisit.crowd.exception.LoginFailedException;
import com.welisit.crowd.mapper.AdminMapper;
import com.welisit.crowd.service.api.AdminService;
import com.welisit.crowd.util.CrowdUtil;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	public void saveAdmin(Admin admin) {
		// 生成系统时间
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createTime = simpleDateFormat.format(date);
		admin.setCreateTime(createTime);
		// 加密密码
		String userPswd = admin.getUserPswd();
//		userPswd = CrowdUtil.md5(userPswd);
		// 使用springSecurity加密
		String encodedPassword = passwordEncoder.encode(userPswd);
		admin.setUserPswd(encodedPassword);
		// 执行保存，如果用户名重复会报错
		
		try {
			adminMapper.insert(admin);
		} catch (Exception e) {
			e.printStackTrace();
			if(e instanceof DuplicateKeyException) {
				throw new LoginAcctAlreadyInUseException(CrowdConstant.MESSAGE_LOGIN_ACCT_ALREADY_IN_USE);
			}
			// 为了不掩盖问题，如果当前捕获到的不是DuplicateKeyException 类型的异常，则
			// 把当前捕获到的异常对象继续向上抛出
			throw e;
		}
	}

	public List<Admin> getAll() {
		// TODO Auto-generated method stub
		return adminMapper.selectByExample(new AdminExample());
	}

	/**
	 * 验证用户登录
	 */
	public Admin getAdminByLoginAcct(String loginAcct, String userPswd) {
		
		// 1. 根据登录账号查询admin对象
		AdminExample example = new AdminExample();
		Criteria criteria = example.createCriteria();
		criteria.andLoginAcctEqualTo(loginAcct);
		List<Admin> list = adminMapper.selectByExample(example);
		
		// 2. 判断admin对象是否为null
		if(list == null || list.size() == 0) {
			throw new LoginFailedException(CrowdConstant.MESSAGE_LOGIN_FAILED);
		}
		
		if(list.size() > 1) {
			throw new RuntimeException(CrowdConstant.MESSAGE_SYSTEM_ERROR_LOGIN_NOT_UNIQUE);
		}
		
		Admin admin = list.get(0);
		
		// 3. 如果Admin对象为null则抛出异常
		if(admin == null) {
			throw new LoginFailedException(CrowdConstant.MESSAGE_LOGIN_FAILED);
		}
		
		// 4. 如果Admin不为null则将数据库密码从Admin对象中取出
		String userPswdDB = admin.getUserPswd();
		
		// 5. 将表单提交的明文密码进行加密
		String userPswdForm = CrowdUtil.md5(userPswd);
		
		// 6. 对密码进行比较
		if(!Objects.equals(userPswdForm, userPswdDB)) {
			// 7. 如果比较结果是不一致则抛出异常
			throw new LoginFailedException(CrowdConstant.MESSAGE_LOGIN_FAILED);
		}
		
		// 8. 如果一直则返回Admin对象
		return admin;
	}

	public PageInfo<Admin> getPageInfo(String keyword, Integer pageNum, Integer pageSize) {
		
		// 1. 调用pageHelper的静态方法开启分页功能
		PageHelper.startPage(pageNum, pageSize);
		
		// 2. 执行查询
		List<Admin> list = adminMapper.selectAdminByKeyword(keyword);
		
		// 3. 封装到PageInfo对象中
		return new PageInfo<>(list, CrowdConstant.PARAM_PAGE_NAV_NUM);
		
	}

	public void removeAdmin(Integer id) {
		adminMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Admin getAdminById(Integer id) {
		return adminMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateAdmin(Admin admin) {
		try {
			adminMapper.updateByPrimaryKeySelective(admin);
		} catch (Exception e) {
			e.printStackTrace();
			if(e instanceof DuplicateKeyException) {
				throw new LoginAcctAlreadyInUseForUpdateException(CrowdConstant.MESSAGE_LOGIN_ACCT_ALREADY_IN_USE);
			}
			// 为了不掩盖问题，如果当前捕获到的不是DuplicateKeyException 类型的异常，则
			// 把当前捕获到的异常对象继续向上抛出
			throw e;
		}
	}

	@Override
	public void saveAdminRoleRelationship(Integer adminId, List<Integer> roleIdList) {
		// 1.根据adminId 删除旧的关联关系数据
		adminMapper.deleteOLdRelationship(adminId);
		// 2.根据roleIdList 和adminId 保存新的关联关系
		if(roleIdList != null && roleIdList.size() > 0) {
			adminMapper.insertNewRelationship(adminId, roleIdList);
		}
	}

	@Override
	public Admin getAdminByLoginAcct(String loginAcct) {
		AdminExample adminExample = new AdminExample();
		Criteria criteria = adminExample.createCriteria();
		criteria.andLoginAcctEqualTo(loginAcct);
		List<Admin> list = adminMapper.selectByExample(adminExample);
		if(list == null || list.size() != 1) {
			return null;
		}
		Admin admin = list.get(0);
		return admin;
	}

}
