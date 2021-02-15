<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>teacherListView</title>
</head>
<body>
<table align="center" width="500" border="1" cellspacing="0" cellpadding="1">
<tr><th>번호</th><th>제목</th><th>첨부파일</th><th>날짜</th></tr>
<c:forEach items="${ requestScope.list }" var="c">
<tr>
	<td align="center">${ n.cid }</td>
	<c:url value="cdetail.do" var="und">
		<c:param name="nid" value="${ n.nid }"/>
	</c:url>
	<td align="center"><a href="${ und }">${ n.ntitle }</a></td>
	<td align="center">${ n.nwriter }</td>
	<td align="center">
		<c:if test="${ !empty n.file_path }">◎</c:if>
		<c:if test="${ empty n.file_path }">&nbsp;</c:if>
	</td>
	<td align="center">
		<fmt:formatDate value="${n.n_create_date }" pattern="yyyy-MM-dd"/>
	</td>
</tr>
</c:forEach>
</table>
</body>
</html>