/**
 *  	for clssDetailView.jsp
 */
 
 TML SCSS JSResult Skip Results Iframe
EDIT ON
// DrawLine code by greensock
/* Variables */
const orig = document.querySelector('.draw-circle path'),
      monthHtml = document.querySelector('.calendar__month'),
      yearHtml = document.querySelector('.calendar__year');
let length, timer, 
    html = '',
    daysHtml =  document.querySelector('.calendar__days');

const svgCircle = document.querySelector('#circle-1');

//DATES 
let thisDay = new Date(),
    thisMonth = thisDay.getMonth();


var obj = {length:0,
           pathLength:orig.getTotalLength()};

var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
];

/* Functions */
function drawLine(useEl) {
  useEl.style.strokeDasharray = [obj.length,obj.pathLength].join(' ');
}

function createUseEl(svg, el) {
    //create new use element on click
  var useElement =
    document.createElementNS('http://www.w3.org/2000/svg', 'use');

    document.querySelector(svg).appendChild(useElement);
  
    useElement.setAttributeNS(
        'http://www.w3.org/1999/xlink',
        'href', 
         el);
  return useElement
}


// get date + add month, year and days + bigger colored circle around today
function daysInMonth(month,year) {
    return new Date(year, month, 0).getDate();
}

//Get current season
function getSeason(date) {
  if(thisMonth === 12) {
      thisMonth = 0;
    }
  if(thisMonth === -1) {
      thisMonth = 11;
    }
 
    let month = thisMonth;
    let season = '';
  
  
    switch(month) {
        case 11:
        case 0:
        case 1:
            season = 'winter';
        break;
        case 2:
        case 3:
        case 4:
            season = 'spring';
        break;
        case 5:
        case 6:
        case 7:
            season = 'summer';
        break;
        case 8:
        case 9: 
        case 10:
            season = 'fall';
        break;
    }
    return season;
}


function addDate() {
  html = '';

  let today = new Date(),
        year = today.getFullYear(),
        month = monthNames[thisMonth],
        day = today.getDate(),
        totalDays = daysInMonth(today.getMonth()+1, year);
    monthHtml.innerHTML = `${month}`;
    yearHtml.innerHTML = `${year}`;
  
  // if thisMonth is not this month remove circle
  if(thisMonth !== today.getMonth()+1) {    
    totalDays = daysInMonth(thisMonth+1, year);
  }
 
    
    for(var i = 0; i < totalDays; i++) {
      
       html += `<a href="#">
                              <div class="calendar__day ${day === (i+1) ? 'today' : ''}">
                                  <div class="calendar__day__number">                                     ${i+1}</div>
                              </div>
                            </a>`;
    }
    daysHtml.innerHTML = html; 
    var element =  document.querySelector('.today-svg');
 
   if(thisMonth === today.getMonth() && !element) {
      var useEl = createUseEl('.draw-circle svg' ,'#circle-1');
      var todayHtml = document.querySelector('.today');
      var posX = todayHtml.offsetLeft;
      var posY = todayHtml.offsetTop;
      useEl.classList.add('today-svg');
      useEl.style.transform = `translate(${posX}px, ${posY}px)`;
    } 
  else if (thisMonth === today.getMonth() && element) {
    document.querySelector('.today-svg').classList.remove('hidden');
  }
  else {
     document.querySelector('.today-svg').classList.add('hidden');
  }
     
    
}

function drawOnClick() {
      let useEl = createUseEl('.draw-circle svg' ,'#circle-1');
      useEl.classList.add(`selected-days`);
      useEl.classList.add(monthNames[thisMonth]);

  
        // Reset length to 0 on every click and if second click on this element
        if (obj.length === obj.pathLength) {
          obj.length = 0;
        }

      // Animation on every use element
        TweenMax.to(obj, 0.5, {length:obj.pathLength, onUpdate:drawLine, onUpdateParams:[useEl], ease:Linear.easeNone})

        // Put svg use element on clicked location
        const posX = this.offsetLeft;
        const posY = this.offsetTop;
        useEl.style.transform = `translate(${posX}px, ${posY}px)`;
}

