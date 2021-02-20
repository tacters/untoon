<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>


</head>
<body>
<h1> 결제가 완료되었습니다. </h1>
<hr>
<h3>주문정보</h3>
<p>${ clss.clss_title }</p> <br>
<p>${ clss.tchr_id }</p> &nbsp; &nbsp; &nbsp; <p>${clss.clss_start} ~ ${clss.clss_end}</p>
<hr>
<h3>고객 정보</h3>
<p><label>고객명 : <input type="text" name="name" value="${loginUser.name}"></label></p>
<p><label>연락처 : <input type="tel" name="phone" value="${loginUser.phone}"></label></p>
<hr>
<p>총 상품 금액 : ${ clss.clss_price }</p>
</body>
</html>