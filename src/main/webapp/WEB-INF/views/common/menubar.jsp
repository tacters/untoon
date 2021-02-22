<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
</head>
<body>

<c:set var="contextPath"	value="${ pageContext.servletContext.contextPath }" scope="application" />

	<div class="edgtf-wrapper">
		<div class="edgtf-wrapper-inner">
			<div class="edgtf-top-bar edgtf-light">
				<div class="edgtf-vertical-align-containers">
					<div class="edgtf-position-left">
						<div class="edgtf-position-left-inner">
											<div class="edgtf-mobile-logo-wrapper">
												<a itemprop="url" href="${pageContext.request.contextPath}/">
													<img itemprop="image"
													src="${pageContext.request.contextPath}/resources/images/home/logo.png"
													alt="Logo"  style="height: 35px"/>
												</a>
											</div>
										</div>
					</div>
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
							<c:if test="${sessionScope.loginUser.user_lv eq 'S'}">
								<c:out value="${ loginUser.name }님은 오늘도 화이팅~!"/>&nbsp; &nbsp; &nbsp;
								<div class="widget edgtf-login-register-widget edgtf-user-not-logged-in">
											<c:url var="clssList" value="/clssList.do" />
											<a href='${ clssList }' title="clssList">클래스 찾기</a>
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="myInfo" value="/myInfo.do" />
									<a href='${ myInfo }' title="myInfo">마이 페이지</a> <!-- 개인정보 수정가능한 조회 페이지 -->
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="pmselect" value="/pmselect.do" />
									<a href='${ pmselect }' title="pmselect">마이 클래스</a> <!-- selectMyPay(): 결제+수강신청 완료된 내역 리스트 조회 페이지  -->
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="logout" value="/logout.do" />
									<a href='${ logout }' title="logout">로그아웃</a>
								</div>
							</c:if>
							
							<!-- TEACHER 로그인-->
							<c:if test="${sessionScope.loginUser.user_lv eq 'T'}">
								<c:out value="재능많은 ${ loginUser.name } 강사님은 오늘도 화이팅~!"/>&nbsp; &nbsp; &nbsp;
								<div class="widget edgtf-login-register-widget edgtf-user-not-logged-in">
											<c:url var="tinsert" value="/tinsert.do" />
											<a href='${ tinsert }' title="tinsert">클래스 등록하기</a>
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="myInfo" value="/myInfo.do" />
									<a href='${ myInfo }' title="myInfo">마이 페이지</a> <!-- 개인정보 수정가능한 조회 페이지 -->
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="pmselect" value="/pmselect.do" />
									<a href='${ pmselect }' title="pmselect">마이 클래스</a> <!-- selectMyPay(): 결제+수강신청 완료된 내역 리스트 조회 페이지  -->
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="logout" value="/logout.do" />
									<a href='${ logout }' title="logout">로그아웃</a>
								</div>
							</c:if>
							
							<!-- ADMIN 로그인-->
							<c:if test="${sessionScope.loginUser.user_lv eq 'A'}">
								<c:out value="${ loginUser.name }님은 관리하시느라 수고 많으세용 ㅠㅜ~!"/>&nbsp; &nbsp; &nbsp;
								<div class="widget edgtf-login-register-widget edgtf-user-not-logged-in">
											<c:url var="adnclist" value="/adnclist.do" />
											<a href='${ adnclist }' title="adnclist">클래스 인증하기</a> <!-- 관리자 미승인 클래스 목록보기 -->
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="myInfo" value="/myInfo.do" />
									<a href='${ myInfo }' title="myInfo">마이 페이지</a> <!-- 개인정보 수정가능한 조회 페이지 -->
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="plist" value="/plist.do" />
									<a href='${ plist }' title="plist">마이 클래스</a> <!-- 결제내역 목록 조회하기(관리자) -->
								</div>
								<div class="widget edgtf-login-register-widget">
									<c:url var="logout" value="/logout.do" />
									<a href='${ logout }' title="logout">로그아웃</a>
								</div>
							</c:if>
						</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>