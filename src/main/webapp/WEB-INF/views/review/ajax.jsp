<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>