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
<h3>${ loginUser.name } 강사님 개인정보 수정 페이지</h3>
<form action="tupdate.do" method="post" enctype="multipart/form-data">
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
						<input type="tel" name="phone" placeholder="-포함해서 입력해주세요"><br><br>
					</td>
				</tr>
				<tr>
					<td>프로필 사진</td>
					<td><input type="file" name="afile"></td>
				</tr>
				<tr class="insertTeacher" rowspan="2">
					<td>계좌번호</td>
					<td>
						<select name="bank">
							<option value="null">은행을 선택해 주세요</option>
							<option value="국민">국민</option>
							<option value="농협">농협</option>
							<option value="기업">기업</option>
							<option value="신한">신한</option>
							<option value="우리">우리</option>
							<option value="하나">하나</option>
						</select>
						<input type="text" name="bank_accp" placeholder="-빼고 입력해주세요">
					</td>
				</tr>
				<tr class="insertTeacher">
					<td>이력서</td>
					<td><input type="file" name="rfile"></td>
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
<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>