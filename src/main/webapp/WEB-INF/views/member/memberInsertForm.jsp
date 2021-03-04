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
<script>
$(function(){
   showDiv();
   
   $("input[name=user_lv]").on("change", function(){ //on으로 이벤트 설정가능 "change"이벤트일때 function()을 실행해라
            showDiv(); // = radio버튼상태가 바뀔때 showDiv를 실행해라
   });       
});

function showDiv(){
	if($("input[name=user_lv]").eq(0).is(":checked")){
	   $(".insertTeacher").css("display","none");
	}
	if($("input[name=user_lv]").eq(1).is(":checked")){
	   $(".insertTeacher").css("display","inline-block");
	}
}
//아이디 중복확인 체크
$(function(){
	$("#userId").on("keyup",function(){
		var userId = $(this).val();
		
		if(userId.length < 5){
			$(".guide").hide();
		
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
				}else{
					$(".ok").hide();
					$(".error").show();
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

//닉네임 중복확인
$(function(){
	$("#userNickname").on("keyup",function(){
		var userNickname = $(this).val();
		
		if(userNickname.length < 2){
			$(".nicknameCheck").hide();
		
			return;
		}
		$.ajax({
			url:"nicknameCheck.do",
			data:{nickname:userNickname},
			type:"post",
			success:function(data){
				console.log(data);
				
				if(data == "ok"){
					$(".error").hide();
					$(".ok").show();
				}else{
					$(".ok").hide();
					$(".error").show();
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
<body>
<c:import url="../common/menubar.jsp"/>

	<h1 align="center">회원가입</h1>

	<div class="outer" align="center" style="margin:10% 15%;">
		<form action="minsert.do" method="post" id="joinForm" enctype="multipart/form-data">
			<table width="500" cellspacing="5">
				<tr>
					<td width="150">아이디</td>
					<td><input type="text" name="id" id="userId" required>
						<!-- ajax를 적용  -->
						<span class="guide ok">사용가능</span>
						<span class="guide error">사용불가능</span>
						<!-- <input type="hidden" id="idDuplicateCheck()" value="0"> -->
						<!-- ajax를 적용  -->
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd" required></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="pwd2" required></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" required></input></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="email" name="email" required>&nbsp;
						<button type="submit" id="email">이메일 인증</button>
					</td>
					
				</tr>
				<tr>
					<td>별명</td>
					<td><input type="text" name="nickname" id="userNickname" required>
						<!-- ajax를 적용  -->
						<span class="nicknameCheck ok">사용가능</span>
						<span class="nicknameCheck error">사용불가능</span>
					</td>
				</tr>
				<tr>
				<td>사용자 등급</td>
					<td><input type="radio" name="user_lv" value="S" checked>일반 사용자 <input
						type="radio" name="user_lv" value="T">강사 </td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birthday" placeholder="ex)920424" required></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="radio" name="gender" value="M">남 <input
						type="radio" name="gender" value="F">여</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="tel" name="phone" placeholder="-포함해주세요"></td>
				</tr>
				<tr>
					<td>프로필 사진</td>
					<td><input type="file" name="afile"></td>
				</tr>
				<tr class="insertTeacher">
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
				</div>
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
</html>