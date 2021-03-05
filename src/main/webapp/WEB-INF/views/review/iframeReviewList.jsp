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
</style>
</head>
<body>
	<!-- 클래스 후기  -->

		<script type="text/javascript">
			/* function reviewDelete(rid){
				   location.href = "${ pageContext.request.contextPath }/rdelete.do?rid=" + rid + "&cid=${ clss.cid}";
				} */
			function showReviewReplyForm(){
				   $("#reviewReplyDiv").css("display", "block");
				}
			/* function revReply(rid){ showReviewReplyForm(); }; */
			function hideReviewReplyForm(){
			   $("#reviewReplyDiv").css("display", "none");
			}			
			function reviewReplyDelete(rrid){
			   location.href = "${ pageContext.request.contextPath }/rrdelete.do?rrid=" + rrid + "&rid=${ review.rid}";
			}

			function showReviewReplyListView(){
			   $("#reviewReplyListView").css("display", "none");
			}
			function hideReviewReplyListView(){
			   $("#reviewReplyListView").css("display", "none");
				} 
			
		
		</script>
		
		<%-- 후기 목록 표시 영역 --%>
		<!-- <div id="reviewDiv"> -->
																																							<%-- 확인용 출력<c:out value="${ sessionScope.loginUser }"/><br> --%>
			<c:forEach items="${ requestScope.reviewList }" var="r">
				<!--  LOGINUSER = 후기글 작성자 본인 -->
						<%-- 확인용 출력
						<c:out value="${ sessionScope.loginUser.id }"/>
						<c:out value="${ r.rwriter }"/> --%>
				<c:if test= "${ sessionScope.loginUser.id eq r.rwriter }">
						<form action="rupdate.do" method="post" enctype="multipart/form-data">
							<input type="hidden" name="cid" value="${ r.cid }">
							<table align="center" width="800" border="0"  style="border-style:solid;" cellspacing="0" cellpadding="5" class="tbl">
							<tr><th colspan="2"></th></tr>
							<tr><td> &nbsp; &nbsp; <input type="hidden" name="rwriter"  value="${ r.rwriter }" style='text-align:left;' >${ r.rwriter }</td>
									<td style='text-align:right;'>마지막 수정일 : ${ r.r_modify_date } &nbsp; &nbsp; </td>
									</tr>
							<tr><th colspan="2">
											<c:if test="${  !empty  r.ofile_r }"	> <!--  원래 첨부파일 있는 경우  -->
													<input type='checkbox' name='delFlag' value='yes'> 파일삭제 <br>
															<img src='resources/reviewClss_files/${ r.rfile_r }'
																		alt= "${ r.cid } 클래스 ${ r.rwriter } 님의 후기 사진"
																		style='width:100%; align: center; position: relative; max-width: 500px; padding: 10px;'>
											</c:if>
											<c:if test="${  empty  r.ofile_r }"	> <!--  원래 첨부파일 XXX 없는 경우  -->
															<input type='file' name='upfile'>
											</c:if>
											</th>
							</tr>
							<tr><th colspan="2"><textarea name="rcontent" rows="5" cols="50" value=${ r.rcontent }></textarea></th></tr>
							<tr><th colspan="2">
								<input type="submit" value="수정 저장"> &nbsp; 
								<input type="reset" value="취소"> &nbsp; 
								<c:url var="rdelete" value="/rdelete.do">
									<c:param name="rid" value="${ r.rid }"/>
								</c:url>
								<button onclick="location.href='${ rdelete }'"> 삭제 </button>
							</th></tr>
							</table>
						</form>
						
					</c:if>
								<!-- LOGINUSER = 상세보기 클래스 가르치는 강사 -->
								<c:if test= "${ sessionScope.loginUser.user_lv eq 'T' and clss.tchr_id eq sessionScope.loginUser.id  }">
								<table align="center" width="800" border="0"  style="border-style:solid;" cellspacing="0" cellpadding="5" class="tbl">
								<tr><th colspan="2"></th></tr>
										<tr><%-- <th>
																<div class="container-avatar"  class="tbl">
																	 <img src="${pageContext.request.contextPath}/resources/images/profilePics/mds_profile.jpg" alt="Avatar" class="image-avatar" style="width:100%; align: center; height:100px;">
																  <div class="middle-avatar"> 
																    <div class="text-avatar" style='text-align:left;'>${ r.rwriter }</div>
																  </div>
																</div>	
															</th> --%>
													<td style='text-align:left;'> &nbsp; &nbsp; ${ r.rwriter }</td><td style='text-align:right;'>${ r.r_modify_date } &nbsp; &nbsp; </td></tr>
										<tr><th colspan="2">
														 <!--  원래 첨부파일 있는 경우  -->
														<c:if test="${  !empty  r.ofile_r }"	>
																		<img src='resources/reviewClss_files/${ r.rfile_r }'
																					alt= "${ r.cid } 클래스 ${ r.rwriter } 님의 후기 사진"
																					style='width:100%; align: center; position: relative; max-width: 500px; padding: 10px;'>
														</c:if>
														<!--  원래 첨부파일 XXX 없는 경우 == NO IMAGE TO SHOW -->
														</th></tr>
										<tr><th colspan="2">${ r.rcontent }</th></tr>
										<tr><th colspan="2"><button onclick='revReply(" + json.reviewList[i].rid + ");'> 댓글달기 </button></th></tr>
										</table>
								</c:if>
											<!-- LOGINUSER = 일반 사용자, 해당 아닌 강사, 관리자  -->
											<c:if test= "${ sessionScope.loginUser.id ne r.rwriter and clss.tchr_id ne sessionScope.loginUser.id }">
											<table align="center" width="800" border="0"  style="border-style:solid;" cellspacing="0" cellpadding="5" class="tbl">
											<tr><th colspan="2"></th></tr>
													<tr><%-- <th>
																<div class="container-avatar"  class="tbl">
																	 <img src="${pageContext.request.contextPath}/resources/images/profilePics/mds_profile.jpg" alt="Avatar" class="image-avatar" style="width:100%; align: center; height:100px;">
																  <div class="middle-avatar"> 
																    <div class="text-avatar" style='text-align:left;'>${ r.rwriter }</div>
																  </div>
																</div>	
															</th> --%>
													<td style='text-align:left;'> &nbsp; &nbsp; ${ r.rwriter }</td><td style='text-align:right;'>${ r.r_modify_date } &nbsp; &nbsp; </td></tr>
													<tr><th colspan="2">
																	<!--  원래 첨부파일 있는 경우  -->
																	<c:if test="${  !empty  r.ofile_r }"	> 
																					<img src='resources/reviewClss_files/${ r.rfile_r }'
																								alt= "${ r.cid } 클래스 ${ r.rwriter } 님의 후기 사진"
																								style='width:100%; align: center; position: relative; max-width: 500px; padding: 10px;'>
																	</c:if>
																	<!--  원래 첨부파일 XXX 없는 경우 == NO IMAGE TO SHOW -->
																	</th></tr>
													<tr><th colspan="2">${ r.rcontent }</th></tr>
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
																				    <div class="text-avatar" style='text-align:left;'>${ r.rwriter }</div>
																				  </div>
																				</div>	
																			</th> --%>
																	<td style='text-align:left;'> &nbsp; &nbsp; ${ r.rwriter }</td><td style='text-align:right;'>${ r.r_modify_date } &nbsp; &nbsp; </td></tr>
																	<tr><th colspan="2">
																					<!--  원래 첨부파일 있는 경우  -->
																					<c:if test="${  !empty  r.ofile_r }"	> 
																									<img src='resources/reviewClss_files/${ r.rfile_r }'
																												alt= "${ r.cid } 클래스 ${ r.rwriter } 님의 후기 사진"
																												style='width:100%; align: center; position: relative; max-width: 500px; padding: 10px;'>
																					</c:if>
																					<!--  원래 첨부파일 XXX 없는 경우 == NO IMAGE TO SHOW -->
																					</th></tr>
																	<tr><th colspan="2">${ r.rcontent }</th></tr>
																	<tr><th colspan="2">
																		
																		<table id="reviewReplyListView" class="tbl_reply" align="center" cellspacing="0" cellpadding="5" border="0"></table>
																		<%-- <button onclick='revReply( ${r.rid} );' style="align:right; margin-top: 10px;"> 댓글달기 </button> --%>
																		<button onclick='showReviewReplyForm();' style="align:right; margin-top: 10px;"> 댓글달기 </button>
																				
																				<%-- 후기 ** 댓글 ** 달기 폼 영역 --%>
																				<div id="reviewReplyDiv">
																					<form action="rrinsert.do" method="post">
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
																						<input type="submit" value="댓글 등록"> &nbsp; 
																						<input type="reset" value="취소" onclick="hideReviewReplyForm(); return false;"> </th></tr>
																					</table>
																					</form>  
																				</div>
																	</th></tr>
																	</table>
															</c:if>
					</c:forEach>
