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
#bodyDiv{
margin: 40px;
/* border: 1px solid #2392BD; */
padding: 30px;
}
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
	padding: 30px;
	margin-bottom: 40px; /* matchced */
	max-width: 40%;
	/* #c6d8d3*/
	
}

#tabArea{
	 /* left-margin: 10%; */
	 width: 100%;
	 margin: 40px;
	/* border: 1px solid #2392BD; */
	padding: 30px;
  }
 .iframe-youtube{
	display:block; margin: auto; float:relative;
	padding: 50px;
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
  position: relative;
  padding: 100px 20px;
  height: 100%;
  background-color: #2392bd;
}

</style>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>




</head>
<body>	
<c:import url="../common/menubar.jsp"/>

<div id="bodyDiv" >
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
			<!-- https://offbyone.tistory.com/368 -->
			<c:forEach var="i" items="${fn: split(tags, ',') }" >
				<a href="#" style="color:#fff;">#<c:out value="${ i }"/></a>[
			</c:forEach>
			
	
	
   ${ clss.clss_times }<br><br>
   ${ clss.clss_duration }<br><br>
  
  
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
		
		
		
		
		
	<!-- 찜하기 / 좋아요  TO PRESS, YOU MUST LOGIN -->
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
			}
			function hideEmptyHeart(){
				$("#emptyHeartDiv").css("display", "none");
			}
			function showFullHeart(){
				$("#fullHeartDiv").css("display", "block");
			}
			function hideFullHeart(){
				$("#fullHeartDiv").css("display", "none");
			}
			
			$(function(){
				hideFullHeart();
				showEmptyHeart();
				
				var cid =${clss.cid};
				var loginUser = "${ sessionScope.loginUser.id }";
				
				$.ajax({
					url: "${ pageContext.request.contextPath }/scCheck.do",
					type: "post",
					data: {cid: cid, id: loginUser},
					dataType: "json",
					success: function(data){
						console.log("success:" + data);
						//object ==> string
						var jsonStr = JSON.stringify(data);
						//string ==> json 
						var json = JSON.parse(jsonStr);
						for(var i in json.list){
							if(loginUser == json.list[i].id && cid == json.list[i].cid ){
								hideEmptyHeart();
								showFullHeart();
							}
						}// for in
					},
					error: function(jqXHR, textstatus, errorthrown){
						console.log("error : " + jqXHR + ", " + textstatus + ", " 
								+ errorthrown);
					}
				});//ajax
			}
			
	</script>
		
		<!-- 찜하기 / 좋아요 버튼 기능 구현   btn-save -->
		<c:if test="${ empty sessionScope.loginUser }">
		<button class="btn-save" onclick="checkSaver();" style="font-size:24px;">♡</button>
		</c:if>
		<c:if test="${ !empty sessionScope.loginUser }">
			<c:url var="scInsert" value="/scInsert.do">
				<c:param name="cid" value="${clss.cid }" />
				<c:param name="id" value="${sessionScope.loginUser.id }"/>
			</c:url>
			<c:url var="scDelete" value="/scDelete.do">
				<c:param name="cid" value="${clss.cid }" />
				<c:param name="id" value="${sessionScope.loginUser.id }"/>
			</c:url>
			<c:url var="addClssSave" value="/addClssSave.do">
				<c:param name="cid" value="${clss.cid }" />
			</c:url>
			<c:url var="delClssSave" value="/delClssSave.do">
				<c:param name="cid" value="${clss.cid }" />
			</c:url>
			
			<div id="saveDiv">
				<div id="emptyHeartDiv" ><button class="btn-save" onclick="changeHeart(scInsert);" style="font-size:24px;">♡</button></div>
				<div id="fullHeartDiv"><button class="btn-save" onclick="changeHeart(scDelete);" style="font-size:24px;">♥</button></div>
			</div>
			<div id="unsaveDiv">
			
			</div>
		</c:if>
		<script type="text/javascript">
			function changeHeart(loc){
				if (loc == scInsert){ /* scInsert을 따옴표안에 넣어야하나? */
					addClssSave();
					location.href="${ scInsert }"; /* JAVASCRIPT에서 이렇게 반환 가능? */
				} else if (loc== scDelete){
					delClssSave();
					return location.href="${ scDelete }"; /* JAVASCRIPT에서 이렇게 반환 가능? */
				}
			};
			function addClssSave(){
				location.href="${ addClssSave }"; 
			}
			function delClssSave(){
				location.href="${ delClssSave }"; 
			}
		</script>
		
</div><!-- end of id= "sideIntro" -->
</header>

<!-- <div id="gapDiv" style="position:relative; padding: 20 20 20 20; margin: 10 10 10 10;">
<br> <br> <br> <br><br> <br> <br> <br><br> <br> <br> <br>
<br> <br> <br> <br><br> <br> <br> <br><br> <br> 
<br><br><br><br><br><br>
</div> -->
<br style="clear:">

<div style="position:relative;">
		
		
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
				  document.getElementById(pageName).style.position = "relative"; /* 이구절을 보가 추가로 넣음 */
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
				
									</table>
								</form>  <!-- 클래스 후기  -->
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
														  <img src="${pageContext.request.contextPath}/resources/images/profilePics/mds_profile.jpg" alt="Avatar" class="image-avatar" style="width:100%; align: center; height:100px;">
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
				
							</div>
					<div class="iframe-youtube">
							<c:url var="rlist" value="/rlist.do">
	 							<c:param name="cid" value="${clss.cid }" />
							</c:url>
						<iframe id="embed" width="1200" height="1000"  src="${ rlist }" ></iframe>
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


</div><!-- bodyDiv -->

<footer><c:import url="../common/footer.jsp"/></footer>
</body>


</html>