function seasons(next){
      //Remove previous added group elements
    var elems = document.querySelectorAll(".spring");
    elems.forEach(elem =>  elem.parentNode.removeChild(elem));
    var elems = document.querySelectorAll(".summer");
    elems.forEach(elem =>  elem.parentNode.removeChild(elem));
    var elems = document.querySelectorAll(".fall");
    elems.forEach(elem =>  elem.parentNode.removeChild(elem));
    var elems = document.querySelectorAll(".winter");
    elems.forEach(elem =>  elem.parentNode.removeChild(elem));

  let season = getSeason();
  
  if (next === true) {
    thisMonth =  thisMonth + 1;
    season = getSeason(thisMonth);
  }
  else if (next === false) {
    thisMonth =  thisMonth - 1;
    season = getSeason(thisMonth);
  }
  //change snow to seasons element
  let seasonEl, transX, transY;
  //getSeason();

  let amount = 0;
  
  if(season === 'winter') {
    amount = 30;
  }
  else if (season === 'spring') {
    amount = 15;
  }
   else if (season === 'summer') {
    amount = 1;
  }
  else if (season === 'fall') {
    amount = 15;
  }
  
  
  for(var i = 0; i < amount; i++) {
    
    //We need to clone the elements instead of using <use> because we can't animate along path with use
    seasonEl = document.getElementById(season).cloneNode(true);
    document.querySelector("#seasons").appendChild(seasonEl);
    transX = Math.floor(Math.random() * 350) + 1;
    transY = Math.floor(Math.random() * 82) + 1;
    
    seasonEl.classList.add(season);
    
    let winterEl =  seasonEl.querySelector(`#winter-el`);
    let springEl = seasonEl.querySelector('#spring');
    let summerEl = seasonEl;
    let fallEl =  seasonEl.querySelector(`#fall-el`);
    
    //animation on every new season element
    if (season === 'winter') {
      seasonEl.style.transform = `translate(${transX}px, 0px) scale(${Math.random()})`;
      snowAnimation(winterEl);
      document.documentElement.style.setProperty(`--theme`, '#8dcfff');
    }
    else if (season === 'spring') {
      seasonEl.style.transform = `translate(${transX}px, ${transY}px) scale(${Math.random()})`;
      springAnimation(seasonEl);
      document.documentElement.style.setProperty(`--theme`, '#bddc53');
    }
    else if (season === 'summer') {
      seasonEl.style.transform = `translate(270px,0) scale(${Math.random()+0.9})`;
      document.documentElement.style.setProperty(`--theme`, '#deab05');
      document.documentElement.style.setProperty(`--col`, '#222222');
      sunAnimation(summerEl);
    }
    else if (season === 'fall') {
      seasonEl.style.transform = `translate(${transX}px, 0px) scale(${Math.random()})`;
      document.documentElement.style.setProperty(`--theme`, '#ea994a');
      fallAnimation(fallEl);
    }
     
  }
}
 
function snowAnimation(el) {
  //make svg follow path 
  let siblingPath = el.nextElementSibling;
  let delayAnimation = Math.random();
   
 TweenMax.to(el, 1, { 
   bezier: {
    values: MorphSVGPlugin.pathDataToBezier(siblingPath), 
    type: "cubic"
  },
  repeat: -1,
  delay: delayAnimation,
  ease: Ease.easeOut
},  delayAnimation*10); 
}

function springAnimation(el) {
  //random flower petal colors
  let colors = ['#FF9900', '#FF6600', '#FF3300', '#F56991'];
  let petals = el.querySelectorAll('.petal'); 
  petals.forEach(petal => petal.style.fill = colors[Math.floor(Math.random() * 3) + 0]);
  
  //Scale flowerpath en move .flower 
  const path = document.querySelector('#flowerPath');

  TweenMax.to('#flowerPath', 2, { 
    scaleY:1.8, 
    transformOrigin:"50% 50%", 
    delay: 0.1,
    ease: Ease.easeOut
  },  1.5);
  TweenMax.to('.flower', 1, { 
    y:-12, 
    transformOrigin:"50% 50%", 
    delay: 0.1,
    ease: Ease.easeOut
  },  1.5);

}

function sunAnimation(el) {

  let shines = el.querySelectorAll('.shine');  
  shines.forEach((shine, i) => {
    TweenMax.to(shine, 0.8, { 
      morphSVG:'M3,8 C7.27916667,12.0320312 17.0177083,20.9453125 21.296875,24.9773437 L3,8 Z',
      repeat: -1,
      delay: i*0.1,
      ease: Ease.easeOut,
      yoyo:true
    });
  });
  let sun = el.querySelector('#Oval');
  
  TweenMax.to(sun, 2.5, { 
    scale:1.1, 
    transformOrigin:"50% 50%", 
    ease: Ease.easeOut,
    repeat:-1,
    yoyo:true
  });
}

