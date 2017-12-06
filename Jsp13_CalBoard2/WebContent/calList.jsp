<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정</title>

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function allChk(bool) {
		if(bool){
			$("input[name=chk]").prop('checked', bool);
		} else{
			$("input[name=chk]").prop('checked', bool);
		}
	}
	
	function chkAlert() {
		if($("input[name=chk]").length != $("input[name=chk]:checked").length){
			$("input[name=all]").prop('checked', false);
		} else {
			$("input[name=all]").prop('checked', true);
		}
	}
</script>


</head>
<body>
	
	<h1>${ymd }</h1>
	<h1>일정 목록 보기</h1>

	<form action="CalController.do" method="post">
		<input type="hidden" name="command" value="mulDel"> <input
			type="hidden" name="ymd" value="${ymd }">

		<jsp:useBean id="util" class="com.cal.dao.Util" />

		<table border="1">
			<col width="50px">
			<col width="50px">
			<col width="300px">
			<col width="200px">
			<col width="100px">
			<tr>
				<th><input type="checkbox" name="all" onclick="allChk(this.checked);"></th>
				<th>번&nbsp;&nbsp;&nbsp;호</th>
				<th>제&nbsp;&nbsp;&nbsp;목</th>
				<th>일&nbsp;&nbsp;&nbsp;정</th>
				<th>작성일</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="5" style="text-align: center;">===일정이 없습니다===</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td style="text-align: center;"><input type="checkbox" name="chk" value="${dto.seq }" onclick="chkAlert();"></td>
							<td style="text-align: center;">${dto.seq }</td>
							<td><a href="CalController.do?command=calDetail&seq=${dto.seq }">${dto.title }</a></td>
							<td>
								<jsp:setProperty property="toDates" name="util"	value="${dto.mdate }" />
								<jsp:getProperty property="toDates"	name="util" />
							</td>
							<td><fmt:formatDate value="${dto.regdate }" pattern="" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>

			<tr>
				<td colspan="5">
					<input type="submit" value="삭제">
					<input type="button" value="돌아가기" onclick="location.href='CalController.do?command=calendar'">
				</td>
			</tr>

		</table>

	</form>

</body>
</html>