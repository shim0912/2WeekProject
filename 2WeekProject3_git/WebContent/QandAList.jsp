<%@page import="com.pr.dto.QADto"%>
<%@page import="java.util.List"%>
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
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
th {
	text-align: center;
	align-content: center;
}

form {
	margin-top: 100px;
}
.searchform{position: fixed; left: 980px; margin-top:5px}

.background{background-image: url("image/image2.jpg"); position: fixed; left:500px;top:150px; height: 60%;width:55%; background-size: cover; z-index: -1;	}
</style>
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("#search1").click(function(){
			var result = $(".result").val;
			location.href="xe.do?command=search&writer=${dto.qa_writer}";
		});
	});
	
	</script>
</head>

<body class="container">
	<!--글쓴번호 글쓴이 제목 날짜  -->
	<%@include file="forms/backform.jsp"%>

	<%
		List<QADto> qaList = (List<QADto>) request.getAttribute("qaList");
	%>
	

	<div class="background">
		<form action="">
			<input type="hidden" name="command" value="delete">
			<table border="1"
				class="table table-striped  table table-bordered table table-hover"
				style="width: 500px;" align="center">
				<col width="10px">
				<col width="40px">
				<col width="120px">
				<col width="80px">
				<tr class="info" style="opacity: 0.7">
					<th class="text-center">글 번호</th>
					<th class="text-center">글쓴이</th>
					<th class="text-center">제 목</th>
					<th class="text-center">작성일</th>
				</tr>
				<c:choose>
					<c:when test="${empty qaList }">
						<tr class="info" style="opacity: 0.7">
							<td colspan="4">==========작성된 글이 없습니다==========</td>
						</tr>
					</c:when>
					<c:otherwise>
					<c:forEach items="${qaList }" var="dto">
						<c:if test="${dto.qa_enabled == 'y' }">
							<tr class="info" style="opacity: 0.7">
								<td><br>${dto.qa_seq }</td>
								<td><br>${dto.qa_writer }</td>
								<td><br><a href="xe.do?command=detailForm&seq=${dto.qa_seq }">${dto.qa_title }</a></td>
								<td><br>${dto.qa_regdate }</td>
							</tr>
						</c:if>
					</c:forEach> 
					</c:otherwise>
				</c:choose>
				<tr class="info" style="opacity: 0.7">
					<td colspan="4" style="text-align: left;">
						<input type="button" value="글쓰기" onclick="location.href='writeForm.jsp'" class="btn btn-primary">
						<input type="button" value="메인" class="btn btn-info btn-sm" onclick="location.href='main.jsp'">
					</td>
				</tr>
			</table>
			<div class="searchform">
				<form action="xe.do" method="get" class="searchform" >
			<input type="hidden" name="command" value="search">
			<select>
				<option id="con" class="btn btn-primary">제목</option>
				<option id="wr" class="btn btn-primary">작성자</option>
			</select>
				<input type="text" class="result" value="${search }" class="btn btn-primary">
				<input type="button" value="검색" id="search1"class="btn btn-primary" >
	
				</form>
			</div>
			
		</form>
	</div>
</body>
</html>