<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="../../resources/js/upload.js"></script>

<style type="text/css">
body {
	font-family: '맑은 고딕', verdana;
	padding: 0;
	margin: 0;
}

div.description {
	text-align: center;
}

nav#nav {
	padding: 10px;
	text-align: right;
}

nav#nav ul li {
	display: inline-block;
}

ul, ol, li {
	list-style: none;
	margin: 0;
	padding: 0;
}

ul.goodsMenu>li {
	display: inline-block;
	width: 80px;
	padding: 5px 10px;
	background: #eee;
	border: 1px solid #eee;
	text-align: center;
	position: relative;
}

ul.goodsMenu>li:hover {
	background: #fff;
}

ul.goodsMenu>li ul.submenu {
	display: none;
	position: absolute;
	top: 30px;
	left: 0;
}

ul.goodsMenu>li:hover ul.submenu {
	display: block;
}

ul.goodsMenu>li ul.submenu>li {
	display: inline-block;
	width: 80px;
	padding: 5px 10px;
	background: #eee;
	border: 1px solid #eee;
	text-align: center;
}

ul.goodsMenu>li ul.submenu>li:hover {
	background: #fff;
}

 section#content ul li { display:inline-block; }
 
 .fadding-photo:hover { 
 	opacity:0.4;
 }
