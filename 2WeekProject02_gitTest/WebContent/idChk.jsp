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

<script type="text/javascript">
	onload = function() {
		var id = opener.document.getElementsByName("id")[0].value;
		document.getElementsByName("id")[0].value = id;
	}

	function confirm(bool) {
		if (bool == "true") {
			opener.document.getElementsByName("pw")[0].focus();
			opener.document.getElementsByName("id")[0].title = "중복 체크";
		} else{
			opener.document.getElementsByName("id")[0].focus();
		}
		self.close();
	}
</script>

</head>
<%
	String idNotUsed = request.getParameter("idNotUsed");
%>
<body>

	<table border="1">
		<tr class="info" style="opacity: 0.7">
			<td><input type="text" name="id"></td>
		</tr>
		<tr class="info" style="opacity: 0.7">
			<td><%=idNotUsed.equals("true") ? "ID 생성이 가능합니다." : "이미 사용 중인 ID입니다."%></td>
		</tr>
		<tr class="info" style="opacity: 0.7">
			<td><input type="button" value="확인" onclick="confirm('<%=idNotUsed%>');"></td>
		</tr>
	</table>

</body>
</html>