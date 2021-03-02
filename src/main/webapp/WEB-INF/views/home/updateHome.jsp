<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<style type="text/css">
.tbl-ad {	border-collapse: collapse;  width: 100%;		} /* font-family 지정해줘도 좋을듯! */
.tbl-ad th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #2392bd;
	color: white;
}
.tbl-ad tr:hover{	background-coor: #ddd;	}
.tbl-ad tr:nth-child(even){		background-color: #f2f2f2;	}
.tbl-ad td, .tbl-ad th {	border: 1px solid #ddd; padding: 8px;	}

</style>

<title>UNTOON 언투온택터즈</title>
</head>
<body>
<c:import url="../common/menubar.jsp"/>

<%-- ADVERTISEMENT --%>
<h3> 홈페이지 광고 관리 </h3>
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
			<c:url value="/adetail.do" var ="adet">
				<c:param name = "adid" value="${ a.adid }"/>
			</c:url>
		</tbody>
	<tr data-href="${ adet }">
		<td class="tbl-ad-data" > ${ a.ad_title } </td> <!-- 광고제목 -->
		<td class="tbl-ad-data"> ${ a.ad_xy } </td> <!-- 화면위치 -->
		<td class="tbl-ad-data"> ${ a.ad_start } </td> <!-- 광고 시작일  -->
		<td class="tbl-ad-data"> ${ a.ad_end } </td> <!-- 광고 종료일  -->
		<td class="tbl-ad-data"> ${ a.a_status } </td> <!-- 액티브 = 현재 보이는지 -->
	</tr>
	</c:forEach>
</table>
<script type="text/javascript"> /* 자바스크립트 유튜브 참고 : https://youtu.be/6BdKUO2QbA0  */
	document.addEventListener("DOMContentLoaded", () => {
		const rows = document.querySelectorAll("tr[data-href]");
		
		rows.forEach(row => {
			row.addEventListener("click", () =>{
				window.location.href = row.dataset.href; // 주소창을 바꿔라. dataset = data-로 설정된 값들 = data-href의 값
			});
		});
	});
</script>


<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>