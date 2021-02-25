<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<!-- 기능 매핑 -->
	<c:url var="approve" value="/approve.do"/>
	<c:url var="deny" value="/deny.do"/>
	<c:url var="adcdelete" value="/adcdelete.do"/>
	<c:url var="pay" value="/pinsert.do"/>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>UNTOON 언투온택터즈</title>

<style type="text/css">
#small-light-grey{
	display: block;
    margin-bottom: 5px;
    font-size: 12px;
    color: #7f7f7f;
    line-height: 1.27;
	font-family: 'Lato', 'Noto Sans KR', 'Apple SD Gothic Neo', 'Malgun Gothic', sans-serif;
}
.topGrid{
	width: 50%;
	min-width: 560px;
	float: left;
	/* border: none; */
	border-style: outset;
	outline: none;
	padding: 14px 16px;
	height: 25%;
	max-height: 500px;
}
#tabArea{
  left-margin: 10%;
  width: 100%;
  }
  
  
  .tbl{
  background-color:#E0F5FF;border-color:#E0F5FF;color:#656565;text-align:center;vertical-align:center;
  }
  
  .btn {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}
.btn:hover {
  background-color: #008CBA;
  color: white;
  transition-duration: 1s;
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
  width: 10%;
  min-width: 150px;
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
<script type="text/javascript">
//jquery ajax 로 해당 < 수업 클래스 > 대한 문의 조회 요청
//해당 < 수업 클래스 >의 번호를 전송함
$(function(){
	hideQaForm(); 
		
	var clssCid = "${ clss.cid }";  //el 의 값을 변수에 대입
	var loginUser = "${ sessionScope.loginUser.id }";  //로그인한 회원 아이디 변수에 대입
	var teacher = "${clss.tchr_id}"; // 수업 강사님
	
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
							+ "<input type-'hidden' name='clssCid' value='${clss.cid}'>" /* "+  json.list[i].cid  +" */
							+ "<textarea name='qcontent'>"
							+ decodeURIComponent(json.list[i].qcontent).replace(/\+/gi, " ") 
							+ "</textarea><input type='submit' value='수정'></form>"
							+ "<button onclick='qaDelete(" + json.list[i].qid + ");'>삭제</button></td></tr>";
					} else { //본인 아닐때
						values += "<tr><td>" + json.list[i].qwriter 
						+ "</td><td>" +  json.list[i].q_modify_date 
						+ "</td></tr><tr><td colspan='2'>"
						+ decodeURIComponent(json.list[i].qcontent).replace(/\+/gi, " ") 
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

function qaDelete(qid){
	location.href = "${ pageContext.request.contextPath }/qdelete.do?qid=" + qid + "&cid=${ clss.cid}";
}

function showQaForm(){
	$("#qaDiv").css("display", "block");
}
function hideQaForm(){
	$("#qaDiv").css("display", "none");
}
</script>

</head>
<body>	
<c:import url="../common/menubar.jsp"/>



<c:if test="${sessionScope.loginUser.user_lv eq 'A'}">
	<h1> ◈ ${clss.cid} ◈ 클래스 인증 대기 </h1>
	<div style="margin: auto; border: 1px solid #2392bd; padding: 10px;">
	
					<c:url var="approve" value="/approve.do" >
						<c:param name="cid" value="${ clss.cid }"/>
					</c:url>
					<button class="admin_lv" onclick="location.href='${ approve }'"> 승인하기 </button>
					&nbsp; &nbsp; 
					<c:url var="refuse" value="/refuse.do" >
						<c:param name="cid" value="${ clss.cid }"/>
					</c:url>
					<c:url var="adcdelete" value="/adcdelete.do">
						<c:param name="cid" value="${ clss.cid }"/>
					</c:url>
					<button class="admin_lv" onclick="location.href='${ adcdelete }'"> 삭제하기 </button>
					&nbsp; &nbsp; 
					<button class="admin_lv" onclick="location.href='${ tcupdate }'"> 수정하기 </button>
	</div>
</c:if>

<c:if test="${sessionScope.loginUser.user_lv eq 'T' and clss.clss_status eq 3 }">
	<h1 style="text-align: center;"> ◈ &nbsp; # ${clss.cid} &nbsp; ◈ 클래스 인증 대기 </h1>
	<div style="margin: auto; border: 1px solid #2392bd; padding: 10px;">
		${ clss.clss_comment }
	</div>
</c:if>

<script type="text/javascript">
	//		${clss.cid}
	//		
</script>


<div>
<%-- <h3 style="text-align: center;"> ${ clss.clss_title } </h3> --%>
</div>

<div id="embedArea" class="topGrid" >
<script type="text/javascript">
	  window.onload = function(){
		  var url = "${ clss.clss_url }"; // 따옴표 "" 필요한가?
		  var url_full_id = url.split("?v=")[1]; // 뒷부분 (예: FCsLikmxhV0)
		  var url_id;
		  
		  if (url_full_id.contains('&')){
			  url_id = url_full_id.split("&")[0]; 
			  // 앞부분 만 가져옴 (예 : "&feature=youtu.be" 또는 "&list=어쩌구저쩌구코드&start_radio=1" 같이 있는 뒷부분 생략)
			  } else {
			  url_id = url_full_id;
			  }
			  var embedlink = "http://www.youtube.com/embed/" + url_id; // 예: www.youtube.com/embed/FCsLikmxhV0
		  }
	  document.getElementById('embedLink').src = embedlink;
	</script>

<iframe id="embedLink" width="560" height="315" src="about:blank"  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>


<div id="sideIntro" class="topGrid">
	<h3 style="text-align: center;"> ${ clss.clss_title } </h3>
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
						window.open("${pageContext.request.contextPath}/pinsert.do", "_self");
						} else {
						window.open(url, "_self");
					} 
					}
				}
			}
	</script>
		<c:if test="${ empty sessionScope.loginUser }">
			<button class="btn" onclick="checkPayer();">결제하기</button>
		</c:if>
		<c:if test="${ !empty sessionScope.loginUser }">
			<c:if test="${sessionScope.loginUser.user_lv eq 'T'}">
				<button class="btn" onclick="confirm('강사계정에서 로그아웃 후, Student계정으로 로그인한 후 결제 하시기 바랍니다.')">결제하기</button>
			</c:if>
			<c:if test="${sessionScope.loginUser.user_lv eq 'A'}">
				<button class="btn" onclick="checkPayer();">결제하기</button>
			</c:if>
			<c:if test="${sessionScope.loginUser.user_lv eq 'S'}">
				<button class="btn" onclick="location.href='${ pay }'">결제하기</button>
			</c:if>		
		</c:if>
		
