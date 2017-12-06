<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>

<c:catch var="err">
	<c:set var="middleWeatherURL" value="http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=${code }"/>
	<c:import var="middleWeader" url="${middleWeatherURL }"/>
	<x:parse var="wRss" xml="${middleWeader }" />
{
"pubDate":"<x:out select="$wRss/rss/channel/pubDate"/>"

}

</c:catch>
<c:if test="${err != null }">
	${err }
</c:if>


