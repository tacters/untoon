<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>

<c:set var="contextPath"	value="${ pageContext.servletContext.contextPath }" scope="application" />

	<div class="edgtf-wrapper">
		<div class="edgtf-wrapper-inner">
			<div class="edgtf-top-bar edgtf-light">
				<div class="edgtf-vertical-align-containers">
					<div class="edgtf-position-right">
						<div class="edgtf-position-right-inner">
						
						<!-- NEED TO LOGIN 로그인  안 되었을 때의 메뉴-->
						<c:if test="${ empty sessionScope.loginUser }">
							<div class="widget edgtf-login-register-widget edgtf-user-not-logged-in">
									<c:url var="clssList" value="/clssList.do" />
									<a href='${ clssList }' title="clssList">클래스 찾기</a>
							</div>
							<div class="widget edgtf-login-register-widget edgtf-user-not-logged-in">
									<c:url var="loginpage" value="/loginpage.do" />
									<a href='${ loginpage }' title="log in">로그인</a>
							</div>
							<div
								class="widget edgtf-login-register-widget edgtf-user-not-logged-in">
									<c:url var="enrollview" value="/enrollView.do" />
									<a href='${ enrollview }' title="enroll">회원가입</a>
							</div>
						</c:if>
						
						<!-- LOGGED IN 로그인 되어있을 때의 메뉴-->
						<c:if test="${ !empty sessionScope.loginUser }"> 
							<!-- STUDENT 로그인-->
							<c:out value="${ loginUser.name }님은 오늘도~!"/>
							<c:if test="${sessionScope.loginUser.user_lv eq 'S'}">
								<div class="widget edgtf-login-register-widget edgtf-user-not-logged-in">
											<c:url var="clssList" value="/clssList.do" />
											<a href='${ clssList }' title="clssList">클래스 찾기</a>
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="myInfo" value="/myInfo.do" />
									<a href='${ myInfo }' title="myInfo">마이 페이지</a> <!-- 개인정보 수정가능한 조회 페이지 -->
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="mylist" value="/mylist.do" />
									<a href='${ mylist }' title="mylist">마이 클래스</a> <!-- MyPagePayList: 결제+수강신청 완료된 내역 리스트 조회 페이지  -->
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="mylist" value="/mylist.do" />
									<a href='${ mylist }' title="mylist">마이 클래스</a> <!-- MyPagePayList: 결제+수강신청 완료된 내역 리스트 조회 페이지  -->
								</div>
							</c:if>
							<!-- TEACHER 로그인-->
							<c:if test="${sessionScope.loginUser.user_lv eq 'T'}">
								<div class="widget edgtf-login-register-widget edgtf-user-not-logged-in">
											<c:url var="clssList" value="/clssList.do" />
											<a href='${ clssList }' title="clssList">클래스 찾기</a>
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="myInfo" value="/myInfo.do" />
									<a href='${ myInfo }' title="myInfo">마이 페이지</a> <!-- 개인정보 수정가능한 조회 페이지 -->
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="mylist" value="/mylist.do" />
									<a href='${ mylist }' title="mylist">마이 클래스</a> <!-- MyPagePayList: 결제+수강신청 완료된 내역 리스트 조회 페이지  -->
								</div>
							</c:if>
								
								<c:if test="${ empty sessionScope.loginUser }">
								<div class="widget edgtf-login-register-widget edgtf-user-not-logged-in">
										<c:url var="clssList" value="/clssList.do" />
										<a href='${ clssList }' title="clssList">클래스 찾기</a>
								</div>
								<div class="widget edgtf-login-register-widget edgtf-user-not-logged-in">
										<c:url var="loginpage" value="/loginpage.do" />
										<a href='${ loginpage }' title="log in">로그인</a>
								</div>
								<div
									class="widget edgtf-login-register-widget edgtf-user-not-logged-in">
										<c:url var="enrollview" value="/enrollView.do" />
										<a href='${ enrollview }' title="enroll">회원가입</a>
								</div>
							</c:if>
						</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





							
							<div class="widget edgtf-login-register-widget">
								<c:url var="tInfo" value="/tInfo.do" />
								<a href='${ tInfo }' title="tInfo"> MY PAGE 강사 로그인 TEST</a>
							</div>
							<div class="widget edgtf-login-register-widget">
								<c:url var="menubar" value="/menubar.do" />
								<a href='${ menubar }' title="menubar"> menubar</a>
							</div>
							<div class="widget edgtf-login-register-widget">
								<c:url var="adlist" value="/adlist.do" />
								<a href='${ adlist }' title="adlist"> pay 관리자 목록조회</a>
							</div>
						</div>
					</div>
				</div>
				<div class="edgtf-slide-from-header-bottom-holder">
					<form action="https://urbango.qodeinteractive.com/" method="get">
						<div class="edgtf-form-holder">
							<input type="text" placeholder="Search here..." name="s"
								class="edgtf-search-field" autocomplete="off" required />
							<button type="submit"
								class="edgtf-search-submit edgtf-search-submit-icon-pack">
								<i class="edgtf-icon-font-awesome fa fa-search "></i>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>