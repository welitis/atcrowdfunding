/**
 * 生成权限的树形结构
 */
function fillAuthTree() {
	// 1.发送Ajax 请求查询Auth 数据
	var ajaxReturn = $.ajax({
		"url" : "assgin/get/all/auth.json",
		"type" : "post",
		"dataType" : "json",
		"async" : false
	});
	if (ajaxReturn.status != 200) {
		layer.msg(" 请求处理出错！ 响应状态码是： " + ajaxReturn.status + " 说明是："
				+ ajaxReturn.statusText);
		return;
	}
	authList = ajaxReturn.responseJSON.data;
	console.log(authList);
	// 3.准备对zTree 进行设置的JSON 对象
	var setting = {
		"data" : {
			"simpleData" : {
				// 开启简单JSON 功能
				"enable" : true,
				// 使用categoryId 属性关联父节点，不用默认的pId 了
				"pIdKey" : "categoryId"
			},
			"key" : {
				// 使用title 属性显示节点名称，不用默认的name 作为属性名了
				"name" : "title"
			}
		},
		"check" : {
			"enable" : true
		}
	};
	// 4.生成树形结构
	// <ul id="authTreeDemo" class="ztree"></ul>
	$.fn.zTree.init($("#authTreeDemo"), setting, authList);
	// 获取zTreeObj 对象
	var zTreeObj = $.fn.zTree.getZTreeObj("authTreeDemo");
	// 调用zTreeObj 对象的方法，把节点展开
	zTreeObj.expandAll(true);
	// 5.查询已分配的Auth 的id 组成的数组
	ajaxReturn = $.ajax({
		"url" : "assign/get/assigned/auth/id/by/role/id.json",
		"type" : "post",
		"data" : {
			"roleId" : window.roleId
		},
		"dataType" : "json",
		"async" : false
	});
	if (ajaxReturn.status != 200) {
		layer.msg(" 请求处理出错！ 响应状态码是： " + ajaxReturn.status + " 说明是："
				+ ajaxReturn.statusText);
		return;
	}
	// 从响应结果中获取authIdArray
	var authIdArray = ajaxReturn.responseJSON.data;
	// 6.根据authIdArray 把树形结构中对应的节点勾选上
	// ①遍历authIdArray
	for (var i = 0; i < authIdArray.length; i++) {
		var authId = authIdArray[i];
		// ②根据id 查询树形结构中对应的节点
		var treeNode = zTreeObj.getNodeByParam("id", authId);
		// ③将treeNode 设置为被勾选
		// checked 设置为true 表示节点勾选
		var checked = true;
		// checkTypeFlag 设置为false，表示不“联动”，不联动是为了避免把不该勾选的勾选上
		var checkTypeFlag = false;
		// 执行
		zTreeObj.checkNode(treeNode, checked, checkTypeFlag);
	}
}

/**
 * 执行分页，生成页面效果
 */
function generatePage() {
	// 1.获取分页数据
	var pageInfo = getPageInfoRemote();
	// 2.填充表格
	fillTableBody(pageInfo);
	// 生成页面会去除全选框的选中状态
	// 恢复全选框的选中状态
	$("#summaryBox").prop("checked", false);
}

/**
 * 获取分页数据
 * 
 * @returns
 */
function getPageInfoRemote() {
	// 调用$.ajax()函数发送请求并接受$.ajax()函数的返回值
	var ajaxResult = $.ajax({
		"url" : "role/get/page/info.json",
		"type" : "post",
		"data" : {
			"pageNum" : window.pageNum,
			"pageSize" : window.pageSize,
			"keyword" : window.keyword
		},
		"async" : false,
		"dataType" : "json"
	});
	console.log(ajaxResult);
	// 判断当前响应状态码是否为200
	var statusCode = ajaxResult.status;
	// 如果当前响应状态码不是200，说明发生了错误或其他意外情况，显示提示消息，让
	// 当前函数停止执行
	if (statusCode != 200) {
		layer.msg("失败！响应状态码=" + statusCode + " 说明信息=" + ajaxResult.statusText);
		return null;
	}
	// 如果响应状态码是200，说明请求处理成功，获取pageInfo
	var resultEntity = ajaxResult.responseJSON;
	// 从resultEntity 中获取result 属性
	var result = resultEntity.result;
	// 判断result 是否成功
	if (result == "FAILED") {
		layer.msg(resultEntity.message);
		return null;
	}
	// 确认result 为成功后获取pageInfo
	var pageInfo = resultEntity.data;
	// 返回pageInfo
	return pageInfo;
}

/**
 * 填充表格
 * 
 * @returns
 */