function fallAnimation(el) {
  //make svg follow path 
  let siblingPath = el.nextElementSibling;
  let delayAnimation = Math.random();

  TweenMax.to(el, 3, { 
     bezier: {
      values: MorphSVGPlugin.pathDataToBezier(siblingPath), 
      type: "cubic"
    },
    repeat: -1,
    delay: delayAnimation,
    ease: Ease.ease
  });
}

// Fist add dates
addDate();

function addRemoveSelected() {
    let selected = document.querySelectorAll('.selected-days');
    let today = new Date();
    selected.forEach( function(useEl) {
      if( useEl.classList.contains( `${monthNames[thisMonth]}` ) ) {
         useEl.classList.remove('hidden');
      }
      else {
        useEl.classList.add('hidden');
      }
    });
      
    days = document.querySelectorAll('a');
    days.forEach(day => day.addEventListener('click', drawOnClick));
}

//get all days
var days = document.querySelectorAll('a');
const nextMonth = document.querySelector('.next');
const prevMonth = document.querySelector('.prev');
let next;
/* Event listeners */
days.forEach(day => day.addEventListener('click', drawOnClick));
 
nextMonth.addEventListener('click', function() {
  //month + 1
  next =  true;
  seasons(next);
  addDate();
  addRemoveSelected();
 
});
prevMonth.addEventListener('click', function() {
  
  //month -1
  next =  false;
 
  seasons(next);
  addDate();
  addRemoveSelected();
});



// Add seasons header
seasons(next);

//remember month of clicked element, remove hidden from element if this month is the same as that month
 
 
 
/* 후기, 문의  AJAX CODE*/
function showReviewForm(){
	$("#reviewDiv").css("display", "block");
}
function hideReviewForm(){
	$("#reviewDiv").css("display", "none");
}

function showReviewListView(){
	$("#reviewlistView").css("display", "none");
}
function hideReviewListView(){
	$("#reviewlistView").css("display", "none");
}
function reviewDelete(rid){
	location.href = "${ pageContext.request.contextPath }/rdelete.do?rid=" + rid + "&cid=${ clss.cid}";
}


/* function showReviewReplyForm(){
	$("#reviewReplyDiv").css("display", "block");
}
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
} */


