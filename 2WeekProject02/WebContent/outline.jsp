<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
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
	.table { margin-top: 150px;  }
	#table{opacity: 0.9; font-size:18px; }
	</style>
</head>
<body>
	<%@include file="forms/backform.jsp"%>

	<div class="background" id="opa">
	<div class="table">
		<table class="table table-striped  table table-bordered info" style="width: 500px; opacity: 2" align="center" ;>
			<tr>
				<td id="table">
			<b>이 페이지를 만든 이유는</b> 모든 사람들이 여행을 희망하는<br>장소에 대한 날씨 그리고 경로에 대한 정보를 제공함으로써 <br>생활에 대한 편리성을 느끼기 위함이다. 
		</td>
			</tr>
		</table>
		</div>
	</div>






</body>
</html>