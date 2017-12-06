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
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
.first {
	margin-top: 200px;
}

td {
	vertical-align: middle;
	text-align: center;
	back
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("div:eq(0)").css({
			"height" : "0px",
			"width" : "20px",
			"margin-top" : "150px",
			"font-size" : "23px",
			"font-family" : "sans-serif",
			"font-style" : "oblique"
		})
		$("td").css({
			"padding-left" : "10px",
			"padding-right" : "10px",
			"padding-top" : "10px",
			"padding-bottom" : "10px"
		});
		$("div:eq(1)").css("margin-left", "115px");
		$("address").css("margin-left", "250px");
	});
</script>
</head>
<body class="container">

	<div class="first">
		<table border="3"
			class="table table-striped  table table-bordered table table-hover"
			style="width: 80px; height: 450px;">
			<tr class="info" style="opacity: 0.7">
				<td><a href="main.jsp"><span	class="text-center"><br>메인</span></a></td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<td><a href="outline.jsp"><span	class="text-center"><br>개요</span></a></td>
				
			</tr>
			<tr class="info" style="opacity: 0.7">
				<td><a href="travelList.jsp"><span class="text-center"><br>여행<br>등록</a></td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<td><a href="xe.do?command=QandAList"><span	class="text-center"><br>Q&A</span></a></td>
			</tr>
		</table>
	</div>
	<div>
		<img alt="메인 음영 그림" src="image/image1.jpg" class="img-thumbnail">
	</div>

	<br>
	<br>
	<br>
	<br>

	<footer>
		<address class="text-center">copyright &copy; allright reserved</address>
	</footer>



</body>
</html>