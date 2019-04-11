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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="../../resources/js/upload.js"></script>
<style type="text/css">
</style>

<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="titleArea">
				<h2>쇼핑 카트다 이자식아</h2>
			</div>
			<p class="">장바구니에 담긴 상품은 30일 동안 보관됩니다.</p>
				<table border="1" summary="" class="xans-element- xans-order xans-order-normnormal boardList xans-record-">
					<caption>기본배송</caption>
					<thead>
						<tr>
							<th scope="col" class="chk"><input type="checkbox" id="allClick"/></th>
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
					<tbody>
						<c:forEach items="${map.goodsList}" var="goods" varStatus="goodsNum">
							<input type="hidden" value="${goodsNum.end }" class="endNum">
							<input type="hidden" value="${goods.g_id }" name="g_id">
							<tr class="xans-record-">
								<!-- 체크박스 부분 -->
								<td><input type="checkbox" id="chk_${goodsNum.index }" value="${goods.g_id }"
									name="chk" class="chk" /></td>
								<!-- 썸네일 부분 -->
								<td class="thumb"><ul id="${goodsNum.index}"  class="uploadedList clearfix"></ul></td>
								<!-- 상품 정보 부분 -->
								<td class="product"><a href=""><strong>${goods.g_name}</strong>
								</a>
									<ul
										class="xans-element- xans-order xans-order-optionall option">
										<li class="xans-record-"><strong>${goods.g_name}</strong></li>
									</ul></td>
								<!-- 판매가 부분 -->
								<td class="price">
									<div class="">
										<fmt:parseNumber var="price"
											value="${goods.g_price-goods.g_price*(goods.g_sale/100) }"
											integerOnly="true" />
										<strong>&#8361;${price}</strong>
									</div>
								</td>
								<!-- 상품 수량 부분 -->
								<td><input id="quantity_${goodsNum.index }" name="o_quantity" size="2"
									value="${map.quantityList[goodsNum.index] }" type="number" />
									<a href="" onclick="changeQuantity('${goodsNum.index }')">
										<img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_modify.gif"
										alt="변경" />
								</a></td>
								<!-- 적립금 부분 -->
								<td class="mileage"><input id='' name='' value=''
									type="hidden"> <img
									src="//img.echosting.cafe24.com/design/common/icon_cash.gif" />
									(여기에 적립금x수량 넣기)</td>
								<!--  배송 구분 부분 -->
								<td class="delivery">기본배송</td>
								<!-- 배송비 부분 -->
								<td>무료</td>
								<!-- 합계 부분 -->
								<td><strong>&#8361;<span
										class="total_${goodsNum.index }">${price*map.quantityList[goodsNum.index]}</span></strong></td>
								<!-- 주문 선택 부분 -->
								<td class="button"><a onclick="cartToOrder('${goodsNum.index}')" >
										<img src="../../../resources/img/btnorder.jpg" alt="주문하기" />
								</a><br> <a href="" onclick="cartDelete('${goodsNum.index}')"> 
										<img src="../../../resources/img/btndelete.jpg" alt="삭제" />
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="10"><strong class="type">[기본배송]</strong> 상품구매금액
								<strong>&#8361;<span id="cartTotal"></span></strong> + 배송비 (무료)
								= 합계 : <strong class="total">&#8361;<span id="allTotal"></span></strong></td>
						</tr>
					</tfoot>
				</table>
				<form id="form"><!-- 이곳에 원하는 input 데이터를 동적으로 넣어 전송 --></form>
				<!-- 선택상품 제어 버튼 -->
				<div class="xans-element- xans-order xans-order-selectorder ">
					<span class="left"> <span class="ctrlTxt"
						style="color: #757575;">선택상품을</span> 
						<a href="#none" id="cartSelectDelete" style="color: #757575;">DELETE</a> / 
						<a href="#none" id="cartAllDelete" style="color: #757575;">EMPTY SHOPPING CART !</a>
					</span>
				</div>
				<!-- 총 주문금액 : 국내배송상품 -->
				<div class="xans-element- xans-order xans-order-totalsummary  ">
					<table border="1" summary="">
						<caption>총 주문금액</caption>
						<thead>
							<tr>
								<th scope="col"><span>총 상품금액</span> <th scope="col">총 배송비</th>
							<th scope="col">결제예정금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="price">
								<div class="box">
									<strong><span id="pageTotal"></span></strong>
								</div>
							</td>
							<td class="option">
								<div class="box">
									<strong>+</strong><strong>0</strong>
								</div>
							</td>
							<td class="total">
								<div class="box">
									<strong>=</strong><strong><span id="payment"></span></strong>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				</div><br>
			<!-- 주문 버튼 -->
			<div class="xans-element- xans-order xans-order-totalorder">
				<a href="#none" onclick="allOrder()" class="">
					<img src="../../../resources/img/allorder.jpg" alt="전체상품주문" />
				</a>
				<a href="#none" onclick="selectOrder()" class="">
					<img src="../../../resources/img/selectorder.jpg" alt="선택상품주문" />
				</a>
				<a href="/goods/goodsList" style="margin-left: 3px;">
					<img src="../../../resources/img/goshopping.jpg" alt="쇼핑계속하기" />
				</a>
			</div>
		</div>
	<!-- 이미지 불러오기위한 handlebars -->
	<script id="source" type="text/x-handlebars-template">
		<li class="col-xs-3 pull-left" >
			<span>
				<img src="{{imgsrc}}" class="fadding-photo">
			</span>
		</li>
	</script>
	
