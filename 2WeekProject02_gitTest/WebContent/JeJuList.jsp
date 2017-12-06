<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>    
<% response.setContentType("text/html; charset=UTF-8");%>
<%@page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
	#search{float: right;}	
	.div { position:absolute ;left:650px; top: 150px;}
	form {
	margin-top: 100px;
}
	
</style>
</head>
<body>
<%@include file="forms/backform.jsp"%>
<%@include file="forms/travelDetail.jsp"%>
<% 
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH) + 1;
int day = cal.get(Calendar.DATE);
%>
	<div class="div">
	<form action="">
		
		<table class="table table-striped  table table-bordered table table-hover " style="width: 380px; height: 150px;">
		<col width="90px">
		<col width="90px">
		<col width="90px">
		<col width="90px">
		
			<tr class="info" style="opacity: 0.7">
				<th colspan="4">
					<select name="year">
<%
for(int i=year;i<year+3;i++){
%>
					<option value="<%=i%>" <%=year==i?"selected":"" %>><%=i%></option>
<%	
}
%>					
					</select>년
					<select name="month">
<%
for(int i=1;i<13;i++){
%>
					<option value="<%=i%>" <%=month==i?"selected":"" %>><%=i%></option>
<%
}
%>					
					</select>월
					
					<select name="day">
<%
for(int i=1;i<32;i++){
%>
					<option value="<%=i%>" <%=day==i?"selected":"" %>><%=i%></option>

<%	
}
%>					
					</select>일
				</th>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<th>제주시 <input type="checkbox" name="incheon"></th>
				<th>서귀포시 <input type="checkbox" name="incheon"></th>
				<th class="text-center">공 란</th>
				<th class="text-center">공 란</th>
			</tr>


			<tr class="info" style="opacity: 0.7">
				<td colspan="4"><input type="button" value="조회" id="search" class="btn btn-primary"></td>
			</tr>
		
		</table>	
	</form>
	</div>
	
<%@include file="forms/infoNweather.jsp" %>	

</body>
</html>