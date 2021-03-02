<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%-- 응답온 페이지값 추출함 --%>
<c:set var="currentPage" value="${ requestScope.page }" /> 

<!DOCTYPE html>
<html>
<head><script type="text/javascript">
function showReviewForm(){
	$("#reviewDiv").css("display", "block");
}
function hideReviewForm(){
	$("#reviewDiv").css("display", "none");
}

function showReviewListView(){
	$("#reviewlistView").css("display", "none");
}
function hideReviewListView(){
	$("#reviewlistView").css("display", "none");
}


function reviewDelete(rid){
	location.href = "${ pageContext.request.contextPath }/rdelete.do?rid=" + rid + "&cid=${ clss.cid}";
}
function showReviewReplyForm(){
	$("#reviewReplyDiv").css("display", "block");
}
function hideReviewReplyForm(){
	$("#reviewReplyDiv").css("display", "none");
}
function reviewReplyDelete(rrid){
	location.href = "${ pageContext.request.contextPath }/rrdelete.do?rrid=" + rrid + "&rid=${ review.rid}";
}

function showReviewReplyListView(){
	$("#reviewReplyListView").css("display", "none");
}
function hideReviewReplyListView(){
	$("#reviewReplyListView").css("display", "none");
}


//jquery ajax 로 해당 < 수업 클래스 > 대한 문의 조회 요청
//해당 < 수업 클래스 >의 번호를 전송함
$(function(){
	hideReviewForm(); 
	hideReviewReplyForm(); // ADDED TO TEST "REPLY댓글 달기 기능"
	hideReviewListView(); // ADDED TO TEST "REVIEW 목록조회 기능"
	hideReviewReplyListView(); // ADDED TO TEST "REVIEW REPLY 목록조회 기능"
	
	var clssCid = "${ clss.cid }";  //el 의 값을 변수에 대입
	var loginUser = "${ sessionScope.loginUser.id }";  //로그인한 회원 아이디 변수에 대입
	var teacher = "${clss.tchr_id}"; // 수업 강사님
	var adminLv= "${ sessionScope.loginUser.user_lv }";
	
	$.ajax({
		url: "${ pageContext.request.contextPath }/rlist.do",
		type: "post",
		data: { cid: clssCid },  //전송값에 변수 사용
		dataType: "json",
		success: function(data){
		console.log("success : " + data);
	
		//object ==> string
		var jsonStr = JSON.stringify(data);
		//string ==> json 
		var json = JSON.parse(jsonStr);
		
		var values = "";
				for(var i in json.list){
					// 본인이 등록한 후기글일 때는 수정/삭제 가능
					if(loginUser == json.list[i].rwriter){
						values += "<tr><td>" + json.list[i].rwriter 
							+ "</td><td>" +  json.list[i].r_modify_date 
							+ "</td></tr><tr><td colspan='2'>"
							+ "<form action='rupdate.do' method='post'>" 
							+ "<input type='hidden' name='rid' value='" +  json.list[i].rid  + "'>"
							+ "<input type='hidden' name='cid' value='"+clssCid+"'>"
							/* + "<input type='hidden' name='clssCid' value='${clss.cid}'>" */
							+ "<textarea name='rcontent'>"
							+ decodeURIComponent(json.list[i].rcontent).replace(/\+/gi, " ") 
							+ "</textarea><input type='submit' value=' 수정 '></form>" 	// 원래 여기에 </form> 들어감
							+ "<button onclick='reviewDelete(" + json.list[i].rid + ");'> 삭제 </button>" //원래 여기에 </td></tr> 들어감
							
							/* for each문 안에다가 댓글달 수 있게 끔 */
							+ "<button onclick='revReply(" + json.list[i].rid + ");'> 댓글달기 </button></td></tr>";
							
					} else if (loginUser == teacher || adminLv == 'A' ) { //대상 강사또는 관리자일 때
						values += "<tr><td>" + json.list[i].rwriter 
						+ "</td><td>" +  json.list[i].r_modify_date 
						+ "</td></tr><tr><td colspan='2'>"
						+ decodeURIComponent(json.list[i].qcontent).replace(/\+/gi, " ") 
						//댓글달기
						+ "<button onclick='revReply(" + json.list[i].rid + ");'> 댓글달기 </button></td></tr>"
						+ "<tr><td colspan='2' style='text-align:right;'><button onclick='saveReview("+json.list[i].save_count +");'> 좋아요 </td></tr>"; 
						
					} else { // 글작성자가 아니며, 대상 강사또는 관리자가 아닐 때
						values += "<tr><td>" + json.list[i].rwriter 
						+ "</td><td>" +  json.list[i].r_modify_date 
						+ "</td></tr><tr><td colspan='2'>"
						+ decodeURIComponent(json.list[i].rcontent).replace(/\+/gi, " ")
						+ "<tr><td colspan='2' style='text-align:right;'><button onclick='saveReview("+json.list[i].save_count +");'> 좋아요 </td></tr>";
					}
				}
				$("#rlistTbl").html($("#rlistTbl").html() + values);
			},
		error: function(jqXHR, textstatus, errorthrown){
			console.log("error : " + jqXHR + ", " + textstatus + ", " 
				+ errorthrown);
			}	
		});// 문의 작성 수정/삭제 ajax
});  //jquery document ready

