<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
</head>
<body>
<c:import url="../common/menubar.jsp"/>
<c:import url="../member/myPageheader.jsp"/>

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
   
   
   
   <c:set var="status" value="${ c.clss_status }"/>
   <%-- <td align="center"><c:out value="${ c.clss_status }"/></td> --%>
   
   <c:choose>
	   <c:when test="${ status eq 1 }">
	   	<td align="center"><c:out value="승인 대기"/></td>
	   </c:when>
	   <c:when test="${ status eq 2 }">
	   	<td align="center"><c:out value="승인"/></td>
	   </c:when>
	   <c:when test="${ status eq 3 }">
	   	<td align="center"><c:out value="승인 거부"/></td>
	   </c:when>
	   <c:otherwise>
	   	<td align="center"><c:out value="기간만료"/></td>
	   </c:otherwise>
	   
   </c:choose>
   
   
   
   
   <td align="center">
      ${ c.clss_start }
   </td>
   <td>${ c.clss_end }</td>
   <td>${ c.clss_update }</td>
</tr>
</c:forEach>
</table>
<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>