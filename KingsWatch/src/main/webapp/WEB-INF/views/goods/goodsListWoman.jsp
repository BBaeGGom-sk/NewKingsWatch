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

<!--모바일-->
<meta name='viewport' content='user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height'>
<!-- 모바일 메뉴 styles -->
<link rel='stylesheet' type='text/css' href='https://rosemont.co.kr/plugin/mobile/demo.css' />
<link rel='stylesheet' type='text/css' href='https://rosemont.co.kr/plugin/mobile/component.css' />
<!--css-->
<link rel='stylesheet' type='text/css' href='https://rosemont.co.kr/font/ff.css'>
<link rel='stylesheet' type='text/css' href='https://rosemont.co.kr/css/reset.css'>
<link rel='stylesheet' type='text/css' href='https://rosemont.co.kr/css/style.css'>
<link rel='stylesheet' type='text/css' href='https://rosemont.co.kr/css/responsive.css'>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="http://unitage.co.kr/ind-script/optimizer.php?filename=tdTBbsMgDADQe7PrvsNqt4_YbziOQ1gAR9hI7d-XtDmsmiZNKT3Gws_EgGGSyHA8ZViyuIwRMquUTAykCmOWZEASo6S3GniH_6xnOqiEYl7SoZfzzsRitrdowAvnfamGfeAfqUxdUc4K07fKx-kIS-mDp26yGEAH7gZW7xLo7NPnzYwylMBrvaGQQeRUFqQZXVM2eLUkOWJoqd7FBZ1Pbrdbuy_FoEf1dCvy6_486d0D7bx6_vWDD8W3N00kmF_awxOHF6jbRXhBH556V3-ydRW1Vx-H1o5XhXlm28IBTdppCVOJ7TiTpRv9mYcWU2TrpzJmmr4Yh4ch_DRraBzEyTi2-_9eSiJ-xS5TQ3T16kk1FKnu0km-rOQV&type=css&k=90a9a5ce5e641a6d9335ff94029fdf99fc61579e&t=1545356289" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="../../resources/js/upload.js"></script>
<style type="text/css">
.m_container {
    overflow-y: auto;
    overflow-x: hidden; 
}
.conP, .wrapper, .lineWrapper {
    width: 100%;
    max-width: 1440px;
    margin: 0 auto;
    padding: 0 45px;
    box-sizing: border-box;
}
.bbList {
    overflow: hidden;
    font-size: 0;
    margin: 0 0 -40px;
}

ol, ul {
    list-style: none;
}
.bbList li a, .bbList li img {
    width: 100%;
}
a {
    display: inline-block;
    cursor: pointer;
    text-decoration: none !important; 
}
.imgBox img {
    display: block;
}
.watch3Layout .imgBox {
    padding: 60px 100px;
    background-size: cover;
    background-position: center;
}

.watch .imgBox {
    background-color: #fff;
    padding: 20px 50px;
}
.imgBox {
    position: relative;
    background-image: url(../img/pub2/back_gr_gold.jpg);
    background-size: cover;
    background-position: center;
}
.textWrap {
    overflow: hidden;
}
@media screen and (max-width: 1200px)
.textWrap .txtBox {
    margin-top: 25px;
}

.textWrap .txtBox {
    text-align: center;
    margin-top: 40px;
}
.pdName {
    font-size: 24px;
    color: #333;
    text-transform: capitalize;
    margin-bottom: 15px;
}
.pdDetail {
    font-size: 14px;
    color: #B48C83;
    text-transform: capitalize;
    letter-spacing: 1.5px;
    font-family: serif;
}

.spanAlign {
	text-align: right;
	padding-right: 25px;
	font-size: 15px;
}
</style>

<style type="text/css">
.top_cate {
    margin: 0 auto;
    padding: 0px;
    width: 100%;
    height: 49px;
    text-align: center;
    border-top: 1px solid #e6e6e6;
    border-bottom: 1px solid #e6e6e6;
    background-color: rgba( 255,255,255,0.9 );
    z-index: 98;
}
.xans-layout-category {
    margin: 0 auto;
    text-align: center;
    width: 1280px;
    height: 49px;
    background-color: rgba( 255,255,255,0 );
    z-index: 98;
}
.xans-layout-category .position {
    margin: 0px;
}
.xans-layout-category .position > ul {
    padding: 0px;
    font-size: 0;
    line-height: 0;
}