function fillTableBody(pageInfo) {
	// 清除tbody 中的旧的内容
	$("#rolePageBody").empty();
	// 这里清空是为了让没有搜索结果时不显示页码导航条
	$("#Pagination").empty();
	// 判断pageInfo 对象是否有效
	if (pageInfo == null || pageInfo == undefined || pageInfo.list == null
			|| pageInfo.list.length == 0) {
		$("#rolePageBody").append(
				"<tr><td colspan='4' align='center'>抱歉！没有查询到您搜索的数据！</td></tr>");
		return;
	}
	// 使用pageInfo 的list 属性填充tbody
	for (var i = 0; i < pageInfo.list.length; i++) {
		var role = pageInfo.list[i];
		var roleId = role.id;
		var roleName = role.name;
		var numberTd = "<td>" + (i + 1) + "</td>";
		var checkboxTd = "<td><input type='checkbox' roleId='" + roleId
				+ "' class='itemBox'></td>";
		var roleNameTd = "<td>" + roleName + "</td>";
		var checkBtn = "<button type='button' roleId='"
				+ roleId
				+ "' class='btn btn-success btn-xs checkBtn'><i class='glyphicon glyphicon-check'></i></button>";
		var pencilBtn = "<button type='button' roleId='"
				+ roleId
				+ "' class='btn btn-primary btn-xs pencilBtn'><i class='glyphicon glyphicon-pencil'></i></button>";
		var removeBtn = "<button type='button' roleId='"
				+ roleId
				+ "' class='btn btn-danger btn-xs removeBtn'><i class='glyphicon glyphicon-remove'></i></button>";
		var buttonTd = "<td>" + checkBtn + " " + pencilBtn + " " + removeBtn
				+ "</td>";
		var tr = "<tr>" + numberTd + checkboxTd + roleNameTd + buttonTd
				+ "</tr>";
		$("#rolePageBody").append(tr);
	}
	// 生成分页导航条
	generateNavigator(pageInfo);
}

function generateNavigator(pageInfo) {

	var pageNums = "";
	if (window.keyword == null || window.keyword == undefined) {
		window.keyword = "";
	}
	console.log("keyword=" + window.keyword);
	if (pageInfo.isFirstPage) {
		// 如果是第一页，则将上一页按钮锁住不能点击
		pageNums += "<li class='disabled'><span aria-hidden='true'>&laquo;</span></li>";
	} else {
		pageNums += "<li><a onclick='paginationCallBack("
				+ pageInfo.prePage
				+ ")' href='javascript:void(0);' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span></a></li>";
		if (pageInfo.firstPage != 1 && pageInfo.firstPage != 2) {
			pageNums += "<li><a onclick='paginationCallBack(1)' href='javascript:void(0);'>1</a></li><li><span>...</span></li>"
		}
		if (pageInfo.firstPage == 2) {
			pageNums += "<li><a onclick='paginationCallBack(1)' href='javascript:void(0);'>1</a></li>"
		}
	}
	for (var i = 0; i < pageInfo.navigatepageNums.length; i++) {
		var pageNum = pageInfo.navigatepageNums[i];
		if (pageInfo.pageNum == pageNum) { // 判断是否为当前页
			pageNums += "<li class='active'><span>" + pageNum
					+ "<span class='sr-only'>(current)</span></span></li>"
		} else {
			pageNums += "<li><a onclick='paginationCallBack(" + pageNum
					+ ")' href='javascript:void(0);'>" + pageNum + "</a></li>"
		}
	}
	if (pageInfo.isLastPage) {
		// 如果是否为最后一页，则将下一页按钮锁住不能点击
		pageNums += "<li class='disabled'><span aria-hidden='true'>&raquo;</span></li>";
	} else {

		if (pageInfo.lastPage != pageInfo.pages
				&& pageInfo.lastPage != pageInfo.pages - 1) {// 2 3
			// ...
			// 6
			pageNums += "<li><span>...</span></li><li><a onclick='paginationCallBack("
					+ pageInfo.pages
					+ ")' href='javascript:void(0);'>"
					+ pageInfo.pages + "</a></li>";
		}
		if (pageInfo.lastPage == pageInfo.pages - 1) { // 4 5 6
			pageNums += "<li><a onclick='paginationCallBack(" + pageInfo.pages
					+ ")' href='javascript:void(0);'>" + pageInfo.pages
					+ "</a></li>";
		} // >>
		pageNums += "<li><a onclick='paginationCallBack("
				+ pageInfo.nextPage
				+ ")' href='javascript:void(0);' aria-label='Next'> <span aria-hidden='true'>&raquo;</span></a></li>";
	}
	var tr = "<tr><td colspan='6' align='center'><ul class='pagination'>"
			+ pageNums + "</ul></td></tr>";
	$("#Pagination").append(tr);
}

function paginationCallBack(pageNum) {
	window.pageNum = pageNum;
	generatePage();
	// 取消页码超链接的默认行为
	return false;
}

/**
 * 展示roleArray中的数据到模态框
 * 
 * @param roleArray
 * @returns
 */
function showDeleteRoleContent(roleArray) {
	$("#deleteModal").modal("show");

	$(".delete-body").empty();

	window.roleIdArray = [];

	// 遍历roleArray数组
	for (var i = 0; i < roleArray.length; i++) {
		var role = roleArray[i];
		var roleName = role.name;
		$(".delete-body").append("<p>" + roleName + "</p>");

		var roleId = role.id;
		// 存入id
		window.roleIdArray.push(roleId);
	}
}
