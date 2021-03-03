<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의등록</title>
<!-- iframe 스타일 -->
<style>
      #back{width:100vw;height:100vh;background:#000;opacity:0.7;display:none;position:fixed;top:0;z-index:10;}
      #pay_pop{width:700px;height:840px;position:fixed;left:0;right:0;margin:0 auto;top:70px;display:none;z-index:20}
      #pay_pop iframe{border-radius:10px;width:100%;height:100%;border:none;}
</style>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/clssInsert/common.css?ver=201204" media="all">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/clssInsert/notokr.css?ver=201204" media="all">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/clssInsert/jquery.mCustomScrollbar.css" media="all">
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }//resources/css/clssInsert/header_pc.css?ver=201204"/>
<link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/clssInsert/footer_pc.css?ver=201204"/>
<link type="text/css" rel="stylesheet"
		href="${ pageContext.request.contextPath }/resources/css/clssInsert/style.css?ver=20040210" />
		
<!-- 스크립트 -->
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<%-- <script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/insertClss/myPage/mypage.js"></script> --%>
<script src="${ pageContext.request.contextPath }/resources/js/insertClss/lazysizes.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/insertClss/jquery-ui.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/insertClss/tutor_common.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/insertClss/func13.js"></script>
<!--- pc,mobile 공통 스크립트-->
<script src="${ pageContext.request.contextPath }/resources/js/insertClss/prototype.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/insertClss/controll.js"></script>

<!-- <style>
input[type=file] {
	display: block
}
</style> -->
</head> 
<body>
<c:import url="../common/menubar.jsp"/>
	<form action="tcinsert.do" method="POST" id="frm-register-detail" enctype="multipart/form-data" name="insert">
	<input type="hidden" name="tchr_id" value="${ loginUser.id }">
		<div class="insertForm1">
		<div class="tutor_cont">
			<div class="dim" id="dim"></div>
			<div class="title_box">
				<h3>강의등록하기</h3>
			</div>
			<div class="info1">
				<span class="pink">*</span>필수
			</div>
			
			<div class="box">
				<div class="title">수업제목<b class="pink">*</b><br><br><span class="gray8">공백포함<br>최소10자~최대30자 이내</span></div>
				<div class="cont">
					<div class="caution caution2" id="classTipDiv">
						<b class="pink">TIP</b><br>
						<ul class="gray8">
						<li>누구를 대상으로, 어떤 재능을 가르치시나요?</li>
						<li>수업을 통해 어떤것을 얻어갈 수 있나요?</li>
						<li>예시:미국주식,내 손으로 직접 투자하자/4회만에 내 손으로 만든 영상,유튜브에업로드♥</li>
						<ul>
					</div>
					<div class="caution caution2" id="bookTipDiv" style="display:none">
						<b class="pink">TIP</b><br>
						<ul class="gray8">
						<li>누구를 대상으로, 어떤 재능을 공유하나요?</li>
						<li>전자책을 통해 어떤것을 얻어갈 수 있나요?</li>
						<li>예시:[강사전자책] 회사에서 사랑받는 비법(60page)</li>
						<ul>
					</div>
					<div class="inner1">
						<input type="text" class="basic nick" id="Title" name="clss_title" placeholder="수강생을 끌어당길 수 있는 개성넘치는 제목을 만들어 보세요.">
		                <span style="float:right;">(<span id="title_length">0</span>/100)</span>
					</div>
				</div>
			</div>
			<!-- 제목글자수세기 -->
			<script>
			$(function(){
				$('#Title').keyup(function (e){
					var title = $(this).val();
					
					/* $('#title_length').html("("+title.length +"/100)"); */
					$('#title_length').html(title.length);
							
					if(title.length > 100){
						alert("최대 100자까지 입력가능합니다.");
						$(this).val(title.substring(0,100));
						/* $('#title').html("(100 / 200)"); */
					}
				});
			});// function end
			</script>
	
			<div class="box">
				<div class="title">
					프로필사진<b class="pink">*</b>
				</div>
				<div class="cont">
					<div class="caution caution1">
						<b class="pink">주의</b><br> <span class="gray8">* 얼굴이
							나오지 않은 동물/캐릭터/단순배경사진/증명사진은 승인되지 않습니다.</span><br>
						<div style="overflow: hidden">
							<div class="pf">
								<img
									src="https://front-img.taling.me/Content/Images/tutor/Images/eximg01.png">
							</div>
							<div class="pf">
								<img
									src="https://front-img.taling.me/Content/Images/tutor/Images/eximg02.png">
							</div>
							<div class="pf">
								<img
									src="https://front-img.taling.me/Content/Images/tutor/Images/eximg03.png">
							</div>
							<div class="pf">
								<img
									src="https://front-img.taling.me/Content/Images/tutor/Images/eximg04.png">
							</div>
						</div>
					</div>
					<div style="margin: 30px 0">
						<img class="upf_b button"
							src="https://front-img.taling.me/Content/Images/tutor/Images/btn_pfimg.png">
						<div class="upf" id="picture-cover" id="ProfileThumbnailUrl"
							style="background-image: url('//s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/Profile/s_4c2bb13bbdf07495208dc87bcf2700e860e6f329.png')">
							<img
								src="//s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/Profile/s_4c2bb13bbdf07495208dc87bcf2700e860e6f329.png"
								style="width: 300px; height: 132px; float: right; margin-left: 582px; position: absolute; opacity: 0;" />
							<input type="hidden" id="ProfileThumbnailUrl"
								value="//s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/Profile/s_4c2bb13bbdf07495208dc87bcf2700e860e6f329.png" />
							<input type="file" id="picture" name="upfile"
								style="width: 150px; height: 130px; opacity: 0;" />
						</div>
					</div>
					<script>
                    $('#picture').change(function (e) {
                        var file = (e.target || window.event.srcElement).files[0];

                        var reader = new FileReader();
                        reader.onload = function() {
                            $('#picture-cover').css("background-image", "url('"+reader.result+"')");
                        }
                        reader.readAsDataURL(file);
                    });
                </script>
				</div>
			</div>
		</div>
		</div>