ul, menu, dir {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.xans-layout-category .position > ul > li {
    position: relative;
    display: inline-block;
    width: auto;
    height: 49px;
    padding: 0 27px 0px;
}

li {
    list-style: none;
}

.xans-product-normalmenu .function {
    overflow: hidden;
    text-align: right;
    height: 25px;
    line-height: 25px;
    border: 1px solid #e6e6e6;
    font-size: 0px;
    letter-spacing: 0px;
    word-spacing: 0px;
}
.xans-product-normalmenu .prdCount {
    float: left;
    font-size: 10px;
    padding: 0 0 0 10px;
    color: #5b5b5b;
}
.xans-product-normalmenu p {
    margin: 0 auto;
    text-align: center;
    font-family: Verdana,Arial,"돋움",Dotum,'Apple SD Gothic Neo',AppleGothic,sans-serif;
}
.xans-product-normalmenu ul#type {
    display: inline;
    margin: 0 4px 0 0;
}

#type {
    display: inline;
    margin: 0 4px 0 0;
}

#type li {
    display: inline;
    font-size: 10px;
    padding: 0 10px 0 10px;
    background-size: 1px 8px;
}

#type li:first-child {
    background: none;
}
</style>

<style type="text/css">
.navbar-collapse {
    -ms-flex-preferred-size: 100%;
    flex-basis: 100%;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
}
.ml-auto, .mx-auto {
    margin-left: auto !important;
}
.dropup, .dropright, .dropdown, .dropleft {
    position: relative;
}
</style>


<style type="text/css">
.menubar {
	display: inline-block;
}

.menubar li ul {
background: rgb(109,109,109);
display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:200px;
z-index:200;
}

.menubar li:hover ul {
display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}
 
.ScrollButton {
  position: fixed;   /* 버튼의 위치 고정 */
  right: 10px;       /* x 위치 입력 */
  cursor: pointer;   /* 호버링 했을 때 커서 모양 변경 */
  z-index: 10;       /* 다른 태그에 가려지지 않게 우선순위 변경 */
  display: none;     /* 스크롤 위치에 상관없이 보이게 하려면 생략 */
}
/* 두 태그에 각각 y 위치 입력 */
#TopButton {
  bottom: 108px;        
}
#BottomButton {
  bottom: 75px;
}

