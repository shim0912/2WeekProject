<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>    
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.pr.dto.UserDto"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
	form {margin-top: 100px;}
	th {text-align: center;vertical-align: middle; }
	td{text-align: left;}
	.background{background-image: url("image/image2.jpg"); position: fixed; left:500px;top:150px; height: 60%;width:55%; background-size: cover; z-index: -1;	}
</style>
</head>
<body>
<%@include file="forms/backform.jsp"%>
<%
		UserDto dto = (UserDto) request.getAttribute("userOne");
		%>

	<div class="background">
	<form action="xe.do" method="post">
	<input type="hidden" name="command" value="delete">
		<table border="1"class="table table-striped  table table-bordered info" style="width: 500px; opacity: 2" align="center" ;>
		<col width="70px">
		<col width="60px">
			<tr class="info" style="opacity: 0.7">
				<th class="text-center">글번호</th>
				<td>${dto.qa_seq }</td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<th  class="text-center">글쓴이</th>
				<td>${dto.qa_writer }</td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<th  class="text-center">제 목</th>
				<td>${dto.qa_title }</td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<th  class="text-center">내 용</th>
				<td><textarea rows="10" cols="50" readonly="readonly">${dto.qa_content }</textarea></td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<td colspan="4" style="text-align: left;">
					<input type="button" value="삭제" class="btn btn-primary btn-sm" onclick="location.href='xe.do?command=delete&no=${dto.qa_seq }'">
					<input type="button" value="목록" onclick="location.href='xe.do?command=QandAList'" class="btn btn-info btn-sm"> 
				</td>
			</tr>			

		</table>	
	</form>
	</div>
</body>
</html>