function revReply(rid){
	showReviewReplyForm();
	showReviewReplyListView();

	jQuery( function($) {
		var refRid = rid; 
		var refRcid = "${clss.cid}";
		var loginUser = "${ sessionScope.loginUser.id }";  //로그인한 회원 아이디 변수에 대입
		var teacher = "${clss.tchr_id}"; // 수업 강사님
		var adminLv= "${ sessionScope.loginUser.user_lv }";


		$.ajax({
			url: "${ pageContext.request.contextPath }/rrlist.do",
			type: "post",
			data: { ref_rid: refRid,  ref_rcid = refRcid},  //전송값에 변수 사용 // 문의 id를 받아옴 (rid)
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
						if(loginUser == json.list[i].rrwriter){
							values += "<tr><td>" + json.list[i].rrwriter 
								+ "</td><td>" +  json.list[i].rr_modify_date 
								+ "</td></tr><tr><td colspan='2'>"
								+ "<form action='rrupdate.do' method='post'>" 
								+ "<input type='hidden' name='rrid' value='" +  json.list[i].rrid  + "'>"
								+ "<input type='hidden' name='ref_rid' value='"+ refRid +"'>" 
								+ "<input type='hidden' name='ref_rid' value='"+ refRcid +"'>" 
								+ "<textarea name='rrcontent'>"
								+ decodeURIComponent(json.list[i].rrcontent).replace(/\+/gi, " ") 
								+ "</textarea><input type='submit' value='수정'></form>"
								+ "<button onclick='reviewReplyDelete(" + json.list[i].rrid + ");'>삭제</button></td></tr>";
						} else if ( loginUser == teacher || adminLv == 'A' ){ 
							values += "<tr><td>" + json.list[i].rrwriter 
							+ "</td><td>" +  json.list[i].rr_modify_date 
							+ "</td></tr><tr><td colspan='2'>"
							+ decodeURIComponent(json.list[i].rrcontent).replace(/\+/gi, " ") 
							+ "</td></tr>";	
						} else{ // 글작성자가 아니며, 대상 강사또는 관리자가 아닐 때
							values += "";	
						}
					}
					$("#rrlistTbl").html($("#rrlistTbl").html() + values);
				},
			error: function(jqXHR, textstatus, errorthrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " 
					+ errorthrown);
				}	
			});// 문의 작성 수정/삭제 ajax
	});  //jquery 

	}; // END OF revReply(rid)

</script>







