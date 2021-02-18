<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
<link href="${ pageContext.request.contextPath }/resources/css/myPage/intro_style.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/myPage/swiper.min.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/myPage/awesomplete.css">
<link type="text/css" rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/myPage/style_base.css" />
<!-- <link type="text/css/myPage" rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myPage/style_base.css?bid=jWuYNsKu" /> -->
<link type="text/css" rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/myPage/style.css" />
<!-- <link type="text/css/myPage" rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myPage/style.css?bid=jWuYNsKu" /> -->
<link type="text/css" rel="stylesheet"
	href=" /resources/css/myPage/style_effect.css" />
<!-- <link type="text/css/myPage" rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myPage/style_effect.css?bid=jWuYNsKu" /> -->
<link type="text/css" rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/myPage/style_responsible.css" />
<!-- <link type="text/css/myPage" rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myPage/style_responsible.css?bid=jWuYNsKu" /> -->
<link type="text/css" rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/myPage/style_nalrarang.css" />
<!-- <link type="text/css/myPage" rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myPage/style_nalrarang.css?bid=jWuYNsKu" /> -->

<!-- <link rel="shortcut icon" href="/static/img/favicon.png" />
<link rel="apple-touch-icon" href="/static/img/m_favicon.png" /> -->
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/myPage/mypage.js"></script>

<!-- 마이페이지 스크립트 -->
<script type="text/javascript">
$(function(){
	$(document).ready(function(){
		$("#myClassSubContent").css('display', 'none');
		$("#payListContent").css('display', 'none');
		$("#myReplyContent").css('display', 'none');
		$("#classReplyContent").css('display', 'none');
		$("#qaContent").css('display', 'none');
		$("#insertTeacherContent").css('display', 'none');
		$("#changePassContent").css('display', 'none');
		$("#quitContent").css('display', 'none');
		$("#changeProfileContent").css('display', 'none');
	});  
	
	// 내 클래스 관리 클릭시
	$("#myClass").click(function(){
		$(".mymenu-sub", "#myClassList").css('display','block');
		$(".mymenu-sub", "#myBoardList").css('display',"none");
		$(".mymenu-sub", "#myPageList").css('display', 'none');
		$(".mymenu-sub", "#favorite_sub").css("display", "none");
		
		// 나의 활동 내역 sub가 보이지 않게
			$("#myReplyContent").css('display','none');
			$("#classReplyContent").css("display","none");
			$("#qaContent").css('display','none');
		
		// 내 정보 관리 sub가 보이지 않게 
			$("#quitContent").css("display","none");
			$("#changePassContent").css("display","none");
			$("#insertTeacherContent").css('display', 'none');
			$("#changeProfileContent").css('display', 'none'); 
		
		$("#myClassSub").click(function(){
			$("#myClassSubContent").css("display", "block");
			$("#payListContent").css("display", "none");
		});
		
		$("#payList").click(function(){
			$("#myClassSubContent").css("display", "none");
			$("#payListContent").css("display", "block");
		});
		
	});	
	
	// 나의 활동내역 클릭시
	$("#myBoard").click(function(){
		$(".mymenu-sub", "#myClassList").css('display','none');
		$(".mymenu-sub", "#myBoardList").css('display',"block");
		$(".mymenu-sub", "#myPageList").css('display', 'none');
		$(".mymenu-sub", "#favorite_sub").css("display", "none");
		
		// 내 클래스 관리 sub가 보이지 않게
			$("#myClassSubContent").css("display", "none");
			$("#payListContent").css("display", "none");
			
		// 내 정보 관리 sub가 보이지 않게 
			$("#quitContent").css("display","none");
			$("#changePassContent").css("display","none");
			$("#insertTeacherContent").css('display', 'none');
			$("#changeProfileContent").css('display', 'none'); 
		
		$("#myReply").click(function(){
			$("#myReplyContent").css('display','block');
			$("#classReplyContent").css("display","none");
			$("#qaContent").css('display','none');
			
		});
		
		$("#classReply").click(function(){
			$("#myReplyContent").css('display','none');
			$("#classReplyContent").css("display","block");
			$("#qaContent").css('display','none');
		});
		
		$("#qa").click(function(){
			$("#myReplyContent").css('display','none');
			$("#classReplyContent").css("display","none");
			$("#qaContent").css('display','block');
	
		});
			
	});  //내 활동 내역 end

	// 내 정보 관리 클릭시
	$("#myPage").click(function(){
		$(".mymenu-sub", "#myClassList").css('display','none');
		$(".mymenu-sub", "#myBoardList").css('display',"none");
		$(".mymenu-sub", "#myPageList").css('display', 'block');
		$(".mymenu-sub", "#favorite_sub").css("display", "none");
		
		
		// 내 클래스 관리 sub가 보이지 않게
			$("#myClassSubContent").css("display", "none");
			$("#payListContent").css("display", "none");
		// 나의 활동 내역 sub가 보이지 않게
			$("#myReplyContent").css('display','none');
			$("#classReplyContent").css("display","none");
			$("#qaContent").css('display','none');
		
		// 내 정보 관리 > 서브메뉴
		$("#insertTeacher").click(function(){
			$("#insertTeacherContent").css('display', 'block');
			$("#changePassContent").css("display","none");
			$("#quitContent").css("display","none");
			$("#changeProfileContent").css('display', 'none');
		});
		
		$("#changePass").click(function(){
			$("#changePassContent").css("display","block");
			$("#insertTeacherContent").css('display', 'none');
			$("#quitContent").css("display","none");
			$("#changeProfileContent").css('display', 'none');
		});
		
		$("#quit").click(function(){
			$("#quitContent").css("display","block");
			$("#changePassContent").css("display","none");
			$("#insertTeacherContent").css('display', 'none');
			$("#changeProfileContent").css('display', 'none');
		});
		
		$("#changeProfile").click(function(){
			$("#quitContent").css("display","none");
			$("#changePassContent").css("display","none");
			$("#insertTeacherContent").css('display', 'none');
			$("#changeProfileContent").css('display', 'block');
		});

});// 내 정보 관리 end
	
	
	
});//function end


