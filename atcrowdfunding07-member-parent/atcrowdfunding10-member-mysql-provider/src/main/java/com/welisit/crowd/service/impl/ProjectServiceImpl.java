package com.welisit.crowd.service.impl;

import java.text.ParseException;
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
import com.welisit.crowd.entity.vo.DetailProjectVO;
import com.welisit.crowd.entity.vo.MemberConfirmInfoVO;
import com.welisit.crowd.entity.vo.MemberLauchInfoVO;
import com.welisit.crowd.entity.vo.PortalTypeVO;
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
		projectPO.setDeploydate(createdate);

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

	@Override
	public List<PortalTypeVO> getPortalTypeVOList() {
		
		return projectPOMapper.selectPortalTypeVOList();
	}

	@Override
	public DetailProjectVO getDetailProjectVO(Integer projectId) {
		
		// 1.查询得到DetailProjectVO对象
		DetailProjectVO detailProjectVO = projectPOMapper.selectDetailProjectVO(projectId);
		
		// 2.根据status确定statusText
		Integer status = detailProjectVO.getStatus();
		
		switch (status) {
		case 0:
			detailProjectVO.setStatusText("审核中");
			break;
		case 1:
			detailProjectVO.setStatusText("众筹中");
			break;
		case 2:
			detailProjectVO.setStatusText("众筹成功");
			break;
		case 3:
			detailProjectVO.setStatusText("已关闭");
			break;
	
		default:
			break;
		}
		
		// 3.根据deployeDate计算lastDay
		// 2020-10-15
		String deployDate = detailProjectVO.getDeployDate();
		
		// 获取当前日期
		Date currentDay = new Date();
		
		// 把众筹日期解析成Date类型
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date deployDay = format.parse(deployDate);
			
			// 获取当前当前日期的时间戳
			long currentTimeStamp = currentDay.getTime();
			
			// 获取众筹日期的时间戳
			long deployTimeStamp = deployDay.getTime();
			
			// 两个时间戳相减计算当前已经过去的时间
			long pastDays = (currentTimeStamp - deployTimeStamp) / 1000 / 60 / 60 / 24;
			
			// 获取总的众筹天数
			Integer totalDays = detailProjectVO.getDay();
			
			// 使用总的众筹天数减去已经过去的天数得到剩余天数
			Integer lastDay = (int) (totalDays - pastDays);
			
			detailProjectVO.setLastDay(lastDay);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return detailProjectVO;
	}
}
