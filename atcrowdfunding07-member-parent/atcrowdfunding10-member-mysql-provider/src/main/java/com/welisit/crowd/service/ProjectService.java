package com.welisit.crowd.service;

import java.util.List;

import com.welisit.crowd.entity.vo.PortalTypeVO;
import com.welisit.crowd.entity.vo.ProjectVO;

public interface ProjectService {

	void saveProject(ProjectVO projectVO, Integer memberId);

	/**
	 * 获取所有的分类视图对象
	 * @return
	 */
	List<PortalTypeVO> getPortalTypeVOList();
}
