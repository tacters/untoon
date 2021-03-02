function indiv(univ)
{		
	orderIdx = document.getElementById('orderIdx').value;
	categoryIdx = document.getElementById('categoryIdx').value;
	query = document.getElementById('query').value;
	var p = [];	
	p.push('type=getUniv');
	p.push('univ='+univ);
	p.push('orderIdx='+orderIdx);
	p.push('categoryIdx='+categoryIdx);
	p.push('query='+query);

	//p.push('searchValue=' + encodeURIComponent(this.searchValue.replace(/\s/g, "")));

	var pars = p.join('&');

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: 'innerdiv'
		, oSelf: this
		, onCreate: function()
		{
			//AjaxBoard.resetTable(this.idTarget);
			//AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert" style="text-align: center;"><img src="images/ajax-loader3.gif" />데이타를 가져오는 중입니다. 잠시만 기다려 주세요.</p>', colspan: 10, rowHeight: '50px'});
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == 'null' ) {				
				html = '<div class="no-category-talents">검색 결과가 없습니다</div>';			
				document.getElementById('innerdiv').innerHTML=html;
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}		
			var ret = eval('(' + oXHR.responseText + ')');
		
			html = '';
		
			for(var i = 0, t = ret.length; i < t; i++)
			{
				var star = ret[i]['Stars'];
				if(ret[i]['Stars'] == null)star = 0;

				html += '<div class="col-md-4 col-sm-6 list-item ng-scope" >';
				html += '<a class="list-item-content" href="/Talent/Detail/'+ret[i]['Id']+'">';
				html += '<div class="img-cover-wrap">';
				html += '<div class="img-cover" style="background-image: url(&quot;'+ret[i]['CoverThumbnailUrl']+'&quot;);"></div>';
				html += '</div>';
				if(ret[i]['IsSoldOut']=='1')
				{
					html += '<div class="talent-soldout">SOLD OUT</div>';
				}
				html += '<div class="img-profile" style="background-image: url(&quot;'+ret[i]['ProfileThumbnailUrl']+'&quot;);"></div>';
				html += '<h1 class="ng-binding">'+ret[i]['Title']+'</h1>';
				html += '<div class="desc-tutor ng-binding">'+ret[i]['Description']+' | '+ret[i]['AN']+'</div>';
				html += '<div class="box-school-status">'+ret[i]['SN']+'</div>';
				html += '<div class="box-stars">';
				html += '<ul class="list-stars">';
				if( star >0 || rret[i]['reCount'] > 0)
				{
					for(var j = 0, u = 5; j < u; j++)
					{
						if(star > j)
						{
							html += '<li class="active">★</li>';
						}
						else
						{
							html += '<li>★</li>';
						}
					}
					html += '</ul>';
					html += '<div class="count ng-binding">('+ret[i]['reCount']+')</div>';
				}
				else
				{
					html +=  '<img src="/Content/Images/new.png" style="width:50%;">';
				}
				
				html += '</div>';
				html += '<hr>';
				html += '<div class="box-talent-status">';
				html += '<div class="row row-count">';
				html += '<div class="table-left">지금까지 이 강의에 참여한 사람</div>';
				html += '<div class="table-right">';
				html += '<strong class="ng-binding">'+ret[i]['Count']+'</strong>명';
				html += '</div>';
				html += '</div>';
				html += '<div class="row row-remain">';
				html += '<div ng-if="!talent.isSoldOut" class="ng-scope">';
				/*html += '<div class="table-left">수강생 모집 여부</div>';
				if(ret[i]['Status']=='1')
				{
					html += '<div class="table-right sold-out"><strong>SOLD OUT</strong></div>';
				}
				else
				{
					html += '<div class="table-right"><strong>모집중</strong></div>';
				}
				*/

				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '</a>';
				html += '</div>';		
			}
				
			document.getElementById('innerdiv').innerHTML=html;
		}
	});
}

function indiv_new(region)
{		
	orderIdx = document.getElementById('orderIdx').value;
	categoryIdx = document.getElementById('categoryIdx').value;
	query = document.getElementById('query').value;
	code = document.getElementById('code').value;
	var p = [];	
	if(region == 'iltal')
	{
		p.push('type=getiltal');
	}
	else
	{
		p.push('type=getRegion');
	}
	p.push('region='+region);
	p.push('orderIdx='+orderIdx);
	p.push('categoryIdx='+categoryIdx);
	p.push('code='+code);
	p.push('query='+query);

	//p.push('searchValue=' + encodeURIComponent(this.searchValue.replace(/\s/g, "")));

	var pars = p.join('&');

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: 'innerdiv'
		, oSelf: this
		, onCreate: function()
		{
			//AjaxBoard.resetTable(this.idTarget);
			//AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert" style="text-align: center;"><img src="images/ajax-loader3.gif" />데이타를 가져오는 중입니다. 잠시만 기다려 주세요.</p>', colspan: 10, rowHeight: '50px'});
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == 'null' ) {				
				html = '<div class="no-category-talents">검색 결과가 없습니다</div>';			
				document.getElementById('innerdiv').innerHTML=html;
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}		
			var ret = eval('(' + oXHR.responseText + ')');
		
			html = '';
			
			for(var i = 0, t = ret.length; i < t; i++)
			{				
				var star = ret[i]['Stars'];
				if(ret[i]['Stars'] == null)star = 0;

				html += '<div class="col-md-4 col-sm-6 list-item ng-scope" >';
				if(region == 'iltal')
				{
					html += '<a class="list-item-content" href="/Talent/iltal/'+ret[i]['Id']+'">';
				}
				else
				{
					html += '<a class="list-item-content" href="/Talent/Detail/'+ret[i]['Id']+'">';
				}				
				
				html += '<div class="img-cover-wrap">';
				html += '<div class="img-cover" style="background-image: url(&quot;'+ret[i]['CoverThumbnailUrl']+'&quot;);"></div>';
				html += '</div>';
				if(ret[i]['IsSoldOut']=='1')
				{
					html += '<div class="talent-soldout">SOLD OUT</div>';
				}
				html += '<div class="img-profile" style="background-image: url(&quot;'+ret[i]['ProfileThumbnailUrl']+'&quot;);"></div>';
				html += '<h1>'+ret[i]['Title']+'</h1>';
				html += '<div class="desc-tutor">'+ret[i]['Description']+' | '+ret[i]['AN']+'</div>';
				html += '<hr>';
				

				if(ret[i]['Is_Code'] == 1)
				{
					html += '<div class="desc-sale">';
					html += '<img src="/Content/Images/sale5.png" width="30px">';
					if(ret[i]['SaleDate'] == 1)
					{
						html += ' 신규 튜터 이벤트 진행중 <span class="saleDate">오늘마감</span>';
					}
					else
					{
						html += ' 신규 튜터 이벤트 진행중 <span class="saleDate">D-'+ret[i]['SaleDate']+'</span>';
					}
					html += '</div>';
				}
				else
				{
					html += '<div class="box-talent-status">';
					html += '	<div class="row row-count">';
					html += '		<div class="table-left">지금까지 이 강의에 참여한 사람</div>';
					html += '		<div class="table-right"><strong>'+ret[i]['Count']+'</strong>명</div>';
					html += '	</div>';
					html += '	<div class="row row-remain">';
					html += '		<div ng-if="!talent.isSoldOut" class="ng-scope"></div>';
					html += '	</div>';
					html += '</div>';
				}
				

				html += '<div class="box-stars">';
				html += '	<div class="lesson">'+ret[i]['group']+'&nbsp; | </div>';
				html += '	<ul class="list-stars">';
					if( star >0 || ret[i]['reCount'] > 0)
					{
						for(var j = 0, u = 5; j < u; j++)
						{
							if(star > j)
							{
								html += '<li class="active">★</li>';
							}
							else
							{
								html += '<li>★</li>';
							}
						}
						html += '</ul>';
						html += '<div class="count">('+ret[i]['reCount']+')</div>';
					}
					else
					{
						html +=  '<img src="/Content/Images/new.png" style="width:50%;"></ul>';
					}										
					html += '<div class="region"> | &nbsp;'+ret[i]['Region']+'</div>'
				html += '</div>';
			
				
				html += '</a>';
				html += '</div>';		
			}
				
			document.getElementById('innerdiv').innerHTML=html;
		}
	});
}

