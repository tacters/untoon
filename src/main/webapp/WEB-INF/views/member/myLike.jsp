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
<c:import url="../common/menubar.jsp"/>
<c:import url="../member/myPageheader.jsp"/>
<h3 align="center">찜한 목록</h3>
<table align="center" border="1" width="700" cellspacing="0">
<tr><th>클래스 제목</th><th>강사</th><th>시작 날짜</th><th>종강 날짜</th>
</tr>
<c:forEach items="${ requestScope.list }" var="l">
<tr>
   <td>   
   <c:url var="cdt" value="/cdetail.do">
      <c:param name="cid" value="${ l.cid }" />
   </c:url>
   <a href="${ cdt }">${ l.clss_title }</a>
   </td>
   <td align="center">${ l.tchr_id }</td>
   <td align="center">
      ${ l.clss_start }
   </td>
   <td>${ l.clss_end }</td>
</tr>
</c:forEach>
</table>

<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>