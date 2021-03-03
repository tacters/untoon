<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>


</head>
<body>
<c:import url="../common/menubar.jsp"/>


<h2> 결제가 완료되었습니다. </h2>
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

<%-- 
<form action="pinsert.do" method="post">

<input type="hidden" name="pid" value="${loginUser.id}">
<input type="hidden" name="cid" value="${clss.cid}">

 --%>
 
	<c:url var="home" value="/home.do">
	</c:url>

 
<button class="btn" onclick="location.href='${home}'"> 결제완료 </button>

<!-- </form> -->

<footer><c:import url="../common/footer.jsp"/></footer>

</body>
</html>