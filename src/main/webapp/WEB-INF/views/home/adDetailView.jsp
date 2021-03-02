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
<div class="body">

<h2>광고관리 : " ${ ad.ad_title } " 광고 상세보기</h2>


<form action="aupdate.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="adid" value="${ ad.adid }">
<c:if test="${ !empty home_upfile.ad_file }">
	<input type="hidden" name="ad_file" value="${ home_upfile.ad_file }">
</c:if>
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5" class="tbl-ad">
<tr><th>광고제목 : </th><td><input type="text" name="ad_title" value="${ ad.ad_title}"></td></tr>
<tr><th>화면위치 : </th><td><input type="text" name="ad_xy" value="${ ad.ad_xy }"></td></tr>
<tr><th>시작날짜 : </th><td><input type="date" id="startDate" min="2020-09-09" max="2021-12-31" value="${ ad.ad_start }"></td></tr>
<tr><th>종결날짜 : </th><td><input type="date" id="endDate" min="2020-09-09" max="2021-12-31" value="${ ad.ad_end }"></td></tr>
				<script type="text/javascript">
					function myFunction() {
					var x = document.getElementById("endDate").min = document.getElementById("startDate");
				</script>
<tr><th>액티브 : </th><td>
				<c:if test="${ad.a_status eq 'Y' }">
					<input type="radio" name="a_status"  id="Y" value="Y" class="astatus"  checked><label for="Y">현재 액티브</label>
					<input type="radio" name="a_status"  id="N" value="N" class="astatus" ><label for="N">광고 중지</label>
				</c:if>
				<c:if test="${ad.a_status eq 'N' }">
					<input type="radio" name="a_status"  id="Y" value="Y" class="astatus"  ><label for="Y">현재 액티브</label>
					<input type="radio" name="a_status"  id="N" value="N" class="astatus"  checked><label for="N">광고 중지</label>
				</c:if>
				</td></tr>
<tr><th>팝업크기 : </th><td>
				가로 <input type="number" id="ad_width" name="ad_width" value="${ ad.ad_width }" min="400" max="2000">
				&nbsp; &nbsp; &nbsp; 
				세로 <input type="number" id="ad_height" name="ad_height" value="${ ad.ad_height }" min="400" max="2000">
				</td></tr>
<tr><th>창닫기 방법 : </th><td>
				<!-- 창닫기 방법: 1=오늘 하루 열지 않음, 2=다시 열지 않음 -->
				<c:if test="${ad.ad_close eq '1' }">
					<input type="checkbox" name="ad_close" id="todayclose" value="1" checked><label for "todayclose">오늘 하루 열지 않음</label><br>
					<!-- <input type="checkbox" name="ad_close" id="permclose" value="2"><label for "permclose">오늘 하루 열지 않음</label><br> -->
				</c:if>
				<c:if test="${ad.ad_close ne '1' }">
					<input type="checkbox" name="ad_close" id="todayclose" value="1" ><label for "todayclose">오늘 하루 열지 않음</label><br>
					<!-- <input type="checkbox" name="ad_close" id="permclose" value="2"><label for "permclose">오늘 하루 열지 않음</label><br> -->
				</c:if>
<tr><th>광고 첨부파일 : </th><td>
					<%-- 원래 첨부파일이 있는 경우 --%>
					<c:if test="${ !empty home_upfile.ad_file }">
						${ home_upfile.ad_file } &nbsp; 
						<input type="checkbox" name="delFlag" value="yes"> 파일삭제 <br>
					</c:if>
					<%-- 원래 첨부파일이 없는 경우 --%>
					<c:if test="${ empty home_upfile.ad_file }">
						<input type="file" name="ad_file">
					</c:if>
				</td></tr>
<tr><th colspan="2">
				<input type="submit" value="저장"> &nbsp; 
				<input type="reset" value="취소"> &nbsp; 
				<button onclick="javascript:history.go(-1); return false;">목록</button>
				
				<c:url var="adel" value="/adelete.do">
					<c:param name="adid" value="${ ad.adid }" />
					<c:if test="${ !empty home_upfile.ad_file}">
						<c:param name="ad_file" value="${ home_upfile.ad_file }" />
					</c:if>
				</c:url>
				<%-- <button onclick="javascript:location.href='${ adel }';">광고 삭제</button> &nbsp; --%> 
				<button onclick="checkDelete();">광고 삭제</button> &nbsp; 
				</th></tr>

</table>
<script type="text/javascript">
	function checkDelete(){
		//var txt;
		var r = confirm("광고를 삭제하시면 복구가 불가합니다. <br> 삭제하시겠습니까?");
		if(r == true) {
			location.href='${ adel }';
		} //else 
			//alert(location.href='/hdetail.do');
	};
</script>


</form>








<br>
<br>
<sub><i style="text-align:center;"> ※ 관리자 전용 홈페이지 관리 사이트※</i></sub>

</div>
<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>