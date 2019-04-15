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
<script src="../../resources/js/upload.js"></script> <!-- upload 경로(path)!! -->
<style type="text/css">
	.fileDrop {
		width: 100%;
		height: 100px;
		border: 1px dotted red;
		background-color: lightslategray;
		margin: auto;
	}
	
	.uploadedList li{
		list-style-type: none;	
	}
	.fileDrop2 {
		width: 100%;
		height: 100px;
		border: 1px dotted red;
		background-color: lightslategray;
		margin: auto;
	}
	
	.uploadedList2 li{
		list-style-type: none;	
	}
</style>
<title>Insert title here</title>
</head>
<body>

${already};

	<div class="container">
	  <div class="row">
	  		<form action="/goods/goodsInsert" method="post">
				<div class="form-group">
					<label for="g_id">상품번호</label>
					<input required class="form-control" id="g_id" name="g_id" placeholder="상품아이디 입력 후 꼭 상품확인 버튼을 눌러주세요">
					<button id="already">상품확인</button>
				</div>
				<div class="form-group">
					<label for="g_brand">브랜드명</label>
					<input required class="form-control" id="g_brand" name="g_brand">
				</div>
				<div class="form-group">
					<label for="g_name">상품명</label>
					<input required class="form-control" id="g_name" name="g_name">
				</div>
				<div class="form-group">
					<label for="g_price">상품원가</label>
					<input required class="form-control" id="g_price" name="g_price">
				</div>
				<div class="form-group">
					<label for="g_sale">할인율</label>
					<input required class="form-control" id="g_sale" name="g_sale" placeholder="숫자만 넣어주세요. ex)50% -> 50 / 할인상품 아닐시 0">
				</div>
				<div class="form-group">
					<label for="g_desc">상세설명</label>
					<input required class="form-control" id="g_desc" name="g_desc">
				</div>
				<div class="form-group">
					<label for="g_category">카테고리</label>
					<select required class="form-control" id="g_category" name="g_category" >
						<option disabled>카테고리선택</option>
						<option value="0">공용</option>
						<option value="1">여성</option>
						<option value="2">남성</option>
					</select>
				</div>
				<div class="form-group">
					<label for="g_is_selling">판매여부</label>
					<select required class="form-control" id="g_is_selling" name="g_is_selling" >
							<option disabled>판매여부선택</option>
							<option id="yes_selling" value="0" selected="selected">판매</option>
							<option id="no_selling" value="1">판매종료</option>
						</select>
				</div>
			</form>

			<div class="form-group">
				<label>업로드할  파일을 드랍</label>
				<div class="fileDrop"></div>
			</div>
			
			<ul class="uploadedList clearfix">
			<!-- 여기에 내용은 아래의 핸들바스태그(72번째줄)가 들어간다!! -->
			</ul>

			<div class="form-group">
				<button class="btn btn-information" type="submit">등록</button>
			</div>
	  </div>
	</div>

	<!-- 기존업로드핸들바스 -->	
	<script id="source" type="text/x-handlebars-template">
		<li class="col-xs-3"> 
			<span>
				<img src="{{imgsrc}}">
			</span>
			<div>
				<a href="{{getLink}}">{{fileName}}</a>
				<a class="btn btn-danger btn-xs pull-right delbtn" href="{{fullName}}"><span class="glyphicon glyphicon-remove"></span></a>
			</div>
		</li>
	</script>

	<script type="text/javascript">	
		var source= $("#source").html();
		var template= Handlebars.compile(source);

		$(document).ready(function() {

			// 이벤트, 이벤트실행할id or class, function(event)
				$(".uploadedList").on("click", ".delbtn", function(event) {
					event.preventDefault();
					var $delbtn=$(this); // 변수에 $표시: 엘리먼트(=html)라는 표시
					var $delList= $(this).parent("div").parent("li"); // 부모태그를 지우면 썸네일에서 사라진다.
				
					$.ajax({
						url: "/deletefile",
						type: "post",
						data: {
							fileName:$delbtn.attr("href") // fileName에 fullname을 갖고있는 delbtn버튼의 href를 속성으로 넣어줌 
						},
						dataType: "text",
						success: function(result){
						$delList.remove(); // 삭제하고 썸네일에서 지우기. 위에 만들어놓은 delList의 값들 remove
						}
					});
				
				});
							
				$("button[type='submit']").click(function (event){
					event.preventDefault();
					var $form=$("form");
					var str=""; // DB에 들어갈 파일명.
					
					// 빈칸감지
		            var g_id = $("#g_id").val();
		            var g_brand = $("#g_brand").val();
		            var g_name = $("#g_name").val();
		            var g_price = $("#g_price").val();
		            var g_sale = $("#g_sale").val();
		            var g_desc = $("#g_desc").val();

				$(".delbtn").each(function(index) { //파일이 여러개일경우 delbtn이 여러개=배열형태로 값 가져와야하니까 index값으로 불러옴
					// value: 자기자신의(=delbtn) href에있는 속성값(attr)=fullName 갖고오기
					// name: files는 배열이기때문에 index를 넣어줌. 변수를 넣어야하니까 + 로 묶어줌.
					str+="<input type='hidden' value='"+$(this).attr("href")+"' name='files["+index+"]'/>"; 
					});
				
			         if(g_id.length == 0){
			              alert("상품아이디를 입력해 주세요"); 
			              $("#g_id").focus();
			              return false;
			         }
				
			         if(g_brand.length == 0){
			              alert("브랜드를 입력해 주세요"); 
			              $("#g_brand").focus();
			              return false;
			         }
				
			         if(g_name.length == 0){
			              alert("상품명을 입력해 주세요"); 
			              $("#g_name").focus();
			              return false;
			         }
				
			         if(g_price.length == 0){
			              alert("상품 가격을 입력해 주세요"); 
			              $("#g_price").focus();
			              return false;
			         }
				
			         if(g_sale.length == 0){
			              alert("할인율을 입력해 주세요"); 
			              $("#g_sale").focus();
			              return false;
			         }
				
			         if(g_desc.length == 0){
			              alert("상품 상세설명을 입력해 주세요"); 
			              $("#g_desc").focus();
			              return false;
			         }
			       
					$form.append(str); // form태그 안에 input 태그 추가. 오로지 파일명만 있음.
					$form.get(0).submit();
				});
				
				// 상품아이디 이미 있는지 여부 확인
				$("#already").click(function(event) {
					event.preventDefault();
				
					var g_id = $("#g_id").val();
					
					if($("#g_id").val()==""){
						alert("상품 아이디를 입력해주세요");
						return false;
					}

					$.ajax({
						type : 'post',
						url : '/goods/already',
						data: {
							g_id : g_id,
						},
						dataType : "text",
						success : function(result) {
							if(result=="already"){
								alert("이미 있는 상품입니다.");									
							} else if(result=="newGoods") {
								alert("새로운 상품입니다.");
							}
						},
						error : function(request, status, error) {
						}
					});
				});
				 
				
				$(".fileDrop").on("dragenter dragover", function(event) {
					event.preventDefault();
				});
				
				$(".fileDrop").on("drop", function(event) {
					event.preventDefault();
					var files= event.originalEvent.dataTransfer.files;
					var file=files[0];
					
					var formData= new FormData();
					formData.append("file", file);
					
					$.ajax({
						url:"/uploadAjax",
						type:"post",
						data:formData,
						dataType:"text",
						processData:false,
						contentType:false,
						success:function(data){
						var result= getFileInfo(data);
						$(".uploadedList").append(template(result));
						}
					});
				});
				
			});
	</script>
</body>
</html>