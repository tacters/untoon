<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
</head>
<body>
<c:import url="../common/menubar.jsp"/>

<c:import url="../member/myPageheader.jsp"/>

<h3 align="left"> ${ loginUser.name }님의 결제내역 </h3>
<h2 align ="center">${pay.pid}번 결제내역 상세보기</h2>
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

<c:if test="${ pay.pstatus eq 2 }">
<c:url var="pup" value="/pupdate.do">
		<c:param name="payno" value="${ pay.payno }"/>
</c:url>
<p align="center"><a href="${ pup }">[결체 취소/환불하기]</a></p> 
</c:if>

<c:url var="pms" value="/pmselect.do">
</c:url>
<p align="center"><a href="${ pms }">[목록으로 돌아가기]</a></p> 

<!-- style="float:left"
<br style="clear:both"> -->

<footer><c:import url="../common/footer.jsp"/></footer>

</body>
</html>