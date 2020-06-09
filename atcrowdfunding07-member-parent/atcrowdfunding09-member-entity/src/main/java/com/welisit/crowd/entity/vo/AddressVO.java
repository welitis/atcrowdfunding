package com.welisit.crowd.entity.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AddressVO implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Integer id;
	
    private String receiveName;

    private String phoneNum;

    private String address;

    private Integer memberId;

}
