package com.welisit.crowd.entity.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberLoginVO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 12312321323L;

	private Integer id;
	
    private String username;
	
	private String email;
	
}