function m_indiv_new()
{		
	orderIdx = document.getElementById('orderIdx').value;
	categoryIdx = document.getElementById('categoryIdx').value;
	regionIdx = document.getElementById('regionIdx').value;
	query = document.getElementById('query').value;
	page = document.getElementById('page').value;
	limit = document.getElementById('limit').value;
	code = document.getElementById('code').value;
	
	var p = [];	
	
	p.push('type=getRegion');
	p.push('region='+regionIdx);
	p.push('orderIdx='+orderIdx);
	p.push('categoryIdx='+categoryIdx);
	p.push('query='+query);
	p.push('page='+page);
	p.push('limit='+limit);
	p.push('code='+code);
	var pars = p.join('&');

	var Ajax = new Ajax2();

	Ajax.init('/Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: 'innerdiv'
		, oSelf: this
		, onCreate: function()
		{
			//AjaxBoard.resetTable(this.idTarget);
			//AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert" style="text-align: center;"><img src="images/ajax-loader3.gif" />데이타를 가져오는 중입니다. 잠시만 기다려 주세요.</p>', colspan: 10, rowHeight: '50px'});
		}
		, onComplete: function(oXHR)
		{
				
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == 'null' ) {				
				if(page > 1)
				{
					document.getElementById('addBox').style.display = "none";
				}
				else
				{
					html = '<div class="no-category-talents">검색 결과가 없습니다</div>';			
					document.getElementById('innerdiv').innerHTML=html;
				}
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}

			var ret = eval('(' + oXHR.responseText + ')');
		
			html = '';
			for(var i = 0, t = ret.length; i < t; i++)
			{
				var star = ret[i]['Stars'];
				if(ret[i]['Stars'] == null)star = 0;

				html += '<a href="/Talent/Detail/'+ret[i]['Id']+'" ng-href="/Talent/Detail/'+ret[i]['Id']+'">';
				html += '<div class="talentList">';
				html += '	<div style="background-image: url(&quot;'+ret[i]['CoverThumbnailUrl']+'&quot;);" class="backImage">';
			
				if(ret[i]['Is_Code'] == 1)
				{
					if(ret[i]['SaleDate'] == 1)
					{
						html += '		<div class="classCount"> 50% 할인 오늘마감</div>';
					}
					else
					{
						html += '		<div class="classCount"> 50% 할인 D-'+ret[i]['SaleDate']+'</div>';
					}
				}			
				else
				{
					html += '		<div class="classCount"><i class="fa fa-fw fa-user"></i>&nbsp;&nbsp;&nbsp;'+ret[i]['Count']+'명 참여</div>';
				}

				
				
				if(ret[i]['IsSoldOut']=='1')
				{
						html += '<div class="classSoldout">SOLDOUT</div>';
				}
				html += '		<div class="tutorImage" style="background-image: url(&quot;'+ret[i]['ProfileThumbnailUrl']+'&quot;);"></div>';
				html += '		<div class="tutorName">'+ret[i]['AN']+'<br><span>'+ret[i]['Description']+'</span></div>';
				html += '	</div>';
				html += '	<div class="talentContent">';
				html += '	<div class="talentTitle">'+ret[i]['mTitle']+'</div>';
				
				if(ret[i]['Is_Sale'] > 0)
				{
					html += '	<div class="talentPrice"><font style="text-decoration: line-through;font-size:10px;color:#999;">￦'+ret[i]['SalePrice']+'</font> ￦'+ret[i]['UnitPrice']+'</div>';
				}
				else
				{
					html += '	<div class="talentPrice">￦'+ret[i]['UnitPrice']+'</div>';
				}
				html += '	<div class="talentInfo"><ul class="stars"><li>'+ret[i]['group']+'&nbsp;&nbsp;</li>';
					if( star >0 || ret[i]['reCount'] > 0)
					{
						for(var j = 0, u = 5; j < u; j++)
						{
							if(star > j)
							{
								html += '<li class="active"><i class="fa fa-star"></i></li>';
							}
							else
							{
								html += '<li><i class="fa fa-star"></i></li>';
							}
						}
						html += '<li class="">('+ret[i]['reCount']+')</li>';
					}
					else
					{
						html +=  '<li style="width:32px;"><img src="/Content/Images/new.png" style="width:100%;"><li>';
					}
						html += '<li>&nbsp;&nbsp;'+ret[i]['Region']+'</li></ul></div>';
				html += '</div>';
				html += '</div>';
				html += '</a>';				
			}
			
			//if(ret.length <10)document.getElementById('addBox').style.display = "none";
			if(page==1)
			{
				document.getElementById('innerdiv').innerHTML=html;
			}
			else
			{
				document.getElementById('innerdiv').innerHTML+=html;
			}
			
		}
	});
}

