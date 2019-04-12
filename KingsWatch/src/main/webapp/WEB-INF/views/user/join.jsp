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
		<div class="row">
		<table  border="1" summary="">
							<table>
								<tbody>
									<tr>
										<th scope="row">아이디 <img	src="/resources/img/ico_required.gif" alt="필수" /></th>
										<td><input id="u_id" name="u_id" class="inputTypeText" placeholder=""
											value="" type="text" /> 
											<button id="idCheckBtn" class="btn btn-primary">중복확인</button>
											(영문소문자/숫자, 4~16자)</td>
									</tr>
									<tr>
										<th scope="row">비밀번호 <img
											src="/resources/img/ico_required.gif"
											alt="필수" /></th>
										<td><input id="u_pw" name="u_pw" autocomplete="off" type="password" /> (영문 대소문자/숫자/특수문자 중
											2가지 이상 조합, 10자~16자)</td>
									</tr>
									</tbody>
								</table>
		
		</div>
	</div>	
</body>
	<script type="text/javascript">
	$(document).ready(function(){
		//아이디 중복 체크
		$("#idCheckBtn").click(function() {
	        var userid=  $("#u_id").val(); 
	       
	        
	        $.ajax({
	            url : "/user/idCheck",
	            type : 'POST',
	            data : {
	            	'userid':userid,
	            },
	            contentType : "application/json; charset=utf-8",
	            dataType : 'text',
	            async:false,
	            success : function(data) {
	            	alert(data);
	               if (data.cnt > 0) {	//아이디가 존재할때마다 cnt에 1이 더해진다.
	                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
	                	$("#join_submit_btn").prop("disabled", true);
	                	$("#join_submit_btn").css("background-color", "#aaaaaa");

	                    $("#u_id").focus();

	                } else {
	                    alert("사용가능한 아이디입니다.");
	                    $("#u_pw").focus();
	                    //아이디가 중복하지 않으면  idck = 1
	                    $("#join_submit_btn").prop("disabled", false);
	                  		                    
	                } 
	            },
	            error : function(error) {
	                
	                alert("error : " + error);
	            }
	        });
	    });	//아이디 중복체크
		
	});
	</script>
</html>