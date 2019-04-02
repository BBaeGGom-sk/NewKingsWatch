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

</style>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
	  <div class="row">
	  		<form action="/goods/goodsUpdate" method="post">
				<div class="form-group">
					<label for="g_id">상품번호</label>
					<input required class="form-control" id="g_id" name="g_id" value="${goodsRead.g_id}">
				</div>
				<div class="form-group">
					<label for="g_brand">브랜드명</label>
					<input required class="form-control" id="g_brand" name="g_brand" value="${goodsRead.g_brand}">
				</div>
				<div class="form-group">
					<label for="g_name">상품명</label>
					<input required class="form-control" id="g_name" name="g_name" value="${goodsRead.g_name}">
				</div>
				<div class="form-group">
					<label for="g_price">상품원가</label>
					<input required class="form-control" id="g_price" name="g_price" value="${goodsRead.g_price}">
				</div>
				<div class="form-group">
					<label for="g_sale">할인율</label>
					<input required class="form-control" id="g_sale" name="g_sale" value="${goodsRead.g_sale}">
				</div>
				<div class="form-group">
					<label for="g_desc">상세설명</label>
					<input required class="form-control" id="g_desc" name="g_desc" value="${goodsRead.g_desc}">
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
						<select required class="form-control" id="g_category" name="g_category" >
							<option disabled>판매여부선택</option>
							<option value="0">미판매</option>
							<option value="1">판매종료</option>
						</select>
				</div>
			</form>
			
			<div class="form-group">
				<label>업로드할 파일을 드랍</label>
				<div class="fileDrop"></div>
			</div>
			
			<ul class="uploadedList clearfix">
			<!-- 여기에 내용은 아래의 핸들바스태그가 들어간다!! -->
			</ul>

			<div class="form-group">
				<button class="btn btn-information" type="submit">수정완료</button>
			</div>
	  </div>
	</div>
	
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
		$(document).ready(function() {
			
			var g_id = "${goodsRead.g_id}";
			
			alert(g_id);
				
			// 이벤트, 이벤트실행할id or class, function(event)
				$(".uploadedList").on("click", ".delbtn", function(event) {
					event.preventDefault();
					var $delbtn=$(this); // 변수에 $표시: 엘리먼트(=html)라는 표시
					var $delList= $(this).parent("div").parent("li"); // 부모태그를 지우면 썸네일에서 사라진다.
				
					var delOk= confirm("수정버튼과 상관 없이 파일이 즉시 삭제됩니다.\n 삭제하시겠습니까");
					
					$.ajax({
						url: "/goods/deletefile",
						type: "post",
						data: {
							fileName:$delbtn.attr("href"), // fileName에 fullname을 갖고있는 delbtn버튼의 href를 속성으로 넣어줌
							g_id:g_id
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
				
				$(".delbtn").each(function(index) { //파일이 여러개일경우 delbtn이 여러개=배열형태로 값 가져와야하니까 index값으로 불러옴
					// value: 자기자신의(=delbtn) href에있는 속성값(attr)=fullName 갖고오기
					// name: files는 배열이기때문에 index를 넣어줌. 변수를 넣어야하니까 + 로 묶어줌.
					str+="<input type='hidden' value='"+$(this).attr("href")+"' name='files["+index+"]'/>"; 
					});
					
					$form.append(str); // form태그 안에 input 태그 추가. 오로지 파일명만 있음.
					$form.get(0).submit();
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
				
				goodsReadPicDbGet(g_id);
			});
		
		function goodsReadPicDbGet(g_id) {
			$.getJSON("/goods/goodsReadPicDbGet/"+g_id, function(result) {
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