//jquery ajax 로 해당 < 수업 클래스 > 대한 문의 조회 요청
//해당 < 수업 클래스 >의 번호를 전송함
$(function(){
	hideReviewForm(); 
	showReviewListView(); //hideReviewListView(); // ADDED TO TEST "REVIEW 목록조회 기능"
	// hideReviewReplyForm(); // ADDED TO TEST "REPLY댓글 달기 기능"
	// hideReviewReplyListView(); // ADDED TO TEST "REVIEW REPLY 목록조회 기능"
	
	var clssCid = ${ clss.cid };  //el 의 값을 변수에 대입 : 클래스 ID
	var loginUser = "${ sessionScope.loginUser.id }";  //로그인한 회원 아이디 변수에 대입
	var teacher = "${clss.tchr_id}"; //el 의 값을 변수에 대입 : 수업 강사님
	var adminLv= "${ sessionScope.loginUser.user_lv }";  //로그인한 회원 유저레벨 (S, T, A) 변수에 대입
	
	$.ajax({
		url: "${ pageContext.request.contextPath }/rlist.do",
		type: "post",
		data: { cid: clssCid },  //전송값에 변수 사용
		dataType: "json",
		success: function(data){
		console.log("success : " + data);
	
		//object ==> string
		var jsonStr = JSON.stringify(data);
		//string ==> json 
		var json = JSON.parse(jsonStr);
		
		showReviewListView(); // NEWLY ADDED HERE = THIS <div> LIST IS NOT SHOWINGGGGGGGGGGGGGG
		
		var values = "";
				for(var i in json.list){
					// 본인이 등록한 후기글일 때는 수정/삭제 가능
					if(loginUser == json.reviewList[i].rwriter){
						values += "<tr><td>" + json.reviewList[i].rwriter 
							+ "</td><td>" +  json.reviewList[i].r_modify_date 
							+ "</td></tr><tr><td colspan='2'>"
							+ "<form action='rupdate.do' method='post=' enctype='multipart/form-data'>" 
							+ "<input type='hidden' name='rid' value='" +  json.reviewList[i].rid  + "'>"
							+ "<input type='hidden' name='cid' value='"+clssCid+"'>"
							
							// 첨부파일 업데이트
																//+ "<input type='hidden' name='ofile_r' value='${ review.ofile_r}'>"
																//+ "<input type='hidden' name='rfile_r' value='${ review.rfile_r}'>"
							// 원래 첨부파일 있는 경우
							if (review.ofile_r != null){
							+ "<input type='checkbox' name='delFlag' value='yes'> 파일삭제 <br>"
							+"<tr><td colspan='2'>"
								+ "<img src= 'resources/reviewClss_files/"+ review.ofile_r +"' alt='"+clssCid+" 클래스 " 
								+ json.reviewList[i].rwriter +"님의 후기 사진' style='width:100%; align: center; position: relative; max-width: 500px; padding: 10px;'>"
							+ "</td></tr>"
							} else { //원래 첨부파일이 없는 경우
							+ "<input type='file' name='upfile'>"	
							}
							
							// 글 내용 수정
							+ "<textarea name='rcontent'>"
							+ decodeURIComponent(json.reviewList[i].rcontent).replace(/\+/gi, " ") 
							+ "</textarea><input type='submit' value=' 수정 '></form>" 
							+ "<button onclick='reviewDelete(" + json.reviewList[i].rid + ");'> 삭제 </button>";
							
							/* for each문 안에다가 댓글달 수 있게 끔 */
							// + "<button onclick='revReply(" + json.reviewList[i].rid + ");'> 댓글달기 </button></td></tr>";
							
					} else if (loginUser == teacher || adminLv == 'A' ) { //대상 강사또는 관리자일 때
						values += "<tr><td>" + json.reviewList[i].rwriter 
						+ "</td><td>" +  json.reviewList[i].r_modify_date 
						+ "</td></tr>"
					
						// 원래 첨부파일 있는 경우
						if (review.ofile_r != null){
							+ "<tr><td colspan='2'>"
							+ "<img src= 'resources/reviewClss_files/"+ review.ofile_r +"' alt='"+clssCid+" 클래스 " 
							+ json.reviewList[i].rwriter +"님의 후기 사진' style='width:100%; align: center; position: relative; max-width: 500px; padding: 10px;'>"
						+ "</td></tr>"
						} else{
						
						+"<tr><td colspan='2'>"
						+ decodeURIComponent(json.reviewList[i].qcontent).replace(/\+/gi, " ") 
						+ "</td></tr>"
						//댓글달기
						// + "<button onclick='revReply(" + json.reviewList[i].rid + ");'> 댓글달기 </button></td></tr>" // 다시 살리면 </td></tr> 확인하기
						+ "<tr><td colspan='2' style='text-align:right;'><button onclick='saveReview("+json.reviewList[i].save_count +");'> 좋아요 </td></tr>";
						}
						
					} else { // 글작성자가 아니며, 대상 강사또는 관리자가 아닐 때
						values += "<tr><td>" + json.reviewList[i].rwriter 
						+ "</td><td>" +  json.reviewList[i].r_modify_date 
						+ "</td></tr><tr><td colspan='2'>"
						+ decodeURIComponent(json.reviewList[i].rcontent).replace(/\+/gi, " ")
						+"</td></tr>"
						+ "<tr><td colspan='2' style='text-align:right;'><button onclick='saveReview("+json.reviewList[i].save_count +");'> 좋아요 </td></tr>";
					}
				}
				$("#rlistTbl").html($("#rlistTbl").html() + values);
			},
		error: function(jqXHR, textstatus, errorthrown){
			console.log("error : " + jqXHR + ", " + textstatus + ", " 
				+ errorthrown);
			}	
		});// 문의 작성 수정/삭제 ajax
});  //jquery document ready

