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
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
 <link rel = "stylesheet"   type = "text/css"   href = "${ pageContext.request.contextPath }/resources/css/clss/clssDetailView.css" />
 <%-- <script src="${ pageContext.request.contextPath }/resources/js/clss/clssDetailView.js" type="text/javascript"></script> --%>
</head>
<body>	
<c:import url="../common/menubar.jsp"/> <%-- ● ONE ● : <c:import url="../common/menubar.jsp"/> --%>


<%-- 강사와 관리자 관리용 --%>
<div> 
	<c:if test="${sessionScope.loginUser.user_lv eq 'A'}">
		<div style="border: 1px solid #2392bd;">
				<c:if test="${clss.clss_status eq 1 }">
					<h1 style="text-align:center;"> ◈ ${clss.cid} ◈ 클래스 인증 대기</h1>
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
						<h1 style="text-align:center; "> ◈ ${clss.cid} ◈ 클래스 인증 완료 </h1>
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
			<h1 style="text-align:center; "> ◈ ${clss.cid} ◈ 클래스 인증 완료 </h1>
			<div style=" border: 1px solid #2392bd; ">
						<c:url var="checkEnroll" value="/checkEnroll.do" >
							<c:param name="cid" value="${ clss.cid }"/>
						</c:url>
						<button class=teacher_lv onclick="location.href='${ checkEnroll }'"> 수강생 목록 </button>	
		</div>
		</c:if>
		<c:if test="${clss.clss_status eq 3 }">
			<h1 style="text-align:center; "> ◈ ${clss.cid} ◈ 클래스 거부 😔 </h1>
			<div style=" border: 1px solid #2392bd; ">
				${ clss.clss_comment }
			</div>
			<div style=" border: 1px solid #2392bd; ">
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
</div> 

