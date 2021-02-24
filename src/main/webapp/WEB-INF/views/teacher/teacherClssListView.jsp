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

<table align="center" border="1" width="700" cellspacing="0">
<tr><th>번호</th><th>제목</th><th>수업승인상태</th><th>강의 시작 날짜</th><th>강의 끝나는 날짜</th><th>수정날짜</th>
</tr>
<c:forEach items="${ requestScope.list }" var="c">
<tr>
   <td align="center">${ c.cid }</td>
   <td>   
   <c:url var="tdt" value="/tcdetail.do">
      <c:param name="cid" value="${ c.cid }" />
   </c:url>
   <a href="${ tdt }">${ c.clss_title }</a>
   </td>
   <td align="center">${ c.clss_status}</td>
   <td align="center">
      ${ c.clss_start }
   </td>
   <td>${ c.clss_end }</td>
   <td>${ c.clss_update }</td>
</tr>
</c:forEach>
</table>

</body>
</html>