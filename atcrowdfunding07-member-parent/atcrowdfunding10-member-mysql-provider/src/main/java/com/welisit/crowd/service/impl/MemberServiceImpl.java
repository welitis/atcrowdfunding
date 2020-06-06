package com.welisit.crowd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.welisit.crowd.entity.po.MemberPO;
import com.welisit.crowd.entity.po.MemberPOExample;
import com.welisit.crowd.entity.po.MemberPOExample.Criteria;
import com.welisit.crowd.mapper.MemberPOMapper;
import com.welisit.crowd.service.MemberService;

//在类上使用@Transactional(readOnly = true)针对查询操作设置事务属性
@Transactional(readOnly = true)
@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberPOMapper memberPOMapper;

	@Override
	public MemberPO getMemberPOByLoginAcct(String loginacct) {
		// 1.创建 Example 对象
		MemberPOExample example = new MemberPOExample(); 
		// 2.创建 Criteria 对象 
		Criteria criteria = example.createCriteria(); 
		// 3.封装查询条件 
		criteria.andLoginacctEqualTo(loginacct); 
		// 4.执行查询 
		List<MemberPO> list = memberPOMapper.selectByExample(example); 
		// 5.获取结果 ,有可能没有查询到结果导致空指针异常，在控制层进行捕获
		if(list == null || list.size() == 0) {
			return null;
		}
		return list.get(0);
	}

	@Transactional(
			propagation = Propagation.REQUIRES_NEW, 
			rollbackFor = Exception.class)
	@Override
	public void saveMember(MemberPO memberPO) {
		memberPOMapper.insertSelective(memberPO);
	}

}
