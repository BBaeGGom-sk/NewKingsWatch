<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<title>마이 페이지</title>
</head>

<body>
	<h1>마이 페이지(회원정보 상세보기)</h1>
	<div class="pager" id="wrap">
		<form id="userform" id="container" method="post" action="/user/update">
			<div id="contents">
				<div class="titleArea">
					<h2 id="title">회원정보 상세보기</h2>
				</div>

				<div align="center">
					<table border="1" summary="">
						<caption>바꿀 수 없는 영역</caption>
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td><input id="u_id" name="u_id" class="inputTypeText"
									value="${login.u_id}" type="text" readonly="readonly" /></td>
							</tr>

							<tr>
								<th scope="row">나이</th>
								<td><input id="u_age" name="u_age" class="inputTypeText"
									value="${login.u_age}" type="text" readonly="readonly" /></td>
							</tr>

							<tr>
								<th scope="row">포인트</th>
								<td><input id="u_point" name="u_point"
									class="inputTypeText" value="${login.u_point}" type="text"
									readonly="readonly" /></td>
							</tr>

						</tbody>
					</table>

					<table border="1" summary="">
						<caption>바꿀 수 있는 영역</caption>
						<tbody>
							<tr>
								<th scope="row">비밀번호</th>
								<td><input id="u_pw" name="u_pw" autocomplete="off"
									type="password" value="" class="changeInput"
									readonly="readonly" /> 비밀번호 변경화면은 별도입니다.</td>
							</tr>


							<tr>
								<th scope="row" id="nameTitle">이름</th>
								<td><span id="nameContents"><input id="u_name"
										name="u_name" maxlength="30" value="${login.u_name}"
										type="text" class="changeInput" readonly="readonly" /> </span></td>
							</tr>

							<tr>
								<!-- 주문자 휴대전화 -->
								<th scope="row">휴대폰 번호</th>
								<td>
									<input id="u_phone" name="u_phone" type="text" value="${login.u_phone}"	autocomplete="off" hidden="" />
									<c:set var="phoneNum" value="${login.u_phone}" /> <!-- 주문자 휴대전화 1 -->
									<select id="u_phoneNumFirst" name="u_phoneNumFirst"	class="changeInput" >
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select> - <!-- 주문자 휴대전화 2 --> <input id="u_phoneNumMid"
									name="u_phoneNumMid" maxlength="4" size="4" class="changeInput"
									value="${fn:substring(phoneNum,3,7)}" type="text" readonly="readonly"/> - <!-- 휴대 전화 3 -->
									<input id="u_phoneNumEnd" name="u_phoneNumEnd" maxlength="4"
									class="changeInput" size="4"
									value="${fn:substring(phoneNum,7,11)}" type="text" readonly="readonly"/></td>
							</tr>



							<tr class="displaynone">
								<th scope="row">&nbsp;&nbsp;SMS 수신여부</th>
								<td><label for=is_sms0><input id="is_sms0"
										class="changeInput" value="T" type="checkbox" />동의함</label>
									<p>유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p></td>
							</tr>

							<tr>
								<th scope="row">주소</th>
								<td>
									<!-- 우편번호 --> <input id="u_postcode" name="u_postNum"
									class="changeInput" placeholder="" size="6" maxlength="6"
									value="${login.u_postNum}" readonly="readonly"/> 
									<!-- 우편번호 버튼 -->
									<input
									class="btn btn-primary" type="button" id="btn_postNum"
									onclick="u_execDaumPostcode()" value="우편번호 찾기"><br>
									<!-- 기본주소 --> <input id="u_address" name="u_adMain"
									class="changeInput" placeholder="기본 주소" size="40"
									value="${login.u_adMain}" readonly="readonly"/><br> 
									<!-- 상세주소 -->
									<input
									id="u_detailAddress" name="u_adSub" class="changeInput"
									placeholder="상세 주소" size="40" type="text"
									value="${login.u_adSub}" readonly="readonly"/>
									<!-- 나머지주소 -->
									<input
									id="u_extraAddress" name="u_adDetail" class="changeInput"
									placeholder="나머지 주소" size="40" value="${login.u_adDetail}" readonly="readonly"/>

								</td>
							</tr>

							<tr class="">
								<th scope="row">성별</th>
								<td>
									<input id="sex_man" name="u_sex" value="1" type="radio"	class="changeInput" />
									<label for="u_sex" class="changeInput" >남자</label>&nbsp;&nbsp;
									<input id="sex_woman" name="u_sex" value="2" type="radio"	class="changeInput" />
									<label for="u_sex" class="changeInput" >여자</label>
								</td>
							</tr>

							<tr>
								<th scope="row">이메일</th>
								<td><input id="u_email" name="u_email" type="text" value="${login.u_email}"	autocomplete="off" hidden="" />
									<input id="u_email1" name="u_email1" class="changeInput" value="" type="text" readonly="readonly"/>
									@
									<input	id="u_email2" name="u_email2" class="changeInput" readonly="readonly" value="" type="text" />
									<select	id="u_emailSelect" class="changeInput">
										<option value="" selected="selected">- 이메일 선택 -</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="yahoo.com">yahoo.com</option>
										<option value="etc">직접입력</option>
								</select>
								</td>
							</tr>

							<tr class="displaynone">
								<th scope="row">&nbsp;&nbsp;이메일 수신여부</th>
								<td><label for=is_news_mail0> <input
										id="is_news_mail0" name="is_news_mail" class="changeInput"
										value="T" type="checkbox" />동의함
								</label>
									<p>유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p></td>
							</tr>

							<tr class="">
								<th scope="row">키(cm)</th>
								<td><input id="add2" name="add2" class="changeInput"
									placeholder="" maxlength="30" value="" type="text" /></td>
							</tr>

							<tr class="">
								<th scope="row">몸무게</th>
								<td><input id="add3" name="add3" class="changeInput"
									placeholder="" maxlength="30" value="" type="text" /></td>
							</tr>


							<tr class="">
								<th scope="row">환불계좌 정보&nbsp;</th>
								<td>
									<ul class="account">
										<li><strong>예금주</strong> <input id="bank_account_owner"
											name="bank_account_owner" class="changeInput" placeholder=""
											autocomplete="off" value="" type="text" /></li>
										<li><strong>은행명</strong> <select id="refund_bank_code"
											name="refund_bank_code" class="changeInput">
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
											name="bank_account_no" class="changeInput" placeholder=""
											autocomplete="off" value="" type="text" /> ('-'와 숫자만
											입력해주세요.)</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>

				</div>
				<!-- end of 기본정보 -->




			</div>
		</form>
		<!-- end of 추가정보 -->
	</div>
	<!-- end of contents -->
	<br>

	<!-- end of container -->
	<!-- end of wrap -->

	<button id="revise">회원정보 변경</button>
	<button type="submit" id="revise_complete">변경 완료</button>
	<button id="cancle_membership">회원탈퇴</button>



	<script type="text/javascript">
	

		//처음에는 변경완료 버튼, 우편번호 찾기버튼, 이메일 셀렉터 안보이게
		$("#revise_complete").hide();
		$("#btn_postNum").hide();
		$("#u_emailSelect").hide();
		
		
		
		//변경하기 버튼 클릭-> readonly속성 풀어주고, 변경할수 있는 버튼들 보이게, 
        $("#revise").click(function() {
        	$("#title").value = "회원정보 변경하기";
        	 $(".changeInput").css("background-color", "#cddc39");
        	 $(".changeInput").attr("readonly", false);
        	 $("#revise").hide();
        	 $("#revise_complete").show();
        	 
     		$("#revise_complete").show();
    		$("#btn_postNum").show();
    		$("#u_emailSelect").show();
		});
        
        //===========변경완료 버튼 클릭=============
        $("#revise_complete").click(function() {
    		//이제 다시 합쳐서 form 으로 보내기
    		var email = $("#u_email1").val() + '@'+ $("#u_email2").val();
    		$("#u_email").attr("value", email);
    		var phone = $("#u_phoneNumFirst").val()+ $("#u_phoneNumMid").val()+$("#u_phoneNumEnd").val();
    		$("#u_phone").attr("value", phone);
    		
    		//폼의 정보들 컨트롤러로 전달
        	$("#userform").submit();
    		
    		//ux를 위한 완료 메시지
        	alert("회원정보가 변경되었습니다.");
		});
        
        
        //회원 탈퇴 버튼 클릭
        $("#cancle_membership").click(function() {
			alert("정말 탈퇴 하시겠습니까?");
			window.location.href = 'delete';
			alert("회원탈퇴가 완료 되었습니다.");
		});

	
        //비밀번호 수정하려면 비밀번호변경 페이지로 넘김
        $("#u_pw").click(function() {
        	window.location.href = 'updatePw';
		})
        
        
        
		// 유저 이메일 받아오기
		var email = "${login.u_email}";
		// 유저 이메일을 @ 기준으로 나누기
		var emailArr = email.split("@");
		// @ 기준으로 나눈 값을 넣어주기
		document.getElementById("u_email1").value = emailArr[0];
		document.getElementById("u_email2").value = emailArr[1];
		// 이메일 셀렉트 변경시 값 바로 적용 및 직접입력 선택시 초기화 및 readonly 해제
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
			
		});
		
		

		// 이메일 셀렉트 판별 및 자동 선택하기
		if (emailArr[1] == "naver.com") {
			document.getElementById("u_emailSelect").value = "naver.com";
			$("#u_emailSelect option:eq(1)").prop("selected", true);
		} else if (emailArr[1] == "daum.net") {
			document.getElementById("u_emailSelect").value = "daum.net";
			$("#u_emailSelect option:eq(2)").prop("selected", true);
		} else if (emailArr[1] == "nate.com") {
			document.getElementById("u_emailSelect").value = "nate.com";
			$("#u_emailSelect option:eq(3)").prop("selected", true);
		} else if (emailArr[1] == "yahoo.com") {
			document.getElementById("u_emailSelect").value = "yahoo.com";
			$("#u_emailSelect option:eq(5)").prop("selected", true);
		} else { // 해당하는게 없으면 직접입력이 선택되고 readonly 속성이 해제됨
			document.getElementById("u_emailSelect").value = "etc";
			$("#u_email2").removeAttr("readonly");
			$("#u_emailSelect option:eq(9)").prop("selected", true);
		}
	
	
		// 휴대전화번호 세번째자리만 분리
		var phoneNumFirst = "${fn:substring(phoneNum,2,3)}";
		// 휴대전화번호 앞자리 판별 및 자동 선택하기 (주문쪽,받는쪽 동시 선택)
		if (phoneNumFirst==0) {
			$("select option[value='010']").attr("selected", true);
		} else if (phoneNumFirst==1) {
			$("select option[value='011']").attr("selected", true);
		} else if (phoneNumFirst==6) {
			$("select option[value='016']").attr("selected", true);
		} else if (phoneNumFirst==7) {
			$("select option[value='017']").attr("selected", true);
		} else if (phoneNumFirst==8) {
			$("select option[value='018']").attr("selected", true);
		} else if (phoneNumFirst==9) {
			$("select option[value='019']").attr("selected", true);
		}
		
		
		//성별 데이터 체크박스에 표현
		var checkSex = "${login.u_sex}";
		if(checkSex == 1){
			$("#sex_man").prop("checked", true);
		}
		else if(checkSex == 2){
			$("#sex_woman").prop("checked", true);
		}
		
			
		
		
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

	</script>


</body>
</html>