package com.welisit.crowd.mvc.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.welisit.crowd.entity.Admin;
import com.welisit.crowd.service.api.AdminService;
import com.welisit.crowd.util.CrowdUtil;
import com.welisit.crowd.util.ResultEntity;

@Controller
public class TestHandler {

	@Autowired
	private AdminService adminService;

	private Logger logger = LoggerFactory.getLogger(TestHandler.class);

	@ResponseBody
	@RequestMapping("/send/array2.json")
	public ResultEntity<Admin> testReceiceArray2(HttpServletRequest request, @RequestBody List<Integer> array) {
		int i = 10 / 0;
		
		boolean judgeRequestType = CrowdUtil.judgeRequestType(request);

		logger.info("judgeRequestType:" + judgeRequestType);

		for (Integer num : array) {
			logger.info("num: " + num);
		}
		Admin admin = new Admin(1, "abc", "dfd", "ddd", "aaa@qq.com", "2020");
		return ResultEntity.successWithData(admin);
	}

	@ResponseBody
	@RequestMapping("/send/array.html")
	public String testReceiceArray(@RequestParam("array[]") List<Integer> array) {
		for (Integer num : array) {
			System.out.println(num);
		}
		return "server had recieve";
	}

	@RequestMapping("/test/ssm.html")
	public String testSsm(HttpServletRequest request, Model model) {
		
		int num = 10 / 0;

		List<Admin> list = adminService.getAll();

		model.addAttribute("adminList", list);

		boolean judgeRequestType = CrowdUtil.judgeRequestType(request);

		logger.info("judgeRequestType:" + judgeRequestType);

		return "target";
	}
}