<!-- <form method="POST" id="frm-register-detail" enctype="multipart/form-data"> -->
<div class="tutor_cont">

		<div class="box">
		<div class="title">수업카테고리<b class="pink">*</b></div>
		<div class="cont">
			<select class="basic len320" id="CateMain" name="clss_category">
												<option value="">수업카테고리를 선택해 주세요</option>
												<option value="미술/공예" >미술/공예</option>
												<option value="뷰티/헬스" >뷰티/헬스</option>
												<option value="언어" >언어</option>
												<option value="머니" >머니</option>
												<option value="데이터" >데이터</option>
												<option value="기타" >기타</option>
									</select>
		</div>
	</div>
	<div class="box" id="groupBox">
		<div class="title">수업참여인원<b class="pink">*</b></div>
		<div class="cont">
			<div class="inner2"  id="minmax">
				<select class="basic len290" id="MinPerson" name="clss_min">
					<option value="" selected>최소인원수</option>
					 					 <option value="01" >1</option>
					 					 <option value="02" >2</option>
					 					 <option value="03" >3</option>
					 					 <option value="04" >4</option>
					 					 <option value="05" >5</option>
					 					 <option value="06" >6</option>
					 					 <option value="07" >7</option>
					 					 <option value="08" >8</option>
					 					 <option value="09" >9</option>
					 					 <option value="10" >10</option>
					 					 <option value="11" >11</option>
					 					 <option value="12" >12</option>
					 					 <option value="13" >13</option>
					 					 <option value="14" >14</option>
					 					 <option value="15" >15</option>
					 					 <option value="16" >16</option>
					 					 <option value="17" >17</option>
					 					 <option value="18" >18</option>
					 					 <option value="19" >19</option>
					 					 <option value="20" >20</option>
				</select>
				 명 ~ 

				<select class="basic len290" id="MaxPerson" name="clss_max" onchange="fn_person()">
					<option value="" selected>최대인원수</option>
										<option value="01" >1</option>
										 <option value="02" >2</option>
					 					 <option value="03" >3</option>
					 					 <option value="04" >4</option>
					 					 <option value="05" >5</option>
					 					 <option value="06" >6</option>
					 					 <option value="07" >7</option>
					 					 <option value="08" >8</option>
					 					 <option value="09" >9</option>
					 					 <option value="10" >10</option>
					 					 <option value="11" >11</option>
					 					 <option value="12" >12</option>
					 					 <option value="13" >13</option>
					 					 <option value="14" >14</option>
					 					 <option value="15" >15</option>
					 					 <option value="16" >16</option>
					 					 <option value="17" >17</option>
					 					 <option value="18" >18</option>
					 					 <option value="19" >19</option>
					 					 <option value="20" >20</option>
				</select>
				
				
			</div>
			<!-- 참여인원수 -->
			<script>
			function fn_person(){
				//var min = $("#MinPerson option:selected").val();
				//var max = $("#maxPerson option:selected").val();
				var min = document.getElementById("MinPerson");
				var max = document.getElementById("MaxPerson");
				
				console.log("min : " + min.value);
				console.log("max : " + max.value);
				
				if(min.value > max.value){
					console.log("여기넘어왔니")
					alert("최대 인원보다 최소 인원이 많습니다. 다시 확인해주세요.");
				}
				
			}
			
			</script>
			
		</div>
	</div>
	<div class="box">
				<div class="title">가격/시간/횟수<b class="pink">*</b></div>
		<div class="cont">
			<div class="inner1" style="margin:0">
				<div class="gray5 title">가격</div>
				<input type="text" id="UnitPrice" name="clss_price" class="basic phone" placeholder="클래스 가격을 입력하세요"> 원
			</div>
				<div class="inner1">
					<div class="gray5 title">1회당 수업시간</div>
					<select class="basic len320" id="Time" name="clss_duration">
						<option value="null">1회당 수업시간을 선택하세요</option>
						 						<option value="1" >1시간</option>
												<option value="2" >2시간</option>
												<option value="3" >3시간</option>
												<option value="4" >4시간</option>
												<option value="5" >5시간</option>
												<option value="6" >6시간</option>
										</select>
					시간
				</div>
				<div class="inner1">
					<div class="gray5 title">총 수업횟수</div>			
									
						<select id="TotalTimes" name="clss_times" class="basic len320">
						<option value="null">총 수업횟수를 선택하세요</option>
												<option value="1" >1회</option>
												<option value="2" >2회</option>
												<option value="3" >3회</option>
												<option value="4" >4회</option>
												<option value="5" >5회</option>
												<option value="6" >6회</option>
												<option value="7" >7회</option>
												<option value="8" >8회</option>
												<option value="9" >9회</option>
												<option value="10" >10회</option>
										</select> 
									회 <br>
							* 다회차 수업일 때 언투온 수강생들은 보통 <span class="pink">4~6회차 수업</span>을 선호합니다.<br>
							되도록 한 달 내에 끝낼 수 있도록 커리큘럼을 만들어주세요.
				</div>
				<div class="inner1">
					<div class="gray5 title">수업기간</div>			
					<label> 시작날짜 <input type="date" name="clss_start" class="basic phone" id="start_date">
					 ~  종강날짜 <input class="basic phone" type="date" name = "clss_end" id="end_date"></label>	
				</div>
		</div>
	</div>
	<script>
	$(function(){
		$("#end_date").change(function(){
			var start = $("#start_date").val();
			var startDateArr = start.split('-');
			
			var end = $("#end_date").val();
			var endDateArr = end.split('-');
			
			//var today = new Date();	//오늘날짜
			
			var startDate = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
			var endDate = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
			//var todayDate = new Date(todayArr[0], parseInt(todayArr[1]-1, todayArr[2]));
			var today = new Date();
			
			if(startDate.getTime() > endDate.getTime()){
				alert("시작날짜와 종료날짜를 확인 해 주세요");
				
				return;
			}
		});
	});
	</script>
	
	<div class="box">
		<div class="title">영상등록<br><br><span class="gray8">권장사항</span></div>
		<div class="cont">
			<div >
			<div class="caution caution1">
				<b class="pink">주의</b><br>
				<ul class="gray8">
				<li>일반 웹페이지 주소가 아닌,Youtbue 영상 URL를 입력해주세요.</li>
                <li>영상은 최대 5개까지 업로드 가능합니다.</li>
				<li>사용방법 : 영상 상세페이지에서 공유 버튼 클릭->팝업창에 나온 영상 URL 복사<br>->복사한 영상URL을 아래 입력창에 붙여넣기</li>
				<!--li style="color:#000">커버영상으로 등록을 원하신다면 해당 영상에 체크해주세요.</li-->
				<ul>
			</div>
			</div>
			<div class="inner1">
					<div class="vdo"><input type="text" name="clss_url" class="basic len786" placeholder="예) https://youtu.be/1sboNBkTMuU" style="margin-bottom:10px;width: 100%;"></div>
			</div>
		</div>
	</div>


