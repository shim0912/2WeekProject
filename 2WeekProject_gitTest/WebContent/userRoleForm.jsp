<%@page import="com.pr.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update form</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>

</head>

<script type="text/javascript">
	
</script>
<body>

	<%
		UserDto dto = (UserDto) request.getAttribute("userOne");
	%>

	<h1>회원등급 변경 페이지</h1>

	<form action="xe.do" method="post">
		<input type="hidden" name="command" value="updateRole">
		<input type="hidden" name="no" value="${dto.pr_no }">

		<table border="1">
			<tr class="info" style="opacity: 0.7">
				<th>번호</th>
				<td>${userOne.pr_no }</td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<th>이름</th>
				<td>${userOne.pr_name }</td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<th>등급</th>
				<td><select name="role">
						<option value="ADMIN"
							<%=dto.getPr_role().equals("ADMIN") ? "selected" : ""%>>관리자</option>
						<option value="USER"
							<%=dto.getPr_role().equals("USER") ? "selected" : ""%>>일반회원</option>
				</select></td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<td colspan="2"><input type="submit" value="변경완료"></td>
			</tr>
		</table>

	</form>

</body>
</html>