function m_indiv_iltal()
{		
	orderIdx = document.getElementById('orderIdx').value;
	categoryIdx = document.getElementById('categoryIdx').value;
	regionIdx = document.getElementById('regionIdx').value;
	query = document.getElementById('query').value;
	page = document.getElementById('page').value;
	limit = document.getElementById('limit').value;
	
	var p = [];	
	
	p.push('type=getiltal');
	p.push('region='+regionIdx);
	p.push('orderIdx='+orderIdx);
	p.push('categoryIdx='+categoryIdx);
	p.push('query='+query);
	p.push('page='+page);
	p.push('limit='+limit);
	var pars = p.join('&');

	var Ajax = new Ajax2();

	Ajax.init('/Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: 'innerdiv'
		, oSelf: this
		, onCreate: function()
		{
			//AjaxBoard.resetTable(this.idTarget);
			//AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert" style="text-align: center;"><img src="images/ajax-loader3.gif" />데이타를 가져오는 중입니다. 잠시만 기다려 주세요.</p>', colspan: 10, rowHeight: '50px'});
		}
		, onComplete: function(oXHR)
		{
				
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == 'null' ) {				
				if(page > 1)
				{
					document.getElementById('addBox').style.display = "none";
				}
				else
				{
					html = '<div class="no-category-talents">검색 결과가 없습니다</div>';			
					document.getElementById('innerdiv').innerHTML=html;
				}
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}

			var ret = eval('(' + oXHR.responseText + ')');
		
			html = '';
			for(var i = 0, t = ret.length; i < t; i++)
			{
				var star = ret[i]['Stars'];
				if(ret[i]['Stars'] == null)star = 0;

				html += '<div class="list-item ng-scope" >';
				html += '<a href="/Talent/iltal/'+ret[i]['Id']+'" ng-href="/Talent/iltal/'+ret[i]['Id']+'" class="overlay-container">';
				html += '<div style="background-image: url(&quot;'+ret[i]['CoverThumbnailUrl']+'&quot;);" class="overlay-background" ></div>';
				if(ret[i]['IsSoldOut']=='1')
				{
					html += '<div class="overlay-content talent-soldout">';
				html += 'SOLD OUT';
				html += '</div>';
				}
				
				html += '<div class="overlay-content talent-counter">';
				html += '<div class="clearfix ng-scope">';
				html += '<div class="counter-wishlist ng-binding">';
				html += '<i class="fa fa-fw fa-user"></i> '+ret[i]['Count']+'명 참여';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '<div class="overlay-content fluid-container">';
				html += '<div class="fluid-fixed-left">';
				html += '<div style="background-image: url(&quot;'+ret[i]['ProfileThumbnailUrl']+'&quot;);" class="img-profile" ></div>';
				html += ret[i]['AN'];
				html += '</div>';
				html += '<div class="fluid-fill">';
				html += '<div class="title">'+ret[i]['Title']+'</div>';

				html += '<div class="price">￦10,000</div>';
				html += '</div>';
				
				
				html += '<div class="bottom">';
				html += '<ul class="stars"><li>일탈수업&nbsp;&nbsp;</li>';
				if( star >0 || ret[i]['reCount'] > 0)
				{
					for(var j = 0, u = 5; j < u; j++)
					{
						if(star > j)
						{
							html += '<li class="active"><i class="fa fa-star"></i></li>';
						}
						else
						{
							html += '<li><i class="fa fa-star"></i></li>';
						}
					}
					html += '<li class="">('+ret[i]['reCount']+')</li>';
				}
				else
				{
					html +=  '<li style="width:32px;"><img src="/Content/Images/new.png" style="width:100%;"><li>';
				}
				
				
				html += '<li>&nbsp;&nbsp;'+ret[i]['Region']+'</li>';
				html += '<li style="float:right;color:#ff005a;width:70px;text-align:center;margin-right:7px;">&nbsp;&nbsp;'+ret[i]['StartDate']+ret[i]['yoil']+'</li>';
				html += '</ul>';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '</a>';
				html += '</div>';			

				//html += '<div class="desc ng-binding"><div style="float:left">'+ret[i]['AN']+'</div><div style="float:right;color:#ff005a">'+ret[i]['StartDate']+ret[i]['yoil']+'</div></div>';
			}
			
			//if(ret.length <10)document.getElementById('addBox').style.display = "none";
			if(page==1)
			{
				document.getElementById('innerdiv').innerHTML=html;
			}
			else
			{
				document.getElementById('innerdiv').innerHTML+=html;
			}
			
		}
	});
}


function inReviewDiv(idx, page)
{
	//query = document.getElementById('query').value;
	if(page ==0)
	{
		nPage=1;
	}else
	{
		nPage = page;
	}
	var p = [];	
	p.push('type=getReview');
	p.push('idx='+idx);
	p.push('page='+nPage);
	
	var pars = p.join('&');

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: 'innerReviewDiv'
		, oSelf: this
		, onCreate: function()
		{
			//AjaxBoard.resetTable(this.idTarget);
			//AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert" style="text-align: center;"><img src="images/ajax-loader3.gif" />데이타를 가져오는 중입니다. 잠시만 기다려 주세요.</p>', colspan: 10, rowHeight: '50px'});
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == 'null' ) {				
				html = '리뷰가 준비중입니다!';			
				document.getElementById('innerReviewDiv').innerHTML=html;
				return;
			}
			
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}

			var ret = eval('(' + oXHR.responseText + ')');
		
			html = '';
			Account_Id = document.getElementById('Account_Id').value;

			for(var i = 0, t = ret.length; i < t; i++)
			{
				if(ret[i]['ProfileThumbnailUrl']=='')ret[i]['ProfileThumbnailUrl'] = '//taling.me/Content/Images/placeholders/profile-default.jpg';
				html += '<ul>';
				html += '<li>';
				html += '<dl>';
				html += '<dt>';
				html += '<p class="profile_img" style="background:#000;z-index:0;width:100%;background-size:cover;background-position:center;background-image: url('+ret[i]['ProfileThumbnailUrl']+');"></p>';
				html += '<p class="name">'+ret[i]['Name']+'</p>';
				html += '</dt>';
				html += '<dd>';
				html += ret[i]['Content'];
				html += '</dd>';
				html += '<dd class="date">'+ret[i]['WrittenAtUtc']+'</dd>';
				if(Account_Id == ret[i]['Id']){
				html += '<dd class="inerbtn"><a id="review-modify" data-price-score="'+ret[i]['PriceScore']+'" data-quality-score="'+ret[i]['QualityScore']+'" data-recommend-score="'+ret[i]['RecommendScore']+'" data-tran-score="'+ret[i]['TranScore']+'" data-kind-score="'+ret[i]['KindScore']+'" data-content="'+ret[i]['mContent']+'">수정</a> <a id="review-delete">삭제</a></dd>';
				}
				
				html += '</dl>';
				html += '</li>';
				html += '</ul>';
			}

			document.getElementById('innerReviewDiv').innerHTML=html;

			htmlPage = '<ul>';

			for(var i = 1; i <= ret[0]['pTotal']; i++)
			{
				if(i == nPage)
				{
					htmlPage += '<li><a class="on" onclick="inReviewDiv('+idx+', '+i+')">'+i+'</a></li>';
				}else{
					htmlPage += '<li><a onclick="inReviewDiv('+idx+','+i+')">'+i+'</a></li>';
				}
			}
			htmlPage += '</ul>';

			document.getElementById('innerPageDiv').innerHTML=htmlPage;

			if(page != 0)$('html,body').animate({scrollTop:$("#bookmarkReview").offset().top-300}, 500);
		}
	});
}

