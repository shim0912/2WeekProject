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
.background{background-image: url("image/image2.jpg"); position: fixed; left:500px;top:150px; height: 60%;width:55%; background-size: cover; z-index: -1;	}
table{margin-top:20px; left: 20px;}
form{margin-top: 100px}
</style>
</head>
<body>
<form action="">
<%@include file="forms/backform.jsp"%>
<%@include file="forms/travelDetail.jsp"%>
</form>


</body>
</html>