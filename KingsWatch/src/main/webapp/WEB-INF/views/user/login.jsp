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

<script type="text/javascript">
    
    	/* 누락된 칸 검사 */
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(inputForm.id.value=="")
            {
                alert("아이디를 입력하세요");    
                inputForm.id.focus();
                return false;
            }
            if(inputForm.password.value=="")
            {
                alert("비밀번호를 입력하세요");    
                inputForm.password.focus();
                return false;
            }
            
        }
    
        // 회원가입 버튼 클릭시 회원가입 화면으로 이동
        function goJoinForm() {
            location.href="join";
        }    
    </script>

</head>

<body>
	<div id="wrap">
		<form name="loginInfo" method="post" action="login" onsubmit="return checkValue()">

			===로그인===
			<br>

			<table>
				<tr>
					<td bgcolor="skyblue">아이디</td>
					<td><input type="text" name="u_id" maxlength="50"></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td><input type="password" name="u_pw" maxlength="50"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="로그인" />
			<input type="button" value="회원가입" onclick="goJoinForm()" />
		</form>

		<% 
            // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
            // LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("0")) 
            {
                out.println("<br>");
                out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
            }
            else if(msg!=null && msg.equals("-1"))
            {    
                out.println("<br>");
                out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
            }
        %>
	</div>
</body>
</html>
