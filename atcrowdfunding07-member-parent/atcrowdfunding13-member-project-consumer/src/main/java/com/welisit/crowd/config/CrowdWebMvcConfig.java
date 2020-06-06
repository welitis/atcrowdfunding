package com.welisit.crowd.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CrowdWebMvcConfig implements WebMvcConfigurer {
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		
		// view-controller是在project-consumer内部定义的，所以这里是一个不经过Zuul访问的地址，所以这个路径前面不加路由规则中定义的前缀：“/project”
		registry.addViewController("/agree/protocol/page").setViewName("project-agree");
		registry.addViewController("/launch/project/page").setViewName("project-launch");
		registry.addViewController("/return/info/page").setViewName("project-return");
		
	}

}
