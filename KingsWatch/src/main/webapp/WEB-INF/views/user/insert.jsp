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
<h1>회원 등록</h1>
<form method="post" action="/user/insert">
ID:<input name="u_id" type="text"><br>
PW:<input name="u_pw" type="password"><br>
Name:<input name="u_name" tyep="text"><br>
<input type="submit" value="등록">
</form>


</body>
</html>