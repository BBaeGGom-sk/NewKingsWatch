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
<title>Insert title here</title>
</head>
<body>

	<div class="container">
	  <div class="row">
	  		<form action="/goods/goodsInsert" method="post">
				<div class="form-group">
					<label for="g_id">상품번호</label>
					<input required class="form-control" id="g_id" name="g_id">
				</div>
				<div class="form-group">
					<label for="g_brand">브랜드명</label>
					<input required class="form-control" id="g_brand" name="g_brand">
				</div>
				<div class="form-group">
					<label for="g_name">상품명</label>
					<input required class="form-control" id="g_name" name="g_name">
				</div>
				<div class="form-group">
					<label for="g_price">상품원가</label>
					<input required class="form-control" id="g_price" name="g_price">
				</div>
				<div class="form-group">
					<label for="g_sale">할인율</label>
					<input required class="form-control" id="g_sale" name="g_sale">
				</div>
				<div class="form-group">
					<label for="g_desc">상세설명</label>
					<input required class="form-control" id="g_desc" name="g_desc">
				</div>
				<div class="form-group">
					<label for="g_category">카테고리</label>
					<input required class="form-control" id="g_category" name="g_category">
				</div>
				<div class="form-group">
					<label for="g_is_selling">판매여부</label>
					<input required class="form-control" id="g_is_selling" name="g_is_selling" value="0" readonly="readonly">
				</div>

			</form>
	  
	  </div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
						
		});
	</script>
</body>
</html>