.pagination > li > a,
.pagination > li > a:focus,
.pagination > li > a:hover {
    color: black;
    background-color: white;
    border-color: white;
}
.active a{
    color: white !important;
    background-color: black !important;
    border-color: black !important;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<%
		session.getAttribute("login");
	 %>
	  
	<div class="m_container">
	  <div class="row">


<div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="index.html" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="menu.html" class="nav-link">Menu</a></li>
	          <li class="nav-item"><a href="services.html" class="nav-link">Services</a></li>
	          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
	          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="room.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="shop.html">Shop</a>
                <a class="dropdown-item" href="product-single.html">Single Product</a>
                <a class="dropdown-item" href="room.html">Cart</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div>
            </li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
	          <li class="nav-item cart"><a href="cart.html" class="nav-link"><span class="icon icon-shopping_cart"></span><span class="bag d-flex justify-content-center align-items-center"><small>1</small></span></a></li>
	        </ul>
	      </div>
	  
	  <nav id="nav">
	  	

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
	  	<c:if test="${login.u_id eq 'admin'}">
		  	<li class="menu4"><a href="/goods/goodsNoSelling">판매종료</a>
		  		<ul class="row submenu">
		  			<li><a href="/goods/goodsListBrandNoSelling?g_brand=로즈몽">로즈몽</a></li>
		  			<li><a href="/goods/goodsListBrandNoSelling?g_brand=세이코">세이코</a></li>
		  			<li><a href="/goods/goodsListBrandNoSelling?g_brand=아르마니">아르마니</a></li>
		  		</ul>
		  	</li>
		 </c:if>
	  </ul>
	  </nav>

	<div class="conP mContain">
        <ul class="bbList watch watch3Layout">
	        	<div style="display: inline-block;">
	        	<c:if test="${login.u_id eq 'admin'}">
	 	       		<a class="btn btn-info" href="/goods/goodsInsert">상품올리기</a>
	        	</c:if>
	        	</div>
	        	<div style="display: inline-block; float: right; margin-bottom: auto;">
					<a href="/goods/goodsListPublic" class="href_tag"><span class="spanAlign">NEW</span></a>
					<a href="/goods/rowPriceGoodsWoman"	class="href_tag"><span class="spanAlign">ROW PRICE</span></a>
					<a href="/goods/highPriceGoodsWoman"	class="href_tag"><span class="spanAlign">HIGH PRICE</span></a>
		        </div>
			<hr>
			<c:if test="${goodsListWoman ne null}">
				<div style="clear: both; margin:auto; padding-left: 180px;">
					<img src="../../resources/img/noitems.png">
				</div>
			</c:if>	
		<div style="clear: both;">
        <c:forEach items="${goodsListWoman}" var="list"  varStatus="status">
            <li>
                <a href="/goods/goodsRead?g_id=${list.g_id}">
                    	<div id="${status.index}"  class="uploadedList">
	
						</div>
                    <div class="textWrap">
                        <div class="txtBox">
                            <p class="pdName">${list.g_name}</p>
                            <p class="pdDetail">&#8361;<fmt:formatNumber value="${list.g_price}" type="number" /></p>
                        </div>
                    </div>
                </a>
            </li>
            </c:forEach>
        </div>
        </ul>
    </div>


	 </div> <!-- row 끝 -->
	 
	 <!-- 페이징!! -->
	 <div class="row text-center">
		<ul class="pagination">
			<c:if test="${pm.cri.page>1}">
				<li><a href="/goods/goodsListWoman${pm.makeCategory(pm.cri.page-1)}">&laquo;</a></li>
			</c:if>
				<c:forEach var="idx" begin="${pm.beginPageNum}"
					end="${pm.stopPageNum}">
					<li class="${pm.cri.page==idx?'active':''}"><a
						href="/goods/goodsListWoman${pm.makeCategory(idx)}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pm.cri.page<pm.totalPage}">
					<li><a href="/goods/goodsListWoman${pm.makeCategory(pm.cri.page+1)}">&raquo;</a></li>
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
	
	<a id="TopButton" class="ScrollButton"><img src="../resources/img/top.png"></a>
	<a id="BottomButton" class="ScrollButton"><img src="../resources/img/bottom.png"></a>
	
	<a id="footer"></a>
	
	<!-- 이미지 불러오기위한 handlebars -->
	<script id="source" type="text/x-handlebars-template">
			<div class="prdImg">
				<img src="{{imgsrc}}" class="thumb fadding-photo"> 
			</div>
	</script>
	

	
	<script type="text/javascript">
		$(document).ready(function() {
			
		var page = 1;
		
		// 불러온 g_id값 저장변수
		var arr="";
		
		// 반복문사용
		// # : 구분자
		<c:forEach items="${goodsListWoman}" var="pic">
			arr=arr+"#"+"${pic.g_id}";			
		</c:forEach>
	
		goodsPicDbGet(arr);
		
		$(function() {
		    $(window).scroll(function() {
		        if ($(this).scrollTop() > 100) {
		            $('.ScrollButton').fadeIn();
		        } else {
		            $('.ScrollButton').fadeOut();
		        }
		    });
		        
		    $("#TopButton").click(function() {
		        $('html, body').animate({scrollTop : 0}, 800);
		        return false;
		    });
		 
		    $("#BottomButton").click(function() {
		        $('html, body').animate({scrollTop : ($('#footer').offset().top)}, 800);
		        return false;
		    });
		});
		
		// 브랜드+카테고리 동적으로으로 붙이기
		$(".href_tag").on("click", function(event){
			event.preventDefault();
			
			var a_href = $(this).attr("href");
			var send_href = a_href+"?g_brand="+"${g_brand}"+"&"+"g_category="+"${g_category}";
			location.href=send_href;
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