function inQnaDiv(idx, page)
{
	//query = document.getElementById('query').value;
	if(page ==0)
	{
		nPage=1;
	}else
	{
		nPage = page;
	}
	var p = [];	
	p.push('type=getQna');
	p.push('idx='+idx);
	p.push('page='+nPage);
	
	var pars = p.join('&');

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: 'innerQnaDiv'
		, oSelf: this
		, onCreate: function()
		{
			//AjaxBoard.resetTable(this.idTarget);
			//AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert" style="text-align: center;"><img src="images/ajax-loader3.gif" />데이타를 가져오는 중입니다. 잠시만 기다려 주세요.</p>', colspan: 10, rowHeight: '50px'});
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == 'null' ) {				
				html = '';			
				document.getElementById('innerQnaDiv').innerHTML=html;
				return;
			}
			
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}

			var ret = eval('(' + oXHR.responseText + ')');
		
			html = '';
			
			Account_Id = document.getElementById('Account_Id').value;
			Owner_Id = document.getElementById('Owner_Id').value;

			for(var i = 0, t = ret.length; i < t; i++)
			{			
				if(ret[i]['Noname'] == 1)
				{
					ret[i]['ProfileThumbnailUrl'] = '//taling.me/Content/Images/placeholders/profile-default.jpg';
					ret[i]['Name'] = '익명';
				}
				html += '<li>';
				html += '<dl>';
				html += '<dt>';
				html += '<p class="profile_img" style="background:#000;z-index:0;width:100%;background-size:cover;background-position:center;background-image: url('+ret[i]['ProfileThumbnailUrl']+');"></p>';
				html += '<p class="name">'+ret[i]['Name']+'</p>';
				html += '</dt>';
				html += '<dd>';
				html += ret[i]['question'];
				html += '</dd>';
				//html += '<dd class="date">'+ret[i]['qDate']+'</dd>';
				if(Account_Id == Owner_Id && ret[i]['answer'] ==null){
				html += '<dd class="inerbtn"><a onclick="openAnswer('+ret[i]['qId']+')">답변하기</a></dd>';
				}
				html += '</dl>';
				html += '</li>';	
				
				tutorName = document.getElementById('tutorName').value;
				tutorImage = document.getElementById('tutorImage').value;

				if(ret[i]['answer'] !=null)
				{
					html += '<li>';
					html += '<div class="re">ㄴ</div>';
					html += '<dl class="recont">';
					html += '<dt>';
					html += '<p class="profile_img" style="background:#000;z-index:0;width:100%;background-size:cover;background-position:center;background-image: url('+tutorImage+');"></p>';
					html += '<p class="name">'+tutorName+'</p>';
					html += '</dt>';
					html += '<dd>';
					html += ret[i]['answer'];
					html += '</dd>';
					//html += '<dd class="date">'+ret[i]['aDate']+'</dd>';
					html += '</dl>';
					html += '</li>';	
				}
			}
			
			document.getElementById('innerQnaDiv').innerHTML=html;

			htmlPage = '<ul>';

			for(var i = 1; i <= ret[0]['pTotal']; i++)
			{
				if(i == nPage)
				{
					htmlPage += '<li><a class="on" onclick="inQnaDiv('+idx+', '+i+')">'+i+'</a></li>';
				}else{
					htmlPage += '<li><a onclick="inQnaDiv('+idx+','+i+')">'+i+'</a></li>';
				}

			}
			htmlPage += '</ul>';

			document.getElementById('innerQnaPageDiv').innerHTML=htmlPage;

			if(page != 0)$('html,body').animate({scrollTop:$("#bookmarkQna").offset().top-300}, 500);
		}
	});
}

var isUploading = false;
function question()
{		
	Account_Id = document.getElementById('Account_Id').value;
	noname = document.getElementById('noname').checked;
	if(noname == true)
	{
		noname = 1;
	}
	else
	{
		noname = 0;
	}

	if (Account_Id == '') {
		alert('로그인이 필요합니다');
		return;
	}
	content_question = document.getElementById('content_question').value;
	Talent_Id = document.getElementById('Talent_Id').value;	

	var p = [];
	p.push('type=setQuestion');
	p.push('content='+encodeURIComponent(content_question));
	p.push('Talent_Id='+Talent_Id);
	p.push('Writer_Id='+Account_Id);
	p.push('noname='+noname);

	var pars = p.join('&');

	if(isUploading) {
		alert('질문 등록중입니다. 잠시만 기다려 주세요');
		return false;
	}

	isUploading = true;

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: 'innerdiv'
		, oSelf: this
		, onCreate: function()
		{
			//AjaxBoard.resetTable(this.idTarget);
			//AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert" style="text-align: center;"><img src="images/ajax-loader3.gif" />데이타를 가져오는 중입니다. 잠시만 기다려 주세요.</p>', colspan: 10, rowHeight: '50px'});
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == -1 ) {
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert">검색결과가 존재하지 않습니다.</p>', colspan: 10, rowHeight: '100px'});
				
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}
			isUploading = false;
			alert("문의 사항이 등록되었습니다.");
			location.reload();
		
		}
	});
}

function answer()
{		
	content_answer = document.getElementById('content_answer').value;
	Talent_Id = document.getElementById('Talent_Id').value;
	Account_Id = document.getElementById('Account_Id').value;
	Target_Id = document.getElementById('qId').value;

	var p = [];
	p.push('type=setAnswer');
	p.push('content='+encodeURIComponent(content_answer));
	p.push('Talent_Id='+Talent_Id);
	p.push('Writer_Id='+Account_Id);
	p.push('Target_Id='+Target_Id);

	var pars = p.join('&');
	
	if(isUploading) {
		alert('답변 등록중입니다. 잠시만 기다려 주세요');
		return false;
	}

	isUploading = true;

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: 'innerdiv'
		, oSelf: this
		, onCreate: function()
		{
			//AjaxBoard.resetTable(this.idTarget);
			//AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert" style="text-align: center;"><img src="images/ajax-loader3.gif" />데이타를 가져오는 중입니다. 잠시만 기다려 주세요.</p>', colspan: 10, rowHeight: '50px'});
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == -1 ) {
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert">검색결과가 존재하지 않습니다.</p>', colspan: 10, rowHeight: '100px'});
				
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}
			isUploading = false;
			alert("답변이 등록되었습니다.");
			location.reload();
		
		}
	});
}

function m_answer(idx)
{		
	content_answer = document.getElementById('content_answer_'+idx).value;
	Talent_Id = document.getElementById('Talent_Id').value;
	Account_Id = document.getElementById('Account_Id').value;
	Target_Id = idx;

	var p = [];
	p.push('type=setAnswer');
	p.push('content='+content_answer);
	p.push('Talent_Id='+Talent_Id);
	p.push('Writer_Id='+Account_Id);
	p.push('Target_Id='+Target_Id);

	var pars = p.join('&');

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: 'innerdiv'
		, oSelf: this
		, onCreate: function()
		{
			//AjaxBoard.resetTable(this.idTarget);
			//AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert" style="text-align: center;"><img src="images/ajax-loader3.gif" />데이타를 가져오는 중입니다. 잠시만 기다려 주세요.</p>', colspan: 10, rowHeight: '50px'});
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == -1 ) {
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert">검색결과가 존재하지 않습니다.</p>', colspan: 10, rowHeight: '100px'});
				
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}
			alert("답변이 등록되었습니다.");
			location.reload();
		
		}
	});
}

