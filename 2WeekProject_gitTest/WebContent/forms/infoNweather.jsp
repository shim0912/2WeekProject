<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>    
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script src="weather/weather.js"></script>

<style type="text/css">
	.weather{left: 1050px;position: absolute; top: 250px}	
</style>
</head>
<body>

	<div class="weather">
		<table  border="2" class="table table-striped  table table-bordered">
		<col width="55px">
		<col width="180px">
		<col width="55px">
		<col width="180px">
		
			<tr class="info" style="opacity: 0.7">
				<th colspan="2" rowspan="2" class="text-center">지역 내용</th>
				<th colspan="2" rowspan="2" class="text-center">도로 주소</th>
			</tr>
			<tr>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<td><br>주소 </td>
				<td></td>
				<td>출발 위치</td>
				<td></td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<td><br>기 온</td>
				<td><input type="text" id="temp" readonly="readonly"></td>
				<td><br>거 리</td>
				<td></td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<td>습도</td>
				<td><input type="text" id="reh" readonly="readonly"></td>
				<td rowspan="3" colspan="2"></td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<td>강수확률</td>
				<td><input type="text" id="pop" readonly="readonly"></td>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<td colspan="2">
					<img id="weather_img" src="">
				</td>
			</tr>
		
		</table>	
	</div>











</body>
</html>