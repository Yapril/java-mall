<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<div class="container">
		<div class="card card-primary">
			<div class="card-heading">
				<h3 class="card-title">
					登录页面
				</h3>
				<div class="card-body">
					<form method="post" action="dologin.jsp">
						<div class="form-group">
							<label for="username">用户名：</label>
							<input type="text" class="form-control" id="username" name="username">
						</div>
						<div class="form-group">
							<label for="password">密码：</label>
							<input type="password" class="form-control" id="password" name="password">
						</div>
						<div class="form-check">
							<label for="" class="form-check-label">
								<input type="checkbox" class="form-check-input" name="isUseCookie">十天内记住我
							</label>
						</div>
						<button class="btn btn-primary" type="submit">登录</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>