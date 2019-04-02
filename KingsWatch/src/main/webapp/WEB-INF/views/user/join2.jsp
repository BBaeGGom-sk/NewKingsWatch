<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

<title>회원가입</title>
</head>

<body>
<div class="pager" id="wrap" >
	<form class="" id="container" method="post" action="/user/join">
		<div id="contents">
			<div class="titleArea">	<h2>회원가입</h2></div>
			
					<h3>기본정보</h3>
					<div align="center">
						<table  border="1" summary="">
							<caption>회원 기본정보</caption>
							<tbody>
								<tr>
									<th scope="row">아이디 <img	src="/resources/img/ico_required.gif" alt="필수" /></th>
									<td><input id="u_id" name="u_id"
										fw-label="아이디" fw-msg="" class="inputTypeText" placeholder=""
										value="" type="text" /> <a href="#none" title="새창 열기"
										onclick="checkIdLayer('/member/check_id.html')"><img
											src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_overlap_id.gif"
											alt="아이디 중복확인" /></a> (영문소문자/숫자, 4~16자)</td>
								</tr>
								<tr>
									<th scope="row">비밀번호 <img
										src="/resources/img/ico_required.gif"
										alt="필수" /></th>
									<td><input id="u_pw" name="u_pw" autocomplete="off" type="password" /> (영문 대소문자/숫자/특수문자 중
										2가지 이상 조합, 10자~16자)</td>
								</tr>
								<tr>
									<th scope="row">비밀번호 확인 <img src="/resources/img/ico_required.gif" alt="필수" /></th>
									<td><input id="user_passwd_confirm"
										name="user_passwd_confirm" autocomplete="off" type="password" /></td>
								</tr>
								<tr>
									<th scope="row">비밀번호 확인 질문 &nbsp;</th>
									<td><select id="hint" name="hint" fw-filter="isFill"	fw-label="hint" >
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
									<th scope="row">비밀번호 확인 답변 &nbsp;</th>
									<td><input id="hint_answer" name="hint_answer"
										fw-filter="isFill" fw-label="비밀번호 확인시 답변" type="text" /></td>
								</tr>
								<tr>
									<th scope="row" id="nameTitle">이름 <img src="/resources/img/ico_required.gif"	alt="필수" /></th>
									<td><span id="nameContents"><input id="u_name"	name="u_name" 	maxlength="30" value="" type="text" /></span>
										<span id="under14Msg" class="displaynone">14세 미만 사용자는 법정대리인 동의가 필요합니다.</span></td>
								</tr>
								
								<tr>
									<th scope="row">휴대전화 <img src="/resources/img/ico_required.gif"	alt="필수" /></th>
									<td><select id="mobile1" name="mobile[]">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										-<input id="mobile2" name="mobile[]" maxlength="4" type="tel" autocomplete="off" />
										-<input id="mobile3" name="mobile[]" maxlength="4" type="tel" autocomplete="off" />
									</td>
								</tr>
								
								<tr class="displaynone">
									<th scope="row">&nbsp;&nbsp;SMS 수신여부 </th>
									<td><label for=is_sms0><input id="is_sms0"	class="ec-base-chk" value="T" type="checkbox" />동의함</label>
										<p>유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p></td>
								</tr>
								
								<tr>
									<th scope="row">주소 <img src="/resources/img/ico_required.gif"	alt="필수" /></th>
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
										<input id="u_extraAddress " name="u_adDetail"  class="inputTypeText" placeholder="나머지 주소" size="40" >
										 
								</td>
								</tr>
								
																

								<tr class="">
									<th scope="row">성별 <img
										src="/resources/img/ico_required.gif"
										id="icon_sex" alt="필수" /></th>
									<td>
									<input id="u_sex" name="u_sex" value="1" type="radio" />
									<label	for="u_sex">남자</label>
									<input id="u_sex" name="u_sex" value="0"	type="radio" />
									<label for="u_sex">여자</label></td>
								</tr>
								<tr class="">
									<th scope="row">생년월일 <img
										src=/resources/img/ico_required.gif
										id="icon_is_birthday" alt="필수" /></th>
									<td><input id="birth_year" name="birth_year"  maxlength="4" value=""/> 년
										<input id="birth_month" name="birth_month" maxlength="2" value=""/> 월
										<input id="birth_day" name="birth_day"	maxlength="2" value=""  /> 일
										<span class="birth displaynone">
											<input	id="is_solar_calendar0" name="is_solar_calendar" value="T"
											type="radio" checked="checked" />
											<label	for="is_solar_calendar0">양력</label>
											<input	id="is_solar_calendar1" name="is_solar_calendar" value="F"
											type="radio" />
											<label for="is_solar_calendar1">음력</label>
										</span>
									</td>
								</tr>
								
								<tr>
									<th scope="row">이메일 <img	src="/resources/img/ico_required.gif"	alt="필수" /></th>
									<td><input id="email1" name="email1" class="mailId" value="" type="text" />
									@<input id="email2" name="email2"	class="mailAddress" readonly="readonly" value="" type="text" />
									<select	id="email3" >
											<option value="" selected="selected">- 이메일 선택 -</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="nate.com">nate.com</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="yahoo.com">yahoo.com</option>
											<option value="empas.com">empas.com</option>
											<option value="korea.com">korea.com</option>
											<option value="dreamwiz.com">dreamwiz.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="etc">직접입력</option>
									</select></td>
								</tr>
								
								<tr class="displaynone">
									<th scope="row">&nbsp;&nbsp;이메일 수신여부 </th>
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
									<td><input id="reco_id" name="reco_id" fw-filter=""
										fw-label="추천인 ID" fw-msg="" class="inputTypeText"
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
												name="refund_bank_code" >
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
			</div> <!-- end of contents -->
			<br>
			<button class="btn btn-primary" type="submit">가입완료</button>
	</form> 	<!-- end of container -->
</div> <!-- end of wrap -->


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
	                    document.getElementById("u_extraAddress").value = '';
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
            //[1] 기본값 설정
            $("#extraInfo").hide(); //추가정보 숨기기

            //[2] more...클릭시 보이기 및 숨기기
            $("#more").click(function() {
                //3000 : 3초, 'slow', 'normal', 'fast'
                $("#extraInfo").show('fast'); //천천히 보이기
                $(this).hide('fast');//more버튼 숨기기
            });
        });
	</script>


</body>

