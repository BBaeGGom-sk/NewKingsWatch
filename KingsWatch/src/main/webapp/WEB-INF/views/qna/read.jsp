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
.uploadedList{
list-style: none;
margin-bottom : 50px;
}

</style>

<title>Insert title here</title>
</head>
<body>



	<div class="container">
		<div class="row">
<h3 align="left">${vo.q_title}</h3>
<hr>
</div>
			<div class="form-group">
				<label for="u_id">작성자</label>&nbsp; ${vo.u_id}&nbsp;&nbsp;
			<label
				for="q_updateDate">작성일</label>&nbsp;&nbsp;${vo.q_updateDate}&nbsp;&nbsp;
			<label for="q_viewCnt">조회</label>&nbsp;${vo.q_viewCnt}
			<c:if test="${vo.q_lock==1}">&nbsp;<span class="glyphicon glyphicon-lock"></span></c:if>
			<hr>
			</div>
			<div class="form-group">
				<label for="q_content">내용</label>
				<textarea class="form-control" readonly name="q_content" id="q_content">${vo.q_content}</textarea>
			</div>


<div class="form-group">
<label>첨부파일</label>
<ul class="uploadedList clearfix">


</ul>
</div>







			<div class="form-group">
			<c:choose>
			<c:when test="${vo.u_id == login.u_id}">
				<button id="update" class="btn btn-warning">수정</button>
				<button id="delete" class="btn btn-danger">삭제</button>
				</c:when>
				</c:choose>
				<button id="list" class="btn btn-info">목록</button>
				<button id="reply" class="btn btn-primary">댓글</button>
			</div>
		</div>


<div class="container">
		<div class="row">
			<div id="myCollapsible" class="collapse">
				<div class="form-group">
					<label for="replyer">작성자</label> <input class="form-control"
						id="replyer" readonly value="${login.u_id}">
				</div>

				<div class="form-group">
					<label for="qr_Text">내용</label> <input class="form-control"
						id="qr_Text">
				</div>

				<div class="form-group">
					<button id="replyInsertBtn" class="btn btn-success">등록</button>
					<button id="replyResetBtn" class="btn btn-default">초기화</button>
				</div>


			</div>
		</div>


		<div class="row" id="q_replies"></div>
		<div class="row">
			<ul class="pagination"></ul>
		</div>



	<div class="row">
		<div id="myModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-header">
					<button data-dismiss="modal" class="close">&times;</button>
					<p id="modal_q_rno"></p>
				</div>
				<div class="modal-body">
					<input id="modal_qr_Text" class="form-control">
				</div>
				<div class="modal-footer">
					<button id="modal_update" data-dismiss="modal" class="btn btn-xs">수정</button>
					<button id="modal_delete" data-dismiss="modal" class="btn btn-xs">삭제</button>
					<button id="modal_close" data-dismiss="modal" class="btn btn-xs">닫기</button>
				</div>
			</div>
		</div>
	</div>



	<!-- 클래스 컨테이너 div 엔드태그 -->

	<form>
		<input value="${vo.q_bno}" name="q_bno"  type="hidden"> <input
			value="${cri.page}" name="page" type="hidden"> <input
			value="${cri.perPage}" name="perpage" type="hidden">
	</form>
	<!-- 	여러개일경우를 대비해서 이렇게 만들엇쪄 -->


