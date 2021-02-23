<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>관리자 클래스 상세보기</h2>
<p>${ clss.cid }
<p>${ clss.clss_content }
<p>${ clss.clss_start }
<p>${ clss.clss_duration }

<c:if test="${clss.clss_status == 1 }">
<%-- <button type="button" onclick="location.href='${ approve }';">승인하기</button> --%>
<c:url var="approve" value="/approve.do" >
	<c:param name="cid" value="${ clss.cid }"/>
</c:url>
<a href="${ approve }">승인하기</a>
<c:url var="refuse" value="/refuse.do" >
	<c:param name="cid" value="${ clss.cid }"/>
</c:url>
<button type="button" onclick="location.href='${ refuse }';">승인거부</button>
</c:if>
<%-- <c:if test="${clss.clss_end }">

</c:if> --%>
<c:if test="${clss.clss_status == 3 }">
<c:url var="adcdelete" value="/adcdelete.do">
	<c:param name="cid" value="${ clss.cid }"/>
</c:url>
<button type="button" onclick="location.href='${ adcdelete }';">삭제하기</button>
</c:if>
</body>
</html>