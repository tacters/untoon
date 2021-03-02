<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<!-- 기능 매핑 -->
	<c:url var="approve" value="/approve.do"/>
	<c:url var="deny" value="/deny.do"/>
	<c:url var="adcdelete" value="/adcdelete.do"/>
	<c:url var="pay" value="/paymove.do">
		<c:param name="cid" value="${clss.cid }" />
	</c:url>
	<%-- <c:url var="qareplyinsert" value="/qainsert.do">
		<c:param name="cid" value="${clss.cid }" />
	</c:url> --%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>UNTOON 언투온택터즈</title>

<style type="text/css">

.topGrid{
	display:auto; margin:auto; align:center;
	width: 50%;
	min-width: 560px;
	float: left;
	/* border: none; */
	border-style: outset;
	outline: none;
	padding: 14px 16px;
	padding: 10px;
	/* margin: 50%; */
	min-height: 315px
	max-height: 500px;
}
#sideIntro{
	display: block; margin:auto; 
	align:center; text-align:center;
	background-color: #2392bd;
	color: black;
	border-radius: 20px;
	padding: 15px;
	max-width: 40%;
	/* #c6d8d3*/
	
}

#tabArea{
  left-margin: 10%;
  width: 100%;
  }
 .iframe-youtube{
	display:block; margin: auto; float:relative;
	padding: 100px;
 }
  
  .tbl{
  background-color:#E0F5FF;border-color:#E0F5FF;color:#656565;text-align:center;vertical-align:center;
  }
 .tbl_reply{
 background-color:#fff;border-color:#fff;color:#656565;text-align:center;vertical-align:center;
 }
  
  .btn {
  background-color: #000;
  color: white;
  border: 2px solid #000;
  transition-duration: 0.3s;
  padding: 15px  30px 15px 30px;
  margin: 10px 10px;
  cursor: pointer #2392bd;
  font-size: 16px;
  
}
.btn:hover {
  background-color: white; 
  color: #008CBA; 
  border: 2px solid #008CBA;
  padding: 20px  35px 20px 35px;
  margin: 10px 10px;
  cursor: pointer;
  font-size: 20px;
}
 

.container-avatar {
  position: relative;
  width: 20%;
  max-width: 200px;
}

.image-avatar {
  opacity: 1;
  display: block;
  width: 100%;
  height: auto;
  transition: .5s ease;
  backface-visibility: hidden;
  border-radius: 50%;
  margin-left: auto;
  margin-right: auto;
}

.middle-avatar {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%)
}

.container-avatar:hover .image-avatar {
  opacity: 0.3;
}

.container-avatar:hover .middle-avatar {
  opacity: 1;
}

.text-avatar {
  background-color: #fff;
  /* border-radius: 50%; */
  opacity: 0.8;
  color: black;
  font-size: 12px;
  padding: 16px 32px;
  word-wrap: break-word;
  width: 11em;
}
</style>

<style type="text/css"> /* div id= tabArea */
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}


/* Style tab links */
.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 20%;
  min-width: 150px;
  /* border-radius: 5px; */
}

.tablink:hover {
  background-color: #c6d8d3;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  color: white;
  display: none;
  padding: 100px 20px;
  height: 100%;
  background-color: #2392bd;
}

</style>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<!-- 후기 AJAX -->
<script type="text/javascript">
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


/* function showReviewReplyForm(){
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
} */


