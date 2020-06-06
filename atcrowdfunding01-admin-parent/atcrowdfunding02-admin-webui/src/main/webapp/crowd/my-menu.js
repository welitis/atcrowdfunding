function generateTree(){
	// 2. 发送ajax请求获取数据
	$.ajax({
		"url" : "menu/get/whole/tree.json",
		"type" : "post",
		"dataType" : "json",
		"success" : function(response) {
			var result = response.result;
			if (result == "SUCCESS") {
				// layer.msg("数据加载成功！");
				// 1. 创建JSON 对象用于存储对zTree 所做的设置
				var setting = {
					view : {
						addDiyDom : myAddDiyDom,
						addHoverDom: myAddHoverDom,
						removeHoverDom: myRemoveHoverDom,
					},
				
					data: {
						key: {
							url: "xUrl"
						}
					}
				};
				var zNodes = response.data;
				// 3. 初始化属性结构
				$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			}
			if (result == "FAILED") {
				layer.msg("操作失败！" + response.message);
			}
		},
		"error" : function(response) {
			layer.msg("获取数据失败！" + response.status + " "
					+ response.statusText);
		}
	})
}

/**
 * 鼠标离开时
 * @returns
 */
function myRemoveHoverDom(treeId, treeNode){
	// btnGrouptreeDemo_2
	var btnGroupId = "btnGroup" + treeNode.tId;
	$("#"+btnGroupId).remove();
}

/**
 * 鼠标悬停时
 * @returns
 */
function myAddHoverDom(treeId, treeNode){
	var anchorId = treeNode.tId + "_a";
	var btnGroupId = "btnGroup" + treeNode.tId;
	// 防止添加多个
	if($("#" + btnGroupId).length > 0){
		return;
	}
	
	var updateIcon = "<a MenuId='"+treeNode.id+"' class='updateIcon btn btn-info dropdown-toggle btn-xs' style='margin-left:10px;padding-top:0px;' href='#' title='修改权限信息'>&nbsp;&nbsp;<i class='fa fa-fw fa-edit rbg '></i></a>";
	var removeIcon = "<a MenuId='"+treeNode.id+"' class='removeIcon btn btn-info dropdown-toggle btn-xs' style='margin-left:10px;padding-top:0px;' href='#'>&nbsp;&nbsp;<i class='fa fa-fw fa-times rbg '></i></a>";
	var addIcon = "<a MenuId='"+treeNode.id+"' class='addIcon btn btn-info dropdown-toggle btn-xs' style='margin-left:10px;padding-top:0px;' href='#'>&nbsp;&nbsp;<i class='fa fa-fw fa-plus rbg '></i></a>";
	/**
	 * level 0: 根节点
	 * 	添加子节点
	 * level 1: 分支节点
	 * 	修改
	 * 	添加子节点
	 * 	没有子节点：可以删除
	 * 	有子节点：不能删除
	 * level 2：叶子节点
	 * 	修改
	 * 	删除
	 */
	var spanContent = "";
	if(treeNode.level == 0){
		spanContent = addIcon;
	}
	if(treeNode.level == 1){
		spanContent += addIcon;
		spanContent += updateIcon;
		if(treeNode.children.length == 0){
			spanContent += removeIcon;
		}
	}
	if(treeNode.level == 2){
		spanContent += updateIcon;
		spanContent += removeIcon;
	}
	$("#" + anchorId).after("<span id='"+btnGroupId+"'>"+spanContent+"</span>");
}


/**
 * 自定义dom函数，修改图标
 */
function myAddDiyDom(treeId, treeNode){
	// 获取id treeDemo_2_ico
	var spanId = treeNode.tId + "_ico";
	// 修改class
	$("#" + spanId).removeClass().addClass(treeNode.icon);
}