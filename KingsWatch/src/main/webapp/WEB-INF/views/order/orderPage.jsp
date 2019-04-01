<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<h1>주문페이지</h1>
		</div>
		<div class="row">
			<form action="/order/orderpage" method="post">
				<div class="boardWrite">
					<table border="1" summary="">
						<caption>주문자 정보 입력</caption>
						<tbody class="address_form ">
							<tr>
								<!-- 주문자 이름 -->
								<th>주문하시는 분<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수">
								</th>
								<td><input id="u_name" name="u_name" class="inputTypeText"
									type="text" value=${dto.u_name} ></td>
							</tr>
							<tr>
								<!-- 주문자 주소 -->
								<th>주소 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
								alt="필수" />
								</th>
							<td>
								<!-- 우편 번호 1 -->
								<input id="ozipcode1" name="ozipcode1" class="inputTypeText" placeholder="" size="6" maxlength="6" readonly="1" value="" type="text" />
								-
								<!-- 우편 번호 2 -->
								<input id="ozipcode2" name="ozipcode2" class="inputTypeText" placeholder="" size="6" maxlength="6"readonly="1" value="" type="text" /> 
								<a href="#none"	id="btn_search_ozipcode">
								<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_zipcode.gif" alt="우편번호" />
								</a><br /> 
								<!-- 기본 주소 -->
								<input id="oaddr1" name="oaddr1" class="inputTypeText" placeholder="" size="40" readonly="1" value="" type="text" /> 
								<span class="grid">기본주소</span><br /> 
								<!-- 나머지 주소 -->
								<input id="oaddr2" name="oaddr2" class="inputTypeText" placeholder="" size="40" value="" type="text" /> 
								<span class="grid">나머지주소</span>
							</td>
							</tr>
							<!-- <tr>
								일반 전화
								<th scope="row">일반전화 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수" />
								</th>
								<td>
								<select id="ophone1_1" name="ophone1_[]">
										<option value="02">02</option>
										<option value="031">031</option>
										<option value="032">032</option>
										<option value="033">033</option>
										<option value="041">041</option>
										<option value="042">042</option>
										<option value="043">043</option>
										<option value="044">044</option>
										<option value="051">051</option>
										<option value="052">052</option>
										<option value="053">053</option>
										<option value="054">054</option>
										<option value="055">055</option>
										<option value="061">061</option>
										<option value="062">062</option>
										<option value="063">063</option>
										<option value="064">064</option>
										<option value="0502">0502</option>
										<option value="0503">0503</option>
										<option value="0504">0504</option>
										<option value="0505">0505</option>
										<option value="0506">0506</option>
										<option value="0507">0507</option>
										<option value="070">070</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select>
								-
								<input id="ophone1_2" name="ophone1_[]" maxlength="4" size="4" value="" type="text" />
								-
								<input id="ophone1_3"
									name="ophone1_[]" maxlength="4" size="4" value="" type="text" />
								</td>
							</tr> -->
							<tr>
								<!-- 휴대 전화 -->
								<th scope="row">휴대전화</th>
								<td>
									<!-- 휴대 전화 1 -->
									<select id="ophone2_1" name="ophone2_[]">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
									-
									<!-- 휴대 전화 2 -->
									<input id="ophone2_2" name="ophone2_[]" maxlength="4" size="4" value="" type="text" />
									-
									<!-- 휴대 전화 3 -->
									<input id="ophone2_3" name="ophone2_[]" maxlength="4" size="4" value="" type="text" />
								</td>
							</tr>
							<tr>
								<!-- 이메일 -->
								<th scope="row">이메일 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수" />
								</th>
								<td>
									<!-- 이메일 1 -->
									<input id="oemail1" name="oemail1" class="mailId"value="" type="text" />
									@
									<!-- 이메일 2 -->
									<input id="oemail2" name="oemail2" class="mailAddress" readonly="readonly" value="" type="text" />
										<select id="oemail3">
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
										</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>

</body>
</html>