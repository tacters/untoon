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
	 	</c:url>
	<a href="${ pmd }">${ m.clss_title }</a> 
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


</body>
</html>