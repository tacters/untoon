<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body>
	<jsp:include page="../common/menubar.jsp" />

	<h1 align="center">회원가입</h1>

	<div class="outer" align="center">
		<form action="minsert.do" method="post" id="joinForm">
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
					<td><input type="password" name="pwd2" required></td>
				</tr>
				<tr>
					<td>NAME</td>
					<td><input type="text" name="name" required></input></td>
				</tr>
				<tr>
					<td>EMAIL</td>
					<td><input type="email" name="email" required></td>
				</tr>
				<!-- <tr>
					<td>EMAIL NUMBER </td>
					<td><input type="email" name="email2" required></td>
				</tr> -->
				<tr>
					<td>NICKNAME</td>
					<td><input type="text" name="nickname" required></td>
				</tr>
				<tr>
				<td>user_lv</td>
					<td><input type="radio" name="user_lv" value="1">일반 사용자 <input
						type="radio" name="user_lv" value="2">강사 </td>
				</tr>
				<tr>
					<td>BIRTHDAY</td>
					<td><input type="text" name="birthday" required></td>
				</tr>
				<tr>
					<td>GENDER</td>
					<td><input type="radio" name="gender" value="M">남 <input
						type="radio" name="gender" value="F">여</td>
				</tr>
				<tr>
					<td>PHONE</td>
					<td><input type="tel" name="phone"></td>
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
						<button onclick='return validate();'>가입하기</button> &nbsp; <input
						type="reset" value="취소하기">
					</td>
				</tr>
			</table>
		</form>
		<br> <br> <a href="home.do">시작 페이지로 이동</a>
	</div>

	<script type="text/javascript">
		function validate(){
			// 아이디 중복체크 여부
			if($("#idDuplicateCheck").val() == 0){
				alert("사용가능한 아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}else{
				return true;
			}
		}
		
		$(function(){
			$("#userId").on("keyup",function(){
				var userId = $(this).val();
				
				if(userId.length < 5){
					$(".guide").hide();
					$("#idDuplicateCheck").val(0);
					
					return;
				}
				
				$.ajax({
					url:"idCheck.do",
					data:{id:userId},
					type:"post",
					success:function(data){
						console.log(data);
						
						if(data == "ok"){
							$(".error").hide();
							$(".ok").show();
							$("#idDuplicateCheck").val(1);
						}else{
							$(".ok").hide();
							$(".error").show();
							$("#idDuplicateCheck").val(0);
						}
						
					},error:function(jqxhr,textStatus,errorThrown){
						console.log("ajax 처리 실패");
						
						console.log(jqxhr);
						console.log(textStatus);
						console.log(errorThrown);
					}
				});
			});
		});
	</script>
</html>