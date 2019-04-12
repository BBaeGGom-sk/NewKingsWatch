<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



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

<script src="../../resources/js/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<style type="text/css">
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategray;
	margin: auto;
}

.uploadedList li {
	list-style-type: none;
}
</style>




<title>공지사항 게시판입니다.</title>
</head>
<body>


	<div class="container">
		<div class="row">
			<form action="/notice/insert" method="post">

				<div class="form-group">
					<label for="n_title">제목</label> <input required class="form-control"
						id="n_title" name="n_title">
				</div>

				<div class="form-group">
					<label for="u_id">작성자</label> <input required
						class="u_id" id="u_id" name="u_id">
				</div>

				<div class="form-group">
					<label for="n_content">내용</label>
					<textarea required class="form-control" id="n_content" name="n_content"
						rows="3"></textarea>
				</div>
				<div class="form-group">
				<hr>
					본 글을 최상단에 올리시겠습니까? <input type="radio" name="n_topMost" value="1">
					예 <input type="radio" name="n_topMost" value="0" checked="checked"> 아니오
					<hr>
				</div>
			</form>

			<div class="form-group">
				<label>업로드한 파일을 드랍시키세요.</label>
				<div class="fileDrop"></div>
			</div>

			<ul class="uploadedList clearfix">

			</ul>




			<div class="form-group">
				<button class="btn" type="submit">등록</button>
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
				<a href="{{fullName}}" class="btn btn-danger btn-xs pull-right delbtn"><span class="glyphicon glyphicon-remove"></span></a>
			</div>
		</li>
	</script>



	<script type="text/javascript">
		var source = $("#source").html();
		var template = Handlebars.compile(source);

		$(".uploadedList").on("click", ".delbtn", function(event){
			event.preventDefault();
			var $delBtn = $(this);
			var $delLi = $(this).parent("div").parent("li");
           
			$.ajax({
				url: "/deletefile",
				type:"post",
				data:{
					fileName:$delBtn.attr("href")
				},
				dataType:"text",
				success:function(result){
                     $delLi.remove();
				}
			})
			
		});
		
	
		
		
		$(document).ready(function() {

			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
			});

			$(".fileDrop").on("drop", function(event) {
				event.preventDefault();

				var files = event.originalEvent.dataTransfer.files;
				var file = files[0]; 

				var formData = new FormData();
				formData.append("file", file);
					
				$.ajax({
					url : "/uploadAjax",
					type : "post",
					data : formData,
					dataType : "text",
					processData : false,
					contentType : false,
					success : function(data) {
						var result = getFileInfo(data);
						$(".uploadedList").append(template(result));

					}
				});
			});

			$("button[type='submit']").click(function(event) {
			/* 	$("form").submit(); */
			
			event.preventDefault();
			var $form=$("form");
			var str = "";
			
			$(".delbtn").each(function(index){
				str+="<input name='files["+index+"]' value='"+$(this).attr("href")+"' type='hidden'/>";
			});
			
			alert(str);
			
			$form.append(str);
			$form.get(0).submit();
			
			
			});
		});
	</script>


</body>
</html>