<!-- 			</div> -->
		
<script type="text/javascript">
		$(function(){
			   hideReviewForm(); 
		});

		
   	   $(function() {
   	      var refRid = ${ r.rid }; 
   	      var refRcid = ${ r.cid };
   	      var loginUser = "${ sessionScope.loginUser.id }";  //로그인한 회원 아이디 변수에 대입
   	      var teacher = "${clss.tchr_id}"; // 수업 강사님
   	      var adminLv= "${ sessionScope.loginUser.user_lv }";


   	      $.ajax({
   	         url: "${ pageContext.request.contextPath }/rrlist.do",
   	         type: "post",
   	         data: { ref_rid: refRid },  //전송값에 변수 사용 // 문의 id를 받아옴 (rid)
   	         dataType: "json",
   	         success: function(data){
   	         console.log("success : " + data);
   	      
   	         //object ==> string
   	         var jsonStr = JSON.stringify(data);
   	         //string ==> json 
   	         var json = JSON.parse(jsonStr);

   	         var values = "";
   	               for(var i in json.list){
   	                  // 본인이 등록한 후기 댓글일 때는 수정/삭제 가능
   	                  if(loginUser == json.list[i].rrwriter){
   	                     values += "<tr><td>" + json.list[i].rrwriter + "</td>"
   	                        	+ "<td>" +  json.list[i].rr_modify_date + "</td></tr>"
   	                        + "<tr><td colspan='2'>"
	   	                        + "<form action='rrupdate.do' method='post'>" 
	   	                        + "<input type='hidden' name='rrid' value='" +  json.list[i].rrid  + "'>"
	   	                        + "<input type='hidden' name='ref_rid' value='"+ refRid +"'>" 
	   	                        + "<input type='hidden' name='ref_rcid' value='"+ refRcid +"'>" 
	   	                        + "<textarea name='rrcontent'>"
	   	                        + decodeURIComponent(json.list[i].rrcontent).replace(/\+/gi, " ") 
	   	                        + "</textarea></tr>"
   	                        + "<tr><td><input type='submit' value='수정'></form>"
   	                        	+ "<button onclick='reviewReplyDelete(" + json.list[i].rrid + ");'>삭제</button></td></tr>";
   	                  } else if ( loginUser == teacher || adminLv == 'A' ){ 
   	                     values += "<tr><td>" + json.list[i].rrwriter + "</td>"
			   	                     	+ "<td>" +  json.list[i].rr_modify_date + "</td></tr>"
			   	                     + "<tr><td colspan='2'>"
			   	                    	 + decodeURIComponent(json.list[i].rrcontent).replace(/\+/gi, " ") 
			   	                     + "</td></tr>";   
   	                  } else{ // 글작성자가 아니며, 대상 강사또는 관리자가 아닐 때
   	                     values += "";   
   	                  }
   	               }
   	               $("#reviewReplyListView").html($("#reviewReplyListView").html() + values);
   	            },
   	         error: function(jqXHR, textstatus, errorthrown){
   	            console.log("error : " + jqXHR + ", " + textstatus + ", " 
   	               + errorthrown);
   	            }   
   	         });// 후기 댓글  수정/삭제 ajax
}); <!-- END :  jQuery( function($) -->


</script>
		
		
		
		
		
		<%-- 후기  ** 댓글 ** 목록 표시 영역 --%>
													<!-- <div id="reviewReplyListView" >
													<table id="rrlistTbl" class="tbl_reply" align="center" cellspacing="0" cellpadding="5" border="1"></table>
													</div> -->
													
													<!-- <table id="reviewReplyListView" class="tbl_reply" align="center" cellspacing="0" cellpadding="5" border="0"></table> -->
													


		
		
		
		
	
		
		
		
		
</body>
</html>