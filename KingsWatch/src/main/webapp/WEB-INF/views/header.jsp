<html lang="ecu-kr">
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="index.html">King's<small>Watch</small></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a href="/"	class="nav-link">Home</a></li>
				<li class="nav-item"><a href="<c:url value="/user/join"/>" class="nav-link">회원가입</a></li>
				<li class="nav-item"><a href="/user/login" class="nav-link">로그인</a></li>
				<li class="nav-item"><a href="/user/logout" class="nav-link">로그아웃</a></li>
				<li class="nav-item"><a href="/user/viewDetail?id=${login.u_id}"
					class="nav-link">회원정보 상세보기</a></li>
				<li class="nav-item"><a href="/example" class="nav-link">예제화면</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="room.html" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="shop.html">Shop</a> <a
							class="dropdown-item" href="product-single.html">Single
							Product</a> <a class="dropdown-item" href="room.html">Cart</a> <a
							class="dropdown-item" href="checkout.html">Checkout</a>
					</div></li>
				<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
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