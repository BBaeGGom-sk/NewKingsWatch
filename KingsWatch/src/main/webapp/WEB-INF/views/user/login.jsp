<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>로그인 화면</title>


</head>

<body>
	<div id="wrap">
		<form name="loginInfo" method="post" action="login">

			===로그인입니다.===
			<br>

			<table>
				<tr>
					<td bgcolor="skyblue">아이디</td>
					<td><input id="input_id" type="text" name="u_id" maxlength="50"></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td><input id="input_pw" type="password" name="u_pw" maxlength="50"></td>
				</tr>
			</table>
			<br>
			<input type="submit" id="btn_login" value="로그인" />
			<input type="button" id="btn_join" value="회원가입" />
		</form>

	</div>

	
<script type="text/javascript">
    	
   $(document).ready(function() {
	   $("#input_id").focus();
	   
		$("form").submit(function(event){
			event.preventDefault();
            if($("#input_id").val()=="")
            {
                alert("아이디를 입력하세요");    
                $("#input_id").focus();
                return false;
            }
            else if($("#input_pw").val()=="")
            {
                alert("비밀번호를 입력하세요");    
                $("#input_pw").focus();
                return false;
            }
            
        	//preventDefault한것 없애기
			$(this).unbind('submit').submit();
		});



    
        // 회원가입 버튼 클릭시 회원가입 화면으로 이동
        $("#btn_join").click(function(event) {
        	event.preventDefault();
            location.href="/user/join";
		});

    });
	</script>

</body>
</html>
