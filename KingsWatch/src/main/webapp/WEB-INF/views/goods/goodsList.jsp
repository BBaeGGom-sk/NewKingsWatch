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

	<div class="container">
	  <div class="row">
	  
	  <nav id="nav">
	  	<div id="nav_box">
	  		네비게이션입니다.
	  	</div>

	  <ul class="goodsMenu">
	  	<li class="menu0"><a href="">메인으로</a>
	  	</li>
	  	<li class="menu1"><a href="">로즈몽</a>
	  		<ul class="row submenu">
	  			<li><a href="">여성</a></li>
	  			<li><a href="">공용</a></li>
	  		</ul>
	  	</li>
	  	<li class="menu2"><a href="">세이코</a>
	  		<ul class="row submenu">
	  			<li><a href="">여성</a></li>
	  			<li><a href="">남성</a></li>
	  			<li><a href="">공용</a></li>
	  		</ul>
	  	</li>
	  	<li class="menu3"><a href="">아르마니</a>
	  		<ul class="row submenu">
	  		  	<li><a href="">여성</a></li>
	  			<li><a href="">남성</a></li>
	  			<li><a href="">공용</a></li>
	  		</ul>
	  	</li>
	  </ul>
	  </nav>
	  

	<section id="content">
	  	<label for="goodsList">리스트입니다.</label>
		<a class="btn btn-info" href="/goods/goodsInsert">상품올리기</a>
	 <hr>
	 <ul>
	 	<c:forEach items="${goodsList}" var="list"  varStatus="status">
	 	<li>
    		<div class="thumbnail">
                <div class="form-group">
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
	 
	 
 		<c:forEach items="${goodsList}" var="list" >
			 <li>
			<span>
				${list.g_id}
				${list.g_name}
				${list.g_price}
				${list.g_sale}
				${list.g_desc}
			</span>
	  			<a href="{{getLink}}">{{fileName}}</a>
	 		</li>
 		</c:forEach>
	</ul>
	이미지파일?

	
	</section>
	
	  
	 </div>
	</div>
	
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
		
		var arr="";
		<c:forEach items="${goodsList}" var="pic">
			arr=arr+"#"+"${pic.g_id}";			
		</c:forEach>
		
		goodsPicDbGet(arr);

			function goodsPicDbGet(arr) {
				var source= $("#source").html();
				var template= Handlebars.compile(source);

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