<script type="text/javascript">

$(document).ready(function() {
	
	// 불러온 g_id값 저장변수
	var arr="";
	
	// 반복문사용
	// # : 구분자
	<c:forEach items="${map.goodsList}" var="pic">
		arr=arr+"#"+"${pic.g_id}";			
	</c:forEach>
	
	goodsPicDbGet(arr);

		function goodsPicDbGet(arr) {
			var source= $("#source").html();
			var template= Handlebars.compile(source);

			// #을 자른다
			arr=arr.substring(1);
			arr=arr.split("#");
			$.each(arr, function(index) {
				$.getJSON("/order/goodsPicDbGet/"+this, function(result) {
						var data= getFileInfo(result["fullName"]);
						$("#"+index).append(template(data));
				});		
			});
		}
	
	// 장바구니에 담긴 상품 갯수
	var endNum = ${map.goodsList.size()};
	// total 초기화
	var total = 0;
	// 각 상품x수량 한 값의 합을 total에 넣어줌 
	for (var i = 0; i < endNum; i++) {
		var sum = parseInt($('.total_' + i).html());
		total = total + sum;
	}
	// 총 합계가 들어가야할 공간에 넣어줌
	document.getElementById("allTotal").innerHTML = total;
	document.getElementById("cartTotal").innerHTML = total;
	document.getElementById("pageTotal").innerHTML = total;
	document.getElementById("payment").innerHTML = total;
});


// 수량 변경 버튼 클릭시 DB상에 수량 정보 수정
function changeQuantity(index) {
	var b_quantity = document.getElementById("quantity_" + index).value;
	var u_id = "bbaeggom"; // 후에 변경하기 (로그인 세션 등으로 정보 받아오기)
	var g_id = document.getElementsByName("g_id")[index].value;

	$.ajax({
		type : 'post',
		url : '/order/changeQuantity',
		data : {
			g_id : g_id,
			u_id : u_id,
			b_quantity : b_quantity
		},
		dataType : "text",
		success : function(result) {
			alert("수량이 변경되었습니다.");
		},
		error : function(request, status, error) {
		}
	});
};

// 최상단 체크박스 클릭시 모든 체크박스 체크/해제
$("#allClick").on("click",function() {
	//클릭되었으면
	if ($("#allClick").prop("checked")) {
		//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
		$("input[class=chk]").prop("checked", true);
	//클릭이 안되있으면
	} else {
		//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
		$("input[class=chk]").prop("checked", false);
	};
	
}); 

// 장바구니에서 모든 상품 가지고 주문페이지로 넘어가기(allOrder버튼)
function allOrder() {
	var u_id = "bbaeggom"; // 후에 변경하기
	var g_idArr = new Array();
	var o_quantityArr = new Array(); 
	
	//모든 g_id 배열로 받아주기
	$("input:hidden[name=g_id]").each(function() {
		g_idArr.push($(this).val());
	});
	
	//모든 수량 배열로 받아주기
	$("input[name=o_quantity]").each(function() {
		o_quantityArr.push($(this).val());
	});
	
	//데이터 전송용 form에 u_id,g_id,o_quantity를 담아줄 input생성과 값넣어주기
 	$("#form").append("<input type='hidden' class='formUid' name='u_id'/>");
 	$(".formUid").val(u_id);
 	
 	for (var i = 0; i < g_idArr.length; i++) {
	 	$("#form").append("<input type='hidden' class='formGid_"+i+"' name='g_idArr'/>");
 		$(".formGid_"+i).val(g_idArr[i]);
 		
 		$("#form").append("<input type='hidden' class='formQuantity_"+i+"' name='o_quantityArr'/>");
 		$(".formQuantity_"+i).val(o_quantityArr[i]);
	}
 	
 	//input이 생성된 전송용 form을 전!송!
 	$("#form").attr("action","/order/cartOrderPage");
	$("#form").attr("method","post");
	$("#form").submit();
};

