<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>