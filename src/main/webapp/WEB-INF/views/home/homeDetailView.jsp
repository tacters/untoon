<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<style type="text/css">
/* BODY 틀 */
.body {
margin: 40px;
/* border: 1px solid #2392BD; */
padding: 30px;
}
/* TABLE */
.tbl-ad {	border-collapse: collapse;  width: 100%;		} /* font-family 지정해줘도 좋을듯! */
.tbl-ad th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #2392bd;
	color: white;
}
.tbl-ad > tr:hover{	background-coor: #ddd;	cursor: pointer; }
.tbl-ad > tr:nth-child(even){		background-color: #f2f2f2;	}
.tbl-ad > td, .tbl-ad th {	border: 1px solid #ddd; padding: 8px;	}


/* TOOL TIP 스타일 시트 */
.tooltip {
  color: black;
  position: relative;
  display: inline-block;
  /* border-bottom: 1px dotted lightgray; */
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: #2392bd;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  position: absolute;
  z-index: 1;
  bottom: 125%;
  left: 50%;
  margin-left: -60px;
  opacity: 0;
  transition: opacity 0.3s;
}

.tooltip .tooltiptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #2392bd transparent transparent transparent;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
  opacity: 1;
}


/* FULL PAGE TABS */
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}

/* ALL INPUT TAGS */


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
  width: 50%;
}

.tablink:hover {
  background-color: #2392bd;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  color: white;
  display: none;
  padding: 100px 20px;
  height: 100%;
  width:100%;
}

#Home {background-color: #2392bd;}
#News {background-color: #2392bd;}
#Contact {background-color: #2392bd;}
</style>
<base target="_parent" />

<title>UNTOON 언투온택터즈</title>

</head>
<body>
<c:import url="../common/menubar.jsp"/>


