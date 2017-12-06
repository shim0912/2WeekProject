<%@page import="com.cal.dto.CalDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 상세 보기</title>
</head>
<body>
	<%
		CalDto dto = (CalDto) request.getAttribute("dto");
	%>
	<jsp:useBean id="util" class="com.cal.dao.Util" />
	<table border="1">

		<tr>
			<th>ID</th>
			<td>${dto.id }</td>
		</tr>
		<tr>
			<th>날&nbsp;&nbsp;&nbsp;짜</th>
			<td>
				<jsp:setProperty property="toDates" name="util"	value="${dto.mdate }" />
				<jsp:getProperty property="toDates" name="util" />
			</td>
		</tr>
		<tr>
			<th>제&nbsp;&nbsp;&nbsp;목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>내&nbsp;&nbsp;&nbsp;용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="돌아가기" onclick="location.href='CalController.do?command=calList&year=<%=dto.getMdate().substring(0, 4)%>&month=<%=dto.getMdate().substring(4, 6)%>&date=<%=dto.getMdate().substring(6, 8)%>'">
				<input type="button" value="삭제">
			</td>
		</tr>
	</table>

</body>
</html>