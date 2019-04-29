<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/headlink.jsp"></jsp:include>
<title>비밀번호 변경</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<br><br><br><br>
		<div class="pager" id="wrap"  style="text-align: center">
		<div><h2 style="color:#C49B63">비밀번호 변경</h2></div>
	</div>
	<div class="container">
		<div class="row">
<%-- 			id : ${login.u_id} , pw : ${login.u_pw} --%>
			<form action="updatePw" method="post">
				<table border="1" class="table">
					<tbody>
						<tr>
							<th scope="row">기존 비밀번호</th>
							<td><input id="u_pw" name="oldPw" autocomplete="off"
								type="password" value="" class="changeInput" > (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</td>
						</tr>
						<tr>
							<th scope="row">바꿀 비밀번호</th>
							<td><input id="newPw" name="newPw" autocomplete="off"
								type="password" value="" class="changeInput" > (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자) </td>
						</tr>
						<tr>
							<th scope="row">바꿀 비밀번호 확인</th>
							<td><input id="ch_pwConfirm" name="ch_pwConform" autocomplete="off"
								type="password" value="" class="changeInput" > 바꿀 비밀번호와 똑같이 한번더 입력해주세요. </td>
						</tr>
					</tbody>
				</table>
				<button type="submit" class="btn btn-primary">제출</button>
			</form>
		</div>
	</div>	
</body>
	<script type="text/javascript">
	$(document).ready(function(){
		
		
	});
	</script>
</html>