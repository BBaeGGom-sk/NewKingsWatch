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

div#container_box {
   float: right;
   width: calc(100% - 200px - 20px);
}

img {
   align-items: center;
}

table{
   align-content: center;
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

   <div class="container">
      <div class="row">

         <div class="row">
            <nav id="nav">
               <button name="goodsUpdate" id="goodsUpdate" class="btn btn-primary">수정</button>
            </nav>
         </div>


	   <form>
         <div id="container_box" class="form-group">
            <div style="float: left;">
               <ul class="uploadedList clearfix">
                     <!-- 상품이미지업로드 -->
               </ul>
            </div>
            <div style="float: left; padding-top: 5%;" class="form-group">
               <label for="g_name">이름</label>
                  <p>${goodsRead.g_name}</p>
               <label for="g_price">가격</label>
                  <p>&#8361;<fmt:formatNumber value="${goodsRead.g_price}" type="number" /></p>
               <label for="g_price">할인가격</label>
                  <p id="priceSale"></p>
               <label for="o_quantity">수량</label>
               <p>
                  <button type="button" class="plus">+</button>
                     <input name="o_quantity" id="o_quantity" type="number" class="numBox" min="1" value="1" readonly="readonly">
                   <button type="button" class="minus">-</button>
                </p>
               <label for="g_desc">설명</label>
                  <p>${goodsRead.g_desc}</p>
              <button class="form-control" id="order" name="order'">구매하기</button>
              <button class="form-control" id="cart" name="cart">카트담기</button>
            </div>
         </div>
	      <input id="g_id" name="g_id"  value="${goodsRead.g_id}" type="hidden">
	      <input id="u_id" name="u_id"  value="a" type="hidden">
   </form>
      </div>
   </div>
   
 	<!-- 스크롤버튼 -->
	<a id="TopButton" class="ScrollButton"><img src="../resources/img/top.png"></a>
	<a id="BottomButton" class="ScrollButton"><img src="../resources/img/bottom.png"></a>
	
	<a id="footer"></a>
	
   <!-- 이미지 불러오기위한 handlebars -->
   <script id="source" type="text/x-handlebars-template">
      <li class="col-xs-3 pull-left" >
         <span>
            <img src="{{imgsrc}}">
         </span>
      </li>
   </script>

   <script type="text/javascript">
      $(document).ready(function() { 
    	  
         var g_id = "${goodsRead.g_id}";
         
         var g_price= ${goodsRead.g_price};
         var g_sale= ${goodsRead.g_sale};

         salePrice();

         // 할인가격구하기
	     function salePrice() {
	         var g_persent = g_sale/100;
	         var g_salePrice= g_price-(g_price*g_persent);
	         $("#priceSale").text("₩"+g_salePrice.toLocaleString());
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
            $("form").attr("action","goodsUpdate");
            $("form").attr("method","get");
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

            if(minusNum <= 0 ) {
                $(".numBox").val(num);
            } else {
                $(".numBox").val(minusNum);          
            }
         });
         
         // 주문페이지 이동
         $("#order").click(function() {
            $("form").attr("action","/order/orderPage");
            $("form").attr("method","get");
            $("form").submit();
         });
         
         // 장바구니 담기
         $("#cart").click(function(event) {
			event.preventDefault();
			var u_id = "bbaeggom"; // 후에변경하기
			var o_quantity = $("#o_quantity").val();
						
				$.ajax({
					type : 'post',
					url : '/order/addCart',
					data: {
						g_id : g_id,
						u_id : u_id,
						o_quantity : o_quantity
					},
					dataType : "text",
					success : function(result) {
						if(result=="INSERT_SUCCESS"){
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
         $.getJSON("/goods/goodsReadPicDbGet/"+g_id, function(result) {
            var source= $("#source").html();
            var template= Handlebars.compile(source);
            $(result).each(function() {
               var data= getFileDetail(this);
               $(".uploadedList").append(template(data));
            });
         });      
      }
   </script>
</body>
</html>