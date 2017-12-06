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
<title>인덱스</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
body {
	align-content: center;
	text-align: center;
}

img {
	margin-top: 50px;
	top: 50px;
	width: 850px;
	height: 550px;
	border-radius: 10px 10px 10px 10px
}

td {
	font-family: 궁서;
	font-size: 15px;
	vertical-align: middle;
}
</style>
<script type="text/javascript">
	function member() {
		open("JoinMember.jsp", "", "width=500px,height=500px");
	}
</script>
</head>
<body>

	<div class="mainpicture">
		<img alt="인덱스 홈페이지 사진" src="image/image1.jpg" class="img-thumbnail">
	</div>

	<br>
	<br>
	<br>
	<div class="form-group row">
		<form action="xe.do" method="get">
			<input type="hidden" name="command" value="login">
			<table border="1" class="table table-striped  table table-bordered table table-hover" align="center" style="width: 500px;">
				<tr>
					<td valign="middle"><b>아이디</b></td>
					<th>
						<input type="text" class="form-control" placeholder="아이디를 입력하세요" name="id">
					</th>
				</tr>
				<tr>
					<td valign="middle"><b>비밀번호</b></td>
					<th><input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="pw"></th>
				</tr>
			</table>
				<input type="submit" value="확인" class="btn btn-primary">
				<input type="button" value="회원가입" class="btn btn-info" onclick="member()">
		</form>
	</div>

	<br>
	<address>copyright &copy; allright reserved</address>




</body>
</html>