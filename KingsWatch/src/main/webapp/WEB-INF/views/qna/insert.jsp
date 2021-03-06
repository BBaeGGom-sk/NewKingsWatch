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




<title>Insert title here</title>
</head>
<body>


	<div class="container">
		<div class="row">
			<form action="/qna/insert" method="post">

				<div class="form-group">
					<label for="q_title">제목</label> <input 
						class="form-control" id="q_title" name="q_title">
				</div>

				<div class="form-group">
					<label for="u_id">작성자</label> <input  class="form-control"
						id="u_id" name="u_id" value="${login.u_id}" readonly>
				</div>

				<div class="form-group">
					<label for="q_content">내용</label>
					<textarea  class="form-control" id="q_content"
						 name="q_content" rows="3"></textarea>
				</div>
				<div class="form-group">
				<hr>
					글을 비공개로 하시겠습니까? <input type="radio" name="q_lock" value="1">
					예 <input type="radio" name="q_lock" value="0" checked="checked"> 아니오
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

<li class="col-xs-3"><span> <img src="{{imgsrc}}">
				</span>
					<div>
		<a href="{{getLink}}">{{fileName}}</a> 
<a href="{{fullName}}" class="btn btn-danger btn-xs pull-right delbtn">
<span class="glyphicon glyphicon-remove"></span></a>
					</div></li>

</script>



	<script type="text/javascript">
		var source = $("#source").html();
		var template = Handlebars.compile(source);

		$(".uploadedList").on("click", ".delbtn", function(event) {
			event.preventDefault();
			var $delBtn = $(this);
			var $delLi = $(this).parent("div").parent("li");

			$.ajax({
				url : "/deletefile",
				type : "post",
				data : {
					fileName : $delBtn.attr("href")
				},
				dataType : "text",
				success : function(result) {
					$delLi.remove();
				}
			})

		});

		$(document).ready(
				function() {
					
					
					$("#q_title").click(function() {
						$("form").attr("required", "true");
					});
					
					
					

					$(".fileDrop").on("dragenter dragover", function(event) {
						event.preventDefault();
					});

					$(".fileDrop").on("drop", function(event) {
						event.preventDefault();

						var files = event.originalEvent.dataTransfer.files;
						var file = files[0]; // 파일 하나씩만 넣게 설정하기위해 0을 넣어줌?

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

					$("button[type='submit']").click(
							function(event) {
								/* 	$("form").submit(); */

								
								var q_title = $("#q_title").val();
								var u_id = $("#u_id").val();
								var q_content = $("#q_content").val();
								
								
							        if(q_title.length == 0){
							              alert("제목을 입력하세요"); 
							              $("#q_title").focus();
							              return false;
							         }
							        if(u_id.length == 0){
							              alert("아이디를 입력해 주세요"); 
							              $("#n_title").focus();
							              return false;
							         }
							        if(q_content.length == 0){
							              alert("내용을 입력해 주세요"); 
							              $("#q_content").focus();
							              return false;
							         }
								
								
								
								event.preventDefault();
								var $form = $("form");
								var str = "";

								$(".delbtn").each(
										function(index) {
											str += "<input name='files["
													+ index + "]' value='"
													+ $(this).attr("href")
													+ "' type='hidden'/>";
										});

								$form.append(str);
								$form.get(0).submit();

							});
				});
	</script>


</body>
</html>