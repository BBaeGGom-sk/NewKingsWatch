<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/headlink.jsp"></jsp:include>
<title>공지 사항</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<br><br><br><br>
	<div class="container">

<h1 align="center"><a href="/notice/list">공지사항</a></h1>
<hr>
		<div class="row">


			<table class="table table-striped" >
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
						<td>
						<c:choose>
						<c:when test="${vo.n_topMost==1}"><strong>공지</strong></c:when>
						<c:otherwise>
						${vo.n_bno}
						</c:otherwise>
						</c:choose>
						</td><td><a href="/notice/read${pm.makeQuery(pm.cri.page)}&n_bno=${vo.n_bno}">
								<c:choose>
								<c:when test="${vo.n_topMost==1}">
								<strong>${vo.n_title}</strong>
								</c:when>
								<c:otherwise>
								${vo.n_title}
								</c:otherwise>
								</c:choose>
								</a></td>
							<td>
							<c:choose>
								<c:when test="${vo.n_topMost==1}">
							<strong>${vo.u_id}</strong>
							</c:when>
							<c:otherwise>
							${vo.u_id}
							</c:otherwise>
							</c:choose>
							</td>
						<td>${vo.n_regDate}</td>
						<td>${vo.n_viewCnt}</td>
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
					<li><a href="/notice/list${pm.makeQuery(pm.cri.page-1)}">&laquo;</a></li>
				</c:if>


				<c:forEach var="idx" begin="${pm.beginPageNum}"
					end="${pm.stopPageNum}">
					<li class="${pm.cri.page==idx?'active':''}"><a
						href="/notice/list${pm.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pm.cri.page<pm.totalPage}">
					<li><a href="/notice/list${pm.makeQuery(pm.cri.page+1)}">&raquo;</a></li>
				</c:if>
				
			</ul>
	<c:if test="${login.u_id=='admin'}">
		<div style="text-align: right;">
			<a class="btn btn-info pull-right" href="/notice/insertui">글쓰기</a>
		</div>
	</c:if>
		</div>
	<div class="row">

		</div>

	<!-- 	<div class="row">
 -->

<!--         <form target="_blank" method="get" action="/notice/search">

			<div class="col-xs-3 col-sm-2">
				<select class="form-control" id="ssel" name="searchType">
					<option disabled>검색 기준</option>
					<option value="title">제목</option>
					<option value="writer">작성자</option>
					<option value="content">내용</option>
				</select>
			</div>

			<div class="input-group col-xs-9 col-sm-10">
			<input class="form-control" id="keyword" name="keyword"> 
			<span class="input-group-btn">
				<button class="btn btn-success">검색</button>
			</span>
			</div>
			
			
			</form> -->
			
		</div> <!-- 로우태그엔드 -->




	</div>
	<!-- 클래스 컨테이너 -->

<script type="text/javascript">
list();

$(document).ready(function(){
	
	$(".btn-success").click(function() {
		$("form").submit();
	});
	
});

</script>




</body>
</html>