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
	.uploadedList{
		list-style: none;	
		margin-bottom: 50px;
	}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
	  <div class="row">

			<table border="1">
				<tbody>
					<tr>
						<td rowspan="8">
	            			<ul class="uploadedList clearfix">

	            			</ul>
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${goodsRead.g_name}</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>${goodsRead.g_price }</td>
					</tr>
					<tr>
						<td>할인율</td>
						<td>${goodsRead.g_sale}</td>
					</tr>
					<tr>
						<td>수량</td>
						<td></td>
					</tr>
					<tr>
						<td>이미지</td>
					</tr>
					<tr>
						<td colspan="2">구매하기</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">카트담기</td>
						<td></td>
					</tr>
				</tbody>
			</table>	  
	  
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
		
			var g_id = "${goodsRead.g_id}";
		
			alert(g_id);
			
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