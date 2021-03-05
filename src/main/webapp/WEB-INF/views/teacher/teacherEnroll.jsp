<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
</head>
<body>
<table>
	<tr><th>이름</th><th>ID</th><th>닉네임</th><th>전화번호</th><th>성별</th>
</tr>
<c:forEach items="${ requestScope.list }" var="m">
<tr>
   <td align="center">${ m.id }</td>
   <td align="center">${ m.nickname } </td>
   <td align="center">${ m.phone } </td>
   <c:set var="gender" value="${ m.gender }"/>
   <c:if test="${ gender eq 'F' }"/>
   <td align="center"><c:out value="여자"/></td>
   <c:if test="${ gender eq 'M' }"/>
   <td align="center"><c:out value="남자"/></td>
</tr>
   </c:forEach>
</table>
</body>
</html>