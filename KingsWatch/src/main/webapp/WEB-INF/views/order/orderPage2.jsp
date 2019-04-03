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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css">
li {
	list-style-type: none;
}



</style>

<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<h1>주문페이지</h1>
		</div>
		<!-- 혜택정보 -->
		<div class="bankBenefit ">
			<h3>
				<strong><span>혜택정보</span></strong>
			</h3>
			<div class="info">
				<div class="member">
					<p>
						<strong>${dto.u_name}</strong> 님은, [화이트] 회원이십니다.
					</p>
					<ul class="">
						<li class="displaynone"><span class="displaynone">0</span> 이상
							<span class="displaynone"></span> 구매시 <span></span>을 추가할인 받으실 수
							있습니다. <span class="displaynone">(최대 0)</span></li>
						<li class=""><span class="">1</span> 이상 <span
							class="displaynone"></span> 구매시 <span>1%</span>을 추가적립 받으실 수 있습니다.
							<span class="displaynone">(최대 )</span></li>
					</ul>
				</div>
				<ul class="mileage">
					<li><a href="/myshop/mileage/historyList.html">가용적립금 : <strong>0원</strong></a></li>
					<li><a href="/myshop/coupon/coupon.html">쿠폰 : <strong>0개</strong></a></li>
				</ul>
			</div>
		</div>
		<ul class="controlInfo">
			<li>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
			<li class="displaynone">할인 적용 금액은 주문서작성의 결제예정금액에서 확인 가능합니다.</li>
		</ul>
		<div class="row">
			<form action="/order/orderpage" method="post">
				<div class="boardWrite">
					<table border="1" summary="">
						<h3>주문자 정보</h3>
						<caption>주문자 정보 입력</caption>
						<p class="required">
							<img
								src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
								alt="필수" /> 필수입력사항
						</p>
						<tbody class="address_form ">
							<tr>
								<!-- 주문자 이름 -->
								<th>주문하시는 분<img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
									alt="필수">
								</th>
								<td><input id="u_name" name="u_name" class="inputTypeText"
									type="text" value=${dto.u_name} ></td>
							</tr>
							<tr>
								<!-- 주문자 주소 -->
								<th>주소 <img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
									alt="필수" />
								</th>
								<td>
									<!-- 우편번호 --> <input id="u_postcode" name="rzipcode1"
									class="inputTypeText" placeholder="" size="6" maxlength="6"
									readonly value="${dto.u_postNum }" type="text" /> <!-- 우편번호 버튼 -->
									<input type="button" onclick="u_execDaumPostcode()"
									value="우편번호 찾기"><br> <!-- 기본주소 --> <input
									id="u_address" name="raddr1" class="inputTypeText"
									placeholder="기본 주소" size="40" readonly value="${dto.u_adMain }"
									type="text" /><br /> <!-- 나머지주소 --> <input
									class="inputTypeText" size="40" id="u_detailAddress"
									placeholder="나머지 주소" value="${dto.u_adSub }"> <!-- 상세주소 -->
									<input id="u_extraAddress" name="raddr2" class="inputTypeText"
									placeholder="상세 주소" size="40" value="${dto.u_adDetail }"
									type="text" />
								</td>
							</tr>

							<tr>
								<!-- 주문자 휴대전화 -->
								<th scope="row">휴대전화 <img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
									alt="필수" />
								</th>
								<td><c:set var="phoneNum" value="${dto.u_phone }" /> <!-- 주문자 휴대전화 1 -->
									<select id="u_phoneNumFirst" name="u_phoneNumFirst">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select> - <!-- 주문자 휴대전화 2 --> <input id="u_phoneNumMid"
									name="u_phoneNumMid" maxlength="4" size="4"
									value="${fn:substring(phoneNum,3,7) }" type="text" /> - <!-- 휴대 전화 3 -->
									<input id="u_phoneNumEnd" name="u_phoneNumEnd" maxlength="4"
									size="4" value="${fn:substring(phoneNum,7,11) }" type="text" />
								</td>
							</tr>
							<tr>
								<!-- 주문자 이메일 -->
								<th scope="row">이메일 <img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
									alt="필수" />
								</th>
								<td>
									<!-- 주문자 이메일 1 --> <input id="u_email1" name="u_email1"
									class="mailId" value="" type="text" /> @ <!-- 주문자 이메일 2 --> <input
									id="u_email2" name="u_email2" class="mailAddress"
									value="" type="text" readonly />
									<select id="u_emailSelect">
										<option value="etc">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="yahoo.com">yahoo.com</option>
										<option value="empas.com">empas.com</option>
										<option value="korea.com">korea.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="gmail.com">gmail.com</option>
								</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 배송지 정보 -->
				<div class="orderArea ">
					<div class="title">
						<h3>배송지 정보</h3>
						<p class="required">
							<img
								src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
								alt="필수" /> 필수입력사항
						</p>
					</div>
					<div class="boardWrite">
						<table border="1" summary="">
							<caption>배송지 정보 입력</caption>
							<tbody>
								<tr>
									<!-- 배송지 선택하기 -->
									<th>배송지 선택</th>
									<td>
										<!-- 라디오 타입으로 주소지 설정 -->
										<div class="address">
											<input id="defaultAddress" name="orderAddress" value="T"
												type="radio" checked="checked" /> <label
												for="defaultAddress">주문자 정보와 동일</label> <input
												id="newAddress" name="orderAddress" value="F" type="radio" />
											<label for="newAddress">새로운배송지</label> <a href="#none"
												id="btn_shipp_addr" class=""> <img
												src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_address.gif"
												alt="주소록 보기" /></a>
										</div>
									</td>
								</tr>
								<tr>
									<!-- 받는사람 -->
									<th scope="row">받으시는 분 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
										alt="필수" />
									</th>
									<td>
										<!-- 받는사람 이름 --> <input id="o_name" name="o_name"
										class="inputTypeText" type="text" value=${dto.u_name } size="15">
									</td>
								</tr>
								<tr>
									<!-- 받는사람 주소지 -->
									<th scope="row">주소 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
										alt="필수" />
									</th>
									<td>
										<!-- 우편번호 --> <input id="o_postcode" name="rzipcode1"
										class="inputTypeText" placeholder="" size="6" maxlength="6"
										readonly value="${dto.u_postNum }" type="text" /> <!-- 우편번호 버튼 -->
										<input type="button" onclick="o_execDaumPostcode()"
										value="우편번호 찾기"><br> <!-- 기본주소 --> <input
										id="o_address" name="raddr1" class="inputTypeText"
										placeholder="기본 주소" size="40" readonly
										value="${dto.u_adMain }" type="text" /><br /> <!-- 나머지주소 -->
										<input class="inputTypeText" size="40" id="o_detailAddress"
										placeholder="나머지 주소" value="${dto.u_adSub }"> <!-- 상세주소 -->
										<input id="o_extraAddress" name="raddr2" class="inputTypeText"
										placeholder="상세 주소" size="40" value="${dto.u_adDetail }"
										type="text" />
									</td>
								</tr>
								<tr>
									<!-- 휴대전화 -->
									<th scope="row">휴대전화 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
										alt="필수" /></th>
									<td>
										<!-- 받는사람 휴대전화 1 --> <select id="o_phoneNumFirst"
										name="o_phoneNumFirst">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
									</select> - <!-- 받는사람 휴대전화 2 --> <input id="o_phoneNumMid"
										name="o_phoneNumMid" maxlength="4" size="4"
										value="${fn:substring(phoneNum,3,7) }" type="text" /> - <!-- 받는사람 휴대전화 2 -->
										<input id="o_phoneNumEnd" name="o_phoneNumEnd" maxlength="4"
										size="4" value="${fn:substring(phoneNum,7,11) }" type="text" />
									</td>
								</tr>
								<tr class="">
									<!-- 배송메세지 -->
									<th scope="row">배송메시지</th>
									<td><textarea id="omessage" name="omessage"
											maxlength="255" cols="70"></textarea></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>


			</form>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			
			// 유저 이메일 받아오기
			var email = "${dto.u_email}";
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
			})
			// 주문페이지 넘어올때 이메일 셀렉트 판별 및 자동 선택하기
			if (emailArr[1] == "naver.com") {
				document.getElementById("u_emailSelect").value = "naver.com";
				$("#u_emailSelect option:eq(1)").prop("selected", true);
			} else if (emailArr[1] == "daum.net") {
				document.getElementById("u_emailSelect").value = "daum.net";
				$("#u_emailSelect option:eq(2)").prop("selected", true);
			} else if (emailArr[1] == "nate.com") {
				document.getElementById("u_emailSelect").value = "nate.com";
				$("#u_emailSelect option:eq(3)").prop("selected", true);
			} else if (emailArr[1] == "hotmail.com") {
				document.getElementById("u_emailSelect").value = "hotmail.com";
				$("#u_emailSelect option:eq(4)").prop("selected", true);
			} else if (emailArr[1] == "yahoo.com") {
				document.getElementById("u_emailSelect").value = "yahoo.com";
				$("#u_emailSelect option:eq(5)").prop("selected", true);
			} else if (emailArr[1] == "empas.com") {
				document.getElementById("u_emailSelect").value = "empas.com";
				$("#u_emailSelect option:eq(6)").prop("selected", true);
			} else if (emailArr[1] == "korea.com") {
				document.getElementById("u_emailSelect").value = "korea.com";
				$("#u_emailSelect option:eq(7)").prop("selected", true);
			} else if (emailArr[1] == "dreamwiz.com") {
				document.getElementById("u_emailSelect").value = "dreamwiz.com";
				$("#u_emailSelect option:eq(8)").prop("selected", true);
			} else if (emailArr[1] == "gmail.com") {
				document.getElementById("u_emailSelect").value = "gmail.com";
				$("#u_emailSelect option:eq(9)").prop("selected", true);
			} else { // 해당하는게 없으면 직접입력이 선택되고 readonly 속성이 해제됨
				document.getElementById("u_emailSelect").value = "etc";
				$("#u_email2").removeAttr("readonly");
				$("#u_emailSelect option:eq(9)").prop("selected", true);
			}
			
			// 휴대전화번호 세번째자리만 분리
			var phoneNumFirst = ${fn:substring(phoneNum,2,3)};
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

			
			// 기본배송지 선택시 주문자의 이름과 주소, 휴대전화번호를 가져옴
			$("#defaultAddress").click(function() {
				document.getElementById('o_name').value = document.getElementById('u_name').value;
				document.getElementById('o_phoneNumFirst').value = document.getElementById('u_phoneNumFirst').value;
				document.getElementById('o_phoneNumMid').value = document.getElementById('u_phoneNumMid').value;
				document.getElementById('o_phoneNumEnd').value = document.getElementById('u_phoneNumEnd').value;
				document.getElementById('o_postcode').value = document.getElementById('u_postcode').value;
				document.getElementById('o_address').value = document.getElementById('u_address').value;
				document.getElementById('o_detailAddress').value = document.getElementById('u_detailAddress').value;
				document.getElementById('o_extraAddress').value = document.getElementById('u_extraAddress').value;
			});
			
			// 새로운배송지 선택시 배송지를 적을 수 있게 모두초기화
			$("#newAddress").click(function() {
				document.getElementById('o_name').value = "";
				document.getElementById('o_phoneNumFirst').value = "";
				document.getElementById('o_phoneNumMid').value = "";
				document.getElementById('o_phoneNumEnd').value = "";
				document.getElementById('o_postcode').value = "";
				document.getElementById('o_address').value = "";
				document.getElementById('o_detailAddress').value = "";
				document.getElementById('o_extraAddress').value = "";
			});
			
		});
			
		
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
	                    document.getElementById("u_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("u_extraAddress").value = '';
	                }
					// 인풋 초기화 해주기
					document.getElementById('u_postcode').value = "";
	                document.getElementById("u_address").value = "";
	                document.getElementById("u_detailAddress").value = "";
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('u_postcode').value = data.zonecode;
	                document.getElementById("u_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("u_detailAddress").focus();
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
	                document.getElementById("o_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>


</body>
</html>