<script id="sourceAttach" type="text/x-handlebars-template">
<li class="col-xs-3 pull-left">
<span>
<img src="{{imgsrc}}">
</span>
<div>
<a href="{{getLink}}">{{fileName}}</a>
</div>
</li>
</script>
<!-- 위에 a태그에 타겟빼니까 일반파일 다운로드 됨 왜??? -->

	<script id="source" type="text/x-handlebars-template">
{{#each.}}
	<div class="panel panel-info">
			
			<div class="panel-heading">
			<span> 작성자:  {{replyer}}</span>
			<span class="pull-right">{{qr_updateDate}}</span>
			</div>
			
			<div class="panel-body">
			<p>{{qr_Text}}</p>
			<button data-qr_Text="{{qr_Text}}" data-q_rno="{{q_rno}}"class="callModal btn btn-sm btn-success">수정/삭제</button>
			</div>
		</div>

{{/each}}
</script>


	<script type="text/javascript">
		$(document).ready(
				function() {

					var page = 1;
					var q_bno = ${vo.q_bno};

					$(".pagination").on("click", "li a", function(event) {
						event.preventDefault();
						page = $(this).attr("href");
						getList(q_bno, page);
					});

					$("#q_replies").on("click", ".callModal", function() {

						var q_rno = $(this).attr("data-q_rno");
						var qr_Text = $(this).attr("data-qr_Text");
					
						$("#modal_q_rno").text(q_rno);
						$("#modal_qr_Text").val(qr_Text);
						$("#myModal").modal("show");
					});

					$("#modal_update").click(
							function() {
								var q_rno = $("#modal_q_rno").text();
								var qr_Text = $("#modal_qr_Text").val();
								$.ajax({
									type : "put",
									url : "/q_replies/" + q_rno,
									headers : {
										"Content-Type" : "application/json",
										"X-HTTP-Method-Override" : "PUT"
									},
									data : JSON.stringify({
										qr_Text : qr_Text
									}),
									dataType : "text",
									success : function() {

									},
									error : function(request, status, error) {
										alert("fail");
										alert("code:" + request.status + "\n"
												+ "msg:" + request.reponseText
												+ "\n" + "error:" + error)
									},
									complete : function() {
										getList(q_bno, page);
										
										
									}
								})
							});

					$("#modal_delete").click(
							function() {
								var q_rno = $("#modal_q_rno").text();
								var q_bno = ${vo.q_bno}
								$.ajax({
									type : "delete",
									url : "/q_replies/" + q_rno +"/"+ q_bno,
									headers : {
										"Content-Type" : "application/json",
										"X-HTTP-Method-Override" : "DELETE"
									},
									data : JSON.stringify({
										qr_Text : qr_Text
									}),
									dataType : "text",
									success : function() {

									},
									error : function(request, status, error) {
										alert("fail");
										alert("code:" + request.status + "\n"
												+ "msg:" + request.reponseText
												+ "\n" + "error:" + error)
									},
									complete : function() {
										getList(q_bno, page);
									}
								})
							});

					$("#reply").click(function() {
						$("#myCollapsible").collapse("toggle");
					});

					$("#replyInsertBtn").click(
							function() {
								var replyer = $("#replyer").val();
								var qr_Text = $("#qr_Text").val();

								$.ajax({
									type : 'post',
									url : '/q_replies',
									headers : {
										"Content-Type" : "application/json",
										"X-HTTP-Method-Override" : "POST"
									},
									data : JSON.stringify({
										replyer : replyer,
										qr_Text : qr_Text,
										q_bno : q_bno
									}),
									dataType : "text",
									success : function(result) {
										$("#replyer").val("");
										$("#qr_Text").val("");
										$("#myCollapsible").collapse("toggle");
										getList(q_bno, page);

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

					getList(q_bno, page);
					getAllAttach(q_bno);
				});

		function getAllAttach(q_bno){
			$.getJSON("/qna/getAttach/"+q_bno, function(result){
				var source = $("#sourceAttach").html();
              var template = Handlebars.compile(source);
              
              $(result).each(function(){
            	 var data = getFileInfo(this);
            	 $(".uploadedList").append(template(data)); 
              });
              
			})
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

		function getList(q_bno, page) {
			$.getJSON("/q_replies/" + q_bno + "/" + page, function(data) {
				var source = $("#source").html();
				var template = Handlebars.compile(source);
				var gab = data.list;

				$("#q_replies").html(template(gab));
				printPaging(data.pm);

			});
		}
	</script>

</body>
</html>