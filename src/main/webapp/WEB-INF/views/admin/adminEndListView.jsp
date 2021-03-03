<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
li {
	border-bottom: solid 1px black;
}

li:last-child {
	border-bottom: none;
}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#div_root {
	margin: auto;
	width: 800px;
}

#div_top {
	width: 100%;
	height: 100px;
	/* background-color: #82FA58; */
	text-align: center;
}

#div_menu {
	width: 15%;
	height: 70%;
	float: left;
	background-color: white;
	text-align: left;
}

/* #div_menu ul {
	width: 30%;
	height: 30%;
	float: left;
	align: center;
	list-style-type: none;
	margin: 10%;
	padding: 10;
	border: solid 1px black;
	background-color: #2392BD;
} */

#div_menu ul{
	width: 80%;
	height: 25%;
	list-style-type: none;
	margin: 5%;
	padding: 10;
	float: left;
	background-color: #2392BD;
}

/*  #div_menu ul li:last-child {
	height: 100;
}  */

#div_menu ul li{
	list-style:none;
	/* border-bottom: solid 1px black; */
	border-bottom:none;
}

#div_menu li a {
	width: 100%;
	display: block;
	color: #000000;
	padding: 8px;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
}

#div_menu li a.current {
	background-color: #2392BD;
	color: white;
}

#div_menu li a:hover:not(.current) {
	background-color: #2392BD;
	color: white;
}

#div_con {
	width: 80%;
	height: 70%;
	float: left;
	background-size: 100% 100%;
	text-align: center;
}

#div_bottom {
	width: 100%;
	height: 100px;
	clear: both;
	background-color: #C8FE2E;
	text-align: center;
}
</style>
</head>
<body>

	<div id="div_root"></div>
	<div id="div_top">
		<c:import url="../common/menubar.jsp" />
	</div>
	<div id="div_menu">
		<h4>세로네비바</h4>
		<ul style="align: center;">
			<li>
			<c:url var="adnclist" value="/adnclist.do">
				<c:param name="page" value="1"/>
			</c:url>
			<a href="${ adnclist }">미승인 클래스관리</a></li>
			<li>
			<c:url var="adclist" value="/adclist.do">
				<c:param name="page" value="1"/>
			</c:url>
			<a href="${ adclist }">승인 클래스 관리</a></li>
			<li>
			<c:url var="adrclist" value="/adrclist.do">
				<c:param name="page" value="1"/>
			</c:url>
			<a href="${ adrclist }">승인 거부한 클래스 관리</a></li>
			<li>
			<c:url var="adendclist" value="/adendclist.do">
				<c:param name="page" value="1"/>
			</c:url>
			<a href="${ adendclist }">기간지난 클래스 관리</a></li>
		</ul>
	</div>
	<div id="div_con">
	<h3>기간지난 클래스 관리</h3>
	<table>
	<tr><th>수업 번호</th><th>수업 제목</th><th>강사 id</th></tr>
	<c:forEach items="${ requestScope.list }" var="c">
	<tr>
		<td align="center">${ c.cid }</td>
		<td align="center">
			<c:url var="acd" value="/adcdetail.do">
		      <c:param name="cid" value="${ c.cid }" />
		   </c:url>
		   <a href="${ acd }">${ c.clss_title }</a>
		</td>
		<td align="center">${ c.tchr_id }</td>
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
   <c:url var="adendcls" value="/adendclist.do">
      <c:param name="page" value="1" />
   </c:url>
   <a href="${ adendcls }">[맨처음]</a>
</c:if> &nbsp;
<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
   <c:url var="adendcls2" value="/adendclist.do">
      <c:param name="page" value="${ startPage - 10 }"/>
   </c:url>
   <a href="${ adendcls2 }">[이전]</a>
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
      <c:url var="adendcls3" value="/adendclist.do">
         <c:param name="page" value="${ p }" />
      </c:url>
      <a href="${ adendcls3 }">${ p }</a>
   </c:if>
</c:forEach> &nbsp;
<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="adendcls4" value="/adendclist.do">
      <c:param name="page" value="${ endPage + 10 }"/>
   </c:url>
   <a href="${ adendcls4 }">[다음그룹]</a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   [다음그룹]&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   [맨끝]&nbsp;
</c:if>   
<c:if test="${ currentPage < maxPage }">
   <c:url var="adendcls5" value="/adendclist.do">
      <c:param name="page" value="${ maxPage }"/>
   </c:url>
   <a href="${ adendcls5 }">[맨끝]</a>
</c:if>
</div>
</c:if>


	</div>
	<div id="div_bottom">
		<c:import url="../common/footer.jsp" />
	</div>
</body>
</html>