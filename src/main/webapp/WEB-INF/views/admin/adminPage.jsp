<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<style>
	li{ border-bottom: solid 1px black;}
	li:last-child{ border-bottom: none;}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#div_root{
		margin:auto;
		width:800px;
	}
	#div_top{
		width:100%;
		height:100px;
		background-color:#82FA58;
		text-align:center;
	}
	#div_menu{
		width:20%;
		height:70%;
		float:left;
		/* background-color:#819FF7; */
		text-align:left;
	}
	#div_menu ul{
		width:30%;
		height:30%;
		float:left;
		align:center;
		list-style-type:none;
		margin:10%;
		padding:10;
		/* border:solid 1px black; */
		background-color:#2392BD;
	}
	#div_menu ul li:last-child {
		height:0;
	}
	#div_con{
		width:80%;
		height:70%;
		float:left;
		background-size:100%100%;
		text-align:center;
	}
	#div_bottom{
		width:100%;
		height:100px;
		clear:both;
		background-color:#C8FE2E;
		text-align:center;
	}
	
	
</style>
<style type="text/css">
	/* ul {
		background-color:#2392BD;
		width:150px;
		list-style-type:none;
		margin:10%;
		padding:10;
		border:solid 1px black;
	} */
	li { border-bottom: solid 1px black;}
	li:last-child { border-bottom:solid;}
	button { background-color:#C6D8D3; border:none;}
	li button{
		display:block;
		color:#000000;
		padding:8px;
		text-align:center;
		text-decoration:none;
		font-weight: bold;
	}
	li button.current{
		background-color:#2392BD;
		color: white;
	}
	li button:hover:not(.current){
		background-color:#2392BD;
		color : white;
	}
</style>
<script type="text/javascript" src="/untoon/resources/js/jquery-3.5.1.min.js"></script>
<script>
$(function(){
	//$("#nclist").css("display","none");
  	$("#nclist").hide();
	$("#yclist").hide();
	$("#rclist").hide();
	$("#eclist").hide();  
	
});
function showNclss(){
	$("#nclist").show();
	$("#yclist").hide();
	$("#rclist").hide();
	$("#eclist").hide();
}
function showYclss(){
	$("#nclist").hide();
	$("#yclist").show();
	$("#rclist").hide();
	$("#eclist").hide(); 
	
}
function showRclss(){
	$("#nclist").hide();
	$("#yclist").hide();
	$("#rclist").show();
	$("#eclist").hide();
	
}
function showEclss(){
	$("#nclist").hide();
	$("#yclist").hide();
	$("#rclist").hide();
	$("#eclist").show();
	
}
</script>
</head>
<body>
<div id="div_root"></div>
<div id="div_top"><c:import url="../common/menubar.jsp"/></div>
<div id="div_menu">
	<h1>세로 네비바 </h1>
	<ul style="align:center;">
		<li><button onclick="showNclss();">미승인 클래스관리</button></li>	
		<li><button onclick="showYclss();">승인 클래스 관리</button></li>
		<li><button onclick="showRclss();">승인 거부한 클래스 관리</button></li>
		<li><button onclick="showEclss();">기간지난 승인 클래스 관리</button></li>
	</ul>
</div>
<div id="div_con">내용
	<div id="nclist">
		<h4>미승인 클래스 관리</h4>
		<table id="anclist">
			<tr><th>수업 번호</th><th>수업 제목</th><th>강사 id</th><th>강의 시작 날짜</th><th>강의 끝나는 날짜</th></tr>
		</table>
	</div>
	<script>
	$.ajax({
		url : "${ pageContext.request.contextPath }/adnclist.do",
		type : "post",
		dataType : "json",
		success : function(data){
			console.log("success : " + data);
			
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			
			var values="";
			for (var i in json.list){
				console.log(json.list);
				values += "<tr><td>"
					+ json.list[i].cid
					+ "</td><td><a href='${ pageContext.request.contextPath }/cdetail.do?cid="
					+ json.list[i].cid
					+ "'>"
					+ decodeURIComponent(json.list[i].clss_title)
							.replace(/\+/gi, " ") /* 디코딩하면 공백이 +로 되기때문에  " " 공백으로 바꿔준다*/
					+ "</a></td><td>" + json.list[i].tchr_id
					+ "</td><td>" + json.list[i].clss_start + "</td><td>" + json.list[i].clss_end
					+ "</td></tr>";
			} //for in
			
			$("#anclist").html($("#anclist").html() + values);
		},
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus + ", "
					+ errorthrown);
		}
	});
	</script>
	<div id="yclist">
		<h4>승인클래스관리</h4>
		<table id="ayclist">
			<tr><th>수업 번호</th><th>수업 제목</th><th>강사 id</th><th>강의 시작 날짜</th><th>강의 끝나는 날짜</th></tr>
		</table>
	</div> 
	<script>
	$.ajax({
		url : "${ pageContext.request.contextPath }/adclist.do",
		type : "post",
		dataType : "json",
		success : function(data){
			console.log("success : " + data);
			
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			
			var values="";
			for (var i in json.list){
				values += "<tr><td>"
					+ json.list[i].cid
					+ "</td><td><a href='${ pageContext.request.contextPath }/cdetail.do?cid="
					+ json.list[i].cid
					+ "'>"
					+ decodeURIComponent(json.list[i].clss_title)
							.replace(/\+/gi, " ") /* 디코딩하면 공백이 +로 되기때문에  " " 공백으로 바꿔준다*/
					+ "</a></td><td>" + json.list[i].tchr_id
					+ "</td><td>" + json.list[i].clss_start + "</td><td>" + json.list[i].clss_end
					+ "</td></tr>";
			} //for in
			
			$("#ayclist").html($("#ayclist").html() + values);
		},
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus + ", "
					+ errorthrown);
		}
	});
	</script>
	<div id="rclist">
		<h4>거부클래스 관리</h4>
		<table id="arclist">
			<tr><th>수업 번호</th><th>수업 제목</th><th>강사 id</th><th>강의 시작 날짜</th><th>강의 끝나는 날짜</th></tr>
		</table>
	</div>
	<script>
	$.ajax({
		url : "${ pageContext.request.contextPath }/adrclist.do",
		type : "post",
		dataType : "json",
		success : function(data){
			console.log("success : " + data);
			
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			
			var values="";
			for (var i in json.list){
				values += "<tr><td>"
					+ json.list[i].cid
					+ "</td><td><a href='${ pageContext.request.contextPath }/cdetail.do?cid="
					+ json.list[i].cid
					+ "'>"
					+ decodeURIComponent(json.list[i].clss_title)
							.replace(/\+/gi, " ") /* 디코딩하면 공백이 +로 되기때문에  " " 공백으로 바꿔준다*/
					+ "</a></td><td>" + json.list[i].tchr_id
					+ "</td><td>" + json.list[i].clss_start + "</td><td>" + json.list[i].clss_end
					+ "</td></tr>";
			} //for in
			
			$("#arclist").html($("#arclist").html() + values);
		},
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus + ", "
					+ errorthrown);
		}
	});
	</script>
	<div id="eclist">
		<h4>기간 지난 클래스 관리</h4>
		<table id="anelist">
			<tr><th>수업 번호</th><th>수업 제목</th><th>강사 id</th><th>강의 시작 날짜</th><th>강의 끝나는 날짜</th></tr>
		</table>
	</div>
	<script>
	$.ajax({
		url : "${ pageContext.request.contextPath }/adendclist.do",
		type : "post",
		dataType : "json",
		success : function(data){
			console.log("success : " + data);
			
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			
			var values="";
			for (var i in json.list){
				values += "<tr><td>"
					+ json.list[i].cid
					+ "</td><td><a href='${ pageContext.request.contextPath }/cdetail.do?cid="
					+ json.list[i].cid
					+ "'>"
					+ decodeURIComponent(json.list[i].clss_title)
							.replace(/\+/gi, " ") /* 디코딩하면 공백이 +로 되기때문에  " " 공백으로 바꿔준다*/
					+ "</a></td><td>" + json.list[i].tchr_id
					+ "</td><td>" + json.list[i].clss_start + "</td><td>" + json.list[i].clss_end
					+ "</td></tr>";
			} //for in
			
			$("#anelist").html($("#anelist").html() + values);
		},
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus + ", "
					+ errorthrown);
		}
	});
	</script>
</div>
<div id="div_bottom"><c:import url="../common/footer.jsp"/></div>

</body>
</html>