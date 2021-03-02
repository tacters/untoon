<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
</head>
<style>
span.guide {
	display: none;
	font-size: 12px;
	top: 12px, right:10px;
}

span.ok {
	color: green;
}

span.error {
	color: red;
}
</style>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<body>

<c:import url="../common/menubar.jsp"/>
	
	<h1 align="center">강사 지원하기</h1>

	<div class="outer" align="center">
		<form action="minsert.do" method="post" id="joinForm" enctype="multipart/form-data">
			<table width="500" cellspacing="5">
				<tr>
					<td width="150">ID</td>
					<td><input type="text" name="id" id="userId" required>
						<!-- ajax를 적용  -->
						<span class="guide ok">사용가능</span>
						<span class="guide error">사용불가능</span>
						<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
						<!-- ajax를 적용  -->
					</td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td><input type="password" name="pwd" required></td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td><input type="password" id="pwd2" required></td>
				</tr>
				<tr>
					<td>NAME</td>
					<td><input type="text" name="name" required></input></td>
				</tr>
				<tr>
					<td>EMAIL</td>
					<td>
						<input type="email" name="email" required>&nbsp;
						<button type="submit" id="email">이메일 인증</button>
					</td>
					
				</tr>
				<tr>
					<td>NICKNAME</td>
					<td><input type="text" name="nickname" required></td>
				</tr>
				<tr>
				<td>user_lv</td>
					<td><input type="radio" name="user_lv" value="T" checked>강사 </td>
				</tr>
				<tr>
					<td>BIRTHDAY</td>
					<td><input type="text" name="birthday" placeholder="주민번호 앞 6자리 입력하세요" required></td>
				</tr>
				<tr>
					<td>GENDER</td>
					<td><input type="radio" name="gender" value="M">남 <input
						type="radio" name="gender" value="F">여</td>
				</tr>
				<tr>
					<td>PHONE</td>
					<td><input type="tel" name="phone" placeholder="-포함해서 입력해주세요"></td>
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
				

				<!-- jQuery와 Postcodify를 로딩한다. -->
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					/*  검색 단추를 누르면 팝업 레이어가 열리도록 설정한다. */
					$(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					});
				</script>

				<tr>
					<td colspan="2" align="center">
						<button onclick='return validate();'>가입하기</button> &nbsp;
					    <input type="reset" value="취소하기">
					</td>
				</tr>
			</table>
		</form>
		<br> <br> <a href="home.do">홈 페이지로 이동</a>
	</div>
	<footer>
	<c:import url="../common/footer.jsp"/>
	</footer>
</body>
	<script type="text/javascript">	
	function idDuplicateCheck(){
		   $.ajax({
		      url: "idCheck.do",
		      type: "post",
		      data: {userid : $("#id").val() },
		      success: function(data){
		         //처리결과를 문자열로 받음
		         console.log("success : " + data);
		         if(data == "ok"){
		            alert("사용 가능한 아이디입니다.");
		            $("#pwd").focus();
		         }else{
		            alert("이미 사용중인 아이디입니다.\n다시 입력하세요.");
		            $("#id").select();
		         }
		      },
		      error: function(jqXHR, textstatus, errorthrown){
		         //에러 발생시 구동되는 콜백함수임
		         console.log("error : " + jqXHR + ", " + textstatus 
		               + ", " + errorthrown);
		      }
		   });
		}
	
	</script>
</html>