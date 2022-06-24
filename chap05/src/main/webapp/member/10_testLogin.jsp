<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id="tonystark";
	String pwd="1234";
	String name="아이언맨";
	
	if(id.equals(request.getParameter("id")) &&
			pwd.equals(request.getParameter("pwd")) ){
		session.setAttribute("loginUser", name);
		response.sendRedirect("10_main.jsp");
	}
	else{
		response.sendRedirect("10_loginForm.jsp");
	}
%>
</body>
</html>