<div class = "body"> <%-- ● TWO : <div class = "body"> ● --%>

			<header class="masthead"> <%-- ● THREE :<header class="masthead"> ● --%>
							<img src="${pageContext.request.contextPath }/resources/clss_files/${clss.clss_rename_filename}" alt="${ clss.clss_title }" 
									style=" height: 400px; border-radius: 20px;">
							<h2 style="color: #fff; word-wrap: break-word;"> ${ clss.clss_title } </h2>
									
									<c:set var="tags" value="${ clss.clss_tags }"/><!-- 이 다음에, 쉼표 기준으로 떼어놓기 -->
									<%-- <c:set var="tag" value="${fn:split(tags, ',') }"/> 			items에다가 split fn 쓰고 index 에다 0,1,2,3,4 쓰면 된다--%>
									<!-- https://offbyone.tistory.com/368 -->
									<c:forEach var="i" items="${fn: split(tags, ',') }" >
										<a href="#" style="color:#fff;">#<c:out value="${ i }"/></a>[
									</c:forEach>
									
				<!-- 찜하기 / 좋아요  TO PRESS, YOU MUST LOGIN  || BO's CODE-->
						<script type="text/javascript">
						function checkSaver(){
							var txt;
							var r = confirm("클래스 찜하기 가능한 계정으로 로그인한 후 결제 하시기 바랍니다.");
							if (r==true) {
								var myWindow = window.open("${pageContext.request.contextPath}/loginpage.do", "_self");
							} else {	
								window.open(url, "_self");
							}
						}
						function showEmptyHeart(){
							$("#emptyHeartDiv").css("display", "block");
							$("#fullHeartDiv").css("display", "none");
						}
						function hideEmptyHeart(){
							$("#fullHeartDiv").css("display", "block");
							$("#emptyHeartDiv").css("display", "none");
						}
						
						// 재윤수정
						$(function(){
							checkSc();
						});
						function checkSc(){
							var cid =${clss.cid};
							var loginUser = "${ sessionScope.loginUser.id }";
							
							$.ajax({
								url: "${ pageContext.request.contextPath }/scCheck.do",
								type: "post",
								data: {cid: cid, id: loginUser},
								dataType: "json",
								success: function(data){
									console.log("success:" + data);
									console.log("cid:" +cid);
									console.log("loginUser:" +loginUser);
									
									//object ==> string
									var jsonStr = JSON.stringify(data);
									//string ==> json 
									var json = JSON.parse(jsonStr);
									//console.log("json : " + json);
									if(json.sclist.length == 0){
										console.log("빈하트");
										showEmptyHeart();
										//hideEmptyHeart();
										//changeHeart();
									}
									for(var i in json.sclist){
										console.log("json.sclist : " + json.sclist); 
										if(cid == json.sclist[i].cid ){
											console.log("좋아요o");
											console.log("빨간하트");
											//showEmptyHeart();
											hideEmptyHeart();
											//changeHeart();
										}
										else{
											console.log("좋아요x");
											console.log("빈하트");
											showEmptyHeart();
											//hideEmptyHeart();
											//changeHeart();
										}
									}// for in
										
								},
								error: function(jqXHR, textstatus, errorthrown){
									console.log("error : " + jqXHR + ", " + textstatus + ", " 
											+ errorthrown);
								}
							});//ajax
						}
						
						function emptyHeart(){
							var cid =${clss.cid};
							var loginUser = "${ sessionScope.loginUser.id }";
							//	location.href="${ scInsert }"; /* JAVASCRIPT에서 이렇게 반환 가능? */
							// 하트 
							$.ajax({
								url : "${ pageContext.request.contextPath }/scinsert.do",
								type : "post",
								data: {cid: cid, id: loginUser},
								dataType: "json",
								success : function(data){
									console.log("success : " + data);
									console.log("등록성공");
									checkSc();
								},
								error: function(jqXHR, textstatus, errorthrown){
									console.log("error : " + jqXHR + ", " + textstatus + ", " 
											+ errorthrown);
								}
								//checkSc();
							});	//ajax end 
							
							// 클래스에 좋아요 갯수 추가
							$.ajax({
								url : "${ pageContext.request.contextPath }/addClssSave.do",
								type : "post",
								data: {cid: cid},
								dataType: "json",
								success : function(data){
									//console.log("success : " + data);
									//console.log("saveList + 1");
									//checkSc();
								},
								error: function(jqXHR, textstatus, errorthrown){
									console.log("error : " + jqXHR + ", " + textstatus + ", " 
											+ errorthrown);
								}
							}); 
						}
						
						
						function fullHeart(){
							var cid =${clss.cid};
							var loginUser = "${ sessionScope.loginUser.id }";
							//	location.href="${ scInsert }"; /* JAVASCRIPT에서 이렇게 반환 가능? */
							$.ajax({
								url : "${ pageContext.request.contextPath }/scdelete.do",
								type : "post",
								data: {cid: cid, id: loginUser},
								dataType: "json",
								success : function(data){
									console.log("success : " + data);
									console.log("삭제성공");
									checkSc();
								},
								error: function(jqXHR, textstatus, errorthrown){
									console.log("error : " + jqXHR + ", " + textstatus + ", " 
											+ errorthrown);
								}
								//checkSc();
							});	//ajax end 
							
							// 클래스에 좋아요 개수 -1
							$.ajax({
								url : "${ pageContext.request.contextPath }/delClssSave.do",
								type : "post",
								data: {cid: cid},
								dataType: "json",
								success : function(data){
									//console.log("success : " + data);
									//console.log("saveList - 1");
									//checkSc();
								},
								error: function(jqXHR, textstatus, errorthrown){
									console.log("error : " + jqXHR + ", " + textstatus + ", " 
											+ errorthrown);
								}
							}); 
						}
						
						
				</script>
							<!-- 찜하기 / 좋아요 버튼 기능 구현   btn-save -->
							<c:if test="${ empty sessionScope.loginUser }">
								<button id="emptyHeart" class="btn-empty" onclick="checkSaver();">♡</button>
							</c:if>
							<c:if test="${ !empty sessionScope.loginUser }">
								<c:url var="scInsert" value="/scInsert.do">
									<c:param name="cid" value="${clss.cid }" />
									<c:param name="id" value="${sessionScope.loginUser.id }" />
								</c:url>
								<c:url var="scDelete" value="/scDelete.do">
									<c:param name="cid" value="${clss.cid }" />
									<c:param name="id" value="${sessionScope.loginUser.id }" />
								</c:url>
								<c:url var="addClssSave" value="/addClssSave.do">
									<c:param name="cid" value="${clss.cid }" />
								</c:url>
								<c:url var="delClssSave" value="/delClssSave.do">
									<c:param name="cid" value="${clss.cid }" />
								</c:url>
			
								<div id="saveDiv">
									<div id="emptyHeartDiv">
										<button class="btn-save" id="emptyHeart" onclick="emptyHeart();"
											style="font-size: 24px;">♡</button>
									</div>
									<div id="fullHeartDiv">
										<button class="btn-full" id="fullHeart" onclick="fullHeart();"
											style="font-size: 24px;">♥</button>
									</div>
									<!-- 좋아요 버튼 원본 -->
									<!-- <div id="emptyHeartDiv" ><button class="btn-save" onclick="changeHeart(scInsert);" style="font-size:24px;">♡</button></div>
							<div id="fullHeartDiv"><button class="btn-save" onclick="changeHeart(scDelete);" style="font-size:24px;">♥</button></div> -->
								</div>
								<div id="unsaveDiv"></div>
							</c:if>
						
			</header> <%-- ● THREE :<header class="masthead"> ● --%>
			
			
			
			<h1 class="page-title">  <%-- ● FOUR :<h1 class="page-title"> ● --%>	
			<!-- 
					<div id="embedArea" class="topGrid" > -->
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
						
				<!-- 	</div> -->
			
			
			</h1>  <%-- ● FOUR :<h1 class="page-title"> ● --%>
			
			<main class="main-content">  <%-- ● FIVE : <main class="main-content"> ● --%>
			
					<div id="tabArea" >
						
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
							  document.getElementById(pageName).style.position = "relative"; /* 이구절을 보가 추가로 넣음 */
							  elmnt.style.backgroundColor = color;
							}
							
							// Get the element with id="defaultOpen" and click on it
							//document.getElementById("defaultOpen").click();
								$(function(){
									$("#defaultOpen").trigger("click");
								});
							</script>
							   
							  
						
							<!-- <div class="tabcontent"> -->
							<div class="button" id="tab">
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
							
