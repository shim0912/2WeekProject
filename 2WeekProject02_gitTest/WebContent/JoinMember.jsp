<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>    
<% response.setContentType("text/html; charset=UTF-8");%>
<%@page import="com.pr.dto.UserDto" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function idconfirm(){
	var chk = document.getElementsByName("id")[0].title;
	if(chk=="중복 미체크"){
		alert("아이디를 중복 체크 해주세요");
		document.getElementsByName("id")[0].focus();
	}
}

function confirm(){
	var id = document.getElementsByName("id")[0];
	if(id.value.length == 0 || id.value.length > 10){
		alert("id는 0~10자 이내로 입력해 주세요!!");
	}else{
		open("xe.do?command=idChk&id=" + id.value, "", "width=300px,height=150px");
	}
}

function closeForm(){
	self.close();
}

$(function(){
	$id = $("input[name=id]");
	$id.change(function(){
		$(this).prop("title", "중복 미체크");
	});
});

</script>
<style type="text/css">
body{margin: 50px;}
</style>
</head>
<body>
	<form action="xe.do" method="get">
		<input type="hidden" name="command" value="join">
			<table border="1" class="table table-striped table-bordered table-hover" style="width: 370px">
				<tr class="info" style="opacity: 0.7">
					<th>아이디</th>
					<td>
						<input type="text" name="id" required="required" title="중복 미체크">
						<input type="button" value="중복확인" onclick="confirm()">
					</td>
				</tr>
				<tr class="info" style="opacity: 0.7">
					<th>비밀번호</th>
					<td><input type="password" name="pw" required="required" onclick="idconfirm()"></td>
				</tr>
				<tr class="info" style="opacity: 0.7">
					<th>이름</th>
					<td><input type="text" name="name" required="required"></td>
				</tr>
				<tr class="info" style="opacity: 0.7">
					<th>주소</th>
					<td><input type="text" name="addr" required="required"></td>
				</tr>
				<tr class="info" style="opacity: 0.7">
					<th>핸드폰번호</th>
					<td><input type="text" name="phone" required="required"></td>
				</tr>
				<tr class="info" style="opacity: 0.7">
					<th>이메일주소</th>
					<td><input type="email" name="email" required="required"></td>
				</tr>
				
			</table>
			<br>
				<input type="submit" value="가입" class="btn btn-primary btn-sm">
				<input type="button" value="취소" class="btn btn-primary btn-sm" onclick="closeForm();">
	</form>	



</body>
</html>