</style>
<title>Insert title here</title>
</head>
<body>
  
	<div class="container">
	  <div class="row">
	  
	  <nav id="nav">
	  	<div id="nav_box">
	  		네비게이션입니다.
	  	</div>

	  <ul class="goodsMenu">
	  	<li class="menu0"><a href="/goods/goodsList">메인으로</a>
	  	</li>
	  	<li class="menu1"><a href="/goods/goodsListBrand?g_brand=로즈몽">로즈몽</a>
	  		<ul class="row submenu">
	  			<li><a href="/goods/goodsListWoman?g_category=1&g_brand=로즈몽">여성</a></li>
	  			<li><a href="/goods/goodsListPublic?g_category=0&g_brand=로즈몽">공용</a></li>
	  		</ul>
	  	</li>
	  	<li class="menu2"><a href="/goods/goodsListBrand?g_brand=세이코">세이코</a>
	  		<ul class="row submenu">
	  			<li><a href="/goods/goodsListWoman?g_category=1&g_brand=세이코">여성</a></li>
	  			<li><a href="/goods/goodsListMan?g_category=2&g_brand=세이코">남성</a></li>
	  			<li><a href="/goods/goodsListPublic?g_category=0&g_brand=세이코">공용</a></li>
	  		</ul>
	  	</li>
	  	<li class="menu3"><a href="/goods/goodsListBrand?g_brand=아르마니">아르마니</a>
	  		<ul class="row submenu">
	  			<li><a href="/goods/goodsListWoman?g_category=1&g_brand=아르마니">여성</a></li>
	  			<li><a href="/goods/goodsListMan?g_category=2&g_brand=아르마니">남성</a></li>
	  			<li><a href="/goods/goodsListPublic?g_category=0&g_brand=아르마니">공용</a></li>
	  		</ul>
	  	</li>
	  	<li class="menu4"><a href="/goods/goodsNoSelling">판매종료</a>
	  		<ul class="row submenu">
	  			<li><a href="/goods/goodsListBrandNoSelling?g_brand=로즈몽">로즈몽</a></li>
	  			<li><a href="/goods/goodsListBrandNoSelling?g_brand=세이코">세이코</a></li>
	  			<li><a href="/goods/goodsListBrandNoSelling?g_brand=아르마니">아르마니</a></li>
	  		</ul>
	  	</li>
	  </ul>
	  </nav>
	  

	<section id="content">

	  	<label for="goodsList">리스트입니다.</label>
		<div class="row">
			<a class="btn btn-info" href="/goods/goodsInsert">상품올리기</a>
		</div>		
	 <hr>
	 <div id="container_box">
		 <div>
		 	<a href="/goods/goodsList">최신순</a>
		 	<a href="/goods/rowPriceGoods">낮은가격순</a>
		 	<a href="/goods/highPriceGoods">높은가격순</a>
		 </div>
		 <ul>
		 	<c:forEach items="${goodsList}" var="list"  varStatus="status">
			 	<li>
		    		<div class="goodsThumb">
		                <div class="form-group">
		                <a href="/goods/goodsRead?g_id=${list.g_id}" >
		                <!-- 비동기이기때문에 index값을 지정해서 맞는 값만 넣기 -->
			            	<ul id="${status.index}"  class="uploadedList clearfix"></ul>
		                </a>
		        	 	</div>
		    		</div>
		    		<div class="description">
		     			<p>
		            		<a href="/goods/goodsRead?g_id=${list.g_id}" >
		            		<span>${list.g_name}</span></a>
		            	</p>
					<div></div>
						<p class="price"><span>&#8361;<fmt:formatNumber value="${list.g_price}" type="number" /></span></p>
						<p class="priceSale">할인율 : ${list.g_sale}%</p>
		        	<div>
		            	<div></div>
		        	</div>
		    	</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	</section>

	 </div> <!-- row 끝 -->
	 
	 <!-- 페이징!! -->
	 <div class="row text-center">
		<ul class="pagination">
			<c:if test="${pm.cri.page>1}">
				<li><a href="/goods/goodsList${pm.makeQuery(pm.cri.page-1)}">&laquo;</a></li>
			</c:if>
				<c:forEach var="idx" begin="${pm.beginPageNum}"
					end="${pm.stopPageNum}">
					<li class="${pm.cri.page==idx?'active':''}"><a
						href="/goods/goodsList${pm.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pm.cri.page<pm.totalPage}">
					<li><a href="/goods/goodsList${pm.makeQuery(pm.cri.page+1)}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	 
	</div> <!-- container 끝!! -->
	
	<div class="form-group" style="display: inline-block; position: absolute;" >
		 <form method="get" action="/goods/goodsSearch">
			<div class="col-xs-3 col-sm-2" >
				<select class="form-control" id="ssel" name="searchType">
					<option disabled>검색 기준</option>
					<option value="g_name">상품명</option>
				</select>
			</div>
			<div class="input-group col-xs-1 col-sm-1">
				<input class="form-control" id="keyword" name="keyword" size="20px" style="text-align:center; width:200px;"> 
				<span class="input-group-btn">
					<button class="btn btn-success">검색</button>
				</span>
			</div>
		</form>
	</div>
	
	<div id="goto_top" class="bordered" style="visibility: visible; top: 613px; right: 170px;">
	<i class="glyphicon glyphicon-eject"></i>
	</div>

	
	<!-- 이미지 불러오기위한 handlebars -->
	<script id="source" type="text/x-handlebars-template">
		<li class="col-xs-3 pull-left" >
			<span>
				<img src="{{imgsrc}}" class="fadding-photo">
			</span>
		</li>
	</script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
		var page = 1;
		
		// 불러온 g_id값 저장변수
		var arr="";
		
		// 반복문사용
		// # : 구분자
		<c:forEach items="${goodsList}" var="pic">
			arr=arr+"#"+"${pic.g_id}";			
		</c:forEach>
	
		goodsPicDbGet(arr);
		
		goto_top_left = $('.next_a').length>0?prev_left+50:prev_left;
		$('#goto_top').css({visibility: 'hidden'}).css( 'top', window_height -50 ).css( 'right', goto_top_left );

		$('#goto_top').click(function(){
			$("html, body").animate({scrollTop: 0}, 100);
		});

		$(window).scroll(function(){
			if(body_height > window_height)
			{
				var scroll_top = $(document).scrollTop() + window_height;
				if(scroll_top > window_height) 	$('#goto_top').css({visibility: 'visible'});
				else $('#goto_top').css({visibility: 'hidden'});
			}
		});
		
		
		});

		function goodsPicDbGet(arr) {
			var source= $("#source").html();
			var template= Handlebars.compile(source);

			// #을 자른다
			arr=arr.substring(1);
			arr=arr.split("#");
			$.each(arr, function(index) {
				$.getJSON("/goods/goodsPicDbGet/"+this, function(result) {
						var data= getFileInfo(result["fullName"]);
						$("#"+index).append(template(data));
				});		
			});
		}
	</script>
</body>
</html>