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
.tbl-ad {	display: block; margin: auto; align: center;border-collapse: collapse;  width: 100%;	 max-width: 700px;	} /* font-family 지정해줘도 좋을듯! */
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
<div class="body">
<h2>광고관리 : NEW 광고 등록하기</h2>


<form action="ainsert.do" method="post" enctype="multipart/form-data">
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5" class="tbl-ad">
<tr><th>광고제목 : </th><td><input type="text" name="ad_title" class="input"></td></tr>
<tr><th>화면위치 : </th><td>
				<!-- 창 위치: 1= middle 가운데, 2= top-left 왼쪽 위, 3= top-right 오른쪽 위, 4= top-middle 가운데 위, 5= bottom-middle 가운데 아래 -->
				<input type="radio" name="ad_xy"  id="middle" value="1"><label for="middle" checked>middle 가운데</label><br>
				<input type="radio" name="ad_xy"  id="top-left" value="2"><label for="top-left">top-left 왼쪽 위</label><br>
				<input type="radio" name="ad_xy"  id="top-right" value="3"><label for="top-right">top-right 오른쪽 위</label><br>
				<input type="radio" name="ad_xy"  id="top-middle" value="4"><label for="top-middle">top-middle 가운데 위</label><br>
				<input type="radio" name="ad_xy"  id="bottom-middle" value="5"><label for="bottom-middle">bottom-middle 가운데 아래</label><br>
				</td></tr>
<tr><th>시작날짜 : </th><td><input type="date" id="startDate"  name="ad_start" min="2020-09-09" max="2021-12-31"  class="input"></td></tr> <!--  -->
<tr><th>종결날짜 : </th><td><input type="date" id="endDate" name="ad_end" min="2020-09-09" max="2021-12-31"  class="input"></td></tr>
				<script type="text/javascript">
					function myFunction() {
					var x = document.getElementById("endDate").min = document.getElementById("startDate");
				</script>
<tr><th>액티브 : </th><td>
				<input type="radio" name="a_status"  id="Y" value="Y" class="astatus"  class="input"><label for="Y">현재 액티브</label>
				<input type="radio" name="a_status"  id="N" value="N" class="astatus" checked  class="input"><label for="N">광고 중지</label>
				</td></tr>
<tr><th>팝업크기 : </th><td>
						가로 <input type="number" id="ad_width" name="ad_width"  min="400" max="2000" width="100px">
						&nbsp; &nbsp; &nbsp; 
						세로 <input type="number" id="ad_height" name="ad_height"  min="400" max="2000" width="100px">
						</td></tr>
<tr><th>창닫기 방법 : </th><td>
				<!-- 창닫기 방법: 1=오늘 하루 열지 않음, 2=다시 열지 않음 -->
				<input type="checkbox" name="ad_close" id="todayclose" value="1"><label for "todayclose">오늘 하루 열지 않음</label><br>
				<!-- <input type="checkbox" name="ad_close" id="permclose" value="2"><label for "permclose">오늘 하루 열지 않음</label><br> -->
<tr><th colspan="2">
				<input type="submit" value="저장하고 첨부파일 넣기"> &nbsp; 
				<input type="reset" value="취소"> &nbsp; 
				<button onclick="javascript:history.go(-1); return false;">목록</button>
				</th></tr>

</table>


</form>






<br>
<br>
<sub><i style="text-align:center;"> ※ 관리자 전용 홈페이지 관리 사이트※</i></sub>

</div>
<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>