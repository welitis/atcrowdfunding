package com.welisit.crowd.test;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.welisit.crowd.service.api.AdminService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-persist-mybatis.xml", "classpath:spring-persist-tx.xml"})
public class AdminServiceImplTest {
	
	@Autowired
	private AdminService adminService;

	@Test
	public void testSaveAdminRoleRelationship() {
		ArrayList<Integer> list = new ArrayList<>();
		list.add(1);
		list.add(2);
		adminService.saveAdminRoleRelationship(13, list);
	}

}
