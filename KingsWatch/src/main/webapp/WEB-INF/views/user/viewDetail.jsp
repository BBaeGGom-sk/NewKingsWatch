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

<title>마이 페이지</title>
</head>

<body>
	<h1>마이 페이지(회원정보 상세보기)</h1>
	<div class="pager" id="wrap">
		<form class="" id="container" method="post" action="/user/join">
			<div id="contents">
				<div class="titleArea">
					<h2>회원정보 상세보기</h2>
				</div>

				<div align="center">
					<table border="1" summary="">
						<caption>바꿀 수 없는 영역</caption>
						<tbody>
							<tr>
								<th scope="row">아이디 </th>
								<td><input id="u_id" name="u_id" class="inputTypeText" value="${login.u_id}" type="text" readonly="readonly"/></td>
							</tr>
							
							<tr>
								<th scope="row">나이 </th>
								<td><input id="u_age" name="u_age" class="inputTypeText" value="${login.u_age}" type="text" readonly="readonly"/></td>
							</tr>
							
							<tr>
								<th scope="row">포인트 </th>
								<td><input id="u_point" name="u_point" class="inputTypeText" value="${login.u_point}" type="text" readonly="readonly"/></td>
							</tr>

						</tbody>
					</table>
					
					<table border="1" summary="">
						<caption>바꿀 수 있는 영역</caption>
						<tbody>
							<tr>
								<th scope="row">비밀번호</th>
								<td><input id="u_pw" name="u_pw" autocomplete="off"  type="password" />
								(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</td>
							</tr>
							<tr>
								<th scope="row">비밀번호 확인 <img
									src="/resources/img/ico_required.gif" alt="필수" /></th>
								<td><input id="user_passwd_confirm"
									name="user_passwd_confirm" autocomplete="off" type="password" /></td>
							</tr>

							<tr>
								<th scope="row" id="nameTitle">이름 </th>
								<td>
								<span id="nameContents"><input id="u_name"
										name="u_name" maxlength="30" value="${login.u_name}" type="text" />
								</span>
								</td>
							</tr>

							<tr>
								<th scope="row">휴대폰 번호</th>
								<td><input id="u_phone" name="u_phone" type="text"	autocomplete="off" hidden="" />
									<select id="u_phone1"	name="u_phone1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select> - <!-- 주문자 휴대전화 2 --> <input id="u_phone2" name="u_phone2"
									maxlength="4" size="4" type="tel" autocomplete="off" /> <input
									id="u_phone3" name="u_phone3" maxlength="4" size="4" type="tel"
									autocomplete="off" /></td>
							</tr>

							<tr class="displaynone">
								<th scope="row">&nbsp;&nbsp;SMS 수신여부</th>
								<td><label for=is_sms0><input id="is_sms0"
										class="ec-base-chk" value="T" type="checkbox" />동의함</label>
									<p>유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p></td>
							</tr>

							<tr>
								<th scope="row">주소</th>
								<td>
									<!-- 우편번호 --> <input id="u_postcode" name="u_postNum"
									class="inputTypeText" placeholder="" size="6" maxlength="6" />
									<!-- 우편번호 버튼 --> <input class="btn btn-primary" type="button"
									onclick="u_execDaumPostcode()" value="우편번호 찾기"><br>
									<!-- 기본주소 --> <input id="u_address" name="u_adMain"
									class="inputTypeText" placeholder="기본 주소" size="40" /><br>
									<!-- 상세주소 --> <input id="u_detailAddress" name="u_adSub"
									class="inputTypeText" placeholder="상세 주소" size="40" type="text" />
									<!-- 나머지주소 --> <input id="u_extraAddress" name="u_adDetail"
									class="inputTypeText" placeholder="나머지 주소" size="40">

								</td>
							</tr>

							<tr class="">
								<th scope="row">성별 </th>
								<td><input id="u_sex" name="u_sex" value="1" type="radio" />
									<label for="u_sex">남자</label> <input id="u_sex" name="u_sex"
									value="2" type="radio" /> <label for="u_sex">여자</label></td>
							</tr>

							<tr>
								<th scope="row">이메일</th>
								<td><input id="u_email" name="u_email" type="text"
									autocomplete="off" hidden="" /> <input id="u_email1"
									name="u_email1" class="mailId" value="" type="text" /> @<input
									id="u_email2" name="u_email2" class="mailAddress"
									readonly="readonly" value="" type="text" /> <select
									id="u_emailSelect">
										<option value="" selected="selected">- 이메일 선택 -</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="yahoo.com">yahoo.com</option>
										<option value="etc">직접입력</option>
								</select></td>
							</tr>

							<tr class="displaynone">
								<th scope="row">&nbsp;&nbsp;이메일 수신여부</th>
								<td><label for=is_news_mail0> <input
										id="is_news_mail0" name="is_news_mail" class="ec-base-chk"
										value="T" type="checkbox" />동의함
								</label>
									<p>유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p></td>
							</tr>

							<tr class="">
								<th scope="row">키(cm)</th>
								<td><input id="add2" name="add2" class="inputTypeText"
									placeholder="" maxlength="30" value="" type="text" /></td>
							</tr>

							<tr class="">
								<th scope="row">몸무게</th>
								<td><input id="add3" name="add3" class="inputTypeText"
									placeholder="" maxlength="30" value="" type="text" /></td>
							</tr>

							
							<tr class="">
								<th scope="row">환불계좌 정보&nbsp;</th>
								<td>
									<ul class="account">
										<li><strong>예금주</strong> <input id="bank_account_owner"
											name="bank_account_owner" class="inputTypeText"
											placeholder="" autocomplete="off" value="" type="text" /></li>
										<li><strong>은행명</strong> <select id="refund_bank_code"
											name="refund_bank_code">
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
	<input type="submit" value="회원정보 변경" id="revise">
	<input type="submit" value="회원탈퇴" id="cancle_membership">



	<script type="text/javascript">
	$("#revise").on(function() {
			alert("회원정보를 수정했습니다.");
		}
	</script>


</body>
</html>