// 장바구니에서 체크한 상품(들) 가지고 주문페이지로 넘어가기(selectOrder버튼)
function selectOrder() {
	// 선택삭제를 위한 배열 선언
	var g_idArr = new Array();
	var chk = $("input:checkbox[name=chk]");
	var checked = $("input:checkbox[name=chk]:checked");
	var u_id = "bbaeggom"; // 후에 변경하기
	var o_quantityArr = new Array();
	
	// 선택된 g_id 배열로 받아주기 선택된 상품 수량 배열로 받아주기
	$("input:checkbox[name=chk]").each(function(idx) {
		if ($(this).is(":checked")) {
		g_idArr.push($(this).val());
		o_quantityArr.push($("#quantity_"+idx).val());
		}
	});
	
	//데이터 전송용 form에 u_id,g_id,o_quantity를 담아줄 input생성과 값넣어주기
 	$("#form").append("<input type='hidden' class='formUid' name='u_id'/>");
 	$(".formUid").val(u_id);
 	
 	for (var i = 0; i < g_idArr.length; i++) {
	 	$("#form").append("<input type='hidden' class='formGid_"+i+"' name='g_idArr'/>");
 		$(".formGid_"+i).val(g_idArr[i]);
 		
 		$("#form").append("<input type='hidden' class='formQuantity_"+i+"' name='o_quantityArr'/>");
 		$(".formQuantity_"+i).val(o_quantityArr[i]);
	}
 	
 	//input이 생성된 전송용 form을 전!송!
 	$("#form").attr("action","/order/cartOrderPage");
	$("#form").attr("method","post");
	$("#form").submit();
	
};

// 장바구니에서 선택한 상품 1개만 가지고 주문페이지로 넘어가기(주문하기 버튼)
function cartToOrder(index) {
	
	var g_idArr = new Array();
	var u_id = "bbaeggom"; // 후에 변경하기
	
	//모든 g_id 배열로 받아주기
	$("input:hidden[name=g_id]").each(function() {
		g_idArr.push($(this).val());
	});
	
	//g_id 배열중에 index 번호를 통해 원하는 g_id와 수량만 가져오기
	var g_id = g_idArr[index];
	var o_quantity = $("#quantity_"+index).val();
	
	//데이터 전송용 form에 u_id,g_id,o_quantity를 담아줄 input생성과 값넣어주기
 	$("#form").append("<input type='hidden' id='formUid' name='u_id'/>");
 	$("#formUid").val(u_id);
 	
 	$("#form").append("<input type='hidden' id='formGid' name='g_id'/>");
 	$("#formGid").val(g_id);
 	
 	$("#form").append("<input type='hidden' id='formQuantity' name='o_quantity'/>");
 	$("#formQuantity").val(o_quantity);
 	
 	//input이 생성된 전송용 form을 전!송!
 	$("#form").attr("action","/order/orderPage");
	$("#form").attr("method","get");
	$("#form").submit();
	
};


// 장바구니에서 선택한 상품 1개 장바구니에서 삭제하기
function cartDelete(index) {
	
	var g_idArr = new Array();
	var u_id = "bbaeggom"; // 후에 변경하기
	
	$("input:hidden[name=g_id]").each(function() {
		g_idArr.push($(this).val());
	});
	
	var g_id = g_idArr[index];
	
	$.ajax({
		type : 'post',
		url : '/order/deleteBtnCart',
		traditional : true,
		data : {
			g_id : g_id,
			u_id : u_id
		},
		dataType : "text",
		success : function(result) {
			alert("선택한 상품이 장바구니에서 삭제되었습니다.");
		},
		error : function(request, status, error) {
		}
	});
	
};

// 장바구니에서 체크된 상품 장바구니에서 삭제하기
$("#cartSelectDelete").on("click",function() {
	// 선택삭제를 위한 배열 선언
	var g_idArr = new Array();
	var chk = $("input:checkbox[name=chk]");
	var checked = $("input:checkbox[name=chk]:checked");
	var u_id = "bbaeggom"; // 후에 변경하기
	
	$("input:checkbox[name=chk]:checked").each(function() {
		g_idArr.push($(this).val());
	});
	
	$.ajax({
		type : 'post',
		url : '/order/deleteCart',
		traditional : true,
		data : {
			g_idArr : g_idArr,
			u_id : u_id
		},
		dataType : "text",
		success : function(result) {
			alert("선택한 상품이 장바구니에서 삭제되었습니다.");
		},
		error : function(request, status, error) {
		}
	});
	
	$(".container").load("/order/cartOrder");
	
});

// 장바구니에 모든 상품 삭제하기
$("#cartAllDelete").on("click",function() {
	
	var u_id = "bbaeggom"; // 후에 변경하기
	
	$.ajax({
		type : 'post',
		url : '/order/cartAllDelete',
		data : {
			u_id : u_id
		},
		dataType : "text",
		success : function(result) {
			alert("모든 상품이 장바구니에서 삭제되었습니다.");
		},
		error : function(request, status, error) {
		}
	});
	
	$(".cartList").remove();
	
});

</script>

</body>
</html>