function sendPhoneConfirm(phone)
{		
	var p = [];
	p.push('type=sendPhoneConfirm');
	p.push('phone='+phone);

	var pars = p.join('&');

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: ''
		, oSelf: this
		, onCreate: function()
		{	
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == -1 ) {
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert">결과가 존재하지 않습니다.</p>', colspan: 10, rowHeight: '100px'});				
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}
			if(oXHR.responseText=='0000')
			{
				alert("인증 번호가 전송 되었습니다.");
			}
			else
			{
				alert("프로그램 오류가 발생하였습니다. 사이트 관리자에게 문의하여주세요.");
			}
		}
	});
}

function phoneConfirm2(code,phone)
{		
	var p = [];
	p.push('type=phoneConfirm');
	p.push('code='+code);
	p.push('phone='+phone);	

	var pars = p.join('&');

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: ''
		, oSelf: this
		, onCreate: function()
		{	
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == -1 ) {
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert">결과가 존재하지 않습니다.</p>', colspan: 10, rowHeight: '100px'});				
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}
			if(oXHR.responseText=='0000')
			{
				alert("인증이 완료 되었습니다.");				
				location.reload();	                
			}
			else
			{
				alert("인증 번호가 틀렸습니다.");
			}
		}
	});
}

function phoneConfirm3(code,phone)
{		
	var p = [];
	p.push('type=phoneConfirm');
	p.push('code='+code);
	p.push('phone='+phone);	

	var pars = p.join('&');

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: ''
		, oSelf: this
		, onCreate: function()
		{	
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == -1 ) {
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert">결과가 존재하지 않습니다.</p>', colspan: 10, rowHeight: '100px'});				
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}
			if(oXHR.responseText=='0000')
			{
				alert("인증이 완료 되었습니다.");							              
			}
			else
			{
				alert("인증 번호가 틀렸습니다.");
			}
		}
	});
}

function phoneConfirm4(code,phone)
{		
	var p = [];
	p.push('type=phoneConfirm');
	p.push('code='+code);
	p.push('phone='+phone);	

	var pars = p.join('&');

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: ''
		, oSelf: this
		, onCreate: function()
		{	
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == -1 ) {
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert">결과가 존재하지 않습니다.</p>', colspan: 10, rowHeight: '100px'});				
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}
			if(oXHR.responseText=='0000')
			{
				alert("인증이 완료 되었습니다.");
				$('#dim').hide();
				$('#phone_box').hide();
				$('#veriPhone').hide();
				$('#verifiedPhone').show();
				$('#isAuth').val('1');

			}
			else
			{
				alert("인증 번호가 틀렸습니다.");
			}
		}
	});
}

function phoneConfirm(code,phone)
{		
	var p = [];
	p.push('type=phoneConfirm');
	p.push('code='+code);
	p.push('phone='+phone);	

	var pars = p.join('&');

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: ''
		, oSelf: this
		, onCreate: function()
		{	
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == -1 ) {
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert">결과가 존재하지 않습니다.</p>', colspan: 10, rowHeight: '100px'});				
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}
			if(oXHR.responseText=='0000')
			{
				alert("인증이 완료 되었습니다.");				
				opener.location.reload();	
                window.close();
			}
			else
			{
				alert("인증 번호가 틀렸습니다.");
			}
		}
	});
}

function phoneConfirmAuth(code,phone)
{		
	var p = [];
	p.push('type=phoneConfirm');
	p.push('code='+code);
	p.push('phone='+phone);	

	var pars = p.join('&');

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: ''
		, oSelf: this
		, onCreate: function()
		{	
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == -1 ) {
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert">결과가 존재하지 않습니다.</p>', colspan: 10, rowHeight: '100px'});				
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}
			if(oXHR.responseText=='0000')
			{
				alert("인증이 완료 되었습니다.");
				opener.PhoneConfirm();
                window.close();
			}
			else
			{
				alert("인증 번호가 틀렸습니다.");
			}
		}
	});
}

function phoneConfirmAuth2(code,phone)
{		
	var p = [];
	p.push('type=phoneConfirm');
	p.push('code='+code);
	p.push('phone='+phone);	

	var pars = p.join('&');

	var Ajax = new Ajax2();
	Ajax.init('../../Controller/execute.php', {
		method: 'post'
		, parameters: pars
		, idTarget: ''
		, oSelf: this
		, onCreate: function()
		{	
		}
		, onComplete: function(oXHR)
		{
			//alert(oXHR.responseText);
			// check
			if( oXHR.responseText == -1 ) {
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: '<p class="alert">결과가 존재하지 않습니다.</p>', colspan: 10, rowHeight: '100px'});				
				return;
			}
			if( oXHR.responseText.indexOf('Warning') != -1 )
			{
				AjaxBoard.createLoading({id: this.idTarget, type: 'text', msg: oXHR.responseText, colspan: 9, rowHeight: '100px'});
				return;
			}
			if(oXHR.responseText=='0000')
			{
				alert("인증이 완료 되었습니다.");
				PhoneConfirm();               
			}
			else
			{
				alert("인증 번호가 틀렸습니다.");
			}
		}
	});
}

