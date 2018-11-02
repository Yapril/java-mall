<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MallUsersDAO" %>
<%
	String username="";
	String password="";
	request.setCharacterEncoding("utf-8");
	
	username = request.getParameter("username");
	password = request.getParameter("password");
	
	System.out.println(username);
	
	MallUsersDAO mallUsersDao = new MallUsersDAO();
	if(mallUsersDao.checkLogin(username,password))
	{
		//为了让用户名在首页上显示，可以把username保存在session里
		session.setAttribute("loginUser", username);
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}else {
		response.sendRedirect("login.jsp");
	}
%>