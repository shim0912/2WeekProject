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
#table{position:absolute; top:45px; left: 20px;}

</style>
</head>
<body>
		<div class="background" >
	<form action="xe.do" method="post">
	<input type="hidden" name="command">
 		<table  border="1"class="table table-striped  table table-bordered info text-center col-md-10 " style="width: 100px;"  id="table">
			<col width="5px">
				
			<tr class="info" style="opacity: 0.7">
				<th class="text-center"><a></a><a href="SeoulList.jsp" ><input type="hidden" value="seoul"name="seoul">서울특별시</a></th>
			</tr>
			
			<tr class="info" style="opacity: 0.7">
				<th class="text-center" ><a href="IncheonList.jsp" ><input type="hidden" value="incheon"name="incheon">인천광역시</a></th>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<th class="text-center"><a href="KungkidoList.jsp"><input type="hidden"  value="kungkiDo"name="kungkiDo">경기도</a></th>
			</tr>
			<tr class="info" style="opacity: 0.7">
				<th class="text-center"><a href="KangwondList.jsp" ><input type="hidden" value="kangwondo"name="kangwondo">강원도</a></th>
			</tr>
			<tr class="info" style="opacity: 0.7">
			<th class="text-center"><a href="ChungNamList.jsp" ><input type="hidden" value="chungNam"name="chungNam">충청남도</a></th>
			</tr>
			<tr class="info" style="opacity: 0.7">
			<th class="text-center"><a href="ChungBuckLsit.jsp" ><input type="hidden" value="chungBuck"name="chungBuck">충청북도</a></th>
			</tr>
			<tr class="info" style="opacity: 0.7">
			<th class="text-center"><a href="JunNamList.jsp" ><input type="hidden" value="junraNam"name="junraNam">전라남도</a></th>
			</tr>
			<tr class="info" style="opacity: 0.7">
			<th class="text-center"><a href="JunBuckList.jsp" ><input type="hidden" value="junraBuck"name="junraBuck">전라북도</a></th>
			</tr>
			<tr class="info" style="opacity: 0.7">
			<th class="text-center"><a href="KungNamList.jsp" ><input type="hidden" value="kungsanNam"name="kungsanNam">경상남도</a></th>
			</tr>
			<tr class="info" style="opacity: 0.7">
			<th class="text-center"><a href="KungBuckList.jsp" ><input type="hidden" value="kungsanBuck"name="kungsanBuck">경상북도</a></th>
			</tr>
			<tr class="info" style="opacity: 0.7">
			<th class="text-center"><a href="JeJuList.jsp" ><input type="hidden" value="jeju" name="jeju">제주도</a></th>
			</tr>
		</table>
		
		
		
		
	</form>
	</div>



</body>
</html>