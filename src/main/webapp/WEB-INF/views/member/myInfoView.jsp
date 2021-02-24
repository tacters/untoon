<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../member/myPageheader.jsp"/>  
	<br><br><br><br>
	
	<div class="outer" align="center">
		<form action="mupdate.do" method="post" id="joinForm">
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
						<input type="password" name="pwd">
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<c:choose>
						<c:when test="${ loginUser.gender eq 'M' }">
							<td>
								<input type="radio" name="gender" value="M" checked>남
								<input type="radio" name="gender" value="F">여
							</td>
						</c:when>
						<c:when test="${ loginUser.gender eq 'M' }">
							<td>
								<input type="radio" name="gender" value="M">남
								<input type="radio" name="gender" value="F" checked>여
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<input type="radio" name="gender" value="M">남
								<input type="radio" name="gender" value="F">여
							</td>	
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>사용자 타입 :</td>
					<c:choose>
						<c:when test="${ loginUser.user_lv eq 'S' }">
							<td>
								<input type="radio" name="user_lv" value="${ loginUser.user_lv }" checked>일반 사용자
								<input type="radio" name="user_lv" value="${ loginUser.user_lv }">강사
							</td>
						</c:when>
						<c:when test="${ loginUser.user_lv eq 'T' }">
							<td>
								<input type="radio" name="user_lv" value="${ loginUser.user_lv }">강사
								<input type="radio" name="user_lv" value="${ loginUser.user_lv }" checked>일반 사용자
							</td>
						</c:when>
					</c:choose>
				</tr>
				<tr>
					<td>나이 :</td>
					<td>
						<input type="text" name="birthday" value="${ loginUser.birthday }">
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
						<c:url var="mdelete" value="mdelete.do">
							<c:param name="id" value="${ loginUser.id }"/>
						</c:url>
						<input type="reset" value="취소하기">
					</td>
				</tr>
		</body>
		<script type="text/javascript">	
	
			function idDuplicateCheck() {
				$.ajax({
					url : "idCheck.do",
					type : "post",
					data : {
						userid : $("#id").val()
					},
					success : function(data) {
						//처리결과를 문자열로 받음
						console.log("success : " + data);
						if (data == "ok") {
							alert("사용 가능한 아이디입니다.");
							$("#pwd").focus();
						} else {
							alert("이미 사용중인 아이디입니다.\n다시 입력하세요.");
							$("#id").select();
						}
					},
					error : function(jqXHR, textstatus, errorthrown) {
						//에러 발생시 구동되는 콜백함수임
						console.log("error : " + jqXHR + ", " + textstatus
								+ ", " + errorthrown);
					}
				});
			}
		</script>
</html>