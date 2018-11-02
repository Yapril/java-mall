<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.MallItems" %>
<%@ page import="dao.MallItemsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商城首页</title>
</head>
<body>
	<h1>商品展示</h1>
	<hr>
	<div class="mall-list">
		<%
			MallItemsDAO mallItemsDao = new MallItemsDAO();
			ArrayList<MallItems> list = mallItemsDao.getAllMallItems();
			for(int i = 0; i<list.size();i++)
			{
				MallItems item = list.get(i);
		%>
		<div class="mall-item">
			<div class="img"><img src="images/<%=item.getPicture() %>"></div>
			<div class="mall-info">
				<p class="name"><%=item.getName() %></p>
				<p class="price"><%=item.getPrice() %></p>
				<p class="city"><%=item.getCity() %></p>
				<p class="number"><%=item.getNumber() %></p>
			</div>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>