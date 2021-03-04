<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

</head>
<body>

<c:import url="../common/menubar.jsp"/>

<h1 align="center"> 관리자용 결제목록 보기 </h1>
<table align="center" border="1" width="1000" cellspacing="0">
<tr><th>결제 번호</th><th>결제한 회원</th><th>클래스 제목</th><th>강사</th><th>결제 금액</th><th>결제상태</th></tr>
<c:forEach items="${ requestScope.list }" var="m">
<tr>
	<td align="center">${ m.payno }</td>
	<td align="center">${ m.pid }</td>
	<td>
		<c:url var="pd" value="/pdetail.do">
			<c:param name="payno" value="${ m.payno }"/>
			<c:param name="page" value="${currentPage }"/>
		</c:url>
		<a href="${ pd }">${ m.clss_title }</a> 
	</td>
	<td align ="center">${ m.tchr_id }</td>
	<td align="center">${ m.clss_price }원</td>
	<td align="center">
	<c:if test="${ m.pstatus eq 2 }">
		결제완료
	</c:if>
	<c:if test="${ m.pstatus eq 4 }">
		취소완료
	</c:if>
	</td>
		
</tr>
</c:forEach>
</table>
<br>

<%-- 현재 페이지가 1이 아니면 링크설정, 현재 1페이지이면 링크없음 --%>
<c:if test="${ empty action}">
<%-- 페이징 처리 
   [맨처음][이전] 숫자...........  [다음][맨끝]
--%>
<div style="text-align: center;">
<c:if test="${ currentPage <= 1}">
[맨처음]
</c:if>
<c:if test="${ currentPage > 1 }">
   <c:url var="pls" value="/plist.do">
      <c:param name="page" value="1" />
   </c:url>
   <a href="${ pls }">[맨처음]</a>
</c:if> &nbsp;
<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
   <c:url var="pls2" value="/plist.do">
      <c:param name="page" value="${ startPage - 10 }"/>
   </c:url>
   <a href="${ pls2 }">[이전]</a>
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
      <c:url var="pls3" value="/plist.do">
         <c:param name="page" value="${ p }" />
      </c:url>
      <a href="${ pls3 }">${ p }</a>
   </c:if>
</c:forEach> &nbsp;
<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="pls4" value="/plist.do">
      <c:param name="page" value="${ endPage + 10 }"/>
   </c:url>
   <a href="${ pls4 }">[다음그룹]</a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   [다음그룹]&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   [맨끝]&nbsp;
</c:if>   
<c:if test="${ currentPage < maxPage }">
   <c:url var="pls5" value="/plist.do">
      <c:param name="page" value="${ maxPage }"/>
   </c:url>
   <a href="${ pls5 }">[맨끝]</a>
</c:if>
</div>
</c:if>



<footer><c:import url="../common/footer.jsp"/></footer>

</body>
</html>