function revReply(rid){
	showReviewListView();
	
	showReviewReplyForm();
	//showReviewReplyListView();
	

	jQuery( function($) {
		var refRid = rid; 
		var refRcid = "${clss.cid}";
		var loginUser = "${ sessionScope.loginUser.id }";  //로그인한 회원 아이디 변수에 대입
		var teacher = "${clss.tchr_id}"; // 수업 강사님
		var adminLv= "${ sessionScope.loginUser.user_lv }";


		$.ajax({
			url: "${ pageContext.request.contextPath }/rrlist.do",
			type: "post",
			data: { ref_rid: refRid,  ref_rcid: refRcid},  //전송값에 변수 사용 // 문의 id를 받아옴 (rid)
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
							values += "<tr><td>" + json.list[i].rrwriter 
								+ "</td><td>" +  json.list[i].rr_modify_date 
								+ "</td></tr><tr><td colspan='2'>"
								+ "<form action='rrupdate.do' method='post'>" 
								+ "<input type='hidden' name='rrid' value='" +  json.list[i].rrid  + "'>"
								+ "<input type='hidden' name='ref_rid' value='"+ refRid +"'>" 
								+ "<input type='hidden' name='ref_rid' value='"+ refRcid +"'>" 
								+ "<textarea name='rrcontent'>"
								+ decodeURIComponent(json.list[i].rrcontent).replace(/\+/gi, " ") 
								+ "</textarea><input type='submit' value='수정'></form>"
								+ "<button onclick='reviewReplyDelete(" + json.list[i].rrid + ");'>삭제</button></td></tr>";
						} else if ( loginUser == teacher || adminLv == 'A' ){ 
							values += "<tr><td>" + json.list[i].rrwriter 
							+ "</td><td>" +  json.list[i].rr_modify_date 
							+ "</td></tr><tr><td colspan='2'>"
							+ decodeURIComponent(json.list[i].rrcontent).replace(/\+/gi, " ") 
							+ "</td></tr>";	
						} else{ // 글작성자가 아니며, 대상 강사또는 관리자가 아닐 때
							values += "";	
						}
					}
					$("#rrlistTbl").html($("#rrlistTbl").html() + values);
				},
			error: function(jqXHR, textstatus, errorthrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " 
					+ errorthrown);
				}	
			});// 문의 작성 수정/삭제 ajax
	});  //jquery 

	}; // END OF revReply(rid)


function showQaForm(){
	$("#qaDiv").css("display", "block");
}
function hideQaForm(){
	$("#qaDiv").css("display", "none");
}
function qaDelete(qid){
	location.href = "${ pageContext.request.contextPath }/qdelete.do?qid=" + qid + "&cid=${ clss.cid}";
}
function showQaReplyForm(){
	$("#qaReplyDiv").css("display", "block");
}
function hideQaReplyForm(){
	$("#qaReplyDiv").css("display", "none");
}
function qaReplyDelete(qaid){
	location.href = "${ pageContext.request.contextPath }/qadelete.do?qaid=" + qaid + "&qid=${ qa.qid}";
}
function showQaListView(){
	$("#qalistView").css("display", "none");
}
function hideQaListView(){
	$("#qalistView").css("display", "none");
}


//jquery ajax 로 해당 < 수업 클래스 > 대한 문의 조회 요청
//해당 < 수업 클래스 >의 번호를 전송함
$(function(){
	hideQaForm(); 
	hideQaReplyForm(); // ADDED TO TEST "REPLY댓글 달기 기능"
	hideQaListView(); // ADDED TO TEST "질문 목록조회 기능"
		
	var clssCid = "${ clss.cid }";  //el 의 값을 변수에 대입
	var loginUser = "${ sessionScope.loginUser.id }";  //로그인한 회원 아이디 변수에 대입
	var teacher = "${clss.tchr_id}"; // 수업 강사님
	var adminLv= "${ sessionScope.loginUser.user_lv }";
	
	$.ajax({
		url: "${ pageContext.request.contextPath }/qlist.do",
		type: "post",
		data: { cid: clssCid },  //전송값에 변수 사용
		dataType: "json",
		success: function(data){
		console.log("success : " + data);
	
		//object ==> string
		var jsonStr = JSON.stringify(data);
		//string ==> json 
		var json = JSON.parse(jsonStr);
		
		var values = "";
				for(var i in json.list){
					// 본인이 등록한 후기글일 때는 수정/삭제 가능
					if(loginUser == json.list[i].qwriter){
						values += "<tr><td>" + json.list[i].qwriter 
							+ "</td><td>" +  json.list[i].q_modify_date 
							+ "</td></tr><tr><td colspan='2'>"
							+ "<form action='qupdate.do' method='post'>" 
							+ "<input type='hidden' name='qid' value='" +  json.list[i].qid  + "'>"
							+ "<input type='hidden' name='cid' value='"+clssCid+"'>"
							/* + "<input type='hidden' name='clssCid' value='${clss.cid}'>" */
							+ "<textarea name='qcontent'>"
							+ decodeURIComponent(json.list[i].qcontent).replace(/\+/gi, " ") 
							+ "</textarea><input type='submit' value='수정'></form>" 	// 원래 여기에 </form> 들어감
							+ "<button onclick='qaDelete(" + json.list[i].qid + ");'>삭제</button>" //원래 여기에 </td></tr> 들어감
							
							/* for each문 안에다가 댓글달 수 있게 끔 */
							+ "<button onclick='selfReply(" + json.list[i].qid + ");'>댓글달기</button></td></tr>";
							
					} else if (loginUser == teacher || adminLv == 'A' ) { //대상 강사또는 관리자일 때
						values += "<tr><td>" + json.list[i].qwriter 
						+ "</td><td>" +  json.list[i].q_modify_date 
						+ "</td></tr><tr><td colspan='2'>"
						+ decodeURIComponent(json.list[i].qcontent).replace(/\+/gi, " ") 
						+ "</td></tr>";	
						
					} else { // 글작성자가 아니며, 대상 강사또는 관리자가 아닐 때
						values += "<tr><td>" + json.list[i].qwriter 
						+ "</td><td>" +  json.list[i].q_modify_date 
						+ "</td></tr><tr><td colspan='2'>"
						+ "<i style='color: gray'> 🔒 비공개 문의사항 🔒 </i>"
						+ "</td></tr>";
					}
				}
				$("#qlistTbl").html($("#qlistTbl").html() + values);
			},
		error: function(jqXHR, textstatus, errorthrown){
			console.log("error : " + jqXHR + ", " + textstatus + ", " 
				+ errorthrown);
			}	
		});// 문의 작성 수정/삭제 ajax
});  //jquery document ready

