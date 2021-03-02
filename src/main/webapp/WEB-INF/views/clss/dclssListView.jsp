<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<c:set var="maxPage" value="${ requestScope.maxPage }" /> 
<c:set var="startPage" value="${ requestScope.startPage }"  /> 
<c:set var="endPage" value="${ requestScope.endPage }"  /> 
<c:set var="currentPage" value="${ requestScope.currentPage }"  />

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
</tr>
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

<!-- 페이징 처리 -->
<%-- 현재 페이지가 1이 아니면 링크설정, 현재 1페이지이면 링크없음 --%>
<c:if test="${ empty action }">
<%-- 페이징 처리 
   [맨처음][이전] 숫자...........  [다음][맨끝]
--%>
<div style="text-align: center;">
<c:if test="${ currentPage <= 1}">
[맨처음]
</c:if>
<c:if test="${ currentPage > 1 }">
   <c:url var="dcls" value="/dclist.do">
      <c:param name="page" value="1" />
   </c:url>
   <a href="${ dcls }">[맨처음]</a>
</c:if> &nbsp;
<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
   <c:url var="dcls2" value="/dclist.do">
      <c:param name="page" value="${ startPage - 10 }"/>
   </c:url>
   <a href="${ dcls2 }">[이전]</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
[이전]
</c:if> &nbsp; 
<%-- 가운데 표시할 페이지 그룹 숫자 링크 설정 --%>
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
    <c:if test="${ p eq currentPage }">
      <font size="4" color="red">[${ p }]</font>
   </c:if>
   <c:if test="${ p ne currentPage }">
      <c:url var="dcls3" value="/dclist.do">
         <c:param name="page" value="${ p }" />
      </c:url>
      <a href="${ dcls3 }">${ p }</a>
   </c:if>
</c:forEach> &nbsp;
<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="dcls4" value="/dclist.do">
      <c:param name="page" value="${ endPage + 10 }"/>
   </c:url>
   <a href="${ dcls4 }">[다음그룹]</a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   [다음그룹]&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   [맨끝]&nbsp;
</c:if>   
<c:if test="${ currentPage < maxPage }">
   <c:url var="dcls5" value="/dclist.do">
      <c:param name="page" value="${ maxPage }"/>
   </c:url>
   <a href="${ dcls5 }">[맨끝]</a>
</c:if>
</div>
</c:if>


<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>