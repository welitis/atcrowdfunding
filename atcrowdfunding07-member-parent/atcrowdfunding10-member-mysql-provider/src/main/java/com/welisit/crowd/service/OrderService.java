package com.welisit.crowd.service;

import java.util.List;

import com.welisit.crowd.entity.vo.AddressVO;
import com.welisit.crowd.entity.vo.OrderProjectVO;

public interface OrderService {

	OrderProjectVO getOrderProjectVO(Integer projectId, Integer returnId);

	List<AddressVO> getAddressVOList(Integer memberId);

	void saveAddress(AddressVO addressVO);

}