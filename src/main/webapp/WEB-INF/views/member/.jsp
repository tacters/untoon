<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
</head>
<body>
<c:import url="member/myPage.jsp"/>

<h1 align="center">${ loginUser.name }님의 정보 보기</h1>
<div class="outer" align="center">
		<form action="mupdate.do" method="post" id="joinForm">
			<table width="500" cellspacing="5">
				<tr>
					<td width="150"> 아이디</td>
					<td>
						<input type="text" name="id" value="${ loginUser.id }" readonly>
					</td>
				</tr>

</body>
</html>