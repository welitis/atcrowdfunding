package com.welisit.crowd.entity.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberConfirmInfoVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	// 易付宝账号
	private String paynum;

	// 法人身份证号
	private String cardnum;
}