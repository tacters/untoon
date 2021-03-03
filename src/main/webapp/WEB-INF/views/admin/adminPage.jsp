<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
li {
	border-bottom: solid 1px black;
}

li:last-child {
	border-bottom: none;
}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#div_root {
	margin: auto;
	width: 800px;
}

#div_top {
	width: 100%;
	height: 100px;
	/* background-color: #82FA58; */
	text-align: center;
}

#div_menu {
	width: 15%;
	height: 70%;
	float: left;
	background-color: white;
	text-align: left;
}

/* #div_menu ul {
	width: 30%;
	height: 30%;
	float: left;
	align: center;
	list-style-type: none;
	margin: 10%;
	padding: 10;
	border: solid 1px black;
	background-color: #2392BD;
} */

#div_menu ul{
	width: 80%;
	height: 25%;
	list-style-type: none;
	margin: 5%;
	padding: 10;
	float: left;
	background-color: #2392BD;
}

/*  #div_menu ul li:last-child {
	height: 100;
}  */

#div_menu ul li{
	list-style:none;
	/* border-bottom: solid 1px black; */
	border-bottom:none;
}

#div_menu li a {
	width: 100%;
	display: block;
	color: #000000;
	padding: 8px;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
}

#div_menu li a.current {
	background-color: #2392BD;
	color: white;
}

#div_menu li a:hover:not(.current) {
	background-color: #2392BD;
	color: white;
}

#div_con {
	width: 80%;
	height: 70%;
	float: left;
	background-size: 100% 100%;
	text-align: center;
}

#div_bottom {
	width: 100%;
	height: 100px;
	clear: both;
	background-color: #C8FE2E;
	text-align: center;
}
</style>
<!-- <style type="text/css">
ul {
		background-color:#2392BD;
		width:150px;
		list-style-type:none;
		margin:10%;
		padding:10;
		border:solid 1px black;
	}
li {
	border-bottom: solid 1px black;
}

li:last-child {
	border-bottom: solid;
}

a {
	background-color: #C6D8D3;
	border: none;
}

li a {
	width: 100%;
	display: block;
	color: #000000;
	padding: 8px;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
}

li a.current {
	background-color: #2392BD;
	color: white;
}

li a:hover:not(.current) {
	background-color: #2392BD;
	color: white;
}
</style> -->
</head>
<body>

	<div id="div_root"></div>
	<div id="div_top">
		<c:import url="../common/menubar.jsp" />
	</div>
	<div id="div_menu">
		<h4>세로네비바</h4>
		<ul style="align: center;">
			<li><a href="">미승인 클래스관리</a></li>
			<li><a href="">승인 클래스 관리</a></li>
			<li><a href="">승인 거부한 클래스 관리</a></li>
			<li><a href="">기간지난 승인 클래스 관리</a></li>
		</ul>
	</div>
	<div id="div_con">
	내용
	</div>
	<div id="div_bottom">
		<c:import url="../common/footer.jsp" />
	</div>
</body>
</html>