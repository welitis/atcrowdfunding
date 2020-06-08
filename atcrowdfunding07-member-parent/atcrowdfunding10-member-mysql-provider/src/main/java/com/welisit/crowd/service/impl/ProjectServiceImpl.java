package com.welisit.crowd.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.welisit.crowd.entity.po.MemberConfirmInfoPO;
import com.welisit.crowd.entity.po.MemberLaunchInfoPO;
import com.welisit.crowd.entity.po.ProjectPO;
import com.welisit.crowd.entity.po.ReturnPO;
import com.welisit.crowd.entity.vo.MemberConfirmInfoVO;
import com.welisit.crowd.entity.vo.MemberLauchInfoVO;
import com.welisit.crowd.entity.vo.ProjectVO;
import com.welisit.crowd.entity.vo.ReturnVO;
import com.welisit.crowd.mapper.MemberConfirmInfoPOMapper;
import com.welisit.crowd.mapper.MemberLaunchInfoPOMapper;
import com.welisit.crowd.mapper.ProjectItemPicPOMapper;
import com.welisit.crowd.mapper.ProjectPOMapper;
import com.welisit.crowd.mapper.ReturnPOMapper;
import com.welisit.crowd.service.ProjectService;

@Transactional(readOnly = true)
@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ReturnPOMapper returnPOMapper;

	@Autowired
	private MemberConfirmInfoPOMapper memberConfirmInfoPOMapper;

	@Autowired
	private MemberLaunchInfoPOMapper memberLaunchInfoPOMapper;

	@Autowired
	private ProjectPOMapper projectPOMapper;

	@Autowired
	private ProjectItemPicPOMapper projectItemPicPOMapper;

	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
	@Override
	public void saveProject(ProjectVO projectVO, Integer memberId) {
		// 一、保存ProjectPO对象
		// 1.创建空的ProjectPO对象
		ProjectPO projectPO = new ProjectPO();

		// 2.把projectVO中的属性复制到projectPO中
		BeanUtils.copyProperties(projectVO, projectPO);

		// 修复bug：把memberId设置到projectPO中
		projectPO.setMemberid(memberId);

		// 修复bug：生成创建时间存入
		String createdate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		projectPO.setCreatedate(createdate);

		// 修复bug：status设置成0，表示即将开始
		projectPO.setStatus(0);

		// 3.保存projectPO
		// 为了能够获取到projectPO保存后的自增主键，需要到ProjectPOMapper.xml文件中进行相关设置
		// <insert id="insertSelective" useGeneratedKeys="true" keyProperty="id" ……
		projectPOMapper.insertSelective(projectPO);

		// 4.从projectPO对象这里获取自增主键
		Integer projectId = projectPO.getId();

		// 二、保存项目、分类的关联关系信息
		// 1.从ProjectVO对象中获取typeIdList
		List<Integer> typeIdList = projectVO.getTypeIdList();
		projectPOMapper.insertTypeRelationship(typeIdList, projectId);

		// 三、保存项目、标签的关联关系信息
		List<Integer> tagIdList = projectVO.getTagIdList();
		projectPOMapper.insertTagRelationship(tagIdList, projectId);

		// 四、保存项目中详情图片路径信息
		List<String> detailPicturePathList = projectVO.getDetailPicturePathList();
		projectItemPicPOMapper.insertPathList(projectId, detailPicturePathList);

		// 五、保存项目发起人信息
		MemberLauchInfoVO memberLauchInfoVO = projectVO.getMemberLauchInfoVO();
		MemberLaunchInfoPO memberLaunchInfoPO = new MemberLaunchInfoPO();
		BeanUtils.copyProperties(memberLauchInfoVO, memberLaunchInfoPO);
		memberLaunchInfoPO.setMemberid(memberId);

		memberLaunchInfoPOMapper.insert(memberLaunchInfoPO);

		// 六、保存项目回报信息
		List<ReturnVO> returnVOList = projectVO.getReturnVOList();

		List<ReturnPO> returnPOList = new ArrayList<>();

		for (ReturnVO returnVO : returnVOList) {

			ReturnPO returnPO = new ReturnPO();

			BeanUtils.copyProperties(returnVO, returnPO);

			returnPOList.add(returnPO);
		}

		returnPOMapper.insertReturnPOBatch(returnPOList, projectId);

		// 七、保存项目确认信息
		MemberConfirmInfoVO memberConfirmInfoVO = projectVO.getMemberConfirmInfoVO();
		MemberConfirmInfoPO memberConfirmInfoPO = new MemberConfirmInfoPO();
		BeanUtils.copyProperties(memberConfirmInfoVO, memberConfirmInfoPO);
		memberConfirmInfoPO.setMemberid(memberId);
		memberConfirmInfoPOMapper.insert(memberConfirmInfoPO);

	}
}