function css_browser_selector(u) {
	var ua = u.toLowerCase(),
		is = function(t) {
			return ua.indexOf(t) > -1
		},
		g = 'gecko',
		w = 'webkit',
		s = 'safari',
		c = 'chrome',
		o = 'opera',
		m = 'mobile',
		v = 0,
		r = window.devicePixelRatio ? (window.devicePixelRatio + '').replace('.', '_') : '1';
	var res = [
		/* IE */
		(!(/opera|webtv/.test(ua)) && /msie\s(\d+)/.test(ua) && (v = RegExp.$1 * 1)) ?
			('ie ie' + v + ((v == 6 || v == 7) ?
				' ie67 ie678 ie6789' : (v == 8) ?
				' ie678 ie6789' : (v == 9) ?
				' ie6789 ie9m' : (v > 9 ) ?
				' ie9m' : '')) :
			/* IE 11 */
			(/trident\/\d+.*?;\s*rv:(\d+)\.(\d+)\)/.test(ua) && (v = [RegExp.$1, RegExp.$2])) ?
				'ie ie' + v[0] + ' ie' + v[0] + '_' + v[1] + ' ie9m' :
				/* FF */
				(/firefox\/(\d+)\.(\d+)/.test(ua) && (re = RegExp)) ?
					g + ' ff ff' + re.$1 + ' ff' + re.$1 + '_' + re.$2 :
					is('gecko/') ? g :
						/* Opera */
						is(o) ? o + (/version\/(\d+)/.test(ua) ? ' ' + o + RegExp.$1 :
							(/opera(\s|\/)(\d+)/.test(ua) ? ' ' + o + RegExp.$2 : '')) :
							/* K */
							is('konqueror') ? 'konqueror' :
								/* Black Berry */
								is('blackberry') ? m + ' blackberry' :
									/* Chrome */
									(is(c) || is('crios')) ? w + ' ' + c :
										/* Iron */
										is('iron') ? w + ' iron' :
											/* Safari */
											!is('cpu os') && is('applewebkit/') ? w + ' ' + s :
												/* Mozilla */
												is('mozilla/') ? g : '',
		/* Android */
		is('android') ? m + ' android' : '',
		/* Tablet */
		is('tablet') ? 'tablet' : '',
		/* Machine */
		is('j2me') ? m + ' j2me' :
			is('ipad; u; cpu os') ? m + ' chrome android tablet' :
				is('ipad;u;cpu os') ? m + ' chromedef android tablet' :
					is('iphone') ? m + ' ios iphone' :
						is('ipod') ? m + ' ios ipod' :
							is('ipad') ? m + ' ios ipad tablet' :
								is('mac') ? 'mac' :
									is('darwin') ? 'mac' :
										is('webtv') ? 'webtv' :
											is('win') ? 'win' + (is('windows nt 6.0') ? ' vista' : '') :
												is('freebsd') ? 'freebsd' :
													(is('x11') || is('linux')) ? 'linux' : '',
		/* Ratio (Retina) */
		(r != '1') ? ' retina ratio' + r : '',
		'js portrait'].join(' ');
	if(window.jQuery && !window.jQuery.browser) {
		window.jQuery.browser = v ? {msie: 1, version: v} : {};
	}
	return res;
};
(function(d, w) {
	var _c = css_browser_selector(navigator.userAgent);
	var h = d.documentElement;
	h.className += ' ' + _c;
	var _d = _c.replace(/^\s*|\s*$/g, '').split(/ +/);
	w.CSSBS = 1;
	for(var i = 0; i < _d.length; i++) {
		w['CSSBS_' + _d[i]] = 1;
	}
	var _de = function(v) {
		return d.documentElement[v] || d.body[v];
	}
	if(w.jQuery) {
		(function($) {
			var p = 'portrait', l = 'landscape';
			var m = 'smartnarrow', mw = 'smartwide', t = 'tabletnarrow', tw = 'tabletwide', ac = m + ' ' + mw + ' ' + t + ' ' + tw + ' pc';
			var $h = $(h);
			var to = 0, cw = 0;

			/* ie7 cpu 100% fix */
			function CSSSelectorUpdateSize() {
				if(to != 0) return;
				try {
					var _cw = _de('clientWidth'), _ch = _de('clientHeight');
					if(_cw > _ch) {
						$h.removeClass(p).addClass(l);
					} else {
						$h.removeClass(l).addClass(p);
					}
					if(_cw == cw) return;
					cw = _cw;
					//clearTimeout(to);
				} catch(e) {
				}
				to = setTimeout(CSSSelectorUpdateSize_, 100);
			}

			function CSSSelectorUpdateSize_() {
				try {
					$h.removeClass(ac);
					$h.addClass(
						(cw <= 360) ? m :
							(cw <= 640) ? mw :
								(cw <= 768) ? t :
									(cw <= 1024) ? tw : 'pc'
					);
				} catch(e) {
				}
				to = 0;
			}

			if(w.CSSBS_ie) {
				setInterval(CSSSelectorUpdateSize, 1000);
			} else {
				$(w).on('resize orientationchange', CSSSelectorUpdateSize).trigger('resize');
			}
			$(w).load(CSSSelectorUpdateSize);
		})(w.jQuery);
	}
})(document, window);

function move(num){
	$('.wrap').css({
		'transform': 'translate3d(0,'+ -100 * num +'%,0)',
		'-webkit-transform': 'translate3d(0,'+ -100 * num +'%,0)'

		// 'position': 'absolute',
		// 'top': ''+ -100 * num +'%'

		// '-webkit-transform': 'translateY('+ -100 * num +'%)',
		// 'transform': 'translateY('+ -100 * num +'%)'
		// 'top': -100 * num +'%', // background fixed 가능
	});
	
	num==0 ? $('.video_play').get(0).play() : $('.video_play').get(0).pause(); // 1 page가 아니면 영상 멈춤

}

function navSwitch(num,nav){ // 섹션 이동 시 페이지점 을 이동 시켜 줌
		nav.find('li').removeClass('active');
		nav.find('li:eq('+num+')').addClass('active');
		directSwitch(num);
	}

function directSwitch(num){ // nav를 클릭해서 바로 이동했을 경우 섹션에 class를 추가해 줌.
		$('.section').removeClass('active');
		setTimeout(function(){
			$('.section'+(num+1)).addClass('active');
			$('.section.active .carousel-wrap').length ? carouselstart() : carouselstart('off'); //carousel이 있으면 시작
		},250); // 페이지가 자리 잡은 후 애니메이션 시작
}

function url(){
	var url = window.location.href;
}

var interval; // interval time;
function carouselstart(sw){ // carousel이 시작
	clearInterval(interval);	
	var eachspeed = [3000, 3000];
	var self = $('.section.active .carousel-wrap');
	var idx = self.index();
	function eachinter(){
		interval = setInterval(function(){
			$(self).find('.buttons .right').trigger('click');
		},eachspeed[idx]);
	}
	if(sw!='off'){
		$(self).find('.slide, .dots, .buttons a').on({
			mouseenter:function(){
				clearInterval(interval);
			},
			mouseleave:function(){
				clearInterval(interval); // 시간이 중첩되는 문제를 해결 함.
				eachinter();
			} 
		});
		eachinter();
	}
}


