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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="../../resources/js/upload.js"></script>
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
			<form action="/qna/update" method="post">

				<div class="form-group">
					 <input readonly class="form-control"
						id="q_bno" name="q_bno" value="${vo.q_bno}" type="hidden">
				</div>



				<div class="form-group">
					<label for="q_title">제목</label> <input required class="form-control"
						id="q_title" name="q_title" value="${vo.q_title}">
				</div>

				<div class="form-group">
					<label for="u_id">작성자</label> <input required
						class="form-control" id="u_id" name="u_id"
						value="${vo.u_id}">
				</div>

				<div class="form-group">
					<label for="q_content">내용</label>
					<textarea required class="form-control" id="q_content" name="q_content"
						rows="3">${vo.q_content}</textarea>
				</div>
				<div class="form-group">
				<hr>
					글을 비공개로 하시겠습니까? <input type="radio" name="q_lock" value="1">
					예 <input type="radio" name="q_lock" value="0" checked="checked"> 아니오
					<hr>
				</div>
				
				
				<input value="${cri.page}" name="page" type="hidden"> <input
					value="${cri.perPage}" name="perpage" type="hidden"> 
					<input value="${cri.keyword}" name="keyword" type="hidden"> <input
					value="${cri.searchType}" name="searchType" type="hidden">
			</form>
			
			
			<div class="form-group">
				<label>업로드한 파일을 드랍시키세요.</label>
				<div class="fileDrop"></div>
			</div>

			<ul class="uploadedList clearfix">

			</ul>
			

			<div class="form-group">
				<button class="btn" type="submit">수정</button>
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
	var q_bno = "${vo.q_bno}";
	
	var source = $("#source").html();
	var template = Handlebars.compile(source);
	
	
	
	
	
		$(document).ready(function() {
	
			
			$(".uploadedList").on("click", ".delbtn", function(event){
				event.preventDefault();
				var $delBtn = $(this);
				var $delLi = $(this).parent("div").parent("li");
	           
				var delok=confirm("수정 버튼과 상관없이 파일이 즉시 삭제됩니다.\n 삭제하시겠습니까?");
				
				if(delok){
				$.ajax({
					url: "/qna/deletefile",
					type:"post",
					data:{
						fileName:$delBtn.attr("href"), 
						q_bno:q_bno
						/* bno 추가시킴 */
					},
					dataType:"text",
					success:function(result){
	                  $delLi.remove();
					}
				})
				}
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
			
			
			$("button[type='submit']").click(function(event) {
				/* $("form").submit(); */
				
				var $form = $("form");
				var str = "";
				
				
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
				
				
				$(".delbtn").each(function(index){
					str+="<input name='files["+index+"]' value='"+$(this).attr("href")+"' type='hidden'/>";
				});
				
				
				$form.append(str).attr("action","supdate").attr("method","post");
				$form.get(0).submit();
			});
			
			getAllAttach(q_bno);
			//글에서 첨부파일 불러오기위해 겟올어태치 함수호출
			
		});
		
		
		function getAllAttach(q_bno){
			$.getJSON("/qna/getAttach/"+q_bno, function(result){
				var source = $("#source").html();
				/* 리드에서 가져온 겟올어태치에서 소스어태치에서 소스로 바꿈 */
              var template = Handlebars.compile(source);
              
              $(result).each(function(){
            	 var data = getFileInfo(this);
            	 $(".uploadedList").append(template(data)); 
              });
              
			})
		}
		
	</script>


</body>
</html>