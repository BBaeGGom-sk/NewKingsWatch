<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ecu-kr">
<head>
<title> 회원가입 </title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/headlink.jsp"></jsp:include>
<style type="text/css">
option {
   background-color: black !important;
   }
</style>
</head>


<body>

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<br><br><br><br>
	<div class="pager" id="wrap"  style="text-align: center">
		<div><h2 style="color:#C49B63">회원가입</h2></div>
		<div><h4 style="color:#C49B63">-기본정보-</h4></div>
	</div>
	<form class="billing-form c p-3 p-md-5"  id="container" method="post" action="/user/join">
				<div align="center">
					<table  border="1" summary="">
						<caption>회원 기본정보</caption>
						<tbody>
							<tr>
								<th scope="row"><label>아이디</label> <img	src="/resources/img/ico_required.gif" alt="필수" /></th>
								<td><input id="u_id" name="u_id" class="form-control" placeholder=""
									value="" type="text" /> 
									<button id="idCheckBtn" class="btn btn-primary" >중복확인</button>
									(영문소문자/숫자, 4~16자)</td>
							</tr>
							<tr>
							

							
								<th scope="row"><label>비밀번호</label> <img
									src="/resources/img/ico_required.gif"
									alt="필수" /></th>
								<td><input class="form-control" id="u_pw" name="u_pw" autocomplete="off" type="password" /> (영문 대소문자/숫자/특수문자 중
									2가지 이상 조합, 10자~16자)</td>
							</tr>
							<tr>
								<th scope="row"><label>비밀번호 확인</label> <img src="/resources/img/ico_required.gif" alt="필수" /></th>
								<td><input class="form-control" id="u_pw_confirm"
									name="u_pw_confirm" autocomplete="off" type="password" />
								<span style="color:blue;" id="alert-success">비밀번호가 일치합니다.</span>
								<span style="color:red;" id="alert-danger">비밀번호가 일치하지 않습니다.</span>
									
								</td>
							</tr>
							<tr>
								<th scope="row"><label>비밀번호 확인 질문 &nbsp;</label></th>
								<td><select id="hint" name="hint" fw-filter="isFill"	fw-label="hint" class="form-control">
										<option value="hint_01">기억에 남는 추억의 장소는?</option>
										<option value="hint_02">자신의 인생 좌우명은?</option>
										<option value="hint_03">자신의 보물 제1호는?</option>
										<option value="hint_04">가장 기억에 남는 선생님 성함은?</option>
										<option value="hint_05">타인이 모르는 자신만의 신체비밀이 있다면?</option>
										<option value="hint_06">추억하고 싶은 날짜가 있다면?</option>
										<option value="hint_07">받았던 선물 중 기억에 남는 독특한 선물은?</option>
										<option value="hint_08">유년시절 가장 생각나는 친구 이름은?</option>
										<option value="hint_09">인상 깊게 읽은 책 이름은?</option>
										<option value="hint_10">읽은 책 중에서 좋아하는 구절이 있다면?</option>
										<option value="hint_11">자신이 두번째로 존경하는 인물은?</option>
										<option value="hint_12">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
										<option value="hint_13">초등학교 때 기억에 남는 짝꿍 이름은?</option>
										<option value="hint_14">다시 태어나면 되고 싶은 것은?</option>
										<option value="hint_15">내가 좋아하는 캐릭터는?</option>
								</select></td>
							</tr>
							<tr>
								<th scope="row"><label>비밀번호 확인 답변 &nbsp;</label></th>
								<td><input id="hint_answer" name="hint_answer" class="form-control" type="text" autocomplete="off"/></td>
							</tr>
							<tr>
								<th scope="row" id="nameTitle"><label>이름</label><img src="/resources/img/ico_required.gif"	alt="필수" /></th>
								<td><span id="nameContents"><input id="u_name"	class="form-control" name="u_name" 	maxlength="30" value="" type="text" /></span>
									<span id="under14Msg" class="displaynone">14세 미만 사용자는 법정대리인 동의가 필요합니다.</span></td>
							</tr>
							
							<tr>
								<th scope="row"><label>휴대폰 번호</label> <img src="/resources/img/ico_required.gif"	alt="필수" /></th>
								<td> 
									<input id="u_phone" name="u_phone" type="text" autocomplete="off" hidden=""/>
									<select id="u_phone1" name="u_phone1" class="form-control">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select> - <!-- 주문자 휴대전화 2 -->
									<input id="u_phone2"name="u_phone2" maxlength="4" size="4"	type="tel" autocomplete="off"/>
									<input id="u_phone3" name="u_phone3" maxlength="4"	size="4" type="tel" autocomplete="off"/>
								</td>
							</tr>
							
							<tr class="displaynone">
								<th scope="row"><label>&nbsp;&nbsp;SMS 수신여부 </label></th>
								<td><label for=is_sms0><input id="is_sms0"	class="ec-base-chk" value="T" type="checkbox" />동의함</label>
									<p>유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p></td>
							</tr>
							
							<tr>
								<th scope="row"><label>주소</label> <img src="/resources/img/ico_required.gif"	alt="필수" /></th>
								<td>
									<!-- 우편번호 -->
									<input id="u_postcode" name="u_postNum" class="inputTypeText" placeholder="" size="6" maxlength="6"	/>
									<!-- 우편번호 버튼 -->
									<input class="btn btn-primary" type="button" onclick="u_execDaumPostcode()" value="우편번호 찾기"><br>
									<!-- 기본주소 -->
									<input id="u_address" name="u_adMain" class="inputTypeText" placeholder="기본 주소" size="40" /><br>
									<!-- 상세주소 -->
									<input id="u_detailAddress" name="u_adSub" class="inputTypeText" placeholder="상세 주소" size="40" type="text" />
									<!-- 나머지주소 -->
									<input id="u_extraAddress" name="u_adDetail"  class="inputTypeText" placeholder="나머지 주소" size="40" >
									 
							</td>
							</tr>
							
															

							<tr class="">
								<th scope="row"><label>성별</label> <img
									src="/resources/img/ico_required.gif"
									id="icon_sex" alt="필수" /></th>
								<td>
								<input id="u_sex_man" name="u_sex" value="1" type="radio" />
								<label	for="u_sex">남자</label>
								<input id="u_sex_woman" name="u_sex" value="2"	type="radio" />
								<label for="u_sex">여자</label></td>
							</tr>
							<tr class="">
								<th scope="row"><label>태어난 년도</label> <img src=/resources/img/ico_required.gif 	id="icon_is_birthday" alt="필수" /></th>
								<td>
									<input id="u_age" name="u_age"  type="text" autocomplete="off" hidden=""/>
									<input id="birth_year" name="birth_year" class="form-control" maxlength="4" value=""/> 년

								</td>
							</tr>
							
							<tr>
								<th scope="row"><label>이메일</label> <img	src="/resources/img/ico_required.gif"	alt="필수" /></th>
								<td>
								<input id="u_email" name="u_email" type="text" autocomplete="off" hidden=""/>
								<input id="u_email1" name="u_email1" class="mailId" value="" type="text" />
								@<input id="u_email2" name="u_email2"	class="mailAddress" readonly="readonly" value="" type="text" />
								<select	id="u_emailSelect" class="form-control">
										<option value="" selected="selected">- 이메일 선택 -</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="yahoo.com">yahoo.com</option>
										<option value="etc">직접입력</option>
								</select>
								<button id="emailCheckBtn" class="btn btn-primary">중복확인</button>
								</td>
							</tr>
							
							<tr class="displaynone">
								<th scope="row"><label>&nbsp;&nbsp;이메일 수신여부</label> </th>
								<td><label for=is_news_mail0>
								<input	id="is_news_mail0" name="is_news_mail" class="ec-base-chk"
										value="T" type="checkbox" />동의함</label>
									<p>유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p></td>
							</tr>
						</tbody>
					</table>
				</div> <!-- end of 기본정보 -->
				
				<br>
				
				<span id="more">&darr;추가정보 보이기&darr;</span>
				
				<div class="boardWrite typeAddinfo"  align="center" id="extraInfo">
					<table border="1" summary="">
						<caption>회원 추가정보</caption> 
						<tbody>
							
							
							<tr class="">
								<th scope="row">키(cm) </th>
								<td><input id="add2" name="add2" class="inputTypeText"
									placeholder="" maxlength="30" value="" type="text" /></td>
							</tr>
							
							<tr class="">
								<th scope="row">몸무게 </th>
								<td><input id="add3" name="add3" class="inputTypeText"
									placeholder="" maxlength="30" value="" type="text" /></td>
							</tr>
							
							<tr class="">
								<th scope="row">추천인 아이디&nbsp;</th>
								<td><input id="reco_id" name="reco_id"  class="inputTypeText"
									placeholder="" value="" type="text" /></td>
							</tr>
							<tr class="">
								<th scope="row">환불계좌 정보&nbsp;</th>
								<td>
									<ul class="account">
										<li><strong>예금주</strong> <input id="bank_account_owner"
											name="bank_account_owner"  class="inputTypeText" placeholder=""
											autocomplete="off" value="" type="text" /></li>
										<li><strong>은행명</strong> <select id="refund_bank_code"
											name="refund_bank_code"  class="form-control">
												<option value="" selected="selected">- 은행선택 -</option>
												<option value="bank_02">산업은행</option>
												<option value="bank_03">기업은행</option>
												<option value="bank_04">국민은행</option>
												<option value="bank_05">외환은행</option>
												<option value="bank_07">수협중앙회</option>
												<option value="bank_11">농협중앙회</option>
												<option value="bank_12">농협개인</option>
												<option value="bank_13">농협</option>
												<option value="bank_20">우리은행</option>
												<option value="bank_209">유안타증권</option>
												<option value="bank_218">KB증권</option>
												<option value="bank_23">SC제일은행</option>
												<option value="bank_230">미래에셋증권</option>
												<option value="bank_238">대우증권</option>
												<option value="bank_240">삼성증권</option>
												<option value="bank_243">한국투자증권</option>
												<option value="bank_26">신한은행</option>
												<option value="bank_261">교보증권</option>
												<option value="bank_262">하이투자증권</option>
												<option value="bank_263">현대차증권</option>
												<option value="bank_266">SK증권</option>
												<option value="bank_267">대신증권</option>
												<option value="bank_269">한화증권</option>
												<option value="bank_270">하나대투증권</option>
												<option value="bank_278">신한금융투자</option>
												<option value="bank_279">동부증권</option>
												<option value="bank_280">유진투자증권</option>
												<option value="bank_287">메리츠증권</option>
												<option value="bank_289">NH투자증권</option>
												<option value="bank_291">신영증권</option>
												<option value="bank_292">케이뱅크</option>
												<option value="bank_293">카카오뱅크</option>
												<option value="bank_295">OK저축은행</option>
												<option value="bank_31">대구은행</option>
												<option value="bank_32">부산은행</option>
												<option value="bank_34">광주은행</option>
												<option value="bank_35">제주은행</option>
												<option value="bank_37">전북은행</option>
												<option value="bank_39">경남은행</option>
												<option value="bank_52">모건스탠리은행</option>
												<option value="bank_53">씨티은행</option>
												<option value="bank_57">유에프제이은행</option>
												<option value="bank_58">미즈호코퍼레이트은행</option>
												<option value="bank_59">미쓰비시도쿄은행</option>
												<option value="bank_60">뱅크오브아메리카</option>
												<option value="bank_71">우체국</option>
												<option value="bank_81">KEB하나은행</option>
												<option value="bank_82">농협회원조합</option>
												<option value="bank_83">도이치은행</option>
												<option value="bank_84">상호저축은행</option>
												<option value="bank_85">새마을금고</option>
												<option value="bank_86">수출입은행</option>
												<option value="bank_87">신용협동조합</option>
												<option value="bank_89">홍콩상하이은행(HSBC)</option>
												<option value="bank_90">에이비엔암로은행</option>
												<option value="bank_91">산림조합</option>
										</select></li>
										<li><strong>계좌번호</strong> <input id="bank_account_no"
											name="bank_account_no" class="inputTypeText" placeholder=""
											autocomplete="off" value="" type="text" /> ('-'와 숫자만
											입력해주세요.)</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div> <!-- end of 추가정보 -->
			<br>
		<button class="btn btn-primary" type="submit" id="join_submit_btn">가입완료</button>
	</form> 	<!-- end of container -->



