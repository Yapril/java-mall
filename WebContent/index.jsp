<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.MallItems" %>
<%@ page import="dao.MallItemsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<title>商城首页</title>
</head>
<body>
	<ul class="nav nav-pills">
		<%
			String loginUser = "";
			if(session.getAttribute("loginUser")!=null) {
				loginUser = session.getAttribute("loginUser").toString();
		%>
		<li>欢饮您！<%=loginUser %></li>
		<li><a href="dologin.jsp">退出</a></li>
		<%
			} else {
		%>
		<li><a href="login.jsp">登录</a></li>
		<%
			}
		%>
	</ul>
	<div class="container">
		<h1>商品展示</h1>
		<hr>
		<div class="row">
			<%
				MallItemsDAO mallItemsDao = new MallItemsDAO();
				ArrayList<MallItems> list = mallItemsDao.getAllMallItems();
				for(int i = 0; i<list.size();i++)
				{
					MallItems item = list.get(i);
			%>
			<div class="col-sm-6 col-md-3">
				<a href="#" class="thumbnail">
					<img src="images/<%=item.getPicture() %>" width="100%"/>
					<div class="caption">
						<h3><%=item.getName() %></h3>
						<p><%=item.getPrice() %></p>
						<p><%=item.getCity() %></p>
						<p><%=item.getNumber() %></p>
					</div>
				</a>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>