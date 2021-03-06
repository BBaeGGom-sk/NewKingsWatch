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

<title>Q&A </title>
</head>
<body>

	<div class="container">

<h1 align="center"><a href="/qna/list">QnA</a></h1>
<hr>

		<div class="row">


			<table class="table table-striped">
				<thead>

					<tr>
						<th width="7%">글번호</th>
						<th width="65%">제목</th>
						<th>작성자</th>
						<th width="15%">작성일</th>
						<th width="7%">조회수</th>
					</tr>

				</thead>


				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.q_bno}</td>
							<td>
							
							<c:choose>
							<c:when test="${login.u_id=='admin'}">
							<a href="/qna/read${pm.makeQuery(pm.cri.page)}&q_bno=${vo.q_bno}">${vo.q_title}<c:if test="${vo.q_lock==1}">&nbsp;
							</span></a><img src="../../../resources/img/icon_secret.gif"></c:if>
							</c:when>
							<c:when test="${vo.u_id==login.u_id}">
							<a href="/qna/read${pm.makeQuery(pm.cri.page)}&q_bno=${vo.q_bno}">${vo.q_title}<c:if test="${vo.q_lock==1}">&nbsp;
							</span></a><img src="../../../resources/img/icon_secret.gif"></c:if></c:when>
										<c:when test="${vo.q_lock!=0}"><a href="" onclick="idchk()">************ 비밀글 입니다. ************ &nbsp;</a>
										<img src="../../../resources/img/icon_secret.gif"></c:when>
										<c:otherwise><a href="/qna/read${pm.makeQuery(pm.cri.page)}&q_bno=${vo.q_bno}">${vo.q_title}</a></c:otherwise>
									</c:choose>
									
									
									<c:if test="${vo.q_replyCnt!=0}">&nbsp;<span
											style="color: blue">[${vo.q_replyCnt}]</span>
									</c:if>
							</a></td>
							<td>${vo.u_id}</td>
							<td>${vo.q_updateDate}</td>
							<td>${vo.q_viewCnt}</td>
						</tr>
					</c:forEach>

				</tbody>
				<tr>
				</tr>

				</tbody>

			</table>
		</div>
		<!-- 클래스 로우 -->


		<div class="row text-center">
			<ul class="pagination">
				<c:if test="${pm.cri.page>1}">
					<li><a href="/qna/list${pm.makeQuery(pm.cri.page-1)}">&laquo;</a></li>
				</c:if>


				<c:forEach var="idx" begin="${pm.beginPageNum}"
					end="${pm.stopPageNum}">
					<li class="${pm.cri.page==idx?'active':''}"><a
						href="/qna/list${pm.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pm.cri.page<pm.totalPage}">
					<li><a href="/qna/list${pm.makeQuery(pm.cri.page+1)}">&raquo;</a></li>
				</c:if>
			</ul>
			<a class="btn btn-info pull-right" href="/qna/insertui">글쓰기</a>


		</div>
		<div class="row">

		</div>
		<hr>

		<div class="row">

			<form target="_blank" method="get" action="/qna/search">

				<div class="col-xs-3 col-sm-2">
					<select class="form-control" id="ssel" name="searchType">
						<option disabled>검색 기준</option>
						<option value="q_title">제목</option>
						<option value="u_id">작성자</option>
						<option value="q_content">내용</option>
					</select>
				</div>

				<div class="input-group col-xs-9 col-sm-10">
					<input class="form-control" id="keyword" name="keyword"> <span
						class="input-group-btn">
						<button class="btn btn-success">검색</button>
					</span>
				</div>


			</form>

		</div>
		<!-- 로우태그엔드 -->




	</div>
	<!-- 클래스 컨테이너 -->

	<script type="text/javascript">
		list();
	

		$(document).ready(function() {

			$(".btn-success").click(function() {
				$("form").submit();
			});

		});
		
		function idchk(){
		alert("비공개 글입니다!")
		return false;
		}
		
	</script>




</body>
</html>