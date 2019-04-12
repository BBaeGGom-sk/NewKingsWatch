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
<script src="../../resources/js/uploaddetail.js"></script>
<style type="text/css">
.uploadedList {
	list-style: none;
	margin-bottom: 50px;
}
</style>

<title>Insert title here</title>
</head>
<body>



	<div class="container">
		<div class="row">
			<h3 align="left">${vo.n_title}</h3>
			<hr>

		</div>

		<div class="form-group">
			<label for="u_id">작성자</label>&nbsp;${vo.u_id}&nbsp;&nbsp; <label
				for="n_updateDate">작성일</label>&nbsp;&nbsp;${vo.n_updateDate}&nbsp;&nbsp;
			<label for="n_viewCnt">조회</label>&nbsp;${vo.n_viewCnt}
			<hr>
			<input class="form-control" readonly name="u_id" id="u_id"
				value=${vo.u_id } type="hidden">
			<div class="form-group"></div>
			<ul class="uploadedList clearfix"></ul>
			<div class="form-group">
				<textarea class="form-control" readonly name="n_content"
					id="n_content">${vo.n_content}</textarea>
			</div>


			<div class="form-group">
				<label>첨부파일</label>
				


				

			</div>


			<div class="form-group">
				<button id="update" class="btn btn-info">수정</button>
				<button id="delete" class="btn btn-danger">삭제</button>
				<button id="list" class="btn btn-info">목록</button>
			</div>
		</div>


	</div>


	<form>
		<input value="${vo.n_bno}" name="n_bno" type="hidden"> <input
			value="${cri.page}" name="page" type="hidden"> <input
			value="${cri.perPage}" name="perpage" type="hidden">
	</form>


	<script id="sourceAttach" type="text/x-handlebars-template">
	<li class="col-xs-3 pull-left">
       <span> 
         <a href="{{getLink}}"><img src="{{imgsrc}}"></a>
	   </span>
    </li>
</script>





	<script type="text/javascript">
		$(document).ready(
				function() {

					var n_bno = ${vo.n_bno};
					

					$("#update").click(function() {
						$("form").attr("action", "updateui");
						$("form").attr("method", "get");
						$("form").submit();
					});

					$("#delete").click(function() {
						$("form").attr("action", "delete");
						$("form").attr("method", "get");
						$("form").submit();
					});
					$("#list").click(function() {
						$("form").attr("action", "list");
						$("form").attr("method", "get");
						$("form").submit();
					});

					getAllAttach(n_bno);
					
				});

		function getAllAttach(n_bno) {
			$.getJSON("/notice/getAttach/" + n_bno, function(result) {
				var source = $("#sourceAttach").html();
				var template = Handlebars.compile(source);

				$(result).each(function() {
					var data = getFileDetail(this);
					$(".uploadedList").append(template(data));
				});

			})
		}

		
	</script>

</body>
</html>