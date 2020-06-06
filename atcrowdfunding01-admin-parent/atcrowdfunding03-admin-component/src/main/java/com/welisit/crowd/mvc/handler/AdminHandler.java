package com.welisit.crowd.mvc.handler;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.welisit.crowd.constant.CrowdConstant;
import com.welisit.crowd.entity.Admin;
import com.welisit.crowd.service.api.AdminService;

@Controller
public class AdminHandler {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/update/admin.html")
	public String updateAdmin(Admin admin,
			@RequestParam(value="keyword",defaultValue = "")String keyword,
			@RequestParam(value="pageNum",defaultValue = "1")Integer pageNum
			) {
		adminService.updateAdmin(admin);
		return "redirect:/admin/get/page.html?keyword=" + keyword + "&pageNum="+ pageNum;
	}
	
	@RequestMapping("/admin/to/edit/page.html")
	public String toEditPage(@RequestParam("adminId")Integer id,
			Model model
			) {
		Admin admin = adminService.getAdminById(id);
		model.addAttribute("admin", admin);
		return "admin-edit";
	}
	
	@PreAuthorize("hasAuthority('user:save')")
	@RequestMapping("/save/admin.html")
	public String saveAdmin(Admin admin) {
		adminService.saveAdmin(admin);
		return "redirect:/admin/get/page.html?pageNum=" + Integer.MAX_VALUE;
	}
	
	@RequestMapping("/admin/remove/admin.html")
	public String removeAdmin(@RequestParam("adminId")Integer id, 
			@RequestParam(value="keyword",defaultValue = "")String keyword,
			@RequestParam(value="pageNum",defaultValue = "1")Integer pageNum
			) {
		adminService.removeAdmin(id);
		return "redirect:/admin/get/page.html?keyword=" + keyword + "&pageNum="+ pageNum;
	}
	
	@RequestMapping("/admin/get/page.html")
	public String getPageInfo(
			@RequestParam(value="keyword", defaultValue = "")String keyword,
			@RequestParam(value="pageNum", defaultValue = "1")Integer pageNum,
			@RequestParam(value="pageSize", defaultValue = "5")Integer pageSize,
			Model model
			) {
		PageInfo<Admin> pageInfo = adminService.getPageInfo(keyword, pageNum, pageSize);
		model.addAttribute(CrowdConstant.ATTR_NAME_PAGE_INFO, pageInfo);
		return "admin-page";
	}
	
	@RequestMapping("/admin/do/login.html")
	public String doLogin(@RequestParam("loginAcct") String loginAcct, 
			@RequestParam("userPswd") String userPswd,
			HttpSession session) {
		
		// 调用service方法执行登录检查，如果能够返回admin说明登录成功，否则抛出异常
		Admin admin = adminService.getAdminByLoginAcct(loginAcct, userPswd);
		
		// 保存用户对象到session中
		session.setAttribute(CrowdConstant.ATTR_NAME_LOGIN_ADMIN, admin);
		
		return "redirect:/admin/to/main/page.html";
	}
	
	@RequestMapping("/admin/to/logout.html")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin/to/login/page.html";
	}
}
