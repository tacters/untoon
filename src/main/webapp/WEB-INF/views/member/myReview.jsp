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
<h3 align="center">${ loginUser.name }님의 후기</h3>
<table>
<tr><th>후기 내용</th><th>강사 id</th><th>강의 시작날짜</th><th>강의 끝나는 날짜</th>
</tr>
<c:forEach items="${ requestScope.list }" var="r">
<tr>
   <td>   
   <c:url var="cdt" value="/cdetail.do">
      <c:param name="cid" value="${ r.cid }" />
   </c:url>
   <a href="${ cdt }">${ r.rcontent }</a>
   </td>
   <td align="center">${ r.tchr_id }</td>
   <td align="center">
      ${ r.clss_start }
   </td>
   <td>${ r.clss_end }</td>
</tr>
</c:forEach>
</table>


<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>