<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 승인거부된 클래스 목록</h2>
<table>
	<tr><th>수업 번호</th><th>수업 제목</th><th>강사 id</th></tr>
	<c:forEach items="${ requestScope.list }" var="c">
	<tr>
		<td align="center">${ c.cid }</td>
		<td>   
		   <c:url var="acd" value="/adcdetail.do">
		      <%-- <c:param name="page" value="${ currentPage }"/> --%>
		      <c:param name="cid" value="${ c.cid }" />
		   </c:url>
		   <a href="${ acd }">${ c.clss_title }</a>
	    </td>
		<td align="center">${ c.tchr_id }</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>