</script>
</head>
<body onload="함수이름">

	<!-- 마이페이지 시작 -->
	<div class="wrap" id="wrap">
		<div class="container">
			<div class="my-summary-wrap">
				<div class="profile-wrap">
					<div class="profile-thumb-wrap">
						<!-- <img src="../static/img/bg-add-thumb.png" onError="this.src='../static/img/bg-add-thumb.png'" class="thumb-profile" alt="프로필사진" /> -->
					</div>
					<div class="profile-info-wrap">
						안녕하세요.
						<div class="profile-name cut-txt"></div>
						<!--a href="javascript:;" title="프로필 사진 편집" class="btn-profile-thumb">프로필 사진 편집</a-->
						<label for="upload" class="btn-profile-thumb">프로필 사진 편집</label>
					</div>
				</div>
			</div>

			<!-- MyMenu -->
			<div class="mymenu-wrap">
				<div class="mymenu-cont">
					<ul class="mymenu-list">

						<li class="mymenu"><a href="#" id="myClass" title="내 클래스 관리" class="btn-mymenu btn-mymenu-on">내 클래스 관리</a></li>
						<!-- <li class="mymenu"><a href="#" onclick="return myMenu();" title="주문/배송관리" class="btn-mymenu btn-mymenu-on">주문/배송관리</a></li> -->
						<!-- <li class="mymenu"><button title="주문/배송관리" id="btn-mymenu btn-mymenu-on">주문/배송관리</button></li> -->
						<!-- <li class="mymenu"><button id="mymenu"
								class="btn-mymenu btn-mymenu-on">내 클래스 관리</button></li> -->
						<!--         <li class="mymenu i-subscript"><a href="/mypage.html?m=subscript&s=subscript" title="정기구독 관리" data-submenu="mymenu-subscript" class="btn-mymenu">정기구독 관리</a></li>-->
						<li class="mymenu"><a href="#" id="myBoard" title="나의 활동 내역"
							data-submenu="mymenu-address" class="btn-mymenu">나의 활동 내역</a></li>
						<li class="mymenu"><a href="#" id="myPage" title="내 정보 관리"
							data-submenu="mymenu-action-history"
							class="btn-mymenu btn-mymenu-action-history">내 정보 관리</a></li>
						<!-- <li class="mymenu"><a href="/mypage.html?m=myinfo&s=profile"
							title="내 정보 관리" data-submenu="mymenu-myinfo" class="btn-mymenu">내
								정보 관리</a></li> -->
					</ul>
				</div>
				<a href="#" id="favorite" title="취미 보관함" class="btn-favorite">찜한 클래스</a>
			</div>
			<!-- MyMenuSubMenu -->
			<div class="mymenu-sub-wrap">
				<div class="mymenu-sub-cont">
					<ul class="mymenu-sub-list" id="myClassList">
						<li class="mymenu-sub"><a href="#" id="myClassSub" title="내 클래스 관리" data-submenu="order"
							class="btn-mymenu-sub mymenu-order sub-menu-order">내 클래스 관리</a></li>
						<li class="mymenu-sub"><a href="#" id="payList" title="정기구독 일정 확인"
							data-submenu="subscript"
							class="btn-mymenu-sub mymenu-subscript sub-menu-subscript">결제 내역</a></li>
					</ul>
					<ul class="mymenu-sub-list" id="myBoardList">
						<ul class="mymenu-sub-list" id="myBoardList">
						<li class="mymenu-sub"><a href="#" title="내가 쓴 댓글"
							data-submenu="payment" id="myReply"
							class="btn-mymenu-sub mymenu-subscript sub-menu-payment">내가 쓴 댓글</a></li>
						<li class="mymenu-sub"><a href="# title="클래스 후기"
							data-submenu="addresslist" id="classReply"
							class="btn-mymenu-sub mymenu-address sub-menu-addresslist">클래스 후기</a></li>
						<li class="mymenu-sub"><a href="#" title="1:1 문의 내역"
							data-submenu="newaddress" id="qa"
							class="btn-mymenu-sub mymenu-address sub-menu-newaddress">1:1 문의 내역</a></li>
					</ul>
					</ul>
					<ul class="mymenu-sub-list" id="myPageList">
						<li class="mymenu-sub"><a href="#" id="changeProfile" title="회원정보 수정" data-submenu="comment" 
							class="btn-mymenu-sub mymenu-action-history sub-menu-comment">회원정보 수정</a></li>
						<li class="mymenu-sub"><a href="#" id="changePass" title="비밀번호 변경" data-submenu="review"
							class="btn-mymenu-sub mymenu-action-history sub-menu-review">비밀번호 변경</a></li>
						<li class="mymenu-sub"><a href="#" id="quit" title="회원 탈퇴"
							data-submenu="qna"
							class="btn-mymenu-sub mymenu-action-history sub-menu-qna">회원 탈퇴</a></li>
						<li class="mymenu-sub"><a href="#" id="insertTeacher" title="강사로 지원하기"
							data-submenu="profile"
							class="btn-mymenu-sub mymenu-myinfo sub-menu-profile">강사로 지원하기</a>
						</li>
					</ul>
					<ul class="mymenu-sub-list" id="favorite_sub">
						<li class="mymenu-sub"><a
							href="/mypage.html?m=myinfo&s=password" title="취미 클래스"
							data-submenu="password"
							class="btn-mymenu-sub mymenu-myinfo sub-menu-password">취미 클래스</a></li>
					</ul>
					<!-- <ul>
						<li class="mymenu-sub"><a href="/mypage.html?m=myinfo&s=exit"
							title="회원탈퇴" data-submenu="exit"
							class="btn-mymenu-sub mymenu-myinfo sub-menu-exit">회원탈퇴</a></li>
						<li class="mymenu-sub"><a
							href="/mypage.html?m=favorite&s=class" title="취미 클래스"
							data-submenu="class"
							class="btn-mymenu-sub mymenu-favorite sub-menu-class">취미 클래스</a>
						</li>
						<li class="mymenu-sub"><a
							href="/mypage.html?m=favorite&s=magazine" title="매거진"
							data-submenu="magazine"
							class="btn-mymenu-sub mymenu-favorite sub-menu-magazine">매거진</a>
						</li>
					</ul> -->
				</div>
				<div class="reply-info-wrap"></div>
				<div class="mymenu-sub-tab-wrap"></div>
			</div>
			<!-- MyMenu Content -->
			<article class="mymenu-content">
				<section class="order-list-wrap order-list" id="myMenuContent"></section> <!-- 여분 -->
				<!-- 내 클래스 관리 -->
				<section class="order-list-wrap order-list" id="myClassSubContent">
				클래스관리 내용
				</section>
				<!-- 결제 내역 -->
				<section class="order-list-wrap order-list" id="payListContent">
				결제 내역 내용
				</section>
				<!-- 내가 쓴 댓글 -->
				<section class="order-list-wrap order-list" id="myReplyContent">
				내가 쓴 댓글 내용
				</section>
				<!-- 클래스 후기 -->
				<section class="order-list-wrap order-list" id="classReplyContent">
				클래스 후기 내용
				</section>
				<!-- 1:1 문의내역 -->
				<section class="order-list-wrap order-list" id="qaContent">
				1 : 1 문의내역 내용
				</section>
				 <!-- <table width='500' border='1'>
				   <tr><td>이름</td><td><input type='text' value='김재윤'></td>	 input type 수정해야함 
				   </tr>
			  	<tr>
			  	<td>이메일</td>
			  	<td>jaeyeun95@naver.com</td>
			  	</tr>
			  	<tr>
			  	<td>전화번호</td>
			  	<td><input type='text' name='phone'></td>
			  	</tr>
			  	</table> -->
			  	<section class="order-list-wrap order-list" id="changeProfileContent">
			  	  <div class="edit-membership-tit">
				         회원 정보 수정
				         </div>
				         <div class="edit-membership-cont">
				         <div class="edit-membership">
				         <table class="table-edit-membership">
				         <colgroup>
				         <col class="col-membership01" />
				         <col class="col-membership02" />
				         </colgroup>
				         <tbody>
				         <tr>
				         <th class="edit-membership-th">닉네임</th>
				         <td class="edit-membership-td">
				         <div class="input-wrap"><input type="text" class="input edit-nickname" value="el태그넣기" /></div>
				         </td>
				         </tr>
				         </tbody>
				         </table>
				         </div>
				         <div class="edit-membership">
				         <table class="table-edit-membership">
				         <colgroup>
				         <col class="col-membership01" />
				         <col class="col-membership02" />
				         </colgroup>
				         <tbody>
				         <tr>
				         <th class="edit-membership-th2">이메일</th>
				         <td class="edit-membership-td">
				         ()el태그 써서 가져오기)
				         </td>
				         </tr>
				         <tr>
				         <th class="edit-membership-th2">휴대폰번호</th>
				         <td class="edit-membership-td">
				         <div class="edit-membership-phone">
				         <div class="input-wrap">
				         <input type="tel" class="input edit-prifle-phone1" value=" 요부분 " maxlength="3" />
				         </div>
				         <div class="input-wrap">
				         <input type="tel" class="input edit-prifle-phone2" value=" 이 value값 " maxlength="4" />
				         </div>
				         <div class="input-wrap">
				         <input type="tel" class="input edit-prifle-phone3" value=" 수정해야함 " maxlength="4" />
				         </div>
				        	<!-- if (MyProfile.userinfo.user_phone_verify == "Y") {
				             <a href="#link" title="인증" class="btn-edit-membership-phone phone-auth-btn">인증 완료</a>
				             </div>
				             <div class="edit-membership-confirm" style="display:none">
				             <div class="input-wrap">
				             <input type="text" class="input auth-number" />
				             </div>
				             <a href="#link" title="확인" class="btn-edit-membership-confirm" style="vertical-align:middle">확인</a>
				             <span class="confirm-time auth-time"></span>
				             <div class="table-txt txt-color-r auth-error-msg"></div>
				             </div>
				      	  } else {
				             <a href="#link" title="인증" class="btn-edit-membership-phone phone-auth-btn">인증</a>
				             </div>
				             <div class="edit-membership-confirm">
				             <div class="input-wrap">
				             <input type="text" class="input auth-number" />
				             </div>
				             <a href="#link" title="확인" class="btn-edit-membership-confirm" style="vertical-align:middle background:#3d4248">확인</a>
				             <span class="confirm-time auth-time"></span>
				             <div class="table-txt txt-color-r auth-error-msg"></div>
				             </div>
				        } -->
				        <a href="#link" title="인증" class="btn-edit-membership-phone phone-auth-btn">인증</a>
				        <a href="#link" title="인증" class="btn-edit-membership-phone phone-auth-btn">인증 완료</a>
				
				         <div class="edit-membership-input-info">
				        	 입력하신 이메일/ 휴대폰 번호로 비밀번호 찾기 및 재설정을 하실 수 있습니다.
				         </div>
				         </td>
				         </tr>
				         </tbody>
				         </table>
				         </div>
				         <div class="edit-membership edit-membership-border">
				         <table class="table-edit-membership">
				         <colgroup>
				         <col class="col-membership01" />
				         <col class="col-membership02" />
				         </colgroup>
				         <tbody>
				         <tr>
				         <th class="edit-membership-th2">이름</th>
				         <td class="edit-membership-td">
				        	(el태그로 이름 가져오기)
				         </td>
				         </tr>
				         <tr>
				         <th class="edit-membership-th2">생년월일</th>
				         <td class="edit-membership-td">
				
				
				             <div class="edit-membership-bitrhday">
				             <div class="input-wrap"><input type="text" class="input edit-birth-year" />value 에</div>년
				             <div class="input-wrap"><input type="text" class="input edit-birth-month" />값 가져오기</div>월
				             <div class="input-wrap"><input type="text" class="input edit-birth-day" />~~~</div>일
				             </div>
				
				         </td>
				         </tr>
				         </tbody>
				         </table>
				         </div>
				         <div class="edit-membership-btn">
				         <a href="#link" title="수정완료" class="btn-edit-membership edit-profile-btn">수정완료<-링크수정해야함</a>
				         </div>
				         </div>
				</section>
				<!-- 비밀번호 변경 -->
				<section class="order-list-wrap order-list" id="changePassContent">
				<div class="edit-membership-tit">
					         비밀번호 변경
				</div>
		         <div class="edit-membership-cont">
		         <div class="edit-membership edit-membership-border">
		         <table class="table-edit-membership">
		         <colgroup>
		         <col class="col-membership01" />
		         <col class="col-membership02" />
		         </colgroup>
		         <tbody>
		         <tr>
		         <th class="edit-membership-th2">현재 비밀번호</th>
		         <td class="edit-membership-td">
		         <div class="input-wrap"><input type="password" class="input cur-password" /></div>
		         </td>
		         </tr>
		         <tr>
		         <th class="edit-membership-th2">새 비밀번호</th>
		         <td class="edit-membership-td">
		         <div class="input-wrap"><input type="password" class="input new-password" /></div>
		         <div class="change-pw-info">비밀번호는 6~16자 영문, 숫자를 사용해주세요.</div>
		         </td>
		         </tr>
		         <tr>
		         <th class="edit-membership-th2">새 비밀번호 확인</th>
		         <td class="edit-membership-td">
		         <div class="input-wrap"><input type="password" class="input confirm-password" /></div>
		         <div class="change-pw-info">비밀번호 확인을 위해 새 비밀번호를 다시 한번 더 입력해주세요.</div>
		         </td>
		         </tr>
		         </tbody>
		         </table>
		         </div>
		         <div class="edit-membership-btn">
		         <a href="#link" title="변경완료" class="btn-edit-membership change-pass-btn">변경완료</a>
		         </div>
		         </div>
				</section>
				<section class="order-list-wrap order-list" id="quitContent">
				<div class="quit-membership-tit">
			         <div class="quit-tit">그 동안 언투온을 이용해주셔서 감사합니다.</div>
			         <div class="quit-txt">
			        	 고객님께서 회원 탈퇴를 원하신다니 저희 서비스가 많이 부족하고 미흡했나 봅니다.<br/>
			        	 불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.
			         </div>
			         </div>
			         <div class="quit-membership-cont">
			         <div class="edit-membership-tit">
			        	 회원탈퇴 안내
			         </div>
			         <div class="info-quit-membership">
			         • 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 hobbyful 고객정보 보호정책에 따라 관리 됩니다.<br/>
			         • 탈퇴 시 보유하고있던 마일리지, 쿠폰은 모두 영구 삭제됩니다.<br/>
			         • 정기구독이 진행 중인 경우에는 탈퇴가 불가능하며, 취소/반품이 완료된 이후 가능합니다.<br/>
			         • 탈퇴 후 24시간 동안 기존에 사용하신 이메일과 휴대폰 번호로는 재가입이 불가능합니다.
			         </div>
			         </div>
			         <div class="quit-membership-cont">
			         <div class="edit-membership-btn">
			         <a href="#link" title="탈퇴하기" class="btn-edit-membership exit-user-btn">탈퇴하기</a>
			         </div>
			         </div>
				</section>
				<section class="haed_count" id="insertTeacherContent">
				<div class="head_cont">
					<div class="inbox">
					<a href="/Account/LoginPage.php" onclick="alert("로그인이 필요합니다") "
					<div class="button"  id="btn-menu-login">
					강사 등록하기
					</div>
					</a>
					</div>
				</div>
				</section>
			</article>
		</div>


	</div>
	<!-- 마이페이지 끝 -->
</body>
</html>