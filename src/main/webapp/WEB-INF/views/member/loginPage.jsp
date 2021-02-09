<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/member/style.css" media="all"/>
<script src="jquery-3.5.1.min.js"></script>
<script>
		let id = $("#id");
		let pw = $("#pw");
		let btn = $("#btn");
		
		$(btn).on("click", function(){
			if($(id).val() == ""){
				$(id).next("label").addClass("warning");
				setTimeout(function(){
					$("label").removeClass("warning");
				},1500);
			}
			else if($(pw).val() == ""){
				$(pw).next("label").addClass("warning");
				setTimeout(function(){
					$("label").removeClass("warning");
				},1500);
			}
		});
	</script>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<section class="login-form">
		<h1>LOGIN</h1>
		<c:if test="${ empty sessionScope.loginUser }">
		<!-- <form action="login.do" method="post"> -->
			<div class="login-area">
				<input type="text" name="id" required>
				<label for="id">USER ID</label>
			</div>
			<div class="login-area">
				<input type="password" name="id" required>
				<label for="pw">PASSWORD</label>
			</div>
			<div class="btn-area">
				<button id="btn" 
					type="submit">LOGIN</button>
			</div>
		<!-- </form> -->
		<div class="caption">
			<a href="#">회원가입</a>
			<a href="#">아이디/비밀번호 찾기</a>
		</div>
		</c:if>
	</section>
	
	
</body>
</html>