package com.welisit.crowd.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.UUID;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.welisit.crowd.entity.Admin;
import com.welisit.crowd.entity.Role;
import com.welisit.crowd.mapper.AdminMapper;
import com.welisit.crowd.mapper.RoleMapper;
import com.welisit.crowd.service.api.AdminService;

// spring����junit
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-persist-mybatis.xml", "classpath:spring-persist-tx.xml"})
public class CrowdTest {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private RoleMapper roleMapper;
	
	@Autowired
	private AdminService adminService;
	
	@Test
	public void test5() {
		for(int i = 0; i < 238; i++) {
			roleMapper.insert(new Role(null, UUID.randomUUID().toString()));
		}
	}
	
	
	/**
	 * 测试事务控制
	 */
	@Test
	public void test4() {
		Admin admin = new Admin(null, "bbb", "bbb", "bcd", "bb@11.com", null);
		adminService.saveAdmin(admin);
	}
	
	/**
	 * 测试日志打印
	 */
	@Test
	public void test3() {
		Logger logger = LoggerFactory.getLogger(CrowdTest.class);
		logger.debug("debug level!");
		logger.info("info level");
		logger.error("error level");
	}
	
	/**
	 * 测试mapper插入数据
	 */
	@Test
	public void test2() {
		int insert = adminMapper.insert(new Admin(null, "aaa", "abc", "aaa", "aaa@qq.com", null));
		
		System.out.println("��Ӱ����У�" + insert);
	}
	
	/**
	 * 测试数据库连接
	 * @throws SQLException
	 */
	@Test
	public void test() throws SQLException {
		Connection connection = dataSource.getConnection();
		System.out.println(connection);
	}
}
