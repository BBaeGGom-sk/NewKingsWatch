<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<c:if test="${sessionScope.userId !=null }">
			<h2>${sessionScope.userName} (${sessionScope.userId})님의 방문을 환영합니다.</h2>
		</c:if>

		<div class="row" >

			<h2><a href="user/join">회원가입</a></h2>
			<h2><a href="user/login">로그인</a></h2>
			<h2><a href="user/logout">로그아웃</a></h2>
			<h2><a href="user/viewDetail?id=${sessionScope.userId}">회원정보 상세보기</a></h2>
			<h2><a href="user/updateUser">회원정보수정</a></h2>

		</div>
	</div>	
</body>
	<script type="text/javascript">
	$(document).ready(function(){
		
		
	});
	</script>
</html>