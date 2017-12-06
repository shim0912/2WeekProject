<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>    
<% response.setContentType("text/html; charset=UTF-8");%>
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
	.background{background-image: url("image/image2.jpg"); position: fixed; left:500px;top:150px; height: 60%;width:55%; background-size: cover; z-index: -1;	}
	.left{left: 200px}
	td{text-align: left;}

</style>
</head>
<body>
	<%@include file="forms/backform.jsp"%>
	
	<div class="background" id="opa">
	
<form action="xe.do" method="get">
	<div id="tablea" style="opacity: 1">
	<input type="hidden" name="command" value="QandAwrite">
			<table border="1"class="table table-striped  table table-bordered info" style="width: 500px; opacity: 2" align="center" ; >
			<col width="70px">
			<col width="60px">

			<tr class="info" style="opacity: 0.7">
				<th valign="middle">아이디</th>
				<td><input type="text" readonly="readonly" name="writer" value="${sessionInfo.pr_id }"></td>
			</tr>	
			<tr class="info" style="opacity: 0.7">
				<th valign="middle">제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<th valign="middle">내용</th>
				<td><textarea rows="10" cols="50" name="content"></textarea></td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<td colspan="3" style="text-align: left;">
					<input type="submit" value="작성완료" class="btn btn-primary btn-sm">
		 			<input type="button" value="취소" onclick="location.href='xe.do?command=QandAList'" class="btn btn-info btn-sm">		
				</td>
			</tr>
			
		</table>	
		
		</div>
</form>
</div>

</body>
</html>