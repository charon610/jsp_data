<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
<form method="post" action="04_testLogin.jsp">
	<lable for="userid">아이디 : </lable>
	<input type="text" name="id" id="userid"><br>
	
	<lable for="userpwd">암 &nbsp;호 : </lable>
	<input type="password" name="pwd" id="userpwd"><br>
	
	<input type="submit" value="로그인">
</form>
</body>
</html>