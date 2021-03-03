<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
<!-- <script type="text/javascript">
function pay(){
   return "redirect: kakaopay.do";
};
</script> -->
 

</head>
<body>

<c:import url="../common/menubar.jsp"/>

<h2> 결제하기 </h2>
<hr>

<h3>주문정보</h3>
<p>클래스 : ${ clss.clss_title }</p> <br>
<p>강사 : ${ clss.tchr_id }</p> &nbsp; &nbsp; 
<p>${clss.clss_start} ~ ${clss.clss_end}</p>
<p>클래스 총 횟수 : 총 ${ clss.clss_times}회</p> <br>
<p>한 회차 당 수업 시간:${ clss.clss_duration }시간</p> <br>
<hr>
<h3>고객 정보</h3>
<p><label>고객명 : <input type="text" value="${loginUser.name}"></label></p>
<p><label>연락처 : <input type="tel" value="${loginUser.phone}"></label></p>
<hr>
<p>총 상품 금액 : ${ clss.clss_price }</p>

	<c:url var="kakao" value="/movekakao.do">
		<c:param name="cid" value="${clss.cid }" />
	</c:url>
	
<button class="btn" onclick="location.href='${ kakao }'">결제하기</button>

<footer><c:import url="../common/footer.jsp"/></footer>

</body>
</html>


