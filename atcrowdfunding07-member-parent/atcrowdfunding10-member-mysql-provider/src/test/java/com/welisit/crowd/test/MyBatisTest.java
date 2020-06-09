package com.welisit.crowd.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import com.welisit.crowd.entity.po.MemberPO;
import com.welisit.crowd.entity.vo.DetailProjectVO;
import com.welisit.crowd.entity.vo.PortalProjectVO;
import com.welisit.crowd.entity.vo.PortalTypeVO;
import com.welisit.crowd.mapper.MemberPOMapper;
import com.welisit.crowd.mapper.ProjectPOMapper;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MyBatisTest {
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private MemberPOMapper memberPOMapper;
	
	@Autowired
	private ProjectPOMapper projectPOMapper;
	
	private Logger logger = LoggerFactory.getLogger(MyBatisTest.class);
	
	@Test
	public void testDetailProjectVO() {
		DetailProjectVO detailProjectVO = projectPOMapper.selectDetailProjectVO(1);
		logger.info(detailProjectVO.toString());
	}
	
	@Test
	public void testSelect() {
		List<PortalTypeVO> typeVOList = projectPOMapper.selectPortalTypeVOList();
		for (PortalTypeVO portalTypeVO : typeVOList) {
			Integer id = portalTypeVO.getId();
			String name = portalTypeVO.getName();
			String remark = portalTypeVO.getRemark();
			logger.info("id=" +id +" name=" +name + " remark=" +remark);
			List<PortalProjectVO> portalProjectVOList = portalTypeVO.getPortalProjectVOList();
			if(portalProjectVOList == null) {
				continue;
			}
			for (PortalProjectVO portalProjectVO : portalProjectVOList) {
				logger.info(portalProjectVO.toString());
			}
		}
	}

	@Test
	public void testMapper() {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String source = "123123";
		String encode = passwordEncoder.encode(source);
		MemberPO memberPO = new MemberPO(null, "jack", encode, " 杰 克 ", "jack@qq.com", 1, 1, "杰克", "123123", 2);
		memberPOMapper.insert(memberPO);
	}

	@Test
	public void testConnection() throws SQLException {
		Connection connection = dataSource.getConnection();
		logger.debug(connection.toString());
	}
}