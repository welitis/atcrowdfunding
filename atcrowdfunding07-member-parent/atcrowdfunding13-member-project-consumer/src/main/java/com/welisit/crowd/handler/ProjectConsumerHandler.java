package com.welisit.crowd.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.welisit.crowd.config.OSSProperties;
import com.welisit.crowd.constant.CrowdConstant;
import com.welisit.crowd.entity.vo.ProjectVO;
import com.welisit.crowd.util.CrowdUtil;
import com.welisit.crowd.util.ResultEntity;


@Controller
public class ProjectConsumerHandler {
	
	@Autowired
	private OSSProperties ossProperties;
	
	@RequestMapping("/create/project/information")
	public String saveProjectBasicInfo(
			
			// 接收除了上传图片之外的其他普通数据
			ProjectVO projectVO, 
			
			// 接收上传的头图
			MultipartFile headerPicture, 
			
			// 接收上传的详情图片
			List<MultipartFile> detailPictureList, 
			
			// 用来将收集了一部分数据的ProjectVO对象存入Session域
			HttpSession session,
			
			// 用来在当前操作失败后返回上一个表单页面时携带提示消息
			ModelMap modelMap
			) throws IOException {
		
		// 一、完成头图上传
		// 1.获取当前headerPicture对象是否为空
		boolean headerPictureIsEmpty = headerPicture.isEmpty();
		
		if(headerPictureIsEmpty) {
			
			// 2.如果没有上传头图则返回到表单页面并显示错误消息
			modelMap.addAttribute(CrowdConstant.ATTR_NAME_MESSAGE, CrowdConstant.MESSAGE_HEADER_PIC_EMPTY);
			
			return "project-launch";
			
		}
		// 3.如果用户确实上传了有内容的文件，则执行上传
		ResultEntity<String> uploadHeaderPicResultEntity = CrowdUtil.uploadFileToOss(
				ossProperties.getEndPoint(), 
				ossProperties.getAccessKeyId(), 
				ossProperties.getAccessKeySecret(), 
				headerPicture.getInputStream(), 
				ossProperties.getBucketName(), 
				ossProperties.getBucketDomain(), 
				headerPicture.getOriginalFilename());
		
		String result = uploadHeaderPicResultEntity.getResult();
		
		// 4.判断头图是否上传成功
		if(ResultEntity.SUCCESS.equals(result)) {
			
			// 5.如果成功则从返回的数据中获取图片访问路径
			String headerPicturePath = uploadHeaderPicResultEntity.getData();
			
			// 6.存入ProjectVO对象中
			projectVO.setHeaderPicturePath(headerPicturePath);
		} else {
			
			// 7.如果上传失败则返回到表单页面并显示错误消息
			modelMap.addAttribute(CrowdConstant.ATTR_NAME_MESSAGE, CrowdConstant.MESSAGE_HEADER_PIC_UPLOAD_FAILED);
			
			return "project-launch";
			
		}
		
		// 二、上传详情图片
		// 1.创建一个用来存放详情图片路径的集合
		List<String> detailPicturePathList = new ArrayList<String>();
		
		// 2.检查detailPictureList是否有效
		if(detailPictureList == null || detailPictureList.size() == 0) {
			modelMap.addAttribute(CrowdConstant.ATTR_NAME_MESSAGE, CrowdConstant.MESSAGE_DETAIL_PIC_EMPTY);
			
			return "project-launch";
		}
		
		// 3.遍历detailPictureList集合
		for (MultipartFile detailPicture : detailPictureList) {
			
			// 4.当前detailPicture是否为空
			if(detailPicture.isEmpty()) {
				
				// 5.检测到详情图片中单个文件为空也是回去显示错误消息
				modelMap.addAttribute(CrowdConstant.ATTR_NAME_MESSAGE, CrowdConstant.MESSAGE_DETAIL_PIC_EMPTY);
				
				return "project-launch";
			}
			
			// 6.执行上传
			ResultEntity<String> detailUploadResultEntity = CrowdUtil.uploadFileToOss(
					ossProperties.getEndPoint(), 
					ossProperties.getAccessKeyId(), 
					ossProperties.getAccessKeySecret(), 
					detailPicture.getInputStream(), 
					ossProperties.getBucketName(), 
					ossProperties.getBucketDomain(), 
					detailPicture.getOriginalFilename());
			
			// 7.检查上传结果
			String detailUploadResult = detailUploadResultEntity.getResult();
			
			if(ResultEntity.SUCCESS.equals(detailUploadResult)) {
				
				String detailPicturePath = detailUploadResultEntity.getData();
				
				// 8.收集刚刚上传的图片的访问路径
				detailPicturePathList.add(detailPicturePath);
			} else {
				
				// 9.如果上传失败则返回到表单页面并显示错误消息
				modelMap.addAttribute(CrowdConstant.ATTR_NAME_MESSAGE, CrowdConstant.MESSAGE_DETAIL_PIC_UPLOAD_FAILED);
				
				return "project-launch";
			}
			
		}
		
		// 10.将存放了详情图片访问路径的集合存入ProjectVO中
		projectVO.setDetailPicturePathList(detailPicturePathList);
		
		// 三、后续操作
		// 1.将ProjectVO对象存入Session域
		session.setAttribute(CrowdConstant.ATTR_NAME_TEMPLE_PROJECT, projectVO);
		
		// 2.以完整的访问路径前往下一个收集回报信息的页面
		return "redirect:http://www.crowd.com/project/return/info/page";
	}

}
