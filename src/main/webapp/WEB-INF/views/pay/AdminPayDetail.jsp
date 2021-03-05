<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
<style type="text/css">
body {
	font-family: Montserrat,sans-serif;
}
 div h2 {
 	padding: 10px;
	text-align:center;
	with: 80%;
 	background: #2392BD;
 	color:#fff;
 	font-size: 30px;
 }
</style>
</head>
<body>
<c:import url="../common/menubar.jsp"/>
<h3 align="left"> 관리자모드 - ${ pay.pid }님의 결제내역 </h3>
<div>
<h2 align ="center">${pay.payno}번 결제내역 상세보기</h2>
</div>
<br>
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
<tr>
	<th>클래스 제목</th>
	<td>${ pay.clss_title }</td>
</tr>
<tr>
	<th>강사</th>
	<td>${ pay.tchr_id }</td>
</tr>
<tr>
	<th>결제 금액</th>
	<td>${ pay.clss_price }원</td>
</tr>
<tr>
	<th>결제한 날짜</th>
	<td>${ pay.paydate }</td>
</tr>
<tr>
	<th>결제 방법</th>
	<td>${ pay.method }</td>
</tr>
<tr>
	<th>결제 상태</th>
	<td>
	<c:if test="${ pay.pstatus eq 2}">
		결제완료
	</c:if>
	<c:if test="${ pay.pstatus eq 4}">
		취소완료
	</c:if>
	</td>
</tr>
</table>

<c:url var="pli" value="/plist.do">
	<c:param name="page" value="${ page }"/>
</c:url>
<p align="center"><a href="${ pli }">[목록 돌아가기]</a></p>

<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>