<script type="text/javascript">
		
		// 주문자쪽 우편번호 찾기 기능
		function u_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("u_detailAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("u_detailAddress").value = '';
	                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('u_postcode').value = data.zonecode;
	                document.getElementById("u_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("u_extraAddress").focus();
	            }
	        }).open();
	    }
		
		// 주문자쪽 우편번호 찾기 기능
		function o_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("o_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("o_extraAddress").value = '';
	                }
					// 인풋 초기화 해주기
					document.getElementById('o_postcode').value = "";
	                document.getElementById("o_address").value = "";
	                document.getElementById("o_extraAddress").value = "";
	                document.getElementById("o_detailAddress").value = "";
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('o_postcode').value = data.zonecode;
	                document.getElementById("o_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("o_extraAddress").focus();
	            }
	        }).open();
	    }
		
		

		
        $(document).ready(function() {
                  	
        	//처음엔 추가정보 숨기기
            $("#extraInfo").hide(); 

            //more...클릭시 보이기 및 숨기기
            $("#more").click(function() {
                //3000 : 3초, 'slow', 'normal', 'fast'
                $("#extraInfo").show('fast'); //천천히 보이기
                $(this).hide('fast');//more버튼 숨기기
            });

            
            
            //가입완료 버튼 눌렸을때.
            //하나라도 빠진것 있으면 채우라고 알려주기
            $("form").submit(function(event) {
            	event.preventDefault();
            	if($("#u_id").val()==""){
                 	alert("아이디를 입력해주세요.");
                    $("#u_id").focus();
                    return false;
                 }
            	else if($("#u_pw").val()==""){
                 	alert("비밀번호를 입력해주세요.");
                 	$("#u_pw").focus();
                 	return false;
                 }
            	else if($("#u_pw_confirm").val()==""){
                 	alert("비밀번호 확인을 해주세요.");
                 	$("#u_pw_confirm").focus();
                 	return false;
                 }
            	else if($("#u_name").val()==""){
                 	alert("이름을 입력해주세요.");
                 	$("#u_name").focus();
                 	return false;
                 }
            	else if($("#u_phone").val()==""){
                 	alert("휴대폰 번호를 입력해주세요.");
                 	$("#u_phone").focus();
                 	return false;
                 }
            	else if($("#u_address").val()==""){
                 	alert("주소를 입력해주세요.");
                 	$("#u_address").focus();
                 	return false;
                 }
            	else if($("#u_sex").val()==""){
                 	alert("성별을 입력해주세요.");
                 	$("#u_sex").focus();
                 	return false;
                 }
            	else if($("#birth_year").val()==""){
                 	alert("태어난 년도를 입력해주세요.");
                 	$("#birth_year").focus();
                 	return false;
                 }
            	else if($("#u_email").val()==""){
                 	alert("이메일을 입력해주세요.");
                 	$("#u_email").focus();
                 	return false;
                 }
            	
            	//preventDefault한것 없애기
            	alert("회원가입 성공!");
    			$(this).unbind('submit').submit();
			});
           


            //폰번호 3개 인풋에서 받은거 합치기
            $("#u_phone3").blur(function mergePhone() {
				var phone1 = document.getElementById("u_phone1").value;
				var phone2 = document.getElementById("u_phone2").value;
				var phone3 = document.getElementById("u_phone3").value;
				var phone = phone1 + phone2 + phone3;
				document.getElementById("u_phone").value = phone;
			});


			// 이메일 관련
			//셀렉트 변경시 값 바로 적용 및 직접입력 선택시 초기화 및 readonly 해제
			$("#u_emailSelect").on("change",function() {
				if (this.value == "etc") {
				    $("#u_email2").val(" ");
					$("#u_email2").removeAttr("readonly");
				} else {
					var langSelect = document.getElementById("u_emailSelect");
				    // select element에서 선택된 option의 value가 저장된다.
				    var selectValue = langSelect.options[langSelect.selectedIndex].value;
				    $("#u_email2").val(selectValue);
					$("#u_email2").prop("readonly", true);
				}
				
				//이메일 3개 인풋에서 받은거 합치기
				var email1 =  document.getElementById("u_email1").value;
				var email2 =  document.getElementById("u_email2").value;
				var email =  email1 + "@" + email2;
				document.getElementById("u_email").value = email;
			});
            
			
			//비밀번호와 비밀번호 확인 문자 서로 비교
			 $(function(){
			        $("#alert-success").hide();
			        $("#alert-danger").hide();
			        $(".pwInput").keyup(function(){
			            var pwd1=$("#u_pw").val();
			            var pwd2=$("#u_pw_confirm").val();
			            if(pwd1 != "" || pwd2 != ""){
			                if(pwd1 == pwd2){
			                    $("#alert-success").show();
			                    $("#alert-danger").hide();
			                    $("#submit").removeAttr("disabled");
			                }else{
			                    $("#alert-success").hide();
			                    $("#alert-danger").show();
			                    $("#submit").attr("disabled", "disabled");
			                }    
			            }
			        });
			    });


			
			//나이 계산
			$("#birth_year").blur(function calAge() {
				var birth_year = parseInt( document.getElementById("birth_year").value);
				var now_year = new Date().getFullYear();
				var age = now_year - birth_year +1;
				document.getElementById("u_age").value = age;
				
			});
			
			

			//아이디 중복 체크
			$("#idCheckBtn").click(function(event) {
				event.preventDefault();//버튼 기본 get이기때문
		        var u_id=  $("#u_id").val(); 
		        $.ajax({
		            url : "/user/idCheck",
		            type : 'POST',
		            data : u_id,
		            contentType : "application/json; charset=utf-8",
		            dataType : 'text',
		            async:false,
		            success : function(data) {
		               if (data > 0) {	//아이디가 존재할때마다 cnt에 1이 더해진다.
		                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
		                    $("#u_id").focus();

		                } else {
		                    alert("사용가능한 아이디입니다.");
		                    $("#u_pw").focus();
		                } 
		            },
		            error : function(error) {
		                
		                alert("error : " + error);
		            }
		        });
		    });	//아이디 중복체크


		    
			//이메일 중복 체크
			$("#emailCheckBtn").click(function(event) {
				event.preventDefault();		//버튼 기본 get이기때문
		        var u_email=  $("#u_email").val(); 
		        
		        $.ajax({
		            url : "/user/emailCheck",
		            type : 'POST',
		            data : u_email,
		            contentType : "application/json; charset=utf-8",
		            dataType : 'text',
		            async:false,
		            success : function(data) {
		               if (data > 0) {	//같은 이메일이 존재할때마다 cnt에 1이 더해진다.
		                    alert("같은 이메일이 존재합니다. 다른 이메일을 입력해주세요.");
		                	$("#join_submit_btn").prop("disabled", true);
		                	$("#join_submit_btn").css("background-color", "#aaaaaa");

		                    $("#u_id").focus();

		                } else {
		                	 alert("해당 이메일로 회원가입이 가능합니다.");
		                    $("#join_submit_btn").prop("disabled", false);
		                    $("#join_submit_btn").css("background-color", "#337AB7");
		                    $("#join_submit_btn").focus();
		                } 
		            },
		            error : function(error) {
		                
		                alert("error : " + error);
		            }
		        });
		    });	//이메일 중복체크
			

        });

	</script>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>
