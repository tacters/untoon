<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<style type="text/css">
.container-avatar {
  position: relative;
  width: 20%;
  max-width: 200px;
}
   #menu {
      width: 960px;
      height: 40px;
      clear: both;
   }

   ul.navi {
      float: left;
      width: 960px;
      margin: 0;
      padding: 0;
      list-style: none;
      -moz-border-radius-topright: 10px;
      -webkit-border-top-right-radius: 10px;
      -moz-border-radius-topleft: 10px;
      -webkit-border-top-left-radius: 10px;
       
   }

   ul.navi li {
      display: inline;
   }

   ul.navi li a {
      float: left;
      font: bold 14px 굴림;
      line-height: 40px;
      color: #fff;
      text-decoration: none;
      /* text-shadow: 1px 1px 1px #880000; */
      margin: 0;
      padding: 0 30px;
      background: #2392BD;
      -moz-border-radius-topright: 10px;
      -webkit-border-top-right-radius: 10px;
      -moz-border-radius-topleft: 10px;
      -webkit-border-top-left-radius: 10px;
   }

   ul.navi .current a, ul.navi li:hover > a { 
      color: #fff;
      text-decoration: none; 
      /* text-shadow: 1px 1px 1px #330000;  */
      background: #2392BD; 
      -moz-border-radius-topright: 10px; 
      -webkit-border-top-right-radius: 10px;
      -moz-border-radius-topleft: 10px;
      -webkit-border-top-left-radius: 10px; 
   }
   
   ul.navi ul { display: none; }
   
   ul.navi li:hover > ul {
      position: absolute; 
      display: block; 
      width: 920px; 
      height: 45px; 
      margin: 40px 0 0 0; 
      background: #2392BD; 
      -moz-border-radius-bottomright: 10px;
      -webkit-border-bottom-right-radius: 10px;
      -moz-border-radius-bottomleft: 10px;
      -webkit-border-bottom-left-radius: 10px; 
   }

   ul.navi li:hover > ul li a {
      float: left;
      font: bold 14px 굴림;
      line-height: 45px;
      color: #fff;
      text-decoration: none;
      /* text-shadow: 1px 1px 1px #110000; */
      margin: 0;
      padding: 0 30px 0 0;
      background: #2392BD;
   }

   ul.navi li:hover > ul li a:hover {
      color: #120000;
      text-decoration: none;
      text-shadow: none;
   }
   

</style>

<!-- <script type="text/javascript">
$(function(){
	
	$.ajax({
		url : "${ pageContext.request.contextPath }/mclss.do",
		type : "post",
		dataType : "json",
		success : function(data){
			console.log("success : " + data);
			
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			
			var values="";
			for (var i in json.myList){
				values += "<tr><td>"
					+ json.myList[i].cid
					+ "</td><td><a href='${ pageContext.request.contextPath }/cdetail.do?cid="
					+ json.myList[i].cid
					+ "'>"
					+ decodeURIComponent(json.myList[i].clss_title)
							.replace(/\+/gi, " ") /* 디코딩하면 공백이 +로 되기때문에  " " 공백으로 바꿔준다*/
					+ "</a></td><td>" + json.myList[i].tchr_id
					+ "</td><td>" + json.myList[i].clss_start + "</td><td>" + json.myList[i].clss_end
					+ "</td></tr>";
			} //for in
			
			$("#myClss").html($("#myClss").html() + values);
		},
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus + ", "
					+ errorthrown);
		}
	});
});
</script> -->
</head>
<body>
<c:if test="${ !empty sessionScope.loginUser and sessionScope.loginUser.user_lv eq 'S'}">
		<h3 style="text-align: center;">
			안녕하세요.<br> ${ loginUser.name }님
		</h3><hr/>
		<br><br>
		<div id="menu" style="margin:0px 10%;">
			<ul class="navi">
				<li><a href="#" id="#" title="내 클래스 관리" class="#">내 클래스 관리</a> 
					<ul>
							<c:url var="mclss" value="/mclss.do"/>
						<li><a href="${ mclss }" title="mclss">수업 목록</a></li>
							<c:url var="pmselect" value="/pmselect.do"/>
						<li><a href='${ pmselect }' title="pmselect">결제내역</a></li>
							
					</ul>
				</li>
				<li><a href="#" id="#" title="내 정보 관리" class="#">내 정보 관리</a>
					<ul>
							<c:url var="myUpdateView" value="myUpdateView.do"/>
						<li><a href="${ myUpdateView }">회원정보 수정</a>
						</li>
							<c:url var="insertTeacher" value="insertTeacher.do"/>
						<li><a href="${ insertTeacher }">강사로 지원하기</a></li>
							<c:url var="myDeleteView" value="myDeleteView.do"/>
						<li><a href="${ myDeleteView }">회원 탈퇴</a></li>
			   		</ul>
			   </li>
			   	<li><a href="#" id="#" title="내 활동 내역" class="#">내 활동 내역</a>
					<ul>	
						<c:url var="myreview" value="/myreview.do"/>
						<li><a href="${ myreview }">클래스 후기</a></li>
						<c:url var="myqa" value="/myqa.do"/>
						<li><a href="${ myqa }">1:1문의</a></li>
			  		</ul>
			  	</li>
			 </ul>
			  
		
			</div>
	</c:if>
	
	<c:if test="${ !empty sessionScope.loginUser and sessionScope.loginUser.user_lv eq 'T' }">
		<h3 style="text-align: center;">
			안녕하세요.<br> ${ loginUser.name }님 
		</h3>
		<div class="container-avatar">
			<img src="${ loginUser.avatar }">
		</div>
		<hr/>
		<br><br>
		<div id="teacher_menu">
			<ul class="navi">
				<li><a href="#" id="#" title="내 클래스 관리" class="#">내 클래스 관리</a> 
					<ul>
						<li><a href="mclss.do" id="#" class="#">수업 목록</a></li>
							<c:url var="pmselect" value="/pmselect.do"/>
						<li><a href='${ pmselect }' title="pmselect">결제내역</a></li>
							
					</ul>
				</li>
				<li><a href="#" id="#" title="내 정보 관리" class="#">내 정보 관리</a>
					<ul>
							<c:url var="tup" value="/tup.do"/>
						<li><a href="${ tup }">회원정보 수정</a>
						</li>
							<c:url var="myDeleteView" value="myDeleteView.do"/>
						<li><a href="${ myDeleteView }">회원 탈퇴</a></li>
			   		</ul>
			   </li>
			  	<li><a href="#" id="#" title="수업 관리하기" class="#">수업 관리하기</a>
					<ul>	
						<c:url var="tclist" value="/tclist.do" />
						<li><a href="${ tclist }">수업 목록</a></li>
						<li><a href="#" id="#" class="#">클래스 후기</a></li>
						<li><a href="#" id="#" class="#">1:1문의</a></li>
			  		</ul>
			  	</li>
			 </ul>
			  
		
			</div>
	</c:if>
	
	<!-- <div>
		<table align="center" border="1" width="700" cellspacing="0" id="myClss">
			<tr><th>클래스 번호</th><th>클래스 제목</th><th>강사</th><th>강의 시작 날짜</th><th>강의 끝나는 날짜</th>
			</tr>
			<tr><th>클래스 번호</th><th>클래스 제목</th><th>강의 시작 날짜</th>
			</tr>
		</table>
	</div> -->
</body>
</html>