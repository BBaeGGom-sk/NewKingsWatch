<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="../../resources/js/upload.js"></script>
<script src="../../resources/js/uploaddetail.js"></script>
<link href="../../resources/css/jquery.bxslider.css"  rel="stylesheet" type="text/css" /> 


 
<style type="text/css">
.uploadedList {
   list-style: none;
   margin-bottom: 50px;
}

body {
   font-family: '맑은 고딕', verdana;
   padding: 0;
   margin: 0;
}

ul {
   padding: 0;
   margin: 0;
   list-style: none;
}

div#root {
   width: 90%;
   margin: 0 auto;
}

header#header {
   font-size: 60px;
   padding: 20px 0;
}

header#header h1 a {
   color: #000;
   font-weight: bold;
}

nav#nav {
   padding: 10px;
   text-align: right;
}

nav#nav ul li {
   display: inline-block; /* margin-left:10px;  */
}

.contain1 {
    padding-top: 110px;
    overflow: hidden;
}

.cosTitle {
    font-size: 2rem;
    font-weight: normal;
    text-transform: capitalize;
}

.price .cosTitle {
    display: inline-block;
    font-family: serif;
    font-size: 14px;
    color: #B48C83;
}

.conP, .wrapper, .lineWrapper {
    width: 100%;
    max-width: 1440px;
    margin: 0 auto;
    padding: 0 45px;
    box-sizing: border-box;
}

.sNewsP, .smallTitle {
    padding: 25px 0 40px;
    color: #666;
    font-size: 16px;
    box-sizing: border-box;
    word-break: keep-all;
}

.accordion dd b {
    text-transform: uppercase;
    font-weight: 200;
}

.accordion dd>table td {
    padding-right: 30px;
    vertical-align: top;
}

.opm {
    font-size: 0.9em;
    font-weight: 300;
    text-transform: capitalize;
}

.opb {
    font-size: 0.9em;
    font-weight: 600;
}
 
 .squarePage {
    position: relative;
    overflow: hidden;
    margin-top: 70px;
    font-size: 16px;
}

.squarePage .squareLeft {
    float: left;
    width: 51%;
    padding-bottom: 60px;
    box-sizing: border-box;
}

.squarePage .squareRight {
    float: left;
    width: 49%;
    padding: 0 50px 0 140px;
    box-sizing: border-box;
}

.squareSlide .slideImg>img {
    padding-bottom: 70%;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}

.selec {
    overflow: hidden;
    border-top: 1px solid #eee;
    border-bottom: 1px solid #eee;
    display: table;
    width: 100%;
}

.selec li {
    width: 50%;
    display: table-cell;
    padding: 15px 0;
    box-sizing: border-box;
}

.selec li.bdLeft {
    border-left: 1px solid #eee;
    padding-left: 15px;
}

.subBtnWrap a {
    width: calc(50% - 5px);
    float: left;
    box-sizing: border-box;
    text-align: center;
}

.btn_bouche_black, .btn1 {
    background-color: #333;
    border: 1px solid #333;
}

.btn_bouche, .btn2 {
    color: #B48C83;
    background-color: #fff;
    border: 1px solid #eee;
}

element.style {
    margin-right: 10px;
}

.cosWrap {
    position: relative;
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    box-sizing: border-box;
    padding: 0 45px;
}

.relPro {
    margin-bottom: 50px;
    box-sizing: border-box;
}

.relPro .smallTitle {
    margin: 50px auto 0px;
    text-align: center;
    font-size: 1.5em;
    font-weight: 300;
}

/* 스크롤버튼  */
  .ScrollButton {
  position: fixed;   /* 버튼의 위치 고정 */
  right: 10px;       /* x 위치 입력 */
  cursor: pointer;   /* 호버링 했을 때 커서 모양 변경 */
  z-index: 10;       /* 다른 태그에 가려지지 않게 우선순위 변경 */
  display: none;     /* 스크롤 위치에 상관없이 보이게 하려면 생략 */
}

/* 두 태그에 각각 y 위치 입력 */
#TopButton {
  bottom: 108px;        
}

