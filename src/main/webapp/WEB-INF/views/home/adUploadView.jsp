<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
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

</style>
</head>
<body>
<c:import url="../common/menubar.jsp"/>
<br>
<h2>광고관리 : NEW 광고 등록하기</h2>


<table align="center" width="500" border="1" cellspacing="0" cellpadding="5" class="tbl-ad">
<tr><th>광고제목 : </th><td> ${ ad.ad_title} </td></tr>
<tr><th>화면위치 : </th><td> ${ ad.ad_xy } </td></tr>
<tr><th>시작날짜 : </th><td> ${ ad.ad_start } </td></tr>
<tr><th>종결날짜 : </th><td> ${ ad.ad_end } </td></tr>
<tr><th>액티브 : </th><td>
				<c:if test="${ad.a_status eq 'Y' }"> 현재 액티브	</c:if>
				<c:if test="${ad.a_status eq 'N' }"> 광고 중지 </c:if>
				</td></tr>
<tr><th>팝업크기 : </th><td>
				가로 : &nbsp; ${ ad.ad_width } px 
				&nbsp; &nbsp; &nbsp; 
				세로 : &nbsp; ${ ad.ad_height } px
				</td></tr>
<tr><th>창닫기 방법 : </th><td>
				<c:if test="${ad.ad_close eq '1' }"> "오늘 하루 열지 않음" ▶ 사용 </c:if>
				<c:if test="${ad.ad_close ne '1' }"> "오늘 하루 열지 않음" ▷ 미사용 </c:if>
				</td></tr>
</table>

<form action="aupload.do" method="post" enctype="multipart/form-data">
	<input  type = "hidden" name="adid" value="${ ad.adid }">
	<table align="center" width="500" border="1" cellspacing="0" cellpadding="5" class="tbl-ad">
			
			<tr><th>광고 첨부파일 : </th><td>
							<input type="file" name="ad_file">
							</td></tr>
			<tr><th colspan="2">
							<input type="submit" value="광고 등록"> &nbsp; 
							<input type="reset" value="취소"> &nbsp; 
							<button onclick="javascript:history.go(-1); return false;">목록</button>
							</th></tr>
	</table>
</form>





<br>
<br>
<sub><i style="text-align:center;"> ※ 관리자 전용 홈페이지 관리 사이트※</i></sub>
<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>
