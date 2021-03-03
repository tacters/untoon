<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
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

<!-- adListView.jsp를 홈페이지 관리창에다가 iframe / import 하는 순간 주석처리하기  -->
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript"> /* 자바스크립트 유튜브 참고 : https://youtu.be/6BdKUO2QbA0  */
		document.addEventListener("DOMContentLoaded", () => {
			const rows = document.querySelectorAll("tr[data-href]");
			
			rows.forEach(row => {
				row.addEventListener("click", () =>{
					window.parent.location.href = row.dataset.href; // 주소창을 바꿔라. dataset = data-로 설정된 값들 = data-href의 값
				});
			});
		});
	</script>
<style type="text/css">
/* BODY 틀 */
.body {
margin: 40px;
/* border: 1px solid #2392BD; */
padding: 30px;
}
/* TABLE */
.tbl-ad {	border-collapse: collapse;  width: 100%;	 text-align: center;	} /* font-family 지정해줘도 좋을듯! */
.tbl-ad th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #2392bd;
	color: white;
}
.tbl-ad > tr:hover{	background-coor: #ddd;	cursor: pointer; }
.tbl-ad > tr:nth-child(even){		background-color: #f2f2f2;	}
.tbl-ad > td, .tbl-ad th {	border: 1px solid #ddd; padding: 8px;	}



/* FULL PAGE TABS */
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}

</style>


<title>UNTOON 언투온택터즈</title>

</head>
<body>
<div class="body">
	<%-- ADVERTISEMENT --%>
	<h1> 홈페이지 광고 관리 </h1>
	<i> 현재 액티브인 광고 및 광고 마감일 내림차순으로 정렬한 광고 목록입니다. 광고를 동시에 3개 이상 액티브 시키면 홈페이지 뷰 (home.jsp)가 어수선해 보일 수 있으니 주의 바랍니다.</i> 
	<br>
	<br>
	<%-- 광고 목록 출력 --%>
	<table class="tbl-ad">
		<tr class="tbl-ad-header">
			<th class="tbl-ad-header"> 광고제목 </th>
			<th class="tbl-ad-header"> 화면위치</th>
			<th class="tbl-ad-header"> 광고 시작일 </th>
			<th class="tbl-ad-header"> 광고 종료일 </th>
			<th class="tbl-ad-header"> 액티브 </th>
		</tr>
		<c:forEach items="${ requestScope.adlist }" var="a"> <!-- ArrayList로 받아져오는 광고 목록 = adlist -->
			<tbody style="display:none">
				<tr><td>${ a.adid }</td></tr>
				<c:url value="/adetail.do" var ="adet" >
					<c:param name="page" value="${ currentPage }"/>
					<c:param name = "adid" value="${ a.adid }"/>
				</c:url>
			</tbody>
		<tr data-href="${ adet }" >
			<td class="tbl-ad-data" > ${ a.ad_title } </td> <!-- 광고제목 -->
			<td class="tbl-ad-data"> ${ a.ad_xy } </td> <!-- 화면위치 -->
			<td class="tbl-ad-data"> ${ a.ad_start } </td> <!-- 광고 시작일  -->
			<td class="tbl-ad-data"> ${ a.ad_end } </td> <!-- 광고 종료일  -->
			<td class="tbl-ad-data"> ${ a.a_status } </td> <!-- 액티브 = 현재 보이는지 -->
		</tr>
		</c:forEach>
	</table>
	<br>
	<br>

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
	<c:url var="alp" value="/alist.do">
		<c:param name="page" value="1" />
	</c:url>
	<a href="${ alp }">[맨처음]</a>
</c:if> &nbsp;
<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
	<c:url var="alp2" value="/alist.do">
		<c:param name="page" value="${ startPage - 10 }"/>
	</c:url>
	<a href="${ alp2 }">[이전]</a>
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
		<c:url var="alp3" value="/alist.do">
			<c:param name="page" value="${ p }" />
		</c:url>
		<a href="${ alp3 }">${ p }</a>
	</c:if>
</c:forEach> &nbsp;
<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
	<c:url var="alp4" value="/alist.do">
		<c:param name="page" value="${ endPage + 10 }"/>
	</c:url>
	<a href="${ alp4 }">[다음그룹]</a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
	[다음그룹]&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
	[맨끝]&nbsp;
</c:if>	
<c:if test="${ currentPage < maxPage }">
	<c:url var="alp5" value="/alist.do">
		<c:param name="page" value="${ maxPage }"/>
	</c:url>
	<a href="${ alp5 }">[맨끝]</a>
</c:if>
</div>
</c:if>



</body>
</html>