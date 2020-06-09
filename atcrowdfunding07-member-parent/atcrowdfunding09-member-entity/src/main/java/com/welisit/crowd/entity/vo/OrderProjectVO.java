package com.welisit.crowd.entity.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderProjectVO implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Integer id;

	/**
	 * 项目名
	 */
    private String projectName;

    /**
     	* 发起人
     */
    private String launchName;

    /**
     * 回报内容
     */
    private String returnContent;

    private Integer returnCount;

    private Integer supportPrice;

    private Integer freight;

    private Integer orderId;
    
    private Integer signalPurchase;
    
    private Integer purchase;

}
