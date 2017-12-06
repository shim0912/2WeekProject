<%@page import="com.cal.dto.CalDto"%>
<%@page import="java.util.List"%>
<%@page import="com.cal.dao.CalDao"%>
<%@page import="com.cal.dao.Util"%>
<%@page import="java.util.Calendar"%>
<%@page import="static java.util.Calendar.*"%>
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
<title>달력</title>
<style type="text/css">
#calendar {
	border-collapse: collapse;
	border: 2px solid gray;
}

#calendar th {
	width: 80px;
	border: 2px solid gray;
}

#calendar td {
	width: 80px;
	height: 80px;
	border: 2px solid gray;
	text-align: left;
	vertical-align: top;
	position: relative;
}

.cPreview {
	position: absolute;
	top: -30px;
	left: 10px;
	background-color: aqua;
	width: 40px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	border-radius: 40px 40px 40px 1px;
}

.clist > p {
	font-size: 5px;
	margin: 1px;
	background-color: pink;
}
</style>

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".countView").hover(
				function() {
					//마우스 올렸을 때

					var aCountView = $(this);
					var year = $(".y").text().trim();
					var month = $(".m").text().trim();
					var cDate = aCountView.text().trim();

					var yyyyMMdd = year + isTwo(month) + isTwo(cDate);

					$.ajax({
						type : "post", //전송 방식
						url : "CalListCountAjax.do", //요청 url
						data : "id=hk&yyyyMMdd=" + yyyyMMdd, //전송 parameter
						datatype : "json", //서버에서 받는 데이터 타입
						async : true, //비동기 true / 동기 false
						success : function(msg) { //성공했을 때
							
							var count = msg.calCount;
							aCountView.after("<div class='cPreview'>" + count
									+ "</div>");

						},
						error:function() { //실패했을 때
							alert("서버 통신 실패!");
						}
					});

				}, function() {
					//마우스 내렸을 때
					$(".cPreview").remove();
				});

		function isTwo(no) {
			return no.length < 2 ? "0" + no : no;
		}

	});
</script>

</head>
<body>

	<div align="center">
		<%
			Calendar cal = Calendar.getInstance();

			int year = cal.get(YEAR);
			int month = cal.get(MONTH) + 1;

			if (request.getParameter("year") != null) {
				year = Integer.parseInt(request.getParameter("year"));
			}
			if (request.getParameter("month") != null) {
				month = Integer.parseInt(request.getParameter("month"));
				if (month > 12) {
					month = 1;
					year = year + 1;
				}
				if (month < 1) {
					month = 12;
					year--;
				}
			}

			//현재 연도, 현재 월, 그 월의 1일
			cal.set(year, month - 1, 1);
			//그 1일의 요일
			int start = cal.get(DAY_OF_WEEK);
			int lastDay = cal.getActualMaximum(DAY_OF_MONTH);
			
			//달력에 일정 표현!!
			CalDao dao = new CalDao();
			String yyyyMM = year + Util.isTwo(String.valueOf(month));
			List<CalDto> clist = dao.getCalViewList("hk", yyyyMM);
		%>
		<table id="calendar">
			<caption>
				<a href="calendar.jsp?year=<%=year - 1%>&month=<%=month%>">◁</a>
				<a href="calendar.jsp?year=<%=year%>&month=<%=month - 1%>">◀</a>
				<span class="y"><%=year%></span>년
				<span class="m"><%=month%></span>월 
				<a href="calendar.jsp?year=<%=year%>&month=<%=month + 1%>">▶</a>
				<a href="calendar.jsp?year=<%=year + 1%>&month=<%=month%>">▷</a>
			</caption>
			<tr>
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
			<tr>
				<%
					for (int i = 1; i < start; i++) {
						out.print("<td>&nbsp;</td>");
					}
				%>
				<%
					for (int i = 1; i <= cal.getActualMaximum(DAY_OF_MONTH); i++) {
				%>
				<td>
					<a class="countView" href="CalController.do?command=calList&year=<%=year%>&month=<%=month%>&date=<%=i%>"
					style="color: <%=Util.fontColor(i, start)%>"><%=i%></a>
					<a href="insertCalBoard.jsp?year=<%=year%>&month=<%=month%>&date=<%=i%>&lastDay=<%=lastDay%>">
					<img alt="일정추가" src="img/pen.png" style="width: 10px; height: 10px;"></a>
					
					<div class="clist">
						<%=Util.getCalView(i, clist) %>					
					</div>
					
				</td>
				<%
					if ((start - 1 + i) % 7 == 0) {
							out.print("</tr><tr>");
						}
					}

					//cal.set(year, month - 1, cal.getActualMaximum(DAY_OF_MONTH));
					//for (int i = cal.get(DAY_OF_WEEK); i < 7 ; i++) {
					for (int i = 0; i < (7 - (start - 1 + lastDay) % 7) % 7; i++) {
						//(start - 1 + lastDay) % 7 : 마지막 날의 요일
						//(7 - (start - 1 + lastDay) % 7) % 7 : 마지막 주의 남은 칸을 만들어 주는데,
						//7(토요일)인 경우 한 줄이 더 생기기 때문에, 한 번 더 %7를 해준다.
						out.print("<td>&nbsp;</td>");
					}
				%>
			</tr>
		</table>
	</div>

</body>
</html>