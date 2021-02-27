
	function add_school(){
		var str='<div class="school_box"><input type="text" class="basic phone" placeholder="예) 탈잉대학교"><input type="text" class="basic phone" placeholder="예) 탈잉학과" style="margin-left:10px"><br><div style="padding-top:10px"></div><input type="text" class="basic len650" placeholder="학생증/재학,졸업증명서" ><div class="verify">업로드</div><div class="verify" onclick="$(this).parent().remove();"><img src="Content/Images/icon_del_bk.png"> 삭제</div></div>';

		$('.school_box').last().after(str);
	}


	function cls(){
		$('#dim').hide();
		$('#class_box').hide();
	}
	function add_class(){
		$('#dim').show();$('#class_box').show();
	}
	
	function cls_class(){
		$('#dim').hide();
		$('#class_box').hide();
	}
	function rmvschool(){
		alert($(this).attr('class'));
		$(this).parent().remove();
	}
	function arwpaper(elm){
		if($(elm).parent().siblings('.ex').css('display')=='none')
		{
			$(elm).parent().siblings('.ex').show();
		}
		else{
			$(elm).parent().siblings('.ex').hide();
		}
		$(elm).siblings('.button').show();
		$(elm).hide();
		
	}