<div class="body">
	<%-- 목록 출력 --%>
		<div id="iframeAlist">
			<c:url var="alist" value="/alist.do" >
					<c:param name="page" value="1" />
			</c:url>
			<%-- 	<button onclick="javascript:location.href='${ alist }';">전체 목록 보기</button> --%>
			
			<br>
			<iframe id="iframe"  src="${ alist }"
							width="80%"  height="600" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
							style="display:block; margin:auto;">
			</iframe>
		</div>

	<c:if test="${ !empty sessionScope.loginUser and sessionScope.loginUser.user_lv eq 'A' }">
		<div style="align:center;">
			<c:url var = "aim" value="/aimove.do"/>
				<button onclick="javascript:location.href='${ aim }'" style="display:block; margin:auto; align:center;">새 광고 등록</button>
		</div>
	<br>
	</c:if>

	<%-- HOMEPAGE 관련 MANAGEMENT--%>
	
	<button class="tablink" onclick="openPage('tab1', this, '#2392bd')" id="defaultOpen">서치바와 카테고리</button>
	<button class="tablink" onclick="openPage('tab2', this, '#2392bd')">목록 문구</button>
	 <!-- <button class="tablink" onclick="" style="background-color: #C6D8D3; cursor:default;">첨부파일 업로드</button> "openPage('tab3', this, 'blue')" -->
	<script>
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
			  elmnt.style.backgroundColor = "#2392bd";
			}
			
			// Get the element with id="defaultOpen" and click on it
			/* $( document ).ready(function() {
			   $( "#defaultOpen" ).trigger( "click" );
			}); */
			//$("defaultOpen").click();
			
			$(function(){
				$("#defaultOpen").trigger("click");
			});
	</script>
	<form action ="hinsert.do" method="post" enctype="multipart/form-data">
			<div id="tab1" class="tabcontent">
			  <h3>서치바와 카테고리</h3>
			  <h2> 01 BANNER : 서치바 배너 영역 </h2>
			  		<div class="tooltip"> Banner Text : &nbsp; &nbsp; 
			  			<input type ="text" name="banner1_txt" value="${ home.banner1_txt }">
			  			<span class="tooltiptext"> 홈페이지 맨위 배너에 나올 문구 </span>
			  		</div>
			  		<br><br>
			  		<div class="tooltip"> Searchbar Text : &nbsp; &nbsp; 
			  			<input type ="text" name="search_txt" value="${ home.search_txt }">
			  			<span class="tooltiptext"> 홈페이지 배너의 검색창에 나올 문구 </span>
			  		</div>
			  		<br><br>
			  		<!-- c:param으로 upload 보낼까? -->
			  		
			  <h2> 카테고리 메뉴 영역 </h2>	
			  		<div class="tooltip"> Category #1 : &nbsp; &nbsp; 
			  			<input type ="text" name="menu_cat1" value="${ home.menu_cat1 }">
			  			<span class="tooltiptext"> 카테고리 이름 </span>
			  			<br>
			  		</div>
			  		<div class="tooltip"> Category #2 : &nbsp; &nbsp; 
			  			<input type ="text" name="menu_cat2" value="${ home.menu_cat2 }">
			  			<br>
			  		</div>
			  		<div class="tooltip"> Category #3 : &nbsp; &nbsp; 
			  			<input type ="text" name="menu_cat3" value="${ home.menu_cat3 }">
			  			<br>
			  		</div>
			  		<div class="tooltip"> Category #4 : &nbsp; &nbsp; 
			  			<input type ="text" name="menu_cat4" value="${ home.menu_cat4 }">
			  			<br>
			  		</div>
			  		<div class="tooltip"> Category #5 : &nbsp; &nbsp; 
			  			<input type ="text" name="menu_cat5" value="${ home.menu_cat5 }">
			  			<br>
			  		</div>
			  		<div class="tooltip"> Category #6 : &nbsp; &nbsp; 
			  			<input type ="text" name="menu_cat6" value="${ home.menu_cat6 }">
			  			<br>
			  		</div>
			  		
			  	<h2> 수강신청 안내 </h2>	
			  	 	<div class="tooltip"> 수강신청 문구 : &nbsp; &nbsp; 
			  			<input type ="text" name="howto_title" value="${ home.howto_title }">
			  			<input type ="hidden" name = "howto_txt" value="null">
			  			<br>
			  		</div>
			</div>
			
			<div id="tab2" class="tabcontent">
			  <h3>목록 문구</h3>
			  <h2> 클래스 목록 </h2>
			  		<div class="tooltip"> Trending Text : &nbsp; &nbsp; 
			  			<input type ="text" name="trending_txt" value="${ home.trending_txt }">
			  			<span class="tooltiptext"> 홈페이지 맨밑 배너에 나올 문구 </span>
			  			<br><br>
			  		</div>		  
			  <h2> 02 BANNER : 추천목록 </h2>
			  		<div class="tooltip"> Banner Text : &nbsp; &nbsp; 
			  			<input type ="text" name="banner2_txt" value="${ home.banner2_txt }">
			  			<span class="tooltiptext"> 홈페이지 맨밑 배너에 나올 문구 </span>
			  			<br><br>
			  		</div>
			  		
			  	<input type="submit" value="저장하고 파일 첨부하기"> &nbsp; &nbsp;
				<input type="reset" value="작성취소"> &nbsp; 
			</div>
	</form>
	
				<!-- <div id="tab3" class="tabcontent">
						  <h3>첨부파일 업로드</h3>
						</div> -->
<br style="float:clear;">
<br>
<br>
	<div style="position:relative; display:block; margin:auto; align:center; text-align:center; padding: 10px;">
		[ 서치바와 카테고리 ] 탭 안에 있는 값들과 [ 목록 문구 ] 탭안에 있는 값들을 다 확인 하신 후 [ 저장 ] 또는 수정내용 값을 초기화 하시려면 [ 작성취소 ]를 눌러주세요.
	</div>
<br>
<br>

</div>
<br>
<br>

<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>