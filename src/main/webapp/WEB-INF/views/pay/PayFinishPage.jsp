<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
<style type="text/css">
body {
	font-family: Montserrat,sans-serif;
}
 .btn-area {
 	margin-top: 30px;
 	text-align:center;
}
 .btn-area input {
 	align:"center";
 	width: 30% ;
 	height:50px;
 	background: #2392BD;
 	color:#fff;
 	font-size: 20px;
 	border: none;
 	border-radius: 10px;
 	cursor:pointer;
 }
  div h3 {
 	padding: 10px;
	text-align:center;
	with: 80%;
 	background: #2392BD;
 	color:#fff;
 	font-size: 30px;
 }

</style>

</head>
<body>
<c:import url="../common/menubar.jsp"/>

<div>
<h3 align="center"> ${ loginUser.id } 님의 결제가 완료되었습니다. </h3>
</div>
<hr>

<%-- <h3>주문정보</h3>
<p>${ clss.clss_title }</p>
<p>${ clss.tchr_id }</p> &nbsp; &nbsp; &nbsp; 
<p>${clss.clss_start} ~ ${clss.clss_end}</p>
<hr>
<h3>고객 정보</h3>
<p><label>고객명 : <input type="text" value="${loginUser.name}"></label></p>
<p><label>연락처 : <input type="tel" value="${loginUser.phone}"></label></p>
<hr>
<p>총 결제 금액 : ${ clss.clss_price }</p> --%>


<form action="pinsert.do" method="post">

<input type="hidden" name="pid" value="${loginUser.id}">
<input type="hidden" name="cid" value="${clss.cid}">
 
<div class="btn-area">
<B><input type="submit" value="결제완료"></B>  
<p align="center">*결제완료하기 버튼을 눌러야 결제가 완료됩니다.</p>
</div>
<!--  input type="submit"이라고 쓰고 value="버튼에 들어갈 이름"을 쓰면 버튼이 만들어지고 클릭하면 값이 전송된다. 즉, onclick 안 써도 된다! -->

</form>

<footer><c:import url="../common/footer.jsp"/></footer>

</body>
</html>