function selfReply(qid){
	showQaReplyForm();
	showQaListView();


	//jquery ajax 로 해당 < 수업 클래스 > 대한 문의 *** 댓글 *** 조회 요청
	//해당 < 수업 클래스 >의 *** 문의 *** 번호를 전송함

	jQuery( function($) {
		var qaQid = qid;  // selfReply(qid)의 매개변수 값 ( 위 ajax에 있던 json.list[i].qid )을 변수에 대입
		var loginUser = "${ sessionScope.loginUser.id }";  //로그인한 회원 아이디 변수에 대입
		var teacher = "${clss.tchr_id}"; // 수업 강사님
		var adminLv= "${ sessionScope.loginUser.user_lv }";


		$.ajax({
			url: "${ pageContext.request.contextPath }/qalist.do",
			type: "post",
			data: { ref_qid: qaQid},  //전송값에 변수 사용 // 문의 id를 받아옴 (qid)
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
						if(loginUser == json.list[i].qawriter){
							values += "<tr><td>" + json.list[i].qawriter 
								+ "</td><td>" +  json.list[i].q_modify_date 
								+ "</td></tr><tr><td colspan='2'>"
								+ "<form action='qaupdate.do' method='post'>" 
								+ "<input type='hidden' name='qaid' value='" +  json.list[i].qaid  + "'>"
								+ "<input type='hidden' name='ref_qid' value='"+ qaQid +"'>" 
								+ "<textarea name='qacontent'>"
								+ decodeURIComponent(json.list[i].qacontent).replace(/\+/gi, " ") 
								+ "</textarea><input type='submit' value='수정'></form>"
								+ "<button onclick='qaReplyDelete(" + json.list[i].qaid + ");'>삭제</button></td></tr>";
						} else if ( loginUser == teacher || adminLv == 'A' ){ 
							values += "<tr><td>" + json.list[i].qawriter 
							+ "</td><td>" +  json.list[i].qa_modify_date 
							+ "</td></tr><tr><td colspan='2'>"
							+ decodeURIComponent(json.list[i].qacontent).replace(/\+/gi, " ") 
							+ "</td></tr>";	
						} else{ // 글작성자가 아니며, 대상 강사또는 관리자가 아닐 때
							values += "<tr><td>" + json.list[i].qawriter 
							+ "</td><td>" +  json.list[i].qa_modify_date 
							+ "</td></tr><tr><td colspan='2'>"
							+ "<i style='color: gray'> 🔒 비공개 문의사항 🔒 </i>"
							+ "</td></tr>";	
						}
					}
					$("#qalistTbl").html($("#qalistTbl").html() + values);
				},
			error: function(jqXHR, textstatus, errorthrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " 
					+ errorthrown);
				}	
			});// 문의 작성 수정/삭제 ajax
	});  //jquery 

	}; // END OF selfReply(qid)
