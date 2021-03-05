<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<%-- <c:set var="cid" value="${ requestScope.cid }"  /> --%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
body{
	font-family: Montserrat, sans-serif;
}
  .tbl{
  background-color:#E0F5FF;border-color:#17578A;color:#656565;text-align:center;vertical-align:center; /* E0F5FF */
   border-radius:20px; 
  }
 .tbl_reply{
 background-color:#5B9BCF;/* border-color:#fff */;color:#fff;text-align:center;vertical-align:center;
 border-radius:5px; padding-left: 20px;
 }
  button {
  background-color: #2392bd;
  color: white;
  border: 2px solid #2392bd;
  transition-duration: 0.3s;
  padding: 5px  10px 5px 10px;
  margin: 10px 10px;
  cursor: pointer #000;
  font-size: 16px;
  align:right;
  
}
	button:hover {
  background-color: white; 
  color: #008CBA; 
  border: 2px solid #2392bd;
  padding: 5px  10px 5px 10px;
  margin: 10px 10px;
  cursor: pointer #000;
  font-size: 18px;
  align:right;
}



/* width */
::-webkit-scrollbar {
  width: 20px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px #fff; 
  border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #c6d8d3; 
  border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #fff; 
}
</style>
</head>
<body>
		
		
									
									<%-- 문의 목록 표시 영역 --%>
									<!-- <div id="qlistView" >
									<table id="qlistTbl" class="tbl" align="center" cellspacing="0" cellpadding="5" border="1"></table> -->
									
									
									
									
									<c:forEach items="${ requestScope.qaList }" var="r">
				<!--  LOGINUSER = 문의글 작성자 본인 -->
						<%-- 확인용 출력
						<c:out value="${ sessionScope.loginUser.id }"/>
						<c:out value="${ q.qwriter }"/> --%>
				<c:if test= "${ sessionScope.loginUser.id eq q.qwriter }">
						<form action="rupdate.do" method="post" enctype="multipart/form-data">
							<input type="hidden" name="cid" value="${ r.cid }">
							<table align="center" width="1000" border="0"  style="border-style:solid;" cellspacing="0" cellpadding="5" class="tbl">
							<tr><th colspan="2"></th></tr>
							<tr><td> &nbsp; &nbsp; <input type="hidden" name="qwriter"  value="${ q.qwriter }" style='text-align:left;' >${ q.qwriter }</td>
									<td style='text-align:right;'>마지막 수정일 : ${ q.q_modify_date } &nbsp; &nbsp; </td>
									</tr>
							<tr><th colspan="2"><textarea name="qcontent" rows="5" cols="50" value=${ q.qcontent } style="font-color:black;"></textarea></th></tr>
							<tr><th colspan="2">
								<input type="submit" value="수정 저장" class="button"> &nbsp; 
								<input type="reset" value="취소" class="button"> &nbsp; 
							</th></tr>
							</table>
						</form>
							<table align="center" width="1000" border="0"  style="border-style:solid;" cellspacing="0" cellpadding="5" class="tbl-btm">
								<tr><th colspan="2">
									<c:url var="rdelete" value="/rdelete.do">
										<c:param name="qid" value="${ q.qid }"/>
									</c:url>
									<button onclick="location.href='${ rdelete }'" class="button"> 삭제 </button>
								</th></tr>
							</table>
					</c:if>
								<!-- LOGINUSER = 상세보기 클래스 가르치는 강사 -->
								<c:if test= "${ sessionScope.loginUser.user_lv eq 'T' and clss.tchr_id eq sessionScope.loginUser.id  }">
								<table align="center" width="800" border="0"  style="border-style:solid;" cellspacing="0" cellpadding="5" class="tbl">
								<tr><th colspan="2"></th></tr>
										<tr><%-- <th>
																<div class="container-avatar"  class="tbl">
																	 <img src="${pageContext.request.contextPath}/resources/images/profilePics/mds_profile.jpg" alt="Avatar" class="image-avatar" style="width:100%; align: center; height:100px;">
																  <div class="middle-avatar"> 
																    <div class="text-avatar" style='text-align:left;'>${ q.qwriter }</div>
																  </div>
																</div>	
															</th> --%>
													<td style='text-align:left;'> &nbsp; &nbsp; ${ q.qwriter }</td><td style='text-align:right;'>${ q.q_modify_date } &nbsp; &nbsp; </td></tr>
										
										<tr><th colspan="2">${ q.qcontent }</th></tr>
										<tr><th colspan="2"><button onclick='revReply(" + json.qaList[i].qid + ");'> 댓글달기 </button></th></tr>
										</table>
								</c:if>
											<!-- LOGINUSER = 일반 사용자, 해당 아닌 강사, 관리자  -->
											<c:if test= "${ sessionScope.loginUser.id ne q.qwriter and clss.tchr_id ne sessionScope.loginUser.id }">
											<table align="center" width="800" border="0"  style="border-style:solid;" cellspacing="0" cellpadding="5" class="tbl">
											<tr><th colspan="2"></th></tr>
													<tr><%-- <th>
																<div class="container-avatar"  class="tbl">
																	 <img src="${pageContext.request.contextPath}/resources/images/profilePics/mds_profile.jpg" alt="Avatar" class="image-avatar" style="width:100%; align: center; height:100px;">
																  <div class="middle-avatar"> 
																    <div class="text-avatar" style='text-align:left;'>${ q.qwriter }</div>
																  </div>
																</div>	
															</th> --%>
													<td style='text-align:left;'> &nbsp; &nbsp; ${ q.qwriter }</td><td style='text-align:right;'>${ q.q_modify_date } &nbsp; &nbsp; </td></tr>
													<tr><th colspan="2">${ q.qcontent }</th></tr>
													<tr><th colspan="2"></th></tr>
													</table>
											</c:if>
															<!-- LOGINUSER = 일반 사용자, 해당 아닌 강사, 관리자  -->
															<c:if test= "${ empty sessionScope.loginUser}">
															<table align="center" width="800" border="0"  style="border-style:solid;" cellspacing="0" cellpadding="5" class="tbl">
															<tr><th colspan="2"></th></tr>
																	<tr><%-- <th>
																				<div class="container-avatar"  class="tbl">
																					 <img src="${pageContext.request.contextPath}/resources/images/profilePics/mds_profile.jpg" alt="Avatar" class="image-avatar" style="width:100%; align: center; height:100px;">
																				  <div class="middle-avatar"> 
																				    <div class="text-avatar" style='text-align:left;'>${ q.qwriter }</div>
																				  </div>
																				</div>	
																			</th> --%>
																	<td style='text-align:left;'> &nbsp; &nbsp; ${ q.qwriter }</td><td style='text-align:right;'>${ q.q_modify_date } &nbsp; &nbsp; </td></tr>
																	<tr><th colspan="2">
																					<!--  원래 첨부파일 있는 경우  -->
																					<c:if test="${  !empty  r.ofile_r }"	> 
																									<img src='resources/reviewClss_files/${ q.qfile_r }'
																												alt= "${ r.cid } 클래스 ${ q.qwriter } 님의 문의 사진"
																												style='width:100%; align: center; position: relative; max-width: 500px; padding: 10px;'>
																					</c:if>
																					<!--  원래 첨부파일 XXX 없는 경우 == NO IMAGE TO SHOW -->
																					</th></tr>
																	<tr><th colspan="2">${ q.qcontent }</th></tr>
																	<tr><th colspan="2">
																		
																		<table id="reviewReplyListView" class="tbl_reply" align="center" cellspacing="0" cellpadding="5" border="0"></table>
																		<%-- <button onclick='revReply( ${q.qid} );' style="align:right; margin-top: 10px;"> 댓글달기 </button> --%>
																		<button onclick='showReviewReplyForm();' style="align:right; margin-top: 10px;"> 댓글달기 </button>
																				
																				<%-- 문의 ** 댓글 ** 달기 폼 영역 --%>
																				<div id="reviewReplyDiv">
																					<form action="qainsert.do" method="post">
																					<input type="hidden" name="ref_rid" value="${ review_reply.ref_rid }" >
																					<input type="hidden" name="ref_rcid" value="${ review_reply.ref_rcid }" >
																						<table align="center" width="500" border="1" cellspacing="0" cellpadding="5" class="tbl_reply">
																						<tr><th>
																									<div class="container-avatar"  class="tbl_reply">
																									  <img src="${pageContext.request.contextPath}/resources/images/profilePics/mds_profile.jpg" alt="Avatar" class="image-avatar" style="width:100%; align: center;">
																									  <div class="middle-avatar">
																									    <div class="text-avatar">${ sessionScope.loginUser.nickname}</div>
																									  </div>
																									</div>	
																								</th>
																						<td><input type="text" name="rrwriter" readonly value="${ sessionScope.loginUser.id }"></td></tr>
																						<tr><th colspan="2">
																									<textarea name="rrcontent" rows="5" cols="50" placeholder="택터즈님의 소중한 댓글은 요기에~"></textarea>
																								</th></tr>
																						<tr><th colspan="2">
																						
																						<input type="submit" value="댓글 등록" class="button"> &nbsp; 
																						<input type="reset" value="취소" onclick="hideReviewReplyForm(); return false;" class="button"> </th></tr>
																					</table>
																					</form>  
																				</div>
																	</th></tr>
																	</table>
															</c:if>
					</c:forEach>
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
											<%-- 댓글 --%>
											<%-- 로그인한 사용자만 문의 *** 댓글 *** 작성가능 --%>
												<c:if test="${ !empty sessionScope.loginUser }">
													<div style=" text-align:center;">
														<button class="btn" onclick="showQaReplyForm();"> 댓글달기 </button>
													</div>
												</c:if>
												<c:if test="${ empty sessionScope.loginUser }">
													<div style=" text-align:center;">
														<button class="btn" onclick="goLogin();"> 댓글달기 </button>
													</div>
												</c:if>
											<script type="text/javascript">
													function goLogin(){
														var txt;
														var r = confirm("문의사항을 작성하려면 <일반 student> 계정으로 로그인한 후 댓글 달기 바랍니다.");
														if (r==true) {
															var myWindow = window.open("${pageContext.request.contextPath}/loginpage.do", "_self");
														} else {
															window.open(url, "_self");
														}
													}
											</script>
											<%-- 문의 ** 댓글 ** 달기 폼 영역 --%>
											<div id="qaReplyDiv">
												<form action="qainsert.do" method="post"> <!-- 원래는 action = "qainsert.do -->
												<input type="hidden" name="qid" value="${ qa.qid }" >
													<table align="center" width="500" border="1" cellspacing="0" cellpadding="5" class="tbl_reply">
													<tr><th>
																<div class="container-avatar"  class="tbl_reply">
																  <img src="${pageContext.request.contextPath}/resources/images/profilePics/mds_profile.jpg" alt="Avatar" class="image-avatar" style="width:100%; align: center;">
																  <div class="middle-avatar">
																    <div class="text-avatar">${ sessionScope.loginUser.nickname}</div>
																  </div>
																</div>	
															</th>
													<td><input type="text" name="qawriter" readonly value="${ sessionScope.loginUser.id }"></td></tr>
													<tr><th colspan="2">
																<textarea name="qacontent" rows="5" cols="50" placeholder="택터즈님의 소중한 댓글은 요기에~"></textarea>
															</th></tr>
													<tr><th colspan="2">
													<input type="submit" value="댓글 등록"> &nbsp; 
													<input type="reset" value="취소" onclick="hideQaReplyForm(); return false;"> </th></tr>
												</table>
												</form>  
											</div>	
											
											<%-- 문의 ** 댓글 ** 목록 표시 영역 --%>
											<div id="qalistView" >
											<table id="qalistTbl" class="tbl_reply" align="center" cellspacing="0" cellpadding="5" border="1"></table>
											</div>
											
									</div>
							
		
	
		
		
		
		
</body>
</html>