#BottomButton {
  bottom: 75px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%
		session.getAttribute("login");
	%>

	<div class="contain1">
		<form>
			<div class="conP mPaddingNone">
				<div class="form-group squarePage">
					<div class="squareLeft">
						<ul class="uploadedList clearfix squareSlide" style="width: auto; position: relative;">
						</ul>
				</div>
					<div class="form-group squareRight">
						<div class="infoBox">
							<c:if test="${login.u_id eq 'admin'}">
								<button name="goodsUpdate" id="goodsUpdate" class="btn btn-primary">수정</button>
							</c:if>

							<h2 class="cosTitle">${goodsRead.g_name}</h2>
							<div class="price">
								<c:if test="${goodsRead.g_sale == 0}">
									<h2 class="cosTitle">
										&#8361;
										<fmt:formatNumber value="${goodsRead.g_price}" type="number" />
									</h2>
								</c:if>
								<c:if test="${goodsRead.g_sale != 0}">
									<p class="cosTitle">
										<s>&#8361;<fmt:formatNumber value="${goodsRead.g_price}" type="number" /></s>
									</p>
									<br>
									<p class="cosTitle" id="priceSale"></p>
								</c:if>
							</div>
							<dl class="accordion">
								<dt class="smallTitle">DESC</dt>
								<dd class="pdKey">
									<table>
										<tbody>
											<tr>
												<td><b>${goodsRead.g_desc}</b></td>
											</tr>
										</tbody>
									</table>
								</dd>
							</dl>
							<dl class="accordion">
								<dt class="smallTitle">QUANTITY</dt>
								<dd class="pdKey">
									<table>
										<tbody>
											<tr>
												<p>
													<button type="button" class="plus">+</button>
													<input name="o_quantity" id="o_quantity" type="number" class="numBox" min="1" value="1" readonly="readonly">
													<button type="button" class="minus">-</button>
												</p>
											</tr>
										</tbody>
									</table>
								</dd>
							</dl>
							<div class="option">
								<ul class="selec">
									<li>
										<h2 class="opm">BRAND</h2>
										<p class="opb">${goodsRead.g_brand}</p>
									</li>
									<li class="bdLeft">
										<h2 class="opm">CATEGORY</h2>
										<c:if test="${goodsRead.g_category eq 0}">
											<p class="opb">PUBLIC</p>
										</c:if>
										<c:if test="${goodsRead.g_category eq 1}">
											<p class="opb">WOMAN</p>
										</c:if>
										<c:if test="${goodsRead.g_category eq 2}">
											<p class="opb">MAN</p>
										</c:if>
									</li>
								</ul>
								<br>
								<div class="subBtnWrap mContain">
									<a class="btn_bouche_black" id="order" name="order" style="margin-right: 10px;">BUY</a>
									<a class="btn_bouche" id="cart" name="cart">ADD CART</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<input id="g_id" name="g_id" value="${goodsRead.g_id}" type="hidden">
			<input id="u_id" name="u_id" value="${login.u_id}" type="hidden">
		</form>
	</div>
	
	<div class="cosWrap">
    <div class="relPro">
        <h2 class="smallTitle">RELATED PRODUCT</h2>
        <div class="bx-wrapper" style="max-width: 100%;"><div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 378px;"><ul class="relbxslider watch" style="width: auto; position: relative;">
          <li style="float: none; list-style: none; position: absolute; width: 776px; z-index: 50; display: block;">
  
                
          </li>
        </ul></div><div class="bx-controls bx-has-controls-direction"><div class="bx-controls-direction"><a class="bx-prev disabled" href="">Prev</a><a class="bx-next disabled" href="">Next</a></div></div></div>
    </div>
</div>

	<!-- 스크롤버튼 -->
	<a id="TopButton" class="ScrollButton"><img
		src="../resources/img/top.png"></a>
	<a id="BottomButton" class="ScrollButton"><img
		src="../resources/img/bottom.png"></a>

	<a id="footer"></a>

	<!-- 이미지 불러오기위한 handlebars -->
	<script id="source" type="text/x-handlebars-template">
		<div class="bx-wrapper" style="max-width: 100%;">
			<div style="width: 100%; overflow: hidden; position: relative; height: 536px;"><ul class="squareSlide" style="width: auto; position: relative;">
				<li class="col-xs-3 pull-left" style="float: none; list-style: none; position: absolute; width: 489px; z-index: 50; display: block;" >	
					<img src="{{imgsrc}}">
				</li>
			</div>
		</div>
   </script>
   
   <script type="text/javascript">
				$(document).ready(
						function() {
							var g_id = "${goodsRead.g_id}";

							var g_price = ${goodsRead.g_price};
							var g_sale = ${goodsRead.g_sale};

							salePrice();

							// 할인가격구하기
							function salePrice() {
								var g_persent = g_sale / 100;
								var g_salePrice = g_price - (g_price * g_persent);
								$("#priceSale").text("₩" + g_salePrice.toLocaleString());
							}

							// 스크롤버튼
							$(function() {
								$(window).scroll(function() {
									if ($(this).scrollTop() > 100) {
										$('.ScrollButton').fadeIn();
									} else {
										$('.ScrollButton').fadeOut();
									}
								});

								$("#TopButton").click(function() {
									$('html, body').animate({scrollTop : 0}, 800);
									return false;
								});

								$("#BottomButton").click(function() {
									$('html, body').animate({scrollTop : ($('#footer').offset().top)}, 800);
									return false;
								});
							});

							// 상품수정버튼
							$("#goodsUpdate").click(function() {
								$("form").attr("action", "goodsUpdate");
								$("form").attr("method", "get");
								$("form").submit();
							});

							// 수량증가버튼
							$(".plus").click(function() {
								var num = $(".numBox").val();
								var plusNum = Number(num) + 1;
								$(".numBox").val(plusNum);
							});

							// 수량감소버튼
							$(".minus").click(function() {
								var num = $(".numBox").val();
								var minusNum = Number(num) - 1;

								if (minusNum <= 0) {
									$(".numBox").val(num);
								} else {
									$(".numBox").val(minusNum);
								}
							});

							// 주문페이지 이동
							$("#order").click(function() {
								$("form").attr("action", "/order/orderPage");
								$("form").attr("method", "get");
								$("form").submit();
							});

							// 장바구니 담기
							$("#cart").click(function(event) {
								event.preventDefault();
								
								var u_id = "${login.u_id}";
								var o_quantity = $("#o_quantity").val();

								
								$.ajax({
									type : 'post',
									url : '/order/addCart',
									data : {
										g_id : g_id,
										u_id : u_id,
										o_quantity : o_quantity
									},
									dataType : "text",
									success : function(result) {
										if (result == "INSERT_SUCCESS") {
											alert("장바구니에 추가되었습니다^^!");
										} else {
											alert("장바구니에 추가되지 않았습니다ㅠㅜ");
										}
									},
									error : function(request, status, error) {

									}
								});
							});

							goodsReadPicDbGet(g_id);

						});

				function goodsReadPicDbGet(g_id) {
					$.getJSON("/goods/goodsReadPicDbGet/" + g_id, function(result) {
						var source = $("#source").html();
						var template = Handlebars.compile(source);
						$(result).each(function() {
							var data = getFileDetail(this);
							$(".uploadedList").append(template(data));
						});
					});
				}
			</script>
</body>
</html>