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

<title>회원가입</title>
</head>

<body>
<div id="wrap" style="clear: both;">
	<div id="container">
		<div id="contents">
			<div class="titleArea">	<h2>회원가입</h2>	</div>

				
					<h3>기본정보</h3>
					<p class="required">
						<img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
							alt="필수" /> 필수입력사항
					</p>
					<div class="boardWrite">
						<table border="1" summary="">
							<caption>회원 기본정보</caption>
							<tbody>
								<tr>
									<th scope="row">아이디 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수" /></th>
									<td><input id="member_id" name="member_id"
										fw-filter="isFill&isFill&isMin[4]&isMax[16]&isIdentity"
										fw-label="아이디" fw-msg="" class="inputTypeText" placeholder=""
										value="" type="text" /> <a href="#none" title="새창 열기"
										onclick="checkIdLayer('/member/check_id.html')"><img
											src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_overlap_id.gif"
											alt="아이디 중복확인" /></a> (영문소문자/숫자, 4~16자)</td>
								</tr>
								<tr>
									<th scope="row">비밀번호 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수" /></th>
									<td><input id="passwd" name="passwd"
										fw-filter="isFill&isMin[4]&isMax[16]" fw-label="비밀번호"
										fw-msg="" autocomplete="off" maxlength="16"
										0="disabled" value="" type="password" /> (영문 대소문자/숫자/특수문자 중
										2가지 이상 조합, 10자~16자)</td>
								</tr>
								<tr>
									<th scope="row">비밀번호 확인 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수" /></th>
									<td><input id="user_passwd_confirm"
										name="user_passwd_confirm" fw-filter="isFill&isMatch[passwd]"
										fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다."
										autocomplete="off" maxlength="16" 0="disabled" value=""
										type="password" /></td>
								</tr>
								<tr>
									<th scope="row">비밀번호 확인 질문 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수" /></th>
									<td><select id="hint" name="hint" fw-filter="isFill"
										fw-label="hint" fw-msg="">
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
									<th scope="row">비밀번호 확인 답변 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수" /></th>
									<td><input id="hint_answer" name="hint_answer"
										fw-filter="isFill" fw-label="비밀번호 확인시 답변" fw-msg=""
										class="inputTypeText" placeholder="" value="" type="text" /></td>
								</tr>
								<tr>
									<th scope="row" id="nameTitle">이름 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수" /></th>
									<td><span id="nameContents"><input id="name"
											name="name" fw-filter="isFill&isMax[30]" fw-label="이름"
											fw-msg="" class="ec-member-name" placeholder=""
											maxlength="30" value="" type="text" /></span> <span id="under14Msg"
										class="displaynone">14세 미만 사용자는 법정대리인 동의가 필요합니다.</span></td>
								</tr>
								<tr>
									<th scope="row">주소 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수" /></th>
									<td><input id="postcode1" name="postcode1"
										fw-filter="isLengthRange[1][14]" fw-label="우편번호1" fw-msg=""
										class="inputTypeText" placeholder="" readonly="readonly"
										maxlength="14" value="" type="text" /> - <input
										id="postcode2" name="postcode2"
										fw-filter="isLengthRange[3][8]" fw-label="우편번호2" fw-msg=""
										class="inputTypeText" placeholder="" readonly="readonly"
										value="" type="text" /> <a href="#none" onclick=""
										id="postBtn"><img
											src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_zipcode.gif"
											alt="우편번호" /></a><br /> <input id="addr1" name="addr1"
										fw-filter="isFill" fw-label="주소" fw-msg=""
										class="inputTypeText" placeholder="" readonly="readonly"
										value="" type="text" /> 기본주소<br /> <input id="addr2"
										name="addr2" fw-filter="" fw-label="주소" fw-msg=""
										class="inputTypeText" placeholder="" value="" type="text" />
										나머지주소</td>
								</tr>
								<tr>
									<th scope="row">휴대전화 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수" /></th>
									<td><select id="mobile1" name="mobile[]"
										fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N"
										fw-msg="">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
									</select>-<input id="mobile2" name="mobile[]" maxlength="4"
										fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N"
										fw-msg="" value="" type="text" />-<input id="mobile3"
										name="mobile[]" maxlength="4" fw-filter="isNumber&isFill"
										fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text" /></td>
								</tr>
								<tr class="displaynone">
									<th scope="row">SMS 수신여부 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수" /></th>
									<td><label for=is_sms0><input id="is_sms0"
											name="is_sms" fw-filter="" fw-label="is_sms" fw-msg=""
											class="ec-base-chk" value="T" type="checkbox" />동의함</label>
										<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p></td>
								</tr>
								<tr>
									<th scope="row">이메일 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수" /></th>
									<td><input id="email1" name="email1" fw-filter="isFill"
										fw-label="이메일" fw-alone="N" fw-msg="" class="mailId" value=""
										type="text" />@<input id="email2" name="email2"
										fw-filter="isFill" fw-label="이메일" fw-alone="N" fw-msg=""
										class="mailAddress" readonly="readonly" value="" type="text" /><select
										id="email3" fw-filter="isFill" fw-label="이메일" fw-alone="N"
										fw-msg="">
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
									<th scope="row">이메일 수신여부 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수" /></th>
									<td><label for=is_news_mail0><input
											id="is_news_mail0" name="is_news_mail" fw-filter=""
											fw-label="is_news_mail" fw-msg="" class="ec-base-chk"
											value="T" type="checkbox" />동의함</label>
										<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p></td>
								</tr>
							</tbody>
						</table>
					</div>
					<h3 class="">추가정보</h3>
					<div class="boardWrite typeAddinfo">
						<table border="1" summary="">
							<caption>회원 추가정보</caption>
							<tbody>
								
								<tr class="">
									<th scope="row">성별 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										id="icon_sex" alt="필수" /></th>
									<td><input id="is_sex0" name="is_sex" fw-filter="isFill"
										fw-label="성별" fw-msg="" value="M" type="radio" /><label
										for="is_sex0">남자</label> <input id="is_sex1" name="is_sex"
										fw-filter="isFill" fw-label="성별" fw-msg="" value="F"
										type="radio" /><label for="is_sex1">여자</label></td>
								</tr>
								<tr class="">
									<th scope="row">생년월일 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										id="icon_is_birthday" alt="필수" /></th>
									<td><input id="birth_year" name="birth_year"
										fw-filter="isFill" fw-label="생년월일" fw-msg=""
										class="inputTypeText" placeholder="" maxlength="4" value=""
										type="text" /> 년 <input id="birth_month" name="birth_month"
										fw-filter="isFill" fw-label="생년월일" fw-msg=""
										class="inputTypeText" placeholder="" maxlength="2" value=""
										type="text" /> 월 <input id="birth_day" name="birth_day"
										fw-filter="isFill" fw-label="생년월일" fw-msg=""
										class="inputTypeText" placeholder="" maxlength="2" value=""
										type="text" /> 일 <span class="birth displaynone"><input
											id="is_solar_calendar0" name="is_solar_calendar"
											fw-filter="isFill" fw-label="생년월일" fw-msg="" value="T"
											type="radio" checked="checked" /><label
											for="is_solar_calendar0">양력</label> <input
											id="is_solar_calendar1" name="is_solar_calendar"
											fw-filter="isFill" fw-label="생년월일" fw-msg="" value="F"
											type="radio" /><label for="is_solar_calendar1">음력</label></span></td>
								</tr>
								<tr class="">
									<th scope="row">신장 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										id="icon_add2" alt="필수" /></th>
									<td><input id="add2" name="add2" fw-filter=""
										fw-label="추가항목2" fw-msg="" class="inputTypeText"
										placeholder="" maxlength="30" value="" type="text" /></td>
								</tr>
								<tr class="">
									<th scope="row">몸무게 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										id="icon_add3" alt="필수" /></th>
									<td><input id="add3" name="add3" fw-filter=""
										fw-label="추가항목3" fw-msg="" class="inputTypeText"
										placeholder="" maxlength="30" value="" type="text" /></td>
								</tr>
								
								<tr class="">
									<th scope="row">추천인 아이디 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										id="icon_reco_id" alt="필수" /></th>
									<td><input id="reco_id" name="reco_id" fw-filter=""
										fw-label="추천인 ID" fw-msg="" class="inputTypeText"
										placeholder="" value="" type="text" /></td>
								</tr>
								<tr class="">
									<th scope="row">환불계좌 정보 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										id="icon_is_display_bank" alt="필수" /></th>
									<td>
										<ul class="account">
											<li><strong>예금주</strong> <input id="bank_account_owner"
												name="bank_account_owner" fw-filter="" fw-label="예금주"
												fw-msg="" class="inputTypeText" placeholder=""
												autocomplete="off" value="" type="text" /></li>
											<li><strong>은행명</strong> <select id="refund_bank_code"
												name="refund_bank_code" fw-filter="" fw-label="은행명"
												fw-msg="">
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
												name="bank_account_no" fw-filter="" fw-label="계좌번호"
												fw-msg="" class="inputTypeText" placeholder=""
												autocomplete="off" value="" type="text" /> ('-'와 숫자만
												입력해주세요.)</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
			</div>
		</div>
	</div>


</div>
</body>

