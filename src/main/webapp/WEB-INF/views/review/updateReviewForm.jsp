<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//jquery ajax 로 해당 < 수업 클래스 > 대한 문의 *** 댓글 *** 조회 요청
//해당 < 수업 클래스 >의 *** 문의 *** 번호를 전송함
$(function(){
	hideQaReplyForm(); 
		
	var qaQid = "${ qa.qid }";  //el 의 값을 변수에 대입
	var loginUser = "${ sessionScope.loginUser.id }";  //로그인한 회원 아이디 변수에 대입
	var teacher = "${clss.tchr_id}"; // 수업 강사님
	var adminLv= "${ sessionScope.loginUser.user_lv }"
	
	$.ajax({
		url: "${ pageContext.request.contextPath }/qalist.do",
		type: "post",
		data: { ref_qid: qaQid},  //전송값에 변수 사용 // 문의 id를 받아옴 (qid)
		dataType: "json",
		success: function(data){
		console.log("success : " + data);
	
		//object ==> string
		var jsonStr = JSON.stringify(data);
		//string ==> json 
		var json = JSON.parse(jsonStr);
		
		var values = "";
				for(var i in json.list){
					// 본인이 등록한 후기 댓글일 때는 수정/삭제 가능
					if(loginUser == json.list[i].qawriter){
						values += "<tr><td>" + json.list[i].qawriter 
							+ "</td><td>" +  json.list[i].q_modify_date 
							+ "</td></tr><tr><td colspan='2'>"
							+ "<form action='qaupdate.do' method='post'>" 
							+ "<input type='hidden' name='qaid' value='" +  json.list[i].qaid  + "'>"
							+ "<input type-'hidden' name='qaQid' value='${ qa.qid }'>" 
							+ "<textarea name='qacontent'>"
							+ decodeURIComponent(json.list[i].qacontent).replace(/\+/gi, " ") 
							+ "</textarea><input type='submit' value='수정'></form>"
							+ "<button onclick='qaReplyDelete(" + json.list[i].qaid + ");'>삭제</button></td></tr>";
					} else if ( loginUser == teacher || adminLv == 'A' ){ 
						values += "<tr><td>" + json.list[i].qawriter 
						+ "</td><td>" +  json.list[i].qa_modify_date 
						+ "</td></tr><tr><td colspan='2'>"
						+ decodeURIComponent(json.list[i].qacontent).replace(/\+/gi, " ") 
						+ "</td></tr>";	
					} else{ // 글작성자가 아니며, 대상 강사또는 관리자가 아닐 때
						values += "<tr><td>" + json.list[i].qawriter 
						+ "</td><td>" +  json.list[i].qa_modify_date 
						+ "</td></tr><tr><td colspan='2'>"
						+ "<i style='color: gray'> 🔒 비공개 문의사항 🔒 </i>") 
						+ "</td></tr>";	
					}
				}
				$("#qalistTbl").html($("#qalistTbl").html() + values);
			},
		error: function(jqXHR, textstatus, errorthrown){
			console.log("error : " + jqXHR + ", " + textstatus + ", " 
				+ errorthrown);
			}	
		});// 문의 작성 수정/삭제 ajax
});  //jquery document ready

function qaReplyDelete(qaid){
	location.href = "${ pageContext.request.contextPath }/qadelete.do?qaid=" + qaid + "&qid=${ qa.qid}";
}

function showQaReplyForm(){
	$("#qaReplyDiv").css("display", "block");
}
function hideQaReplyForm(){
	$("#qaReplyDiv").css("display", "none");
}
</script>
</head>
<body>
					<%-- 로그인한 사용자만 문의 *** 댓글 *** 작성가능 --%>
					<c:if test="${ !empty sessionScope.loginUser }">
						<div style="align:center; text-align:center;">
							<button class="btn" onclick="showQaReplyForm();"> 댓글달기 </button>
						</div>
					</c:if>
					<c:if test="${ empty sessionScope.loginUser }">
						<div style="align:center; text-align:center;">
							<button class="btn" onclick="goLogin();"> 댓글달기 </button>
						</div>
					</c:if>
				<script type="text/javascript">
						function goLogin(){
							var txt;
							var r = confirm("문의사항을 작성하려면 <일반 student> 계정으로 로그인한 후 결제 하시기 바랍니다.");
							if (r==true) {
								var myWindow = window.open("${pageContext.request.contextPath}/loginpage.do", "_self");
							} else {
								window.open(url, "_self");
							}
						}
				</script>
				<%-- 문의 ** 댓글 ** 달기 폼 영역 --%>
				<div id="qaReplyDiv">
				<form action="qainsert.do" method="post">
				<input type="hidden" name="qid" value="${ qa.qid }" >
				<table align="center" width="500" border="1" cellspacing="0" cellpadding="5" class="tbl_reply">
				<tr><th>
							<div class="container-avatar"  class="tbl_reply">
							  <img src="${pageContext.request.contextPath}/resources/images/profilePics/mds_profile.jpg" alt="Avatar" class="image-avatar" style="width:100%; align: center;">
							  <div class="middle-avatar">
							    <div class="text-avatar">${ sessionScope.loginUser.nickname}</div>
							  </div>
							</div>	
						</th>
				<td><input type="text" name="qawriter" readonly value="${ sessionScope.loginUser.id }"></td></tr>
				<tr><th colspan="2">
							<textarea name="qacontent" rows="5" cols="50" placeholder="택터즈님의 소중한 댓글은 요기에~"></textarea>
						</th></tr>
				<tr><th colspan="2">
				<input type="submit" value="문의 등록"> &nbsp; 
				<input type="reset" value="취소" onclick="hideQaReplyForm(); return false;"> </th></tr>
				</table>
				</form>  
				</div>	
				
				<%-- 문의 ** 댓글 ** 목록 표시 영역 --%>
				<div id="qalistView" >
				<table id="qalistTbl" class="tbl_reply" align="center" cellspacing="0" cellpadding="5" border="1"></table>
				</div>
		
</body>
</html>