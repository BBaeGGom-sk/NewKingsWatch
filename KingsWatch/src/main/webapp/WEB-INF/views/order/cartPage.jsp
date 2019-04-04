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
			<div class="titleArea">
				<h2>쇼핑 카트다 이자식아</h2>
			</div>
			<p class="">장바구니에 담긴 상품은 30일 동안 보관됩니다.</p>
			<table border="1" summary=""
				class="xans-element- xans-order xans-order-normnormal boardList xans-record-">
				<caption>기본배송</caption>
				<thead>
					<tr>
						<th scope="col" class="chk"><input type="checkbox" onclick="" /></th>
						<th scope="col" class="thumb">이미지</th>
						<th scope="col" class="product">상품정보</th>
						<th scope="col" class="price">판매가</th>
						<th scope="col" class="quantity">수량</th>
						<th scope="col" class="mileage">적립금</th>
						<th scope="col" class="delivery">배송구분</th>
						<th scope="col" class="charge">배송비</th>
						<th scope="col" class="total">합계</th>
						<th scope="col" class="button">선택</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="10"><strong class="type">[기본배송]</strong> 상품구매금액
							<strong>(여기에 장바구니 금액총합)</strong> + 배송비 (여기에 배송비 넣기) = 합계 : <strong
							class="total"><span>(여기에 상품 총 금액 넣기)</span></strong></td>
					</tr>
				</tfoot>
				<tbody class="xans-element- xans-order xans-order-list">
					<tr class="xans-record-">
						<!-- 체크박스 부분 -->
						<td><input type="checkbox" id="basket_chk_id_0"
							name="basket_product_normal_type_normal" /></td>
						<!-- 썸네일 부분 -->
						<td class="thumb"><a href=""><img src="" alt="여기에 썸네일 넣기" /></a></td>
						<!-- 상품 정보 부분 -->
						<td class="product"><a href=""><strong>(여기에 상품명
									넣기)</strong> </a>
							<ul class="xans-element- xans-order xans-order-optionall option">
								<li class="xans-record-"><strong>(여기에 상품명 넣기)</strong> (옵션
									넣어주기) <br /></li>
							</ul></td>
						<!-- 판매가 부분 -->
						<td class="price">
							<div class="">
								<strong>(상품 가격 넣어주기)</strong>
							</div>
						</td>
						<!-- 상품 수량 부분 -->
						<td><span class="quantity"> <input id="quantity_id_0"
								name="quantity_name_0" size="2" value="1" type="text" /> <a
								href="" onclick=""> <img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_up.gif"
									alt="증가" class="QuantityUp" />
							</a> <a href="" onclick=""> <img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_down.gif"
									alt="감소" class="QuantityDown" />
							</a>
						</span> <a href="" onclick=""> <img
								src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_modify.gif"
								alt="변경" />
						</a></td>
						<!-- 적립금 부분 -->
						<td class="mileage"><input id='' name='' value=''
							type="hidden"> <img
							src="//img.echosting.cafe24.com/design/common/icon_cash.gif" />
							(여기에 적립금x수량 넣기)</td>
						<!--  배송 구분 부분 -->
						<td class="delivery">(배송구분 넣기)(ex:기본배송)</td>
						<!-- 배송비 부분 -->
						<td>(배송비 넣어주기)</td>
						<!-- 합계 부분 -->
						<td class="total"><strong>(가격x수량 넣어주기)</strong></td>
						<!-- 주문 선택 부분 -->
						<td class="button">
							<a href="" onclick=""> 
								<img src="" alt="주문하기" />
							</a><br>
							<a href="" onclick=""> 
								<img src="" alt="관심상품등록" />
							</a><br>
							<a href="" onclick=""> 
								<img src="" alt="삭제" />
							</a>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- 선택상품 제어 버튼 -->
			<div class="xans-element- xans-order xans-order-selectorder ">
				<span class="left"> <span class="ctrlTxt"
					style="color: #757575;">선택상품을</span> <a href="#none" onclick=""
					style="color: #757575;">DELETE</a> / <a href="#none" onclick=""
					style="color: #757575;">EMPTY SHOPPING CART !</a>
				</span>
			</div>
			<!-- 총 주문금액 : 국내배송상품 -->
			<div class="xans-element- xans-order xans-order-totalsummary  ">
				<table border="1" summary="">
					<caption>총 주문금액</caption>
					<thead>
						<tr>
							<th scope="col"><span>총 상품금액</span>
							<th scope="col">총 배송비</th>
							<th scope="col">결제예정금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="price">
								<div class="box">
									<strong>(총 상품금액 넣기)</strong>
								</div>
							</td>
							<td class="option">
								<div class="box">
									<strong>+</strong><strong>(총 배송비 넣기)</strong>
								</div>
							</td>
							<td class="total">
								<div class="box">
									<strong>=</strong><strong>(결제예정금액 넣기)</strong>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<script type="text/javascript">
			$(document).ready(function() {

			});
		</script>
</body>
</html>