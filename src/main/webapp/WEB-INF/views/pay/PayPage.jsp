<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
<style type="text/css">
 .btn-area {
 	margin-top: 30px;
	text-align:center;
 }
 .btn-area button {
 	
 	width: 30% ;
 	height:50px;
 	background: #166cea;
 	color:#fff;
 	font-size: 20px;
 	border: none;
 	border-radius: 10px;
 	cursor:pointer;
 }
 
 div h2 {
 	padding: 10px;
	text-align:center;
	with: 80%;
 	background: #166cea;
 	color:#fff;
 	font-size: 30px;
 }
 
 span{
 	font-size: 19px;
 }
 input {
 	position: relative;
    width: 50%;
    margin: 0 0 14px;
    padding: 12px 20px;
    font-family: inherit;
    font-size: 14px;
    font-weight: inherit;
    line-height: calc(48px - (12px * 2) - 2px);
    color: #8e8e8e;
    background-color: transparent;
    border: 1px solid #e6e6e6;
    border-radius: 4px;
    outline: 0;
    transition: border-color .2s ease-in-out;
 }
</style>
 

</head>
<body>

<c:import url="../common/menubar.jsp"/>
<div>
<h2> 결제 페이지 </h2>
</div>
<hr>
<span>
<h3>주문정보</h3>

<tr><p><strong>클래스 이름 : </strong> ${ clss.clss_title }</p></tr>

<p><strong>클래스 기간 : </strong> ${clss.clss_start} ~ ${clss.clss_end} </p>
<p><strong>클래스 총 횟수 : </strong> 총 ${ clss.clss_times} 회</p> <br>
<strong>담당 강사 : </strong> ${ clss.tchr_id } <br>
<p><strong>한 회차 당 수업 시간: </strong> ${ clss.clss_duration } 시간</p> <br>
<p><strong>총 상품 금액 : </strong> ${ clss.clss_price } 원</p>

</span>
<hr>
<h3>고객 정보</h3>
<span>
<p><strong><label>고객명 :</strong> <input type="tel" value="${loginUser.name}"></label></p>
<p><strong><label>연락처 :</strong> <input type="tel" value="${loginUser.phone}"></label></p>
</span>
<hr>


	<c:url var="kakao" value="/movekakao.do">
		<c:param name="cid" value="${clss.cid }" />
	</c:url>
<div class="btn-area">
<button onclick="location.href='${ kakao }'">결제하기</button>
</div>
<footer><c:import url="../common/footer.jsp"/></footer>

</body>
</html>


