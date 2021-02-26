<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>강사 개인정보 수정 페이지</h1>
<form action="tupdate.do" method="post">
	<div class="outer" align="center">
			<table width="500" cellspacing="5">
				<tr>
					<td width="150"> 아이디 :</td>
					<td>
						<input type="text" name="id" value="${ loginUser.id }" readonly>
					</td>
				</tr>
				<tr>
					<td> 이 름 :</td>
					<td>
						<input type="text" name="name" value="${ loginUser.name }" readonly>
					</td>
				</tr>
				<tr>
					<td>닉네임 :</td>
					<td>
						<input type="text" name="nickname" value="${ loginUser.nickname }" readonly>
					</td>
				</tr>
				<tr>
					<td> 비밀번호 :</td>
					<td>
						<input type="password" name="pwd">
					</td>
				</tr>
				<tr>
					<td> 비밀번호 확인 :</td>
					<td>
						<input type="password" name="pwd2">
					</td>
				</tr>
				<tr>
					<td>생일 :</td>
					<fmt:parseDate value="${ loginUser.birthday }" var="b" pattern="yyMMdd"/>
					<td>
						<fmt:formatDate value="${ b }" pattern="yyyy년-MM월-dd일"/>
					</td>
				</tr>
				<tr>
					<td>이메일 :</td>
					<td>
						<input type="email" name="email"> &nbsp;
						<button type="submit" id="email">이메일 인증</button>
					</td>
				</tr>
				<tr>
					<td>전화번호 : </td>
					<td>
						<input type="tel" name="phone"><br><br>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button>수정하기</button>
						<input type="reset" value="취소하기">
					</td>
				</tr>
				</table>
				</div>
</form>
</body>
</html>