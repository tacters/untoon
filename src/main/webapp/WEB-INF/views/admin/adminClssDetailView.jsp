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

<button>승인하기</button>
<button>승인거부</button>
</body>
</html>