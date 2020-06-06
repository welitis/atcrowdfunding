package com.welisit.crowd.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {

	private String loginacct;
	private String userpswd;
	private String username;
	private String email;
	private String phoneNum;
	private String code;
}
