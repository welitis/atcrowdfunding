<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
<script type="text/javascript" src="jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#btn1").click(function(){
			$.ajax({
				'url': 'send/array.html',
				"type": "post",
				"data": {
					"array": [2,3,4]
				},
				"dataType": "text",
				"success": function(response){
					alert("success");
					console.log(response);
				},
				"error": function(response){
					alert("error");
					console.log(response);
				}
			})
			return false;
		})
		
		$("#btn2").click(function(){
			
			var array = [1,2,3];
			$.ajax({
				'url': 'send/array2.json',
				"type": "post",
				"data": JSON.stringify(array),
				"contentType": "application/json;charset=utf-8",
				"dataType": "json",
				"success": function(response){
					alert("success");
					console.log(response);
				},
				"error": function(response){
					alert("error");
					console.log(response);
				}
			})
			return false;
		})
		
		$("#btn3").click(function(){
			layer.msg("hello world");
		})
	})
</script>
</head>
<body>

	<a href="test/ssm.html">测试SSM环境</a>
	
	<button id="btn1">发送数组数据[2,4,6]</button>
	
	<button id="btn2">发送数组数据2[2,4,6]</button>
	
	<button id="btn3">layer弹框</button>
</body>
</html>