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
<title>Insert title here</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<h2 style="text-align: center;">회원목록</h2>
		<div align="center" id="writerDiv">
			<form action="msearchId.do" method="post">
			<label align="center"> 아이디를 입력하세요 : <input type="search" name="keyword"></label>
			<input type="hidden" name="page" value="1">
			<input type="submit" value="검색"></form><br><br>
			<c:url var="mlist" value="/mlist.do" >
				<c:param name="page" value="1" />
			</c:url>
			<input type="button" value="전체목록" title="mlist" onclick="location.href='${mlist}'">
  		    <input type="button" value="홈으로 이동" onclick="location.href='home.do'"><br><br><br>
  		</div>
<table align="center" border="1">
	<tr>
		<td>아이디</td>
		<td>닉네임</td>
		<td>이메일</td>
		<td>성별</td>
		<td>사용자등급</td>
		<td>생년월일</td>
		<td>전화번호</td>
		<td>회원가입일</td>
		<td>회원정보 수정일</td>
	</tr>
	<c:forEach items="${requestScope.list}" var="m">
			<tr>
			<td>
			<c:url var="mdt" value="mdetail.do">
				<c:param name="page" value="${ currentPage }"/>
				<c:param name="id" value="${ m.id }"/>
			</c:url>
			<a href="${ mdt }">${ m.id }</a>
			</td>
			<td align="center">${m.nickname}</td>
			<td align="center">${m.email}</td>
			<td align="center">${m.gender}</td>
			<td align="center">${m.user_lv}</td>
			<td align="center">${m.birthday}</td>
			<td align="center">${m.phone}</td>
			<td align="center">${m.enroll_date}</td>
			<td align="center">${m.update_date}</td>
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
<c:if test="${ currentPage <= 1 }">
[맨처음]
</c:if>
<c:if test="${ currentPage > 1 }">
	<c:url var="mls" value="mlist.do">
		<c:param name="page" value="1"/>
	</c:url>
	<a href="${ mls }">[맨처음]</a>
</c:if> &nbsp;
<!-- 이전 그룹이 있으면 링크설정, 이전 그룹이 없으면 링크 없음 -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
   <c:url var="mls2" value="mlist.do">
      <c:param name="page" value="${ startPage - 10 }"/>
   </c:url>
   <a href="${ mls2 }">[이전]</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
[이전]
</c:if> &nbsp; 
<!-- 가운데 표시할 페이지 그룹 숫자 링크 설정 -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
    <c:if test="${ p eq currentPage }">
      <font size="4" color="red">[${ p }]</font>
   </c:if>
   <c:if test="${ p ne currentPage }">
      <c:url var="mls3" value="mlist.do">
         <c:param name="page" value="${ p }" />
      </c:url>
      <a href="${ bls3 }">${ p }</a>
   </c:if>
</c:forEach> &nbsp;
<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="mls4" value="mlist.do">
      <c:param name="page" value="${ endPage + 10 }"/>
   </c:url>
   <a href="${ mls4 }">[다음그룹]</a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   [다음그룹]&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   [맨끝]&nbsp;
</c:if>   
<c:if test="${ currentPage < maxPage }">
   <c:url var="mls5" value="mlist.do">
      <c:param name="page" value="${ maxPage }"/>
   </c:url>
   <a href="${ mls5 }">[맨끝]</a><br><br>
</c:if>
</div>
</c:if>






</body>
</html>