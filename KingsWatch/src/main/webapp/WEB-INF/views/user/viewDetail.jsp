<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>회원 정보 상세보기</h1>


<form action="/user/update" method="post">
	ID : <input name="u_id" readonly value="${dto.id}"><br>
	PW : <input name="u_pw"  value="${dto.pw}"><br>
	이름 : <input name="u_name" value="${dto.name}"><br>
	폰번호 : <input name="u_phone" value="${dto.phone}"><br>
	나이 : <input name="u_age" value="${dto.age}"><br>
	주소 : <input name="u_address" value="${dto.address}"><br>
	E-Mail : <input name="u_email" value="${dto.email}"><br>
<input type="submit" value="수정">
<a href="/user/delete?id=${dto.u_id}">삭제</a> 

</form>






</body>
</html>