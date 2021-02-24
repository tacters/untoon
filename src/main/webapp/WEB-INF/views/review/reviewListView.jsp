<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 페이징 처리용 --%>
<c:set var="maxPage" value="${ requestScope.maxPage }" /> 
<c:set var="startPage" value="${ requestScope.startPage }"  /> 
<c:set var="endPage" value="${ requestScope.endPage }"  /> 
<c:set var="currentPage" value="${ requestScope.currentPage }"  /> 

<%-- 동작 요청 url --%>
<c:url var="irf" value="/irfmove.do" /> <!-- 후기 작성 이동-->
<c:url var="urf" value="/urfmove.do" /> <!-- 후기 수정 이동 -->
<c:url var="rdelete" value="/rdelete.do" /> <!-- 후기 삭제 : 수정단계에서만 가능하게 하자-->
<c:url var="rlist" value="/rlist.do" /> <!-- 후기 목록조회 -->

   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
function insertReview(){	
	location.href = "${ irf }";
}
</script>

<style type="text/css">
.btn-write {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}

.btn-write:hover {
  background-color: #008CBA;
  color: white;
  transition-duration: 1s;
}

.tg  {
	border-collapse:collapse;
	border-spacing:0;
	align:"center";
	border:"1" ;
	width:"700";
	cellspacing:"0";
}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-zapj{border-color:#000000;color:#656565;text-align:left;vertical-align:center}
.tg .tg-wqg9{border-color:#000000;color:#656565;text-align:center;vertical-align:center}
.tg .tg-tule{border-color:#000000;color:#656565;text-align:right;vertical-align:center}
</style>

</head>
<body>
<c:import url="../common/menubar.jsp"/>

<%-- 로그인한 사용자 --%>
<c:if test="${ !empty sessionScope.loginUser }">
	<%-- WHEN PAY (혜인) IS COMPLETED: 로그인한 사용자 중 *** 이 수업 수강한 사람 *** 만 글쓰기 기능 사용할 수 있게 함 --%>
	<%-- 	<c:if test="${loginUser.id }"
		<c:forEach items="${ requestScope.list }" var="c">
		
		</c:forEach>
		</c:if>
		 --%>
	<div style="align:center; text-align:center;">
		<button class="btn-write" onclick="insertReview();"> 후기 쓰기 </button>
	</div>
</c:if>
&nbsp; &nbsp; &nbsp; 


<%-- 목록 출력 --%>
<div style="align:center;padding:100px;">
	<c:url var="rlist" value="/rlist.do" >
			<c:param name="page" value="1" />
	</c:url>
	<button class="btn-write" onclick="javascript:location.href='${ rlist }';"> 모든 후기 읽어보쟛~!! </button>
</div>
<br>

<table class="tg">
<thead>
  <tr>
    <th class="tg-wqg9" colspan="2" rowspan="2">profile pic</th>
    <th class="tg-zapj" colspan="4">${ r.rwriter }</th> <!-- nickname 닉네임이 올 자리 -->
    <th class="tg-zapj"></th>
    <th class="tg-zapj"></th>
    <th class="tg-zapj"></th>
    <th class="tg-tule" colspan="3"> ${ r.r_create_date } </th>
  </tr>
  <tr>
    <td class="tg-zapj" colspan="7"></td>
    <td class="tg-tule" colspan="3"> ${ r.r_modify_date } </td>
  </tr>
</thead>
<c:forEach items="${ requestScope.list" var="r">
	<tbody>
	  <tr>
	    <td class="tg-wqg9" colspan="12" rowspan="3">
	    	<c:if test="${ !empty r.ofile_r }">
	    		<div style="width:80%; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
	    			<img src="${pageContext.request.contextPath}/resources/reviewClss_files/${r.rfile_r}" 
	    					  alt="${ r.rwriter }님의 후기글 첨부파일"
	    					  style="max-width:100%; height: auto; width:100%;">
	    		</div>
	    		<br>
	    	</c:if>
			<c:if test="${ empty b.original_filename }">
				<br>
			</c:if>
	    	${r.rcontent }
	    </td>
	  </tr>
	  <tr>
	  </tr>
	  <tr>
	  </tr>
	</tbody>
</c:forEach>
</table>

<br>


<%-- 현재 페이지가 1이 아니면 링크설정, 현재 1페이지이면 링크없음 --%>
<c:if test="${ empty action}"> 	<%-- 페이징 처리 				[맨처음][이전] 숫자...........  [다음][맨끝]			--%>
	<div style="text-align: center;">
		<c:if test="${ currentPage <= 1}">
		[맨처음]
		</c:if>
		<c:if test="${ currentPage > 1 }">
			<c:url var="rlist" value="/rlist.do">
				<c:param name="page" value="1" />
			</c:url>
			<a href="${ rlist }">[맨처음]</a>
		</c:if> &nbsp;
		<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
		<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
			<c:url var="rlist2" value="/rlist.do">
				<c:param name="page" value="${ startPage - 10 }"/>
			</c:url>
			<a href="${ rlist2 }">[이전]</a>
		</c:if>
		<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
		[이전]
		</c:if> &nbsp; 
		<%-- 가운데 표시할 페이지 그룹 숫자 링크 설정 --%>
		<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
		 	<c:if test="${ p eq currentPage }">
				<font size="4" color="red">[${ p }]</font>
			</c:if>
			<c:if test="${ p ne currentPage }">
				<c:url var="rlist3" value="/rlist.do">
					<c:param name="page" value="${ p }" />
				</c:url>
				<a href="${ rlist3 }">${ p }</a>
			</c:if>
		</c:forEach> &nbsp;
		<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
		<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
			<c:url var="rlist4" value="/rlist.do">
				<c:param name="page" value="${ endPage + 10 }"/>
			</c:url>
			<a href="${ rlist4 }">[다음그룹]</a>
		</c:if>
		<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
			[다음그룹]&nbsp;
		</c:if>
		<!-- 맨끝 페이지로 이동 처리 -->
		<c:if test="${ currentPage >= maxPage }">
			[맨끝]&nbsp;
		</c:if>	
		<c:if test="${ currentPage < maxPage }">
			<c:url var="rlist5" value="/rlist.do">
				<c:param name="page" value="${ maxPage }"/>
			</c:url>
			<a href="${ rlist5 }">[맨끝]</a>
		</c:if>
	</div>
</c:if>

<%-- boardListView.jsp 에서 검색조회 관련 페이징처리는 사용안함 --%>



<footer><c:import url="../common/footer.jsp"/></footer>
</body>
</html>