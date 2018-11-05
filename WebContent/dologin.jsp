<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MallUsersDAO" %>
<%@ page import="javax.swing.*" %>
<%
	String username="";
	String password="";
	request.setCharacterEncoding("utf-8");
	
	username = request.getParameter("username");
	password = request.getParameter("password");
	
	System.out.println(username);
	MallUsersDAO mallUsersDao = new MallUsersDAO();
	
	if(session.getAttribute("loginUser") == null) {
		if(mallUsersDao.checkLogin(username,password))
		{
			//为了让用户名在首页上显示，可以把username保存在session里
			session.setAttribute("loginUser", username);
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}else {
			JOptionPane.showMessageDialog(null, "您输入的用户名或者密码不正确，请重新登录！");
			response.sendRedirect("login.jsp");
		}
	}else {
		session.removeAttribute("loginUser");
		response.sendRedirect("login.jsp");
	}
%>