<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
</head>
<body>
<c:import url="../common/menubar.jsp" />











				<%-- 로그인한 사용자만 후기 작성가능 --%>
					<c:if test="${ !empty sessionScope.loginUser }">
						<div style="align:center; text-align:center;">
							<button class="btn" onclick="showReviewForm();"> <b> ◆ ${clss.clss_title } ◆ </b> 후기 작성 </button>
						</div>
					</c:if>
					<c:if test="${ empty sessionScope.loginUser }">
						<div style="align:center; text-align:center;">
							<button class="btn" onclick="goLogin();"> <b> ◆ ${clss.clss_title } ◆ </b> 후기 작성 </button>
						</div>
					</c:if>
				<script type="text/javascript">
						function goLogin(){
							var txt;
							var r = confirm("글을 작성하려면 <일반 student> 계정으로 로그인한 후 작성하시기 바랍니다.");
							if (r==true) {
								var myWindow = window.open("${pageContext.request.contextPath}/loginpage.do", "_self");
							} else {
								window.open(url, "_self");
							}
						}
				</script>
				<%-- 후기 달기 폼 영역 --%>
				<div id="reviewDiv">
				<form action="rinsert.do" method="post">
				<input type="hidden" name="cid" value="${ clss.cid }" >
				<table align="center" width="500" border="1" cellspacing="0" cellpadding="5" class="tbl">
				<tr><th>
							<div class="container-avatar"  class="tbl">
							  <img src="${pageContext.request.contextPath}/resources/images/profilePics/mds_profile.jpg" alt="Avatar" class="image-avatar" style="width:100%; align: center;">
							  <div class="middle-avatar">
							    <div class="text-avatar">${ sessionScope.loginUser.nickname}</div>
							  </div>
							</div>	
						</th>
				<td><input type="text" name="rwriter" readonly value="${ sessionScope.loginUser.id }"></td></tr>
				<tr><th colspan="2"><textarea name="rcontent" rows="5" cols="50" placeholder="택터즈님의 소중한 후기는 요기에~"></textarea></th></tr>
				<tr><th colspan="2">
				<input type="submit" value="후기 등록"> &nbsp; 
				<input type="reset" value="취소" onclick="hideReviewForm(); return false;"> </th></tr>
				</table>
				</form>  
				</div>	
				
				<%-- 후기 목록 표시 영역 --%>
				<div id="reviewlistView" >
				<table id="rlistTbl" class="tbl" align="center" cellspacing="0" cellpadding="5" border="1"></table>
				
						<%-- 문의 ** 댓글 ** 달기 폼 영역 --%>
						<div id="reviewReplyDiv">
							<form action="rrinsert.do" method="post">
							<input type="hidden" name="ref_rid" value="${ review_reply.ref_rid }" >
							<input type="hidden" name="ref_rcid" value="${ review_reply.ref_rcid }" >
								<table align="center" width="500" border="1" cellspacing="0" cellpadding="5" class="tbl_reply">
								<tr><th>
											<div class="container-avatar"  class="tbl_reply">
											  <img src="${pageContext.request.contextPath}/resources/images/profilePics/mds_profile.jpg" alt="Avatar" class="image-avatar" style="width:100%; align: center;">
											  <div class="middle-avatar">
											    <div class="text-avatar">${ sessionScope.loginUser.nickname}</div>
											  </div>
											</div>	
										</th>
								<td><input type="text" name="rrwriter" readonly value="${ sessionScope.loginUser.id }"></td></tr>
								<tr><th colspan="2">
											<textarea name="rrcontent" rows="5" cols="50" placeholder="택터즈님의 소중한 댓글은 요기에~"></textarea>
										</th></tr>
								<tr><th colspan="2">
								<input type="submit" value="댓글 등록"> &nbsp; 
								<input type="reset" value="취소" onclick="hideReviewReplyForm(); return false;"> </th></tr>
							</table>
							</form>  
						</div>	
						
						<%-- 문의 ** 댓글 ** 목록 표시 영역 --%>
						<div id="reviewReplyListView" >
						<table id="rrlistTbl" class="tbl_reply" align="center" cellspacing="0" cellpadding="5" border="1"></table>
						</div>
						
				</div>


















<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>