</div>

<!-- insert4 -->
<div class="tutor_cont">
	<div class="box">
		<div class="title">강사소개<b class="pink">*</b><br><br><span class="gray8">공백포함 1000자 이하</span></div>
		<div class="cont" style="padding-top:15px">
			<div class="caution caution2">
				<b class="pink">TIP</b><br>
				<ul class="gray8">
					<li>강사님의 재능에 관한 경력 및 이력에 대해서 설명해주세요.</li>
					<li>강사님의 재능을 얻기 위해 겪었던 경험에 대해서 말씀해주세요.</li>
				</ul><br>
				<b class="pink">주의!</b><br>
				<ul class="gray8">
					일부 이모티콘은 인식이 되지 않아, 정성스럽게 작성해주신 내용이 날아갈 수 있습니다. 
					<br>강조를 해야 할 내용이 있는 경우 되도록이면 일반 특수문자(★/◎/♡)를 사용해주세요
				</ul>
			</div>
			<div class="inner1">
				<textarea class="basic len980 hei190" placeholder="수강생은 강사님에 대해 많은 관심을 가지고 있습니다. TIP을 참고하여 최대한 자세히 소개를 해주세요." id="TutorInfo" name="tchr_introduction"></textarea>
                <span style="float:right;">(<span id="teacher_info">0</span>/1000)</span>
			</div>
			<div class="inner1">
				<div class="sample1">
					<div class="arw">
						<img class="button" src="https://front-img.taling.me/Content/Images/tutor/Images/icon_down.png" onclick="arwpaper(this)">
						<img class="button" style="display:none"src="https://front-img.taling.me/Content/Images/tutor/Images/icon_up.png" onclick="arwpaper(this)">
					</div>
					<span>예시 이미지 및 화면보기</span>
					<div class="ex">
						<img src="https://front-img.taling.me/Content/Images/tutor/Images/img_example_04.png">
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		$("#TutorInfo").keyup(function(e){
			var content = $(this).val();
			
			$("#teacher_info").html(content.length);
			
			if(content.length > 1000){
				alert("최대 1000자까지 입력 가능합니다.");
				$(this).val(content.substring(0,1000));
			}
		});
	});
	</script>
	<div class="box">
		<div class="title">수업소개<b class="pink">*</b><br><br><span class="gray8">공백포함 2000자 이하</span></div>
		<div class="cont">
			<div class="caution caution2">
				<b class="pink">TIP</b><br>
				<ul class="gray8">
						<li>수업의 목표와 수업진행방식에 대해 설명해주세요.</li>
						<li>수업을 진행하는 동안 얻을 수 있는 결과물 혹은 수업 후 기대할 수 있는 발전에 대해 소개해주세요.</li>
						<li>다른 학원, 수업과는 다른 강사님만의 장점에 대해서 설명해주세요.</li>
						</ul><br>
				<b class="pink">주의!</b><br>
				<ul class="gray8">
					일부 이모티콘은 인식이 되지 않아, 정성스럽게 작성해주신 내용이 날아갈 수 있습니다. 
					<br>강조를 해야 할 내용이 있는 경우 되도록이면 일반 특수문자(★/◎/♡)를 사용해주세요
				</ul>
			</div>
						<div class="inner1">
				<textarea class="basic len980 hei190" placeholder="수업소개는 수강생이 가장 주의깊게 살펴보는 부분입니다. 수강생들이 수업에 대해 알 수 있도록 TIP의 질문을 반드시 포함하여 작성해주세요." id="clss_content" name="clss_content"></textarea>
                <span style="float:right;">(<span id="content_length">0</span>/2000)</span>
			</div>
			<!-- 수업소개 글자수 세기 -->
			<script>
			$(function(){
				$("#clss_content").keyup(function(e){
					var content = $(this).val();
					
					$("#content_length").html(content.length);
					
					if(content.length > 2000){
						alert("최대 2000자까지 입력 가능합니다.");
						$(this).val(content.substring(0,2000));
					}
				});
			});
			</script>
			<div class="inner1">
				<div class="gray5 title">태그<font class="gray8">최대10개 태그 가능</font></div>
				
							
				<div style="position: absolute;margin-top:11px;margin-left:15px;color: #9d9c9c;font-size: 16px;">#</div>
				<input type="text" class="basic phone" id="tag_place" placeholder="프로그래밍"  style="padding-left:25px">				
				<span class="img_upld verify button" onclick="add_tag()">추가</span>
				<!--button onclick="add_tag()">추가</button-->
				<script>
					function add_tag(){
						//alert($('#tag_place').val());
						var cont = $('#tag_place').val();
						if(check_tag(cont))
						{
							$('#tag_box').prepend('<div class="tags"><span>'+$('#tag_place').val()+'</span><img src="${ pageContext.request.contextPath }/resources/css/clssInsert/xbtn.png" onclick="del_tag(this)"><input class="tag_values" type="hidden" name="clss_tags" value="'+$('#tag_place').val()+'"></div>');									
							/* $('#tag_box').prepend('<div class="tags"><span>'+$('#tag_place').val()+'</span><img src="${ pageContext.request.contextPath }/resources/css/clssInsert/xbtn.png" onclick="del_tag(this)"><input class="tag_values" type="hidden" name="tags[]" value="'+$('#tag_place').val()+'"></div>'); */
						}
						$('#tag_place').val('');
					}

					function del_tag(e)
					{
						e.parentNode.parentNode.removeChild(e.parentNode);
					}


					function check_tag(cont){
						//alert($('.tag_box').find('.tag_values').size());
						var num = $('.tags').length;
						if(num==10)
						{
							alert('태그는 10개 까지 등록 가능합니다');
							return false;
						}
						else if (cont == '')
						{
							alert('내용을 입력해주세요');
							return false;
						}
						
						for(var i =0; i<num;i++)
						{
							//alert($('.tag_box').find('.tag_values').eq(i).val());
							if(cont==$('.tags').find('.tag_values').eq(i).val())
							{
								alert('이미 존재하는 태그입니다');
								return false;
							}
						}
						return true;
					}
				</script>
				
				<div style="overflow:hidden;" id="tag_box">
				</div>
			</div>
			<div class="sample1 inner1">
				<div class="arw">
					<img class="button" src="https://front-img.taling.me/Content/Images/tutor/Images/icon_down.png" onclick="arwpaper(this)">
					<img class="button" style="display:none"src="https://front-img.taling.me/Content/Images/tutor/Images/icon_up.png" onclick="arwpaper(this)">
				</div>
				<span>예시 이미지 및 화면보기</span>
				<div class="ex"><img src="https://front-img.taling.me/Content/Images/tutor/Images/img_example_05.png"></div>
			</div>
		</div>
	</div>
	<div class="box">
		<div class="title">짧은강사소개(프로필)<b class="pink">*</b><br><br><span class="gray8">공백포함 50자 이하로 해주세요</span></div>
		<div class="cont">
			<div class="caution caution2">
				<b class="pink">TIP</b><br>
				<ul class="gray8">
					<li>강사님에 대해서 임팩트 있는 내용을 써주세요.</li>
					<li>강사님만의 강점을 입력해 주세요</li>
				</ul><br>
			</div>
			<div class="inner1">
				<textarea class="basic len980 hei190" placeholder="TIP의 내용을 참고하여 강사님의 수업을 수강하기에 적합한 수업대상에 대해 알려주세요. " id="profile" name="tchr_profile"></textarea>
                <span style="float:right;">(<span id="profile_length">0</span>/50)</span>
			</div>
			<div class="sample1 inner1">
				<div class="arw">
					<img class="button" src="https://front-img.taling.me/Content/Images/tutor/Images/icon_down.png" onclick="arwpaper(this)">
					<img class="button" style="display:none"src="https://front-img.taling.me/Content/Images/tutor/Images/icon_up.png" onclick="arwpaper(this)">
				</div>
				<span>예시 이미지 및 화면보기</span>
				<div class="ex"><img src="https://front-img.taling.me/Content/Images/tutor/Images/img_example_06.png"></div>
			</div>
		</div>
	</div>
	<!-- 강사 프로필 글자수 세기 -->
			<script>
			$(function(){
				$("#profile").keyup(function(e){
					var content = $(this).val();
					
					$("#profile_length").html(content.length);
					
					if(content.length > 50){
						alert("최대 50자까지 입력 가능합니다.");
						$(this).val(content.substring(0,50));
					}
				});
			});
			</script>
	
	<div class="box">
		<div class="title">환불규정<b class="pink">*</b><br><br><span class="gray8">공백포함 500자 이하</span></div>
		<div class="cont">
			<div class="caution caution2">
				<b class="pink">TIP</b><br>
				<ul class="gray8">
						<li>수업의 환불규정에 대해 설명해주세요.</li>
						<li>환불 규정에 대해서 상세하게 설명해주세요.</li>
				</ul><br>
			</div>
				<div class="inner1">
				<textarea class="basic len980 hei190" placeholder="수업소개는 수강생이 가장 주의깊게 살펴보는 부분입니다. 수강생들이 수업에 대해 알 수 있도록 TIP의 질문을 반드시 포함하여 작성해주세요." id="policy" name="clss_policy"></textarea>
                <span style="float:right;">(<span id="policy_length">0</span>/500)</span>
			</div>
		</div>
	</div>
	<!-- 환불규정 글자수 세기 -->
			<script>
			$(function(){
				$("#policy").keyup(function(e){
					var content = $(this).val();
					
					$("#policy_length").html(content.length);
					
					if(content.length > 500){
						alert("최대 500자까지 입력 가능합니다.");
						$(this).val(content.substring(0,500));
					}
				});
			});
			</script>


			<div class="button_box" style="width:680px">
				<!-- <input class="next button on" type="submit" value="최종승인요청">&nbsp;&nbsp;&nbsp;&nbsp; -->
				<input class="next button on" type="button" onclick="check()" value="최종승인요청">&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="next button prev" type="reset" value="작성취소">
				
			</div>
		