//jquery ajax 로 해당 < 수업 클래스 > 대한 문의 조회 요청
//해당 < 수업 클래스 >의 번호를 전송함
$(function(){
	hideReviewForm(); 
	showReviewListView(); //hideReviewListView(); // ADDED TO TEST "REVIEW 목록조회 기능"
	// hideReviewReplyForm(); // ADDED TO TEST "REPLY댓글 달기 기능"
	// hideReviewReplyListView(); // ADDED TO TEST "REVIEW REPLY 목록조회 기능"
	
	var clssCid = ${ clss.cid };  //el 의 값을 변수에 대입 : 클래스 ID
	var loginUser = "${ sessionScope.loginUser.id }";  //로그인한 회원 아이디 변수에 대입
	var teacher = "${clss.tchr_id}"; //el 의 값을 변수에 대입 : 수업 강사님
	var adminLv= "${ sessionScope.loginUser.user_lv }";  //로그인한 회원 유저레벨 (S, T, A) 변수에 대입
	
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
		
		showReviewListView(); // NEWLY ADDED HERE = THIS <div> LIST IS NOT SHOWINGGGGGGGGGGGGGG
		
		var values = "";
				for(var i in json.list){
					// 본인이 등록한 후기글일 때는 수정/삭제 가능
					if(loginUser == json.reviewList[i].rwriter){
						values += "<tr><td>" + json.reviewList[i].rwriter 
							+ "</td><td>" +  json.reviewList[i].r_modify_date 
							+ "</td></tr><tr><td colspan='2'>"
							+ "<form action='rupdate.do' method='post=' enctype='multipart/form-data'>" 
							+ "<input type='hidden' name='rid' value='" +  json.reviewList[i].rid  + "'>"
							+ "<input type='hidden' name='cid' value='"+clssCid+"'>"
							
							// 첨부파일 업데이트
																//+ "<input type='hidden' name='ofile_r' value='${ review.ofile_r}'>"
																//+ "<input type='hidden' name='rfile_r' value='${ review.rfile_r}'>"
							// 원래 첨부파일 있는 경우
							if (review.ofile_r != null){
							+ "<input type='checkbox' name='delFlag' value='yes'> 파일삭제 <br>"
							+"<tr><td colspan='2'>"
								+ "<img src= 'resources/reviewClss_files/"+ review.ofile_r +"' alt='"+clssCid+" 클래스 " 
								+ json.reviewList[i].rwriter +"님의 후기 사진' style='width:100%; align: center; position: relative; max-width: 500px; padding: 10px;'>"
							+ "</td></tr>"
							} else { //원래 첨부파일이 없는 경우
							+ "<input type='file' name='upfile'>"	
							}
							
							// 글 내용 수정
							+ "<textarea name='rcontent'>"
							+ decodeURIComponent(json.reviewList[i].rcontent).replace(/\+/gi, " ") 
							+ "</textarea><input type='submit' value=' 수정 '></form>" 
							+ "<button onclick='reviewDelete(" + json.reviewList[i].rid + ");'> 삭제 </button>";
							
							/* for each문 안에다가 댓글달 수 있게 끔 */
							// + "<button onclick='revReply(" + json.reviewList[i].rid + ");'> 댓글달기 </button></td></tr>";
							
					} else if (loginUser == teacher || adminLv == 'A' ) { //대상 강사또는 관리자일 때
						values += "<tr><td>" + json.reviewList[i].rwriter 
						+ "</td><td>" +  json.reviewList[i].r_modify_date 
						+ "</td></tr>"
					
						// 원래 첨부파일 있는 경우
						if (review.ofile_r != null){
							+ "<tr><td colspan='2'>"
							+ "<img src= 'resources/reviewClss_files/"+ review.ofile_r +"' alt='"+clssCid+" 클래스 " 
							+ json.reviewList[i].rwriter +"님의 후기 사진' style='width:100%; align: center; position: relative; max-width: 500px; padding: 10px;'>"
						+ "</td></tr>"
						} else{
						
						+"<tr><td colspan='2'>"
						+ decodeURIComponent(json.reviewList[i].qcontent).replace(/\+/gi, " ") 
						+ "</td></tr>"
						//댓글달기
						// + "<button onclick='revReply(" + json.reviewList[i].rid + ");'> 댓글달기 </button></td></tr>" // 다시 살리면 </td></tr> 확인하기
						+ "<tr><td colspan='2' style='text-align:right;'><button onclick='saveReview("+json.reviewList[i].save_count +");'> 좋아요 </td></tr>";
						}
						
					} else { // 글작성자가 아니며, 대상 강사또는 관리자가 아닐 때
						values += "<tr><td>" + json.reviewList[i].rwriter 
						+ "</td><td>" +  json.reviewList[i].r_modify_date 
						+ "</td></tr><tr><td colspan='2'>"
						+ decodeURIComponent(json.reviewList[i].rcontent).replace(/\+/gi, " ")
						+"</td></tr>"
						+ "<tr><td colspan='2' style='text-align:right;'><button onclick='saveReview("+json.reviewList[i].save_count +");'> 좋아요 </td></tr>";
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
	showReviewListView();
	
	showReviewReplyForm();
	//showReviewReplyListView();
	

	jQuery( function($) {
		var refRid = rid; 
		var refRcid = "${clss.cid}";
		var loginUser = "${ sessionScope.loginUser.id }";  //로그인한 회원 아이디 변수에 대입
		var teacher = "${clss.tchr_id}"; // 수업 강사님
		var adminLv= "${ sessionScope.loginUser.user_lv }";


		$.ajax({
			url: "${ pageContext.request.contextPath }/rrlist.do",
			type: "post",
			data: { ref_rid: refRid,  ref_rcid: refRcid},  //전송값에 변수 사용 // 문의 id를 받아옴 (rid)
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

<!-- 문의 AJAX -->
<script type="text/javascript">
function showQaForm(){
	$("#qaDiv").css("display", "block");
}
function hideQaForm(){
	$("#qaDiv").css("display", "none");
}
function qaDelete(qid){
	location.href = "${ pageContext.request.contextPath }/qdelete.do?qid=" + qid + "&cid=${ clss.cid}";
}
function showQaReplyForm(){
	$("#qaReplyDiv").css("display", "block");
}
function hideQaReplyForm(){
	$("#qaReplyDiv").css("display", "none");
}
function qaReplyDelete(qaid){
	location.href = "${ pageContext.request.contextPath }/qadelete.do?qaid=" + qaid + "&qid=${ qa.qid}";
}
function showQaListView(){
	$("#qalistView").css("display", "none");
}
function hideQaListView(){
	$("#qalistView").css("display", "none");
}


//jquery ajax 로 해당 < 수업 클래스 > 대한 문의 조회 요청
//해당 < 수업 클래스 >의 번호를 전송함
$(function(){
	hideQaForm(); 
	hideQaReplyForm(); // ADDED TO TEST "REPLY댓글 달기 기능"
	hideQaListView(); // ADDED TO TEST "질문 목록조회 기능"
		
	var clssCid = "${ clss.cid }";  //el 의 값을 변수에 대입
	var loginUser = "${ sessionScope.loginUser.id }";  //로그인한 회원 아이디 변수에 대입
	var teacher = "${clss.tchr_id}"; // 수업 강사님
	var adminLv= "${ sessionScope.loginUser.user_lv }";
	
	$.ajax({
		url: "${ pageContext.request.contextPath }/qlist.do",
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
					if(loginUser == json.list[i].qwriter){
						values += "<tr><td>" + json.list[i].qwriter 
							+ "</td><td>" +  json.list[i].q_modify_date 
							+ "</td></tr><tr><td colspan='2'>"
							+ "<form action='qupdate.do' method='post'>" 
							+ "<input type='hidden' name='qid' value='" +  json.list[i].qid  + "'>"
							+ "<input type='hidden' name='cid' value='"+clssCid+"'>"
							/* + "<input type='hidden' name='clssCid' value='${clss.cid}'>" */
							+ "<textarea name='qcontent'>"
							+ decodeURIComponent(json.list[i].qcontent).replace(/\+/gi, " ") 
							+ "</textarea><input type='submit' value='수정'></form>" 	// 원래 여기에 </form> 들어감
							+ "<button onclick='qaDelete(" + json.list[i].qid + ");'>삭제</button>" //원래 여기에 </td></tr> 들어감
							
							/* for each문 안에다가 댓글달 수 있게 끔 */
							+ "<button onclick='selfReply(" + json.list[i].qid + ");'>댓글달기</button></td></tr>";
							
					} else if (loginUser == teacher || adminLv == 'A' ) { //대상 강사또는 관리자일 때
						values += "<tr><td>" + json.list[i].qwriter 
						+ "</td><td>" +  json.list[i].q_modify_date 
						+ "</td></tr><tr><td colspan='2'>"
						+ decodeURIComponent(json.list[i].qcontent).replace(/\+/gi, " ") 
						+ "</td></tr>";	
						
					} else { // 글작성자가 아니며, 대상 강사또는 관리자가 아닐 때
						values += "<tr><td>" + json.list[i].qwriter 
						+ "</td><td>" +  json.list[i].q_modify_date 
						+ "</td></tr><tr><td colspan='2'>"
						+ "<i style='color: gray'> 🔒 비공개 문의사항 🔒 </i>"
						+ "</td></tr>";
					}
				}
				$("#qlistTbl").html($("#qlistTbl").html() + values);
			},
		error: function(jqXHR, textstatus, errorthrown){
			console.log("error : " + jqXHR + ", " + textstatus + ", " 
				+ errorthrown);
			}	
		});// 문의 작성 수정/삭제 ajax
});  //jquery document ready

function selfReply(qid){
	showQaReplyForm();
	showQaListView();


	//jquery ajax 로 해당 < 수업 클래스 > 대한 문의 *** 댓글 *** 조회 요청
	//해당 < 수업 클래스 >의 *** 문의 *** 번호를 전송함

	jQuery( function($) {
		var qaQid = qid;  // selfReply(qid)의 매개변수 값 ( 위 ajax에 있던 json.list[i].qid )을 변수에 대입
		var loginUser = "${ sessionScope.loginUser.id }";  //로그인한 회원 아이디 변수에 대입
		var teacher = "${clss.tchr_id}"; // 수업 강사님
		var adminLv= "${ sessionScope.loginUser.user_lv }";


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
								+ "<input type='hidden' name='ref_qid' value='"+ qaQid +"'>" 
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
							+ "<i style='color: gray'> 🔒 비공개 문의사항 🔒 </i>"
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
	});  //jquery 

	}; // END OF selfReply(qid)

</script>


</head>
<body>	
<c:import url="../common/menubar.jsp"/>

<header  style="position: relative; ">
<br>
<br>
<c:if test="${sessionScope.loginUser.user_lv eq 'A'}">
	<div style="margin: auto; border: 1px solid #2392bd; padding: 10px; width:70%;">
			<c:if test="${clss.clss_status eq 1 }">
				<h1 style="text-align:center; display:block; margin: auto; padding:10px;"> ◈ ${clss.cid} ◈ 클래스 인증 대기</h1>
					<c:url var="approve" value="/approve.do" >
						<c:param name="cid" value="${ clss.cid }"/>
					</c:url>
					<button class="admin_lv" onclick="location.href='${ approve }'"> 승인하기 </button>
					&nbsp; &nbsp; 
					<c:url var="adcdelete" value="/adcdelete.do">
						<c:param name="cid" value="${ clss.cid }"/>
					</c:url>
					<button class="admin_lv" onclick="location.href='${ adcdelete }'"> 삭제하기 </button>
					&nbsp; &nbsp; 
					<form action="deny.do">
					<input type="hidden" name="cid" value="${clss.cid}">
					<c:if test="${sessionScope.loginUser.user_lv eq 'A'}">
						<c:if test="${ clss.clss_status lt 3 }">
						<textarea cols="100" rows="10" name="clss_comment"></textarea>
						<input type="submit" value="거부하기">
						&nbsp; &nbsp; 
						</c:if>
					</c:if>
					</form>
			</c:if>
			<c:if test="${clss.clss_status eq 2 }">
					<h1 style="text-align:center; display:block; margin: auto; padding:10px;"> ◈ ${clss.cid} ◈ 클래스 인증 완료 </h1>
			</c:if>
					
	</div>
</c:if>
<c:if test="${sessionScope.loginUser.user_lv eq 'T' and sessionScope.loginUser.id eq clss.tchr_id}">
	<c:if test="${clss.clss_status eq 1 }">
		<h1> ◈ ${clss.cid} ◈ 클래스 인증 대기중 </h1>
		<div style="margin: auto; border: 1px solid #2392bd; padding: 10px;">
				<c:url var="tupmove" value="/tupmove.do" >
					<c:param name="cid" value="${ clss.cid }"/>
				</c:url>
				<button class="teacher_lv" onclick="location.href='${ tupmove }'"> 수정하기 </button>
		</div>
	</c:if>
	<c:if test="${clss.clss_status eq 2 }">
		<h1 style="text-align:center; display:block; margin: auto; padding:10px;"> ◈ ${clss.cid} ◈ 클래스 인증 완료 </h1>
		<div style="margin: auto; border: 1px solid #2392bd; padding: 10px;">
					<c:url var="checkEnroll" value="/checkEnroll.do" >
						<c:param name="cid" value="${ clss.cid }"/>
					</c:url>
					<button class=teacher_lv onclick="location.href='${ checkEnroll }'"> 수강생 목록 </button>	
	</div>
	</c:if>
	<c:if test="${clss.clss_status eq 3 }">
		<h1 style="text-align:center; display:block; margin: auto; padding:10px;"> ◈ ${clss.cid} ◈ 클래스 거부 😔 </h1>
		<div style="margin: auto; border: 1px solid #2392bd; padding: 10px;">
			${ clss.clss_comment }
		</div>
		<div style="margin: auto; border: 1px solid #2392bd; padding: 10px;">
				<c:url var="tupmove" value="/tupmove.do" >
					<c:param name="cid" value="${ clss.cid }"/>
				</c:url>
				<button class="teacher_lv" onclick="location.href='${ tupmove }'"> 수정하기 </button>
		</div>
	</c:if>
</c:if>

<c:if test="${sessionScope.loginUser.user_lv eq 'T' and clss.clss_status eq 3 }">
	<h1 style="text-align: center;"> ◈ &nbsp; # ${clss.cid} &nbsp; ◈ 클래스 인증 대기 </h1>
	
</c:if>


<div id="embedArea" class="topGrid" >
<script type="text/javascript">

	window.onload = embedLink;
	
	 function embedLink(){
		  var url = "${ clss.clss_url }"; // 따옴표 "" 필요한가?
		  var url_full_id = url.split("?v=")[1]; // 뒷부분 (예: FCsLikmxhV0)
		  console.log(url_full_id);
		  
		  /* var url_id;
		  
		  if (url_full_id.contains("&")){
			  url_id = url_full_id.split("&")[0]; 
			  // 앞부분 만 가져옴 (예 : "&feature=youtu.be" 또는 "&list=어쩌구저쩌구코드&start_radio=1" 같이 있는 뒷부분 생략)
			  } else {
			  url_id = url_full_id;
			  } */
			  
			  // embed하고 자동 재생 시키기
			  var embedLink = "https://www.youtube.com/embed/" + url_full_id + "?autoplay=1"; // 원래 my version used:     url_id;
			  console.log(embedLink);			  
		  };
		  
		  $('#embed').attr('src', "embedLink");
		  //	
	</script>

<!-- <iframe id="embed" width="560" height="315" src=""  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen/> -->
<div class="iframe-youtube">
	<iframe id="embed" width="560" height="315"  src="${ clss.clss_url }" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

</div>


<div id="sideIntro" class="topGrid" ><!--  -->
	<img src="${pageContext.request.contextPath }/resources/clss_files/${clss.clss_rename_filename}" alt="${ clss.clss_title }" 
			style="display:auto; margin:auto; align:center; height: 400px; border-radius: 20px;">
	<h2 style="color: #fff; word-wrap: break-word;"> ${ clss.clss_title } </h2>
			
			<c:set var="tags" value="${ clss.clss_tags }"/><!-- 이 다음에, 쉼표 기준으로 떼어놓기 -->
			<%-- <c:set var="tag" value="${fn:split(tags, ',') }"/> 			items에다가 split fn 쓰고 index 에다 0,1,2,3,4 쓰면 된다--%>
			<c:forEach var="i" items="${fn: split(tags, ',') }" >
				<a href="#" style="color:#fff;">#<c:out value="${ i }"/></a>[
			</c:forEach>
			
	
	
   ${ clss.clss_times }<br><br>
   ${ clss.clss_duration }<br><br>
  
  
  <!-- PAY 결제하기 에서 >> 로그인 안 되있으면 로그인 페이지로 이동 후 결제하기 -->
  <script type="text/javascript">
			function checkPayer(){
				var txt;
				var r = confirm("수강신청 가능한 <일반 student> 계정으로 로그인한 후 결제 하시기 바랍니다.");
				if (r==true) {
					var myWindow = window.open("${pageContext.request.contextPath}/loginpage.do", "_self");
				} else {
					
					if ('${sessionScope.loginUser.user_lv}' == 'A'){
						var rr = confirm("관리자계정에서 <결제하기>를 테스트 해봅니다.");
						if(rr==true){
						window.open("${pageContext.request.contextPath}/paymove.do", "_self");
						} else {
						window.open(url, "_self");
					} 
					}
				}
			}
	</script>
		<c:if test="${ empty sessionScope.loginUser }">
			<button class="btn" onclick="checkPayer();"> <strong>수 강 신 청</strong> </button>
		</c:if>
		<c:if test="${ !empty sessionScope.loginUser }">
			<%-- 강사는 자기가 가르치는 수업이면 결제 불가--%>
			<c:if test="${sessionScope.loginUser.user_lv eq 'T' and sessionScope.loginUser.id eq clss.tchr_id}"> 
				<button class="btn" onclick="confirm('강사계정에서 로그아웃 후, Student계정으로 로그인한 후 결제 하시기 바랍니다.')"> <strong>수 강 신 청</strong> </button>
			</c:if>
			<%-- 강사도 자기가 가르치는 수업이 아니면 결제 가능 --%>
			<c:if test="${sessionScope.loginUser.user_lv eq 'T' and sessionScope.loginUser.id ne clss.tchr_id}"> 
				<button class="btn" onclick="location.href='${ pay }'"> <strong>수 강 신 청</strong> </button>
			</c:if>	
			<%-- 관리자는 결제로 테스트삼아 넘어가짐 --%>
			<c:if test="${sessionScope.loginUser.user_lv eq 'A'}">
				<button class="btn" onclick="checkPayer();"> <strong>수 강 신 청</strong> </button>
			</c:if>
			<c:if test="${sessionScope.loginUser.user_lv eq 'S'}">
				<button class="btn" onclick="location.href='${ pay }'"> <strong>수 강 신 청</strong> </button>
			</c:if>		
		</c:if>
		
</div><!-- end of id= "sideIntro" -->
</header>

<!-- <div id="gapDiv" style="position:relative; padding: 20 20 20 20; margin: 10 10 10 10;">
<br> <br> <br> <br><br> <br> <br> <br><br> <br> <br> <br>
<br> <br> <br> <br><br> <br> <br> <br><br> <br> 
<br><br><br><br><br><br>
</div> -->

<div id="bodyDiv" style="position:relative;">
		<div style="display:block; position:relative; margin:auto;">
			<br style="float:clear;">
			<br style="float:clear;">
			<br style="float:clear;">
		</div>
		
		<div id="tabArea" class="bottomGrid">
			
				<script type="text/javascript">
				function openPage(pageName,elmnt,color) {
				  var i, tabcontent, tablinks;
				  tabcontent = document.getElementsByClassName("tabcontent");
				  for (i = 0; i < tabcontent.length; i++) {
				    tabcontent[i].style.display = "none";
				  }
				  tablinks = document.getElementsByClassName("tablink");
				  for (i = 0; i < tablinks.length; i++) {
				    tablinks[i].style.backgroundColor = "";
				  }
				  document.getElementById(pageName).style.display = "block";
				  elmnt.style.backgroundColor = color;
				}
				
				// Get the element with id="defaultOpen" and click on it
				//document.getElementById("defaultOpen").click();
					$(window).load(function(){	// on load
							$(".defaultOpen").click(); 	// click the element
					})
				</script>
				   
				  <br>
				  
			
				<!-- <div class="tabcontent"> -->
				<div class="button">
					<button class="tablink" onclick="openPage('1-intro', this, '#2392bd')" class="defaultOpen" id="tab1"> 클래스 소개 </button>
					<button class="tablink" onclick="openPage('2-review', this, '#2392bd')" id="tab2"> 후기 </button>
					<button class="tablink" onclick="openPage('3-qna', this, '#2392bd')" id="tab3"> 문의 </button>
					<button class="tablink" onclick="openPage('4-refund', this, '#2392bd')" id="tab4"> 환불정책 </button>
					<button class="tablink" onclick="openPage('5-teacher', this, '#2392bd')" id="tab5"> 강사소개 </button>
				</div>
				<!-- </div> -->
				
				<!-- 클래스 소개 -->
				<div id="1-intro" class="tabcontent">
					<h3 style="text-align: center; color: #fff;"> 클래스 소개 </h3>
					${ clss.clss_content }<br><br>
				</div>
				
				<!-- 클래스 후기  -->
				<div id="2-review" class="tabcontent">
				<h3 style="text-align: center; color: #fff;"> 후기 </h3>
													<%-- 로그인한 사용자만 후기 작성가능 --%>
												<c:if test="${ !empty sessionScope.loginUser }">
													<div style="align:center; text-align:center;">
														<button class="btn" onclick="showReviewForm();"> <b> 클래스 ◆ ${clss.clss_title } ◆ </b>의  후기 작성 </button>
													</div>
												</c:if>
												<c:if test="${ empty sessionScope.loginUser }">
													<div style="align:center; text-align:center;">
														<button class="btn" onclick="goLogin();"> <b> 클래스 ◆ ${clss.clss_title } ◆ </b>의  후기 작성 </button>
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
											<form action="rinsert.do" method="post" enctype="multipart/form-data">
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
											<tr><th colspan="2"><input type="file" name="upfile"></th></tr>
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
											</div>
											
											
											
													<%-- 후기 ** 댓글 ** 달기 폼 영역 --%>
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
													
													<%-- 후기  ** 댓글 ** 목록 표시 영역 --%>
													<div id="reviewReplyListView" >
													<table id="rrlistTbl" class="tbl_reply" align="center" cellspacing="0" cellpadding="5" border="1"></table>
													</div>
													
											
											
		
				</div>
				
				<%-- 문의 목록 / 작성 --%>
				<div id="3-qna" class="tabcontent">
				<h3 style="text-align: center; color: #fff;"> 문의 </h3>		
							<%-- 로그인한 사용자만 문의작성가능 --%>
							<c:if test="${ !empty sessionScope.loginUser }">
								<div style="align:center; text-align:center;">
									<button class="btn" onclick="showQaForm();"> 강사에게 문의 작성 </button>
								</div>
							</c:if>
							<c:if test="${ empty sessionScope.loginUser }">
								<div style="align:center; text-align:center;">
									<button class="btn" onclick="goLogin();"> 강사에게 문의 작성 </button>
								</div>
							</c:if>
						<script type="text/javascript">
								function goLogin(){
									var txt;
									var r = confirm("문의사항을 작성하려면 <일반 student> 계정으로 로그인한 후 무의 작성하시기 바랍니다.");
									if (r==true) {
										var myWindow = window.open("${pageContext.request.contextPath}/loginpage.do", "_self");
									} else {
										window.open(url, "_self");
									}
								}
						</script>
						<%-- 문의 달기 폼 영역 --%>
						<div id="qaDiv">
						<form action="qinsert.do" method="post">
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
						<td><input type="text" name="qwriter" readonly value="${ sessionScope.loginUser.id }"></td></tr>
						<tr><th colspan="2"><textarea name="qcontent" rows="5" cols="50" placeholder="택터즈님의 궁굼한 문의사항은 요기에~"></textarea></th></tr>
						<tr><th colspan="2">
						<input type="submit" value="문의사항 등록"> &nbsp; 
						<input type="reset" value="취소" onclick="hideQaForm(); return false;"> </th></tr>
						</table>
						</form>  
						</div>	
						
						<%-- 문의 목록 표시 영역 --%>
						<div id="qlistView" >
						<table id="qlistTbl" class="tbl" align="center" cellspacing="0" cellpadding="5" border="1"></table>
						
								<%-- 댓글 --%>
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
											var r = confirm("문의사항을 작성하려면 <일반 student> 계정으로 로그인한 후 댓글 달기 바랍니다.");
											if (r==true) {
												var myWindow = window.open("${pageContext.request.contextPath}/loginpage.do", "_self");
											} else {
												window.open(url, "_self");
											}
										}
								</script>
								<%-- 문의 ** 댓글 ** 달기 폼 영역 --%>
								<div id="qaReplyDiv">
									<form action="qainsert.do" method="post"> <!-- 원래는 action = "qainsert.do -->
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
										<input type="submit" value="댓글 등록"> &nbsp; 
										<input type="reset" value="취소" onclick="hideQaReplyForm(); return false;"> </th></tr>
									</table>
									</form>  
								</div>	
								
								<%-- 문의 ** 댓글 ** 목록 표시 영역 --%>
								<div id="qalistView" >
								<table id="qalistTbl" class="tbl_reply" align="center" cellspacing="0" cellpadding="5" border="1"></table>
								</div>
								
						</div>
				
				</div> <%-- END OF 문의 목록 / 작성 --%>
				
				<!-- 클래스 환불정책  -->
				<div id="4-refund" class="tabcontent">
				<h3 style="text-align: center; color: #fff;"> 환불정책 </h3>
				
				
				
				</div>
				
				<!-- 강사소개  -->
				<div id="5-teacher" class="tabcontent">
				<h3 style="text-align: center; color: #fff;"> 강사소개 </h3>
				   <input type="text"  value="${ clss.tchr_profile }">
				   <textarea class="basic len980 hei190" id="TutorInfo" name="tchr_profile"></textarea>
				   <br><br>
				</div>
		
		</div>
		

</div><!-- css: Position Relative  -->

<footer><c:import url="../common/footer.jsp"/></footer>
</body>


</html>