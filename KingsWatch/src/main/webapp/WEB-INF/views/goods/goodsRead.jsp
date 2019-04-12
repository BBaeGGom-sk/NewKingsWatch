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
   </form>
   
      </div>
   </div>
   
   
   <div class="container">
   		<div class="row">
          <button id="reply" class="btn btn-primary">댓글</button>
			<div id="myCollapsible" class="collapse">
				<div class="form-group">
					<label for="u_id">작성자</label> <input class="form-control"
						id="u_id">
				</div>
				
				<div class="form-group">
					<label for="r_title">제목</label> <input class="form-control"
						id="r_title">
				</div>


				<div class="form-group">
					<label for="r_content">내용</label> <input class="form-control"
						id="r_content">
				</div>
				<div class="form-group">
					<label for="r_rating">평점 ★ (1에서 5점까지) </label>
					<input type="radio" name="r_rating" value="1">&nbsp;1&nbsp;
					<input type="radio" name="r_rating" value="2">&nbsp;2&nbsp;
					<input type="radio" name="r_rating" value="3">&nbsp;3&nbsp;
					<input type="radio" name="r_rating" value="4">&nbsp;4&nbsp;
					<input type="radio" name="r_rating" value="5">&nbsp;5&nbsp; 

				</div>
				<div class="form-group">
					<button id="replyInsertBtn" class="btn btn-success">등록</button>
					<button id="replyResetBtn" class="btn btn-default">초기화</button>
				</div>
				
				</div>
				</div>
   
   
   	<div class="row">
		<div id="myModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-header">
					<button data-dismiss="modal" class="close">&times;</button>
					<p id="modal_r_bno"></p>
				</div>
				<div class="modal-body">
					<strong>제목</strong> : <input id="modal_r_title" class="form-control">
					<strong>내용 </strong>: <input id="modal_r_content" class="form-control">
					<strong>평점 </strong>: <input type="radio" value="1" name="modal_r_rating" >1
					<input type="radio" value="2" name="modal_r_rating" >2
					<input type="radio" value="3" name="modal_r_rating" >3
					<input type="radio" value="4" name="modal_r_rating" >4
					<input type="radio" value="5" name="modal_r_rating" >5
				</div>
<!-- 				<div class="modal-footer">
					<button id="modal_update" data-dismiss="modal" class="btn btn-xs">수정</button>
					<button id="modal_delete" data-dismiss="modal" class="btn btn-xs">삭제</button>
					<button id="modal_close" data-dismiss="modal" class="btn btn-xs">닫기</button>
				</div> -->
			</div>
		</div>
	</div>
   
   		<div class="row" id="review"></div>
		<div class="row">
			<ul class="pagination"></ul>
		</div>
   </div>
   
   
 	<!-- 스크롤버튼 -->
	<a id="TopButton" class="ScrollButton"><img src="../resources/img/top.png"></a>
	<a id="BottomButton" class="ScrollButton"><img src="../resources/img/bottom.png"></a>
	
	<a id="footer"></a>
	
	<!--  리뷰 불러오기위한 handlebars -->
		<script id="sourceReview" type="text/x-handlebars-template">
{{#each.}}
	<div class="panel panel-info">
			
			<div class="panel-heading">
			<span> <strong>제목 :{{r_title}} </strong> <br>   <strong>작성자</strong>: {{u_id}} <strong>평점 </strong>:{{r_rating}}</span>
			<span class="pull-right">{{updateDate}}</span>
			</div>
			
			<div class="panel-body">
			<p>{{r_content}}</p>
			</div>
		</div>

{{/each}}
</script>
	
	
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
    	  
    	 var page = 1;
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
         
         
         $("#review").on("click", ".callModal", function() {

				var r_bno = $(this).attr("data-r_bno");
				var r_title = $(this).attr("data-r_title");
				var r_content = $(this).attr("data-r_content");
				var r_rating = $(this).attr("data-r_rating");

				$("#modal_r_bno").text(r_bno);
				$("#modal_r_content").val(r_content);
				$("#modal_r_title").val(r_title);
				$("#modal_r_content").val(r_content);
				$("input:radio[name='modal_r_rating']:checked").val(r_rating);
				
				$("#myModal").modal("show");
			});
         
         
         $("#reply").click(function() {
				$("#myCollapsible").collapse("toggle");
			});

			$("#replyInsertBtn").click(
					function() {
						var u_id = $("#u_id").val();
						var r_title = $("#r_title").val();
						var r_content = $("#r_content").val();
						var r_rating = $("input:radio[name='r_rating']:checked").val();
						
						
						$.ajax({
							type : 'post',
							url : '/review',
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST"
							},
							data : JSON.stringify({
								u_id : u_id,
								r_title : r_title,
								r_content : r_content,
								r_rating : r_rating,
								g_id : g_id
							}),
							dataType : "text",
							success : function(result) {
								$("#u_id").val("");
								$("#r_title").val("");
								$("#r_content").val("");
								$("#myCollapsible").collapse("toggle");
								getList(g_id, page);

							},
							error : function(request, status, error) {
								alert("code:" + request.status + "\n"
										+ "msg:" + request.responseText
										+ "\n" + "error:" + error);
							},
							complete : function() {

							}
						});

					});
         
			$(".pagination").on("click", "li a", function(event) {
				event.preventDefault();
				page = $(this).attr("href");
				getList(g_id, page);
			});

         
         

         goodsReadPicDbGet(g_id);
			getList(g_id, page);
         
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
     
			
     function printPaging(pm) {
				var str = "";
				if (pm.cri.page > 1) {
					str += "<li><a href='" + (pm.cri.page - 1)
							+ "'>&laquo;</a></li>";
				}
				for (var i = pm.beginPageNum; i <= pm.stopPageNum; i++) {
					var strClass = pm.cri.page == i ? 'active' : '';
					str += "<li class='"+strClass+"'><a href='"+i+"'>" + i
							+ "</a></li>";
				}
				if (pm.cri.page < pm.totalPage) {
					str += "<li><a href='" + (pm.cri.page + 1)
							+ "'>&raquo;</a></li>";
				}
				$(".pagination").html(str);

			}

			
     function getList(g_id, page) {
				$.getJSON("/review/" + g_id + "/" + page, function(data) {
					var source = $("#sourceReview").html();
					var template = Handlebars.compile(source);
					var gab = data.list;

					$("#review").html(template(gab));
					printPaging(data.pm);

				});
			}
     
     
   </script>
</body>
</html>