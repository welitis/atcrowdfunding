package com.welisit.crowd.handler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PortalHandler {

	@RequestMapping("/") 
	public String showPortalPage() { 
		// 这里实际开发中需要加载数据…… 
		return "portal";
	}
	
}
