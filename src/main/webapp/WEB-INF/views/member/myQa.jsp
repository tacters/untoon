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
<h3 align="center">${ loginUser.name }님의 1대1문의 내역</h3>
<table>
<tr><th>문의글 번호</th><th>문의 내용</th><th>답변 상태</th>
</tr>
<c:forEach items="${ requestScope.list }" var="q">
<tr>
	<td>${ q.qid }</td>
   <td>   
   <c:url var="cdt" value="/cdetail.do">
      <c:param name="cid" value="${ q.cid}" />
   </c:url>
   <a href="${ cdt }">${ q.qcontent }</a>
   </td>
   <td align="center">
      ${ q.q_status }
   </td>
</tr>
</c:forEach>
</table>


<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>