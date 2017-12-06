<%@page import="com.pr.dto.UserDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
body {
	align-content: center;
	text-align: center;
	margin: 200px;
}

th, td {
	text-align: center;
}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
	function updateRole(no, enabled) {
		
		if(enabled == 'n'){
			alert("탈퇴한 회원입니다!");
		}
		var url = "xe.do?command=userRoleForm&no=" + no;
		open(url, "", "width=350px,height=300px");
	}
	
</script>
</head>
<body>
	
	<h1>회원정보 페이지</h1>

		<table border="1" class="table table-striped table-bordered table-hover" style="width: 1000px" align="center">
			<colgroup>
				<col width="50px">
				<col width="200px">
				<col width="200px">
				<col width="1000px">
				<col width="700px">
				<col width="">
				<col width="150px">
				<col width="200PX">
				<col width="200px">
			</colgroup>
			
			<tr class="info" style="opacity: 0.7">
				<th>No</th>
				<th>아이디</th>
				<th>이름</th>
				<th>주 소</th>
				<th>핸드폰 번호</th>
				<th>이메일 주소</th>
				<th>가입</th>
				<th>등급</th>
				<th>등급변경</th>
			</tr>
			<c:choose>
				<c:when test="${empty userListAll }">
					<tr class="info" style="opacity: 0.7">
						<td colspan="9">가입된 회원이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${userListAll }" var="dto">
						<tr class="info" style="opacity: 0.7">
							<td>${dto.pr_no }</td>
							<td>${dto.pr_id }</td>
							<td>${dto.pr_name }</td>
							<td>${dto.pr_addr }</td>
							<td>${dto.pr_phone }</td>
							<td>${dto.pr_email }</td>
							<td>
								<c:choose>
									<c:when test="${dto.pr_enabled eq 'y' }">가입</c:when>
									<c:when test="${dto.pr_enabled eq 'n' }">탈퇴</c:when>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${dto.pr_role eq 'ADMIN' }">관리자</c:when>
									<c:when test="${dto.pr_role eq 'USER' }">일반 회원</c:when>
								</c:choose>
							</td>
							<td>
								<input type="button" value="변경"  onclick="updateRole(${dto.pr_no }, '${dto.pr_enabled }')">
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	<br>
	<br>
	<input type="button" onclick="location.href='AdminMain.jsp'" value="메인" class="btn btn-primary btn-sm">



</body>
</html>