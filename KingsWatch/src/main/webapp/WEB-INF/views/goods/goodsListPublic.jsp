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

ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

div#root {
	width: 90%;
	margin: 0 auto;
}

header#header {
	font-size: 60px;
	padding: 20px 0;
}

header#header h1 a {
	color: #000;
	font-weight: bold;
}

nav#nav {
	padding: 10px;
	text-align: right;
}

nav#nav ul li {
	display: inline-block; /* margin-left:10px;  */
}

section#container {
	padding: 20px 0;
	border-top: 2px solid #eee;
	border-bottom: 2px solid #eee;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

div#container_box {
	float: right;
	width: calc(100% - 200px - 20px);
}

ul, ol, li {
	list-style: none;
	margin: 0;
	padding: 0;
}

ul.goodsMenu {
	
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


 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }


footer#footer {
	background: #f9f9f9;
	padding: 20px;
}

footer#footer ul li {
	display: inline-block;
	margin-right: 10px;
}
</style>
<title>Insert title here</title>
</head>
<body>

	alert("${pm.cri}");
	
	<div class="container">
	  <div class="row">
	  
	  <nav id="nav">
	  	<div id="nav_box">
	  		네비게이션입니다.
	  	</div>

	  <ul class="goodsMenu">
	  	<li class="menu0"><a href="/goods/goodsList">메인으로</a>
	  	</li>
	  	<li class="menu1"><a href="">로즈몽</a>
	  		<ul class="row submenu">
	  			<li><a href="/goods/goodsListWoman?g_category=1&g_brand=로즈몽">여성</a></li>
	  			<li><a href="/goods/goodsListPublic?g_category=0&g_brand=로즈몽">공용</a></li>
	  		</ul>
	  	</li>
	  	<li class="menu2"><a href="">세이코</a>
	  		<ul class="row submenu">
	  			<li><a href="/goods/goodsListWoman?g_category=1&g_brand=세이코">여성</a></li>
	  			<li><a href="/goods/goodsListMan?g_category=2&g_brand=세이코">남성</a></li>
	  			<li><a href="/goods/goodsListPublic?g_category=0&g_brand=세이코">공용</a></li>
	  		</ul>
	  	</li>
	  	<li class="menu3"><a href="">아르마니</a>
	  		<ul class="row submenu">
	  			<li><a href="/goods/goodsListWoman?g_category=1&g_brand=아르마니">여성</a></li>
	  			<li><a href="/goods/goodsListMan?g_category=2&g_brand=아르마니">남성</a></li>
	  			<li><a href="/goods/goodsListPublic?g_category=0&g_brand=아르마니">공용</a></li>
	  		</ul>
	  	</li>
	  </ul>
	  </nav>
	  

	<section id="content">
	  	<label for="goodsListPublic">리스트입니다.</label>
		<a class="btn btn-info" href="/goods/goodsInsert">상품올리기</a>
	 <hr>
		 <ul>
		 	<c:forEach items="${goodsListPublic}" var="list"  varStatus="status">
			 	<li>
		    		<div class="thumbnail">
		                <div class="form-group">
		                <!-- 비동기이기때문에 index값을 지정해서 맞는 값만 넣기 -->
			            	<ul id="${status.index}"  class="uploadedList clearfix"></ul>
		        	 	</div>
		    		</div>
		    		<div class="description">
		        		<p class="color displaynone"></p>
		     			<p class="name">
		            		<a href="/goods/goodsRead?g_id=${list.g_id}" >
		            		<span class="title displaynone"></span> ${list.g_name}</a>
		            	</p>
					<div class="line"></div>
						<p class="price ">${list.g_price }<span class="displaynone"></span></p>
						<p class="price sale displaynone">할인율 : ${list.g_sale}</p>
		        	<div class="status">
		            <div class="icon">      </div>
		        	</div>
		    	</div>
				</li>
			</c:forEach>
		</ul>
	</section>
	
	  
	 </div> <!-- row 끝 -->
	 
	 <!-- 페이징!! -->
	 <div class="row text-center">
		<ul class="pagination">
			<c:if test="${pm.cri.page>1}">
				<li><a href="/goods/goodsListPublic${pm.makeCategory(pm.cri.page-1)}">&laquo;</a></li>
			</c:if>
				<c:forEach var="idx" begin="${pm.beginPageNum}"
					end="${pm.stopPageNum}">
					<li class="${pm.cri.page==idx?'active':''}"><a
						href="/goods/goodsListPublic${pm.makeCategory(idx)}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pm.cri.page<pm.totalPage}">
					<li><a href="/goods/goodsListPublic${pm.makeCategory(pm.cri.page+1)}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	 
	</div> <!-- container 끝!! -->
	
	<!-- 이미지 불러오기위한 handlebars -->
	<script id="source" type="text/x-handlebars-template">
		<li class="col-xs-3 pull-left" >
			<span>
				<img src="{{imgsrc}}">
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
		<c:forEach items="${goodsListPublic}" var="pic">
			arr=arr+"#"+"${pic.g_id}";			
		</c:forEach>
		
		goodsPicDbGet(arr);

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

		});
	</script>
</body>
</html>