</div>
</form>
<!-- 값 입력확인 스크립트 -->
<script>
function check(){
	title = document.getElementById("Title").value;
	picture = document.getElementById("picture").value;
	cate = document.getElementById("CateMain").value;
	mip = document.getElementById("MinPerson").value;
	maxp = document.getElementById("MaxPerson").value;
	price = document.getElementById("UnitPrice").value;
	times = document.getElementById("Time").value;
	totaltimes = document.getElementById("TotalTimes").value;
	start = document.getElementById("start_date").value;
	end = document.getElementById("end_date").value;
	tinfo = document.getElementById("TutorInfo").value;
	content = document.getElementById("clss_content").value;
	profile = document.getElementById("profile").value;
	policy = document.getElementById("policy").value;
	
	if(title == ""){
		alert("제목을 입력하세요.");
		document.getElementById("Title").focus();
		return false;
	}
	if(picture == ""){
		alert("강의 사진을 등록하세요");
		document.getElementById("picture").focus();
		return false;
	}
	if(cate == ""){
		alert("카테고리를 선택하세요.");
		document.getElementById("CateMain").focus();
		return false;
	}
	if(mip == ""){
		alert("최소인원을 입력하세요.");
		document.getElementById("MinPerson").focus();
		return false;
	}
	if(maxp == ""){
		alert("최대인원을 입력하세요.");
		document.getElementById("MaxPerson").focus();
		return false;
	}
	if(price == ""){
		alert("가격을 입력하세요.");
		document.getElementById("UnitPrice").focus();
		return false;
	}
	if(times == "null"){
		alert("수업시간을 입력하세요.");
		document.getElementById("Time").focus();
		return false;
	}
	if(totaltimes == "null"){
		alert("총 횟수를 입력하세요.");
		document.getElementById("TotalTimes").focus();
		return false;
	}
	if(start == ""){
		alert("시작날짜를 입력하세요.");
		document.getElementById("start_date").focus();
		return false;
	}
	if(end == ""){
		alert("종강날짜를 입력하세요.");
		document.getElementById("end_date").focus();
		return false;
	}
	if(tinfo == ""){
		alert("강사소개를 입력하세요.");
		document.getElementById("TutorInfo").focus();
		return false;
	}
	if(content == ""){
		alert("수업내용을 입력하세요.");
		document.getElementById("clss_content").focus();
		return false;
	}
	if(profile == ""){
		alert("강사 프로필을 입력하세요.");
		document.getElementById("profile").focus();
		return false;
	}
	if(policy == ""){
		alert("환불규정을 입력하세요.");
		document.getElementById("policy").focus();
		return false;
	}
	else{
		document.insert.submit();	
	}
	
}
</script>
<footer><c:import url="../common/footer.jsp"/></footer>


</body>
</html>