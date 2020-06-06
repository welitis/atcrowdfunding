<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@include file="/WEB-INF/include-head.jsp"%>
<link rel="stylesheet" href="ztree/zTreeStyle.css" />
<script type="text/javascript" src="ztree/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="crowd/my-menu.js"></script>
<script type="text/javascript">
	$(function() {
	
		generateTree();
		
		$("#treeDemo").on("click", ".addIcon", function(){
			// 将当前节点的id作为新创建节点的父节点
			window.pid = $(this).attr("menuId");
			console.log(window.pid);
			$("#menuAddModal").modal("show");
			return false;
		})
		
		// 给添加子节点的模态框中保存按钮绑定单击响应函数
		$("#menuSaveBtn").click(function(){
			
			// 收集表单项中用户输入的数据
			var name = $.trim($("#menuAddModal [name=name]").val());
			var url = $.trim($("#menuAddModal [name=url]").val());
			
			// 单选按钮要定位到“被选中”的哪一个
			var icon = $("#menuAddModal [name=icon]:checked").val();
			
			// 发送ajax请求
			$.ajax({
				"url":"menu/save.json",
				"type":"post",
				"data":{
					"name":name,
					"url":url,
					"icon":icon,
					"pid": window.pid
				},
				"dataType": "json",
				"success" : function(response) {
					var result = response.result;
					if (result == "SUCCESS") {
						layer.msg("添加数据成功！");
						generateTree();
						
					}
					if (result == "FAILED") {
						layer.msg("操作失败！" + response.message);
					}
				},
				"error" : function(response) {
					layer.msg("添加数据失败！" + response.status + " "
							+ response.statusText);
				}
			});
			
			$("#menuAddModal").modal("hide");
			
			// jQuery对象调用click，不使用参数相当于点击了一次
			$("#menuResetBtn").click();
			
		})
		
		// 更新菜单
		$("#treeDemo").on("click", ".updateIcon", function(){
			// 将当前节点的id作为新创建节点的父节点
			window.id = $(this).attr("menuId");
			$("#menuEditModal").modal("show");
			var zTreeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var key = "id";
			var value = window.id;
			var node = zTreeObj.getNodeByParam(key, value, null);
			$("#menuEditModal [name=name]").val(node.name);
			$("#menuEditModal [name=url]").val(node.url);
			$("#menuEditModal [name=icon]").val([node.icon]);
			return false;
		})
		
		// 更新按钮点击事件
		$("#menuEditBtn").click(function(){
			// 获取表单数据
			var name = $("#menuEditModal [name=name]").val();
			var url = $("#menuEditModal [name=url]").val();
			var icon = $("#menuEditModal [name=icon]:checked").val();
			
			// 发送ajax更新
			$.ajax({
				"url":"menu/update.json",
				"type":"post",
				"data":{
					"name":name,
					"url":url,
					"icon":icon,
					"id": window.id
				},
				"dataType": "json",
				"success" : function(response) {
					var result = response.result;
					if (result == "SUCCESS") {
						layer.msg("更新数据成功！");
						generateTree();
						$("#menuEditModal").modal("hide");
						
					}
					if (result == "FAILED") {
						layer.msg("操作失败！" + response.message);
					}
				},
				"error" : function(response) {
					layer.msg("更新数据失败！" + response.status + " "
							+ response.statusText);
				}
			});
			
		});
		
		// 删除菜单
		$("#treeDemo").on("click", ".removeIcon", function(){
			window.id = $(this).attr("menuId");
			$("#menuConfirmModal").modal("show");
			var zTreeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var key = "id";
			var value = window.id;
			var node = zTreeObj.getNodeByParam(key, value, null);
			$("#removeNodeSpan").append(node.name);
			return false;
		})
		
		// 删除确认按钮
		$("#confirmBtn").click(function(){
			// 发送ajax删除
			$.ajax({
				"url":"menu/delete.json",
				"type":"post",
				"data":{
					"id": window.id
				},
				"dataType": "json",
				"success" : function(response) {
					var result = response.result;
					if (result == "SUCCESS") {
						layer.msg("删除数据成功！");
						generateTree();
						$("#menuConfirmModal").modal("hide");
						
					}
					if (result == "FAILED") {
						layer.msg("操作失败！" + response.message);
					}
				},
				"error" : function(response) {
					layer.msg("更新数据失败！" + response.status + " "
							+ response.statusText);
				}
			});
		})
		
		
	})
</script>
<body>

	<%@include file="/WEB-INF/include-nav.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%@include file="/WEB-INF/include-sidebar.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-th-list"></i> 权限菜单列表
						<div style="float: right; cursor: pointer;" data-toggle="modal"
							data-target="#myModal">
							<i class="glyphicon glyphicon-question-sign"></i>
						</div>
					</div>
					<div class="panel-body">
						<ul id="treeDemo" class="ztree">

						</ul>
					</div>
				</div>
			<%@include file="/WEB-INF/modal-menu-add.jsp" %>
			<%@include file="/WEB-INF/modal-menu-confirm.jsp" %>
			<%@include file="/WEB-INF/modal-menu-edit.jsp" %>
			</div>
		</div>
	</div>

</body>
</html>