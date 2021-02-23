<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
</head>
<body>
<c:import url="../common/menubar.jsp"/>

<table align="center" border="1" width="700" cellspacing="0">
<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th>
<th>첨부파일</th></tr>
<c:forEach items="${ requestScope.list }" var="c">
<tr>
   <td align="center">${ c.cid }</td>
   <td>   
   <c:url var="tdt" value="/cdetail.do">
      <%-- <c:param name="page" value="${ currentPage }"/> --%>
      <c:param name="cid" value="${ c.cid }" />
   </c:url>
   <a href="${ tdt }">${ c.clss_title }</a>
   </td>
   <td align="center">${ c.tchr_id }</td>
   <td align="center">
 <%--      <c:if test="${ !empty b.original_filename }">
      ◎
      </c:if>
      <c:if test="${ empty b.original_filename }">
      &nbsp;
      </c:if> --%>
      ${ c.clss_update }
   </td>
   <td>${ c.view_count }</td>
</tr>
</c:forEach>
</table>
<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>