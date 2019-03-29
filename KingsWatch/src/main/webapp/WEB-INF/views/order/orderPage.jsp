<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<h1>주문페이지</h1>
		</div>
		<div class="row">
			<form action="/order/orderpage" method="post">
				<div class="boardWrite">
					<table border="1" summary="">
						<caption>주문자 정보 입력</caption>
						<!-- 국문 쇼핑몰 -->
						<tbody class="address_form ">
							<tr>
								<th>주문하시는 분 
									<imgsrc="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수" />
								</th>
								<td>
									<input id="u_name" name="u_name" class="inputTypeText" type="text" />
								</td>
							</tr>
							<tr>

							</tr>
						</tbody>
					</table>
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