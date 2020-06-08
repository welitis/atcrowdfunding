package com.welisit.crowd.entity.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PortalTypeVO {
	
	private Integer id;
	private String name;
	private String remark;
	
	private List<PortalProjectVO> portalProjectVOList;

}
