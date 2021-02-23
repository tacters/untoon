<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<body>	
<c:import url="../common/menubar.jsp"/>

<!-- 기능 매핑 -->
	<c:url var="approve" value="/approve.do"/>
	<c:url var="deny" value="/deny.do"/>
	<c:url var="adcdelete" value="/adcdelete.do"/>
	<c:url var="pay" value="/pinsert.do"/>

<c:if test="${sessionScope.loginUser.user_lv eq 'A'}">
	<h1> ◈ ${clss.cid} ◈ 클래스 인증 대기 </h1>
	<div style="margin: auto; border: 1px solid #2392bd; padding: 10px;">
	
					<button class="admin_lv" onclick="location.href='${ approve }'"> 승인하기 </button>
					&nbsp; &nbsp; 
					<button class="admin_lv" onclick="location.href='${ deny }'"> 거부하기 </button>
					&nbsp; &nbsp; 
					<button class="admin_lv" onclick="location.href='${ adcdelete }'"> 삭제하기 </button>
					&nbsp; &nbsp; 
					<button class="admin_lv" onclick="location.href='${ tcupdate }'"> 수정하기 </button>
	</div>
</c:if>

<c:if test="${sessionScope.loginUser.user_lv eq 'T'}">
	<h1> ◈ ${clss.cid} ◈ 클래스 인증 대기 </h1>
	<div style="margin: auto; border: 1px solid #2392bd; padding: 10px;">
					<button class="admin_lv" onclick="location.href='${ tcupdate }'"> 수정하기 </button>
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
					confirm("관리자계정에서 <결제하기>를 테스트 해봅니다.");
					window.open("${pageContext.request.contextPath}/pinsert.do", "_self");
					
					} else {
						var myWindow = window.open("${pageContext.request.contextPath}/loginpage.do", "_self");
					}
				}
			}
		</script>
		<c:if test="${ empty sessionScope.loginUser }">
			<button class="btn-pay" onclick="checkPayer();">결제하기</button>
		</c:if>
		<c:if test="${ !empty sessionScope.loginUser }">
			<c:if test="${sessionScope.loginUser.user_lv eq 'T'}">
				<button class="btn-pay" onclick="confirm('강사계정에서 로그아웃 후, Student계정으로 로그인한 후 결제 하시기 바랍니다.')">결제하기</button>
			</c:if>
			<c:if test="${sessionScope.loginUser.user_lv eq 'A'}">
				<button class="btn-pay" onclick="checkPayer();">결제하기</button>
			</c:if>
			<c:if test="${sessionScope.loginUser.user_lv eq 'S'}">
				<button class="btn-pay" onclick="location.href='${ pay }'">결제하기</button>
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
		
		</div>
		
		<!-- 클래스 문의  -->
		<div id="3-qna" class="tabcontent">
		<h3 style="text-align: center; color: #fff;"> 문의 </h3>
		</div>
		
		<!-- 클래스 환불정책  -->
		<div id="4-refund" class="tabcontent">
		<h3 style="text-align: center; color: #fff;"> 환불정책 </h3>
		</div>
		
		<!-- 클래스 후기  -->
		<div id="5-teacher" class="tabcontent">
		<h3 style="text-align: center; color: #fff;"> 강사소개 </h3>
		${ clss.tchr_profile }
		   ${ clss.tchr_profile }<br><br>
		</div>

</div>




<footer><c:import url="../common/footer.jsp"/></footer>
</body>


</html>