</div>
<br style="float:clear;">




<br>

<div id="tabArea" class="bottomGrid">
	<div id=small-light-grey>
	[원데이 클래스] UNTOON 언투온 택터즈들의 세상
	</div>
	
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
		document.getElementById("defaultOpen").click();
		</script>
		   
		<button class="tablink" onclick="openPage('1-intro', this, '#2392bd')" id="defaultOpen"> 클래스 소개 </button>
		<button class="tablink" onclick="openPage('2-review', this, '#2392bd')"> 후기 </button>
		<button class="tablink" onclick="openPage('3-qna', this, '#2392bd')"> 문의 </button>
		<button class="tablink" onclick="openPage('4-refund', this, '#2392bd')"> 환불정책 </button>
		<button class="tablink" onclick="openPage('5-teacher', this, '#2392bd')"> 강사소개 </button>
		
		<!-- 클래스 소개 -->
		<div id="1-intro" class="tabcontent">
			<h3 style="text-align: center; color: #fff;"> 클래스 소개 </h3>
			${ clss.clss_content }<br><br>
		</div>
		
		<!-- 클래스 후기  -->
		<div id="2-review" class="tabcontent">
		<h3 style="text-align: center; color: #fff;"> 후기 </h3>
		
		<c:url var="rlist" value="/rlist.do">
				<c:param name="page" value="1" />
		</c:url>
		
		<a href='${ rlist }' title="review list 후기 조회하기"> 후기 조회 해보자~~~ </a>
		
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
							var r = confirm("문의사항을 작성하려면 <일반 student> 계정으로 로그인한 후 결제 하시기 바랍니다.");
							if (r==true) {
								var myWindow = window.open("${pageContext.request.contextPath}/loginpage.do", "_self");
							} else {
								window.open(url, "_self");
							}
						}
				</script>
					<%-- 로그인한 상태이면서, 본인 글일때만 보여지게 함 --%>
					<%-- <c:if test="${ !empty loginUser and loginUser.id eq qa.qwriter }">
						<c:url var="qupdate" value="/qupdate.do">
							<c:param name="cid" value="${clss.cid }" />
						</c:url>
						<a href="${ quv }">수정하기</a> &nbsp; &nbsp; 
						<c:url var="qdelete" value="/qdelete.do">
							<c:param name="bid" value="${ board.bid }" />		
						</c:url>
						<a href="${ bdl }">[글삭제]</a> &nbsp; &nbsp; 
					</c:if>
				 --%>
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
				<tr><th>문 의 사 항</th><td><textarea name="qcontent" rows="5" cols="50"></textarea></td></tr>
				<tr><th colspan="2">
				<input type="submit" value="문의 등록"> &nbsp; 
				<input type="reset" value="취소" onclick="hideQaForm(); return false;"> </th></tr>
				</table>
				</form>  
				</div>	
				
				<%-- 문의 목록 표시 영역 --%>
				<div id="qlistView" >
				<table id="qlistTbl" class="tbl" align="center" cellspacing="0" cellpadding="5" border="1"></table>
				</div>
		
		</div>
		
		<!-- 클래스 환불정책  -->
		<div id="4-refund" class="tabcontent">
		<h3 style="text-align: center; color: #fff;"> 환불정책 </h3>
		</div>
		
		<!-- 클래스 후기  -->
		<div id="5-teacher" class="tabcontent">
		<h3 style="text-align: center; color: #fff;"> 강사소개 </h3>
		   ${ clss.tchr_profile }<br><br>
		</div>

</div>
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




<footer><c:import url="../common/footer.jsp"/></footer>
</body>


</html>