function carousel(){ //carousel wrap
	var ing=true;
	var loop=false;
	var carousel = {
		num: 0,
		carouselWraps: $('.carousel-wrap').length,
		items: $('.slide li').length,
		speed : 500,
		dotactive : function(selfdot,idx,active){
			selfdot.find('.dot').removeClass('active');
			selfdot.find('.dot').eq(active).addClass('active');
			if(idx.parents('.carousel-wrap').find('.slideview2')){
				var self2 = idx.parents('.carousel-wrap').find('.slideview2');
				var self3 = idx.parents('.carousel-wrap').find('.itemwrap');
				self2.find('li').removeClass('active');
				self2.find('li:eq('+active+')').addClass('active');
				self3.find('li').removeClass('active');
				self3.find('li:eq('+(active+1)+')').addClass('active');
			}
		}
	}


	// function
	function slide(direction,idx,idxa){ //idxa는 .dot을 눌렀을 때의 index 값
		var self = idx.parents('.carousel-wrap').find('.slide');
		var selfdot = idx.parents('.carousel-wrap').find('.dots');
		var active = idx.parents('.carousel-wrap').find('.dots .active').index();
		switch(direction){
			case '+' : direction = '+=1'; break;
			case '-' : direction = '-=1'; break;
			case 'dot' : direction = '-'+(idxa+1); break;
			default : break;
		}
		
		// function slide2(active){
		// 	if(idx.parents('.carousel-wrap').find('.slideview2')){
		// 		var self2 = idx.parents('.carousel-wrap').find('.slideview2');
		// 		self2.find('li').hide();
		// 		self2.find('li:eq('+active+')').show();
		// 	}
		// }

		if(ing==true){
			ing=false;

			if(direction == '+=1'){
				if(active==0){
					active=(self.find('li').length-3); // 0 부터 시작이고 clone 한 것 까지 총 3을 빼야 한다.
					loop= true;
				}else{
					active--;
				}
			}else if(direction == '-=1'){
				if(active==(self.find('li').length-3)){
					// alert(3);
					active=0;
					loop = true;
				}else{
					// alert(1);
					active++; // 1.먼저 1을 더함
				}
			}

			if(idxa>=0){//dot을 누를 경우
				carousel.dotactive(selfdot,idx,idxa); // .dot에 active를 줌
				// slide2(idxa);
			}else{// 좌우 버튼을 누를 할 경우
				carousel.dotactive(selfdot,idx,active); //  현재 active(+,-가 적용된 후의 active)에 .active를 추가
				// slide2(active);
			}

			self.find('ul:not(:animated)').animate({'left':direction+'00%'},carousel.speed,function(){
				if(direction == '+=1'){
					if(loop){
						self.find('ul').css('left','-'+(self.find('li').length-2)+'00%');
						loop=false;
					}
				}else if(direction == '-=1'){
					if(loop){
						self.find('ul').css('left','-100%');
						loop=false;
					}
					// if(active==(self.find('li').length-3)){ // 애니메이션이 끝났을 때 위에서 +1 한 것을 반영 하여.. 작동 함.
					// 	self.find('ul').css('left','-100%');
					// 	// alert(2);
					// 	console.log(active);
					// }else{
					// 	console.log(active);
					// }
				}
				ing=true;
				// console.log(ing);
			});
			// console.log(ing);
			// console.log(active);
		}

		// self.find('ul:not(:animated)').animate({'left':direction+'00%'},carousel.speed,function(){
		// 	ing=true;
		// });

	}

// initialization
	for(var j=0; j<carousel.carouselWraps; j++){
		var childlength = $('.carousel-wrap:eq('+j+') .slide li').length;
		for(var i=0; i<childlength;i++){
			$('.dots:eq('+j+')').append('<a class="dot">'+(i+1)+'</a>');
			$('.dots:eq('+j+') .dot:eq(0)').addClass('active');	
			$('.slide:eq('+j+') .itemwrap li:eq('+i+')').attr('data-item-num',''+(i+1));
		}
	}

	$('.slide').each(function(i,e){
		var ulwidth = ($(e).find('li').length+2)*100;
		var items = $(e).find('li').length;
		var itemWidth = 100/(items+2)+'%'; //2는 clone
		$(e).find('ul').css({'left':'-100%','width':ulwidth+'%'});
		$(e).find('.itemwrap li').css({'width':itemWidth});
		$(e).find('.itemwrap li').each(function(i1,e1){
			$(e1).addClass('item'+(i1+1)+'');
		});
		$(e).find('li:first').before($(e).find('li[data-item-num='+items+']').clone());
		$(e).find('li:last').after($(e).find('li[data-item-num=1]').clone());
	});

	if($('.slideview2').length){
		var view2s = $('.slideview2').length;
		for(var i=0; i<view2s; i++){
			var view2items = $('.slideview2:eq('+i+') ul li').length;
			var thisview2 = $('.slideview2:eq('+i+')');
			for(var j=0; j<view2items; j++){
				thisview2.find('li:first-child').addClass('active');
				thisview2.find('li:eq('+j+')').addClass('item'+(j+1));
			}
			
		}

	}

	//event
	$('.left').on('click',function(){
		var idx = $(this);
		// active = $(this).parents('.carousel-wrap').find('.active').index();
		slide('+',idx);
	});
	$('.right').on('click',function(){
		var idx = $(this);
		// active = $(this).parents('.carousel-wrap').find('.active').index();
		slide('-',idx);
	});
	$('.dots .dot').on('click',function(){
		var idx = $(this);
		var idxa = $(this).index();
		// carousel.num = idxa;
		// active = $(this).parents('.carousel-wrap').find('.active').index();
		slide('dot',idx,idxa);
	});
}

function jstab(){
	//tab-content
	$('.tab-content .tab-btns .tab-btn').on('click',function(){
		var index = $(this).index(); //li의 순서와 content의 순소를 일치 시키기 위해 index를 뽑아냄
		// $(this).parents('.tab-content').find('.tab-content-item:eq('+index+')').addClass('active').show(); // button의 index와 같은 순서의 tab을 show();
		$(this).parents('.tab-content').find('.tab-content-item').removeClass('active'); // 1차적으로 전체 가리기
		$(this).parents('.tab-content').find('.tab-content-item:eq('+index+')').addClass('active'); // button의 index와 같은 순서의 tab을 show();
		$(this).parents('.tab-content').find('.tab-btns .tab-btn .icon').removeClass('hover');
		$(this).find('.icon').addClass('hover');

		//section5 text도 함께 onoff 되도록
		if($(this).parents('.section5').length){
			$(this).parents('.section5').find('.text2 .item-text').removeClass('active');
			$(this).parents('.section5').find('.text2 .item-text:eq('+index+')').addClass('active');
		}
	});

// $(".tab-contents .tab-content-item:not(:first-child)").hide(); // js가 없을 땐 기본적으로 보일 수 있도록 hide를 js에서 제어
$('.section5 .text2 .item-text:eq(0)').addClass('active');
$(".tab-contents .tab-content-item:first-child").addClass('active');
$(".tab-btns .tab-btn:first-child .icon").addClass('hover'); // js가 없을 땐 기본적으로 보일 수 있도록 hide를 js에서 제어
}

function plax(){ // plax
	$('.s7-plax1').plaxify({"yRange":30, 'invert' : true });
	$('.s7-plax2').plaxify({"yRange":14, 'invert' : true });
	$.plax.enable();
}


