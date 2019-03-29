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
<script src="../../resources/js/upload.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
	  <div class="row">
	  
	  <div class="row">
		<a class="btn btn-info" href="/goods/goodsInsert">상품올리기</a>
	  </div>
	 
	  <div class="form-group">
	  	<label for="goodsList">리스트입니다.</label>
	  </div>
	  
	  <div>
	  	<div>
	  		<ul>
				<li id="anchorBoxId_2238" class="xans-record-">
            		<div class="thumbnail">
                		<a href="/product/1차수량-진행중신상포함특별기획-이벤트봄-아우터-한방에-끝내기-아우터-골라골라-2개에-69900원/2238/category/73/display/1/" name="anchorBoxName_2238" class=" _evt_tracker0"><img src="//www.maysome.com/web/product/medium/201903/d7143e38f54f534986f84bae92bc8264.jpg" onmouseover="this.src='//www.maysome.com/web/product/big/201903/66f5df97d4233e07d0503f0c96622f0e.jpg'" onmouseout="this.src='//www.maysome.com/web/product/medium/201903/d7143e38f54f534986f84bae92bc8264.jpg'" id="eListPrdImage2238_1" alt="1차수량 진행중[★신상포함★특별기획 이벤트]봄 아우터 한방에 끝내기, 아우터 골라골라 2개에 69,900원!"></a>
               			<span class="wish"><img src="/web/upload/icon_201707141622586000.png" class="icon_img ec-product-listwishicon" alt="관심상품 등록 전" productno="2238" categoryno="73" icon_status="off" login_status="T" individual-set="F"></span>
           			 </div>
           			<div class="description">
                		<strong class="name"><a href="/product/1차수량-진행중신상포함특별기획-이벤트봄-아우터-한방에-끝내기-아우터-골라골라-2개에-69900원/2238/category/73/display/1/" class=" _evt_tracker0"><span class="title displaynone"><span style="font-size:12px;color:#555555;font-weight:bold;">상품명</span> :</span> <span style="font-size:12px;color:#555555;font-weight:bold;"><font color="#ff0000">1차수량 진행중<br>[★신상포함★특별기획 이벤트]</font><br>봄 아우터 한방에 끝내기, 아우터 골라골라 2개에 69,900원!</span></a></strong>
                		<ul class="xans-element- xans-product xans-product-listitem spec"><li class=" xans-record-">
							<strong class="title displaynone"><span style="font-size:11px;color:#ff0000;">판매가</span> :</strong> <span style="font-size:11px;color:#ff0000;">69,900원</span><span id="span_product_tax_type_text" style=""> </span></li>
						</ul>
						<div class="crema-product-reviews-count" data-product-code="2238" data-format="Review : {{{count}}}" style="float: right; font-size: 11px; color: #ad0909; margin-top: -10px;">Review : 1,617</div>
                 			<div class="icon"> 
                    			<div class="promotion">
                    			</div>
                			</div>
            		</div>
        		</li>
	  			
	  		</ul>
	  	</div>
	  
	  </div>
	  
	  <div class="form-group">
	      <label for="goodsPicDbGet">첨부파일</label>
	         	<ul class="uploadedList clearfix">

	           	</ul>
       </div>
	  
	  </div>
	</div>
	
	<!-- 이미지 불러오기위한 handlebars -->
	<script id="source" type="text/x-handlebars-template">
		<li class="col-xs-3 pull-left" >
			<span>
				<img src="{{imgsrc}}">
			</span>
			<div>
				<a href="{{getLink}}">{{fileName}}</a>
			</div>
			</li>
	</script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			var page = 1;
			var g_id= ${goodsList[0].g_id}; // 
			
			goodsPicDbGet(g_id);
						
		});
		
		function goodsPicDbGet(g_id) {
			$.getJSON("/goods/goodsPicDbGet/"+g_id, function(result) {
				var source= $("#source").html();
				var template= Handlebars.compile(source);
				$(result).each(function() {
					var data= getFileInfo(this);
					$(".uploadedList").append(template(data));
				});
			});		
		}
	</script>
</body>
</html>