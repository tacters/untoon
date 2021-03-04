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
<c:import url="../common/menubar.jsp"/>
<c:import url="../member/myPageheader.jsp"/>
<h3 align="center">${ loginUser.name }님의 클래스 관리</h3>
<table align="center" border="1" width="700" cellspacing="0">
<tr><th>클래스 번호</th><th>클래스 제목</th><th>강사</th><th>강의 시작 날짜</th><th>강의 끝나는 날짜</th>
</tr>
<c:forEach items="${ requestScope.myList }" var="m">
<tr>
   <td align="center">${ m.cid }</td>
   <td>   
   <c:url var="tdt" value="/tcdetail.do">
      <c:param name="cid" value="${ m.cid }" />
   </c:url>
   <a href="${ tdt }">${ m.clss_title }</a>
   </td>
   <td align="center">${ m.tchr_id }</td>
   <td align="center">
      ${ m.clss_start }
   </td>
   <td>${ m.clss_end }</td>
</tr>
</c:forEach>
</table>

<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>