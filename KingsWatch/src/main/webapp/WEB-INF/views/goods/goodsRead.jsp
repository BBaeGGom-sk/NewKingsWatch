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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="../../resources/js/upload.js"></script>
<style type="text/css">
.uploadedList {
	list-style: none;
	margin-bottom: 50px;
}

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

div#container_box {
	float: right;
	width: calc(100% - 200px - 20px);
}

img {
	align-items: center;
}

table{
	align-content: center;
}

</style>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">

			<div class="row">
				<nav id="nav">
					<button name="goodsUpdate" id="goodsUpdate" class="btn btn-primary">수정</button>
				</nav>
			</div>

			<div id="container_box" class="form-group">
				<div style="float: left;">
					<ul class="uploadedList clearfix">
							<!-- 상품이미지업로드 -->
					</ul>
				</div>
				<div style="float: left; padding-top: 5%;" class="form-group">
					<label for="g_name">이름</label>
						<p>${goodsRead.g_name}</p>
					<label for="g_price">가격</label>
						<p>${goodsRead.g_price}</p>
					<label for="count">수량</label>
					<p>
						<button type="button" class="plus">+</button>
							<input type="number" class="numBox" min="1" value="1" readonly="readonly" style="align-items: center; display: compact;">
	 					<button type="button" class="minus">-</button>
	 				</p>
					<label for="g_desc">설명</label>
						<p>${goodsRead.g_desc}</p>
					<button class="form-control">구매하기</button>
					<button class="form-control">카트담기</button>
				</div>

			</div>
		</div>
	</div>
	
	<form>
		<input id="g_id" name="g_id"  value="${goodsRead.g_id}" type="hidden">
	</form>


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

			var g_id = "${goodsRead.g_id}";
			
			$("#goodsUpdate").click(function() {
				$("form").attr("action","goodsUpdate");
				$("form").attr("method","get");
				$("form").submit();
			});
		
			$(".plus").click(function() {
				var num = $(".numBox").val();
				alert(num);
				var plusNum = Number(num) + 1;
				$(".numBox").val(plusNum);
				alert(plusNum);
			});
			  
			$(".minus").click(function() {
				var num = $(".numBox").val();
				alert(num);
				var minusNum = Number(num) - 1;
				$(".numBox").val(minusNum);
				alert(minusNum);
			});

			goodsReadPicDbGet(g_id);
		});
		
		function goodsReadPicDbGet(g_id) {
			$.getJSON("/goods/goodsReadPicDbGet/"+g_id, function(result) {
				var source= $("#source").html();
				var template= Handlebars.compile(source);
				$(result).each(function() {
					var data= getFileInfo(this);
					$(".uploadedList").append(template(data));
				});
			});		
		}
	</script>
</body>
</html>