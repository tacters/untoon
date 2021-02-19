<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table align="center" width="500" border="1" cellspacing="0" cellpadding="1">
<tr><th>번호</th><th>제목</th><th>첨부파일</th><th>시작날짜</th></tr>
<c:forEach items="${ requestScope.list }" var="c">
<tr>
	<td align="center">${ c.cid }</td>
	<c:url value="cdetail.do" var="und">
		<c:param name="nid" value="${ c.cid }"/>
	</c:url>
	<td align="center"><a href="${ und }">${ c.clss_title }</a></td>
	<%-- <td align="center">${ c.nwriter }</td> --%>
	<%-- <td align="center">
		<c:if test="${ !empty n.file_path }">◎</c:if>
		<c:if test="${ empty n.file_path }">&nbsp;</c:if>
	</td> --%>
	<td align="center">
		<fmt:formatDate value="${c.clss_start }" pattern="yyyy-MM-dd"/>
	</td>
</tr>
</c:forEach>
</table>

</body>
</html>