<script type="text/javascript">
$(function(){
	hideReviewForm();
	hideReviewReplyForm();
});

function showReviewForm(){
	$("#reviewDiv").css("display", "block");
}
function hideReviewForm(){
	$("#reviewDiv").css("display", "none");
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
	$("#reviewReplyListView").css("display", "block");
}
function hideReviewReplyListView(){
	$("#reviewReplyListView").css("display", "none");
}
</script>							
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
													<table style="display: flex; margin: auto;align:center;" width="500" border="1" cellspacing="0" cellpadding="5" class="tbl">
														<tr><th>
																	<div class="container-avatar"  class="tbl">
																	  <img src="${pageContext.request.contextPath}/resources/avatar_files/${ sessionScope.loginUser.avatar}" alt="Avatar" class="image-avatar" style="width:100%; align: center; height:100px;">
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
								<div class="iframe-reply">
										<c:url var="rlist" value="/rlist.do">
				 							<c:param name="cid" value="${clss.cid }" />
										</c:url>
									<iframe width="1200" height="1000"  src="${ rlist }" ></iframe>
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
													<div style=" text-align:center;">
														<button class="btn" onclick="showQaReplyForm();"> 댓글달기 </button>
													</div>
												</c:if>
												<c:if test="${ empty sessionScope.loginUser }">
													<div style=" text-align:center;">
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
							${ clss.clss_policy }
							</div>
							
							<!-- 강사소개  -->
							<div id="5-teacher" class="tabcontent">
							<h3 style="text-align: center; color: #fff;"> 강사소개 </h3>
							   ${ clss.tchr_profile }
							   <br><br>
							</div>
					
					</div>
					
			
			</main>  <%-- ● FIVE : <main class="main-content"> ● --%>
			
			<aside class="sidebar"> 	<%-- ● SIX : <aside class="sidebar"> ● --%>
				<h4>${ clss.clss_title } </h4>
				<h6> ONE DAY CLASS의 수강일</h6>
				<div class="clssInfo">
						START : ${ clss.clss_start } <br>
						END : ${ clss.clss_end } <br>
				</div>
						<br>
						<br>
						<div class="clssInfo"> 
								최소 필요 인원 : ${ clss.clss_min } 명<br>
								현재 수강생 : ${ clss.clss_enrolled } 명 / ${ clss.clss_max } 명<br>
						</div>
						<br>
						<br>
						<div class="clssInfo">
								클래스 회차 : ${ clss.clss_times } 회<br> <br>
								클래스 수업시간  : ${ clss.clss_duration } 시간<br> <br>
								TOTAL : $ { clss.clss_price } <br> <br>
						</div>
						<br>
						<br>
						<sub><i> 클래스 최근 수성날짜 : ${ clss.clss_update } </i></sub>
						
			</aside> <%-- ● SIX : <aside class="sidebar"> ● --%>
			
			<footer class="footer"> <%-- ● SEVEN : <footer class="footer">  ● --%>
			
			 <!-- PAY 결제하기 에서 >> 로그인 안 되있으면 로그인 페이지로 이동 후 결제하기 -->
						  <script type="text/javascript">
									function checkPayer(){
										var txt;
										var r = confirm("수강신청 가능한 계정으로 로그인한 후 결제 하시기 바랍니다.");
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
			</footer> <%-- ● SEVEN : <footer class="footer">  ● --%>
			
</div> <%-- ● TWO : <div class = "body"> ● --%>


<c:import url="../common/footer.jsp"/><%-- ● EIGHT  : <c:import url="../common/footer.jsp"/>  ● --%>
</body>
</html>

