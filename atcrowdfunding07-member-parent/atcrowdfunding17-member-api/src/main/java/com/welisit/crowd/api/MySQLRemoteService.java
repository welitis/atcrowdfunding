package com.welisit.crowd.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.welisit.crowd.entity.po.MemberPO;
import com.welisit.crowd.entity.vo.ProjectVO;
import com.welisit.crowd.util.ResultEntity;

@FeignClient("welisit-crowd-mysql") // 指定远程调用的应用名称
public interface MySQLRemoteService {

	@RequestMapping("/get/memberpo/by/login/acct/remote")
	ResultEntity<MemberPO> getMemberPOByLoginAcctRemote(@RequestParam("loginacct") String loginacct);

	@RequestMapping("/save/member/remote")
	public ResultEntity<String> saveMemberRemote(@RequestBody MemberPO memberPO);

	@RequestMapping("/save/project/vo/remote")
	public ResultEntity<String> saveProjectVORemote(@RequestBody ProjectVO projectVO, 
			@RequestParam("memberId") Integer memberId);

}
