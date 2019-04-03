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
	ID : <input name="u_id" readonly value="${login.u_id}"><br>
	성별 : <input name="u_sex" readonly value="${login.u_sex}"><br>
	나이 : <input name="u_age" readonly value="${login.u_age}"><br>
	포인트 : <input name="u_point" readonly value="${login.u_point}"><br>
	<hr>
	PW : <input name="u_pw"  type="password" value="${login.u_pw}"><br>
	이름 : <input name="u_name" value="${login.u_name}"><br>
	폰번호 : <input name="u_phone" value="${login.u_phone}"><br>
	E-Mail : <input name="u_email" value="${login.u_email}"><br> 
	<%-- 주소 : <input name="u_address" value="${login.u_address}"><br> --%>
	<%-- 회원가입일 : <input name="u_regdate" readonly value="${login.u_regdate}"><br> --%>
<input type="submit" value="수정" id="revise">
<a href="#">삭제</a> 

</form>
		


<script type="text/javascript">
$("#revise").on(function() {
		alert("회원정보를 수정했습니다.");
	}
</script>


</body>
</html>