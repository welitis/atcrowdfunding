<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keys" content="">
<meta name="author" content="">
<base
	href="http://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" href="index.html" style="font-size: 32px;">尚筹网-创意产品众筹平台</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="container" style="text-align: center">

		<h2 class="form-signin-heading">
			<i class="glyphicon glyphicon-log-in"></i> 尚筹网系统消息
		</h2>
		<h4>${requestScope.exception.message }</h4>
		<button style="width: 300px; margin: 0px auto;"
			class="btn
	btn-lg btn-success btn-block">返回刚才页面</button>
	</div>
	<script src="jquery/jquery-2.1.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$("button").click(function() {
			// 调用back()方法类似于点击浏览器的后退按钮
			window.history.back();
		});
	});
</script>
</body>
</html>