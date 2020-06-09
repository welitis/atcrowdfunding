package com.welisit.crowd.entity.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailProjectVO {
	
	private Integer projectId;
	private String projectName;
	private String projectDesc;
	private Integer followerCount;
	private Integer status;
	private Integer day;
	private String statusText;
	private Integer money;
	private Integer supportMoney;
	private Integer percentage;
	private String deployDate;
	/** 剩余天数 */
	private Integer lastDay;
	/** 支持人数 */
	private Integer supporterCount;
	private String headerPicturePath;
	private List<String> detailPicturePathList;
	private List<DetailReturnVO> detailReturnVOList;

}
