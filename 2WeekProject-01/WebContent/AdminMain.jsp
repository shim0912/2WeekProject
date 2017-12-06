<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<%@page import="com.pr.dto.UserDto"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
body {
	align-content: center;
	text-align: center;
}
</style>
</head>
<% session.getAttribute("dto"); %>
<body>


	<h1>운영자 전용 페이지</h1>
	<h2>${sessionAdminInfo.pr_id }님, 환영합니다!! (등급 : ${sessionInfo.pr_role })</h2>

	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="#">환영합니다</a></li>
		<li role="presentation"><a href="xe.do?command=userListAll">회원정보관리</a></li>
		<li role="presentation"><a href="xe.do?command=logout">로그아웃</a></li>
	</ul>
</body>
</html>