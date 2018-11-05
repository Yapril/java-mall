<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MallUsersDAO" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.net.URLEncoder" %>

<%
	String username="";
	String password="";
	String[] isUseCookie = request.getParameterValues("isUseCookie");
	request.setCharacterEncoding("utf-8");
	
	username = request.getParameter("username");
	password = request.getParameter("password");
	
	System.out.println(username);
	MallUsersDAO mallUsersDao = new MallUsersDAO();
	//是否登录过
	if(session.getAttribute("loginUser") == null) {
		//未登录
		//判断是否登录成功
		if(mallUsersDao.checkLogin(username,password))
		{
			//成功登录
			//为了让用户名在首页上显示，可以把username保存在session里
			session.setAttribute("loginUser", username);
			//是否点击记住登录
			if(isUseCookie!=null&&isUseCookie.length>0)
			{
				//设置Cookie
				username = URLEncoder.encode("username");
				password = URLEncoder.encode("password");
				
				Cookie usernameCookie = new Cookie("username",username);
				Cookie passwordCookie = new Cookie("password",password);
				//设置十天期限(ms)
				usernameCookie.setMaxAge(864000);
				passwordCookie.setMaxAge(864000);
				
				response.addCookie(usernameCookie);
				response.addCookie(passwordCookie);
				
			}
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}else {
			//未成功登录
			JOptionPane.showMessageDialog(null, "您输入的用户名或者密码不正确，请重新登录！");
			response.sendRedirect("login.jsp");
		}
	}else {
		//已登录过，退出登录
		session.removeAttribute("loginUser");
		response.sendRedirect("login.jsp");
	}
%>