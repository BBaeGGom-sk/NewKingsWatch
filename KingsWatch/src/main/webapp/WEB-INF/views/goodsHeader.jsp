<html lang="ecu-kr">
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar" style="margin:0px auto 0 !important">
	<div class="container" style="margin:0px auto 0 !important">
		<a class="navbar-brand" href="index.html">King's<small>Watch</small></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a href="/"	class="nav-link">Home</a></li>
							<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로즈몽</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="/goods/goodsListBrand?g_brand=로즈몽" >ALL</a>
						<a class="dropdown-item" href="/goods/goodsListWoman?g_category=1&g_brand=로즈몽">WOMAN</a>
						<a class="dropdown-item" href="/goods/goodsListPublic?g_category=0&g_brand=로즈몽">PUBLIC</a>
					</div></li>
							<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">아르마니</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="/goods/goodsListBrand?g_brand=아르마니" >ALL</a>
						<a class="dropdown-item" href="/goods/goodsListWoman?g_category=1&g_brand=아르마니">WOMAN</a>
						<a class="dropdown-item" href="/goods/goodsListMan?g_category=2&g_brand=아르마니">MAN</a>
						<a class="dropdown-item" href="/goods/goodsListPublic?g_category=0&g_brand=아르마니">PUBLIC</a>
					</div></li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">세이코</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="/goods/goodsListBrand?g_brand=세이코" >ALL</a>
						<a class="dropdown-item" href="/goods/goodsListWoman?g_category=1&g_brand=세이코">WOMAN</a>
						<a class="dropdown-item" href="/goods/goodsListMan?g_category=2&g_brand=세이코">MAN</a>
						<a class="dropdown-item" href="/goods/goodsListPublic?g_category=0&g_brand=세이코">PUBLIC</a>
					</div></li>
				<c:if test="${login.u_id eq 'admin' }">
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle"  id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">판매종료</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="/goods/goodsNoSelling" >ALL</a>
						<a class="dropdown-item" href="/goods/goodsListBrandNoSelling?g_brand=로즈몽">로즈몽</a>
						<a class="dropdown-item" href="/goods/goodsListBrandNoSelling?g_brand=세이코">세이코</a>
						<a class="dropdown-item" href="/goods/goodsListBrandNoSelling?g_brand=아르마니">아르마니</a>
					</div></li>
				</c:if>
				<li class="nav-item"><a href="<c:url value="/user/join"/>" class="nav-link">회원가입</a></li>
				<li class="nav-item"><a href="<c:url value="/user/join"/>" class="nav-link">회원가입</a></li>
				<li class="nav-item"><a href="/user/login" class="nav-link">로그인</a></li>
				<li class="nav-item"><a href="/user/logout" class="nav-link">로그아웃</a></li>
				<li class="nav-item"><a href="/user/viewDetail?id=${login.u_id}"
					class="nav-link">회원정보 상세보기</a></li>
				<li class="nav-item cart"><a href="cart.html" class="nav-link">
						<span class="icon icon-shopping_cart"></span> <span
						class="bag d-flex justify-content-center align-items-center"><small>1</small></span>
				</a></li>
			</ul>
		</div>
	</div>
</nav>
<!----------------- 네이게이션 끝 ----------------->
</html>