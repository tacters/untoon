<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
<script type="text/javascript">
function main(){
	return "home.do";
};
</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
//전자결제대행사 = Payment Gateway (PG)
/*
회원가입 후 생성된
가맹점 식별코드를 이용해서 window.IMP 변수를 초기화합니다.
가맹점 식별코드는 관리자 페이지 로그인 한 뒤 시스템설정 → 내정보에서 확인할 수 있습니다.
IMP.init()호출은 최초 1회 이루어져야하며, 페이지 로딩 단계에서 미리 호출해두시면 보다 효율적입니다.
*/
var IMP = window.IMP; // 생략가능
IMP.init('imp59263885'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
/*
결제 창을 띄워야 하는 페이지에서 아래의 IMP.request_pay({파라메터}) 함수를 호출합니다.
결제에 필요한 아래의 파라메터만 입력하고 함수를 실행하면 관리자 페이지에서 선택한 PG사의 결제 창이 실행됩니다.
복수PG를 이용할 경우 pg파라메터의 값만 바꿔넣으면 원하는 PG사의 결제 창으로 결제가 진행됩니다.
*/
IMP.request_pay({
    pg : 'kakao', // version 1.1.0부터 지원.
    pay_method : 'card', // 'samsung':삼성페이, 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 14000,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456',
    m_redirect_url : '' // 모바일 결제시, 결제가 끝나고 랜딩되는 URL을 지정 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
});
</script>
</head>
<body>
<h1> 결제하기 </h1>
<form action="pinsert.do" post="post">
<h3>주문정보</h3>
<p>${ clss.clss_title }</p> <br>
<p>${ clss.tchr_id }</p> &nbsp; &nbsp; <p>${clss.clss_start} ~ ${clss.clss_end}</p>
<hr>
<h3>고객 정보</h3>
<p><label>고객명 : <input type="text" name="name" value="${loginUser.name}"></label></p>
<p><label>연락처 : <input type="tel" name="phone" value="${loginUser.phone}"></label></p>
<hr>
<p>총 결제한 금액 : ${ clss.clss_price }</p>
<button onclick="main();">메인으로 돌아가기 </button>

</form>

</body>
</html>