//
// document ready ///////////////////////////////////////////
// 
$(function(){

	var sections = $('.wrap .section').length-1;
	var now = 0; // 현재 페이지 번호
	var playing = true;
	var nav = $('.nav');
	var position = $('.position');
	var bwcheck = $('html').attr('class');
	var bwv,
	older,
	ribbon;
	
	if(bwcheck.indexOf('ie6789')>=0){//browser check
		older= true;
		bwv = bwcheck.split(' ');
		$('.section').addClass('active');
		switch(bwv[2]){
			case 'ie6' : bwv = '6'; break;
			case 'ie7' : bwv = '7'; break;
			case 'ie8' : bwv = '8'; break;
			case 'ie9' : bwv = '9'; break;
			default : bwv = '??'; break;
		}

		ribbon = '<div class="ribbon">\
			<span class="ribbon-text">본 페이지는 인터넷 익스플로러 10 이상, 크롬, 파이어폭스에 최적화 되어 있습니다. 현재 인터넷익스플로러 버전은 '+bwv+' 입니다. <a href="http://windows.microsoft.com/ko-KR/internet-explorer/download-ie" target="_blank">업데이트 하기</a></span>\
			<button type="button" title="리본 레이어 닫기" class="ribbon-close"><span class="icon img-x-white"></span></button>\
			<span class="ribbon-mask" ></span>\
		</div>';

		$('body').append(ribbon);

		$('.ribbon-close').on('click',function(){
			$('.ribbon').hide();
		});
	}

	//event

////// 이하 kakaopay 참조

function handle(delta) {
	if(Math.abs(delta) < 0.9) return;
	// if(true == _actionFlag) return;

	if(!$('html').is('.ie6789')){ // ie6789에서는 fullpage scroll 작동 안함.
		if (delta < 0){

			if(now < sections && playing==true ){
				// scroll down
				now += 1;
				playing = false;
				move(now);
				navSwitch(now,position);
			}else if(now==sections){
				//  마지막 섹션에서 또 내릴 때 추가 애니메이션 예정
				// $('.section7').addClass('bottomactive');
			}
	  } else {
	  	if(now>0 && playing==true){
			now -= 1;
			playing = false;
			move(now);
			nav.find('li').removeClass('active');
			navSwitch(now,position);
		}
	  }
		
	}
}

function wheel(event){
		var delta = 0;
		if (!event) /* For IE. */
				event = window.event;
		if (event.wheelDelta) { /* IE/Opera. */
				delta = event.wheelDelta/120;
				/** In Opera 9, delta differs in sign as compared to IE.
				 */

				if (window.opera)
						delta = -delta;
		} else if (event.detail) { /** Mozilla case. */
				/** In Mozilla, sign of delta is different than in IE.
				 * Also, delta is multiple of 3.
				 */
				delta = -event.detail/3;

		}
		/** If delta is nonzero, handle it.
		 * Basically, delta is now positive if wheel was scrolled up,
		 * and negative, if wheel was scrolled down.
		 */
		if (delta)
				handle(delta);
}

if (window.addEventListener)
		/** DOMMouseScroll is for mozilla. */
		window.addEventListener('DOMMouseScroll', wheel, false);

/** IE/Opera. */
window.onmousewheel = document.onmousewheel = wheel;

	// /////////////////////////////// 이하 ff에서 문제 있음.

	// $(window).on('mousewheel DOMMouseScroll', function(event){
	// 	if (event.originalEvent.wheelDelta > 0 || event.originalEvent.detail < 0) {
	// 		// scroll up
	// 		if(now>0 && playing==true){
	// 			now -= 1;
	// 			playing = false;
	// 			move(now);
	// 			nav.find('li').removeClass('active');
	// 			navSwitch(now,position);
	// 		}
	// 	}else{
	// 		if(now < sections && playing==true ){
	// 			// scroll down
	// 			now += 1;
	// 			playing = false;
	// 			move(now);
	// 			navSwitch(now,position);
	// 		}else if(now==sections){
	// 			//  마지막 섹션에서 또 내릴 때 추가 애니메이션 예정
	// 			// $('.section7').addClass('bottomactive');
	// 		}
	// 	}
	// });


	$('.section3 .btn-more, .layer-close').on('click',function(){
		$('.section3-layer').toggleClass('layer-on');
		return false;
	});


	$('.tab-contents').on('mousewheel DOMMouseScroll', function(event){
		if (event.originalEvent.wheelDelta > 0 || event.originalEvent.detail < 0) {
			// scroll up
			event.stopPropagation();
		}else{
			event.stopPropagation();
		}
	});
	
	$('.position ul li').on('click',function(){
		var idx = now = $(this).index();
		$('.position li').removeClass('active');
		$('.position').each(function(){
			$(this).find('li:eq('+idx+')').addClass('active');
		})
		move(idx);
		directSwitch(idx);
	});

	$('.wrap').on('transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd',function(){
		playing=true;
	});

	// end event
	$('.nav li:first-child').addClass('active');
	$('.header li:first-child').addClass('active');
	var start = setTimeout(function(){
		$('.section1').addClass('active');
	},600);

// element check
if($('.carousel-wrap').length)carousel();
if($('.tab-content').length)jstab();
if($('.plax').length)plax();

// jquery library 
//$(".customscroll").mCustomScrollbar();


// layerpop import
$(".btn-sms-send").on('click',function() {
		$("body").append("<div id='backgroundSmsLayer'></div>");
		$("#backgroundSmsLayer").css({
			"position":"fixed",
			"top":"0px",
			"left":"0px",
			"width":"100%",
			"height":"100%",
			"background-color":"#000",
			"z-index":"5000",
			"opacity":"0.3"
		});
		
		$('#layerSms').fadeIn();
			
			$("#layerSms").css({
				"position":"fixed",
				"top":"50%",
				"left":"50%",
				"width":"344px",
				"height":"320px",
				"margin-left":"-172px",
				"margin-top":"-160px",
				"display":"block",
				"z-index":"5001",
				"border":"0px"
			});
			
		
	});
$(".close").on('click',function() {
		$("#backgroundSmsLayer").remove();
		$("#layerSms .os").attr("checked", false);
		$("#layerSms .hp").val(null);
		$('#layerSms').fadeOut();
	});
});

var generateRandom = function (min, max) {
   var ranNum = Math.floor(Math.random()*(max-min+1)) + min;
      return ranNum;
   }


function qPop(Id) {
	if(Id ==0)
	{
		var win = window.open('/My/Qnatutee', 'win', 'width=400, height=665, scrollbars=no, resizable=yes');
	} 
	else
	{	
		 var win = window.open('/My/Qnatutor', 'win', 'width=400, height=665, scrollbars=no, resizable=yes');
	}
}

function mqPop(Id) {
	num = generateRandom(1, 1000000);
	if(Id ==0)
	{
		var win = window.open('/My/Qnatutee', num, 'width=400, height=665, scrollbars=no, resizable=yes');
	} 
	else
	{	
		 var win = window.open('/My/Qnatutor', num, 'width=400, height=665, scrollbars=no, resizable=yes');
	}
}

function qNewPop(Id) {
	var win = window.open('/My/Qnanew/'+Id, 'win', 'width=400, height=665, scrollbars=no, resizable=yes');
}

function mqNewPop(Id) {
	num = generateRandom(1, 1000000);
	var win = window.open('/My/Qnanew/'+Id, num, 'width=400, height=665, scrollbars=no, resizable=yes');
}

function weekly(){
	if(!$('div','.weekly_best').hasClass('inner_area'))
	{$num = Math.floor((Math.random() * 2) + 1);
	$num -=1;
	$('div','.weekly_best').eq($num).addClass("inner_area");}
	
	$('.weekly_best').fadeIn("fast");
	$('.weekly_best').show();
	$('.inner_area','.weekly_best').show();
}
function weekly2(){
	$('.weekly_best').hide();
	$('.inner_area','.weekly_best').hide();
	$('div','.weekly_best').removeClass("inner_area");	
}

function weekly_1(){
	if(!$('div','.weekly_best2').hasClass('inner_area2'))
	{$num = Math.floor((Math.random() * 2) + 1);
	$num -=1;
	$('div','.weekly_best2').eq($num).addClass("inner_area2");}
	
	$('.weekly_best2').fadeIn("fast");
	$('.weekly_best2').show();
	$('.inner_area2','.weekly_best2').show();
}
function weekly_2(){
	$('.weekly_best2').hide();
	$('.inner_area2','.weekly_best2').hide();
	$('div','.weekly_best2').removeClass("inner_area2");	
}



/*원써니 검색창 아래 박스*/
function search_box(){
	$('.search_best').show();
	$('.search_back').show();
}
 $(function(){
	$('.search_back').click(function(){		
		$('.search_best').hide();
		$('.search_back').hide();
	});
 });

