<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>메인 화면</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

    <link rel="stylesheet" href="resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/animate.css">
    
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/css/magnific-popup.css">

    <link rel="stylesheet" href="resources/css/aos.css">
    <link rel="stylesheet" href="resources/css/ionicons.min.css">

    <link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="resources/css/jquery.timepicker.css">
    
    <link rel="stylesheet" href="resources/css/flaticon.css">
    <link rel="stylesheet" href="resources/css/icomoon.css">
    <link rel="stylesheet" href="resources/css/style.css">

</head>


<body>

<!-- ----------네비게이션---------- -->
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"	id="ftco-navbar">
			<div class="container">
				<a class="navbar-brand" href="index.html">King's<small>Watch</small></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>
				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a href="index.html"
							class="nav-link">Home</a></li>
						<li class="nav-item"><a href="user/join" class="nav-link">회원가입</a></li>
						<li class="nav-item"><a href="user/login" class="nav-link">로그인</a></li>
						<li class="nav-item"><a href="user/logout" class="nav-link">로그아웃</a></li>
						<li class="nav-item"><a href="user/viewDetail?id=${login.u_id}" class="nav-link">회원정보 상세보기</a></li>
						<li class="nav-item"><a href="example" class="nav-link">예제 화면</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="room.html" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="shop.html">Shop</a>
								<a class="dropdown-item" href="product-single.html">Single	Product</a>
								<a class="dropdown-item" href="room.html">Cart</a>
								<a class="dropdown-item" href="checkout.html">Checkout</a>
							</div></li>
						<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
						<li class="nav-item cart">
							<a href="cart.html"	class="nav-link">
							<span class="icon icon-shopping_cart"></span>
							<span class="bag d-flex justify-content-center align-items-center"><small>1</small></span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!----------------- 네이게이션 끝 ----------------->


	<section class="home-slider owl-carousel">
		<div class="slider-item"	style="background-image: url('resources/images/bg_1.jpg');">	<!-- 갈남색 -->
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center"	data-scrollax-parent="true">

					<div class="col-md-8 col-sm-12 text-center ftco-animate">
						<span class="subheading">Welcome</span>
						<h1 class="mb-4">The Best Coffee Testing Experience</h1>
						<p class="mb-4 mb-md-5">A small river named Duden flows by
							their place and supplies it with the necessary regelialia.</p>
						<p>
							<a href="#" class="btn btn-primary p-3 px-xl-4 py-xl-3">Order Now</a>
							<a href="#"	class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">View Menu</a>
						</p>
					</div>

				</div>
			</div>
		</div>

		<div class="slider-item" style="background-image: url(resources/images/bg_2.jpg);"> <!-- 커피컵 -->
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center"
					data-scrollax-parent="true">

					<div class="col-md-8 col-sm-12 text-center ftco-animate">
						<span class="subheading">Welcome</span>
						<h1 class="mb-4">Amazing Taste &amp; Beautiful Place</h1>
						<p class="mb-4 mb-md-5">A small river named Duden flows by
							their place and supplies it with the necessary regelialia.</p>
						<p>
							<a href="#" class="btn btn-primary p-3 px-xl-4 py-xl-3">Order
								Now</a> <a href="#"
								class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">View
								Menu</a>
						</p>
					</div>

				</div>
			</div>
		</div>

		<div class="slider-item"
			style="background-image: url(resources/images/bg_3.jpg);">	<!-- 카운터 -->
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center"
					data-scrollax-parent="true">

					<div class="col-md-8 col-sm-12 text-center ftco-animate">
						<span class="subheading">Welcome</span>
						<h1 class="mb-4">Creamy Hot and Ready to Serve</h1>
						<p class="mb-4 mb-md-5">A small river named Duden flows by
							their place and supplies it with the necessary regelialia.</p>
						<p>
							<a href="#" class="btn btn-primary p-3 px-xl-4 py-xl-3">Order Now</a>
							<a href="#"	class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">View Menu</a>
						</p>
					</div>

				</div>
			</div>	<!-- end of container -->
		</div>	<!-- end of slider item -->
	</section>



	<section class="ftco-intro">
		<div class="container-wrap">
			<div class="wrap d-md-flex align-items-xl-end">
				<div class="info">
					<div class="row no-gutters">
						<div class="col-md-4 d-flex ftco-animate">
							<div class="icon">
								<span class="icon-phone"></span>
							</div>
							<div class="text">
								<h3>000 (123) 456 7890</h3>
								<p>A small river named Duden flows by their place and
									supplies.</p>
							</div>
						</div>
						<div class="col-md-4 d-flex ftco-animate">
							<div class="icon">
								<span class="icon-my_location"></span>
							</div>
							<div class="text">
								<h3>198 West 21th Street</h3>
								<p>203 Fake St. Mountain View, San Francisco, California, USA</p>
							</div>
						</div>
						<div class="col-md-4 d-flex ftco-animate">
							<div class="icon">
								<span class="icon-clock-o"></span>
							</div>
							<div class="text">
								<h3>Open Monday-Friday</h3>
								<p>8:00am - 9:00pm</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- ---------------our story section---------------- -->
    <section class="ftco-about d-md-flex">
    	<div class="one-half img" style="background-image: url(resources/images/about.jpg);"></div>
    	<div class="one-half ftco-animate">
    		<div class="overlap">
	        <div class="heading-section ftco-animate ">
	        	<span class="subheading">Discover</span>
	          <h2 class="mb-4">Our Story</h2>
	        </div>
				<div>
					<p>On her way she met a copy. The copy warned the Little Blind
						Text, that where it came from it would have been rewritten a
						thousand times and everything that was left from its origin would
						be the word "and" and the Little Blind Text should turn around and
						return to its own, safe country. But nothing the copy said could
						convince her and so it didn?셳 take long until a few insidious Copy
						Writers ambushed her, made her drunk with Longe and Parole and
						dragged her into their agency, where they abused her for their.</p>
				</div>
  			</div>
    	</div>
    </section>
    




	<br><br><br><br>
	<div class="container">
 		<c:if test="${login != null}">
 			<h2>${login.u_id}(${login.u_name})님 환영 합니다.
 		</c:if> 
		<!-- 왜 login안에 regdate랑 u_id는 null이지? -->
	</div>	
	
	
	
	
	
	
	
	
<!-- 	
	--------------------- 주문 영역 ----------------------
    <section class="ftco-intro">
    	<div class="container-wrap">
    		<div class="wrap d-md-flex align-items-xl-end">
	    			    		
	    		<div class="book p-4">
	    			<h3>Book a Table</h3>
	    			<form action="#" class="appointment-form">
	    				<div class="d-md-flex">
		    				<div class="form-group">
		    					<input type="text" class="form-control" placeholder="First Name">
		    				</div>
		    				<div class="form-group ml-md-4">
		    					<input type="text" class="form-control" placeholder="Last Name">
		    				</div>
	    				</div>
	    				<div class="d-md-flex">
		    				<div class="form-group">
		    					<div class="input-wrap">
		            		<div class="icon"><span class="ion-md-calendar"></span></div>
		            		<input type="text" class="form-control appointment_date" placeholder="Date">
	            		</div>
		    				</div>
		    				<div class="form-group ml-md-4">
		    					<div class="input-wrap">
		            		<div class="icon"><span class="ion-ios-clock"></span></div>
		            		<input type="text" class="form-control appointment_time" placeholder="Time">
	            		</div>
		    				</div>
		    				<div class="form-group ml-md-4">
		    					<input type="text" class="form-control" placeholder="Phone">
		    				</div>
	    				</div>
	    				<div class="d-md-flex">
	    					<div class="form-group">
		              <textarea name="" id="" cols="30" rows="2" class="form-control" placeholder="Message"></textarea>
		            </div>
		            <div class="form-group ml-md-4">
		              <input type="submit" value="Appointment" class="btn btn-white py-3 px-4">
		            </div>
	    				</div>
	    			</form>
	    		</div>
    		</div>
    	</div>
    </section>  
--------------- 주문 영역 끝 --------------------- -->
	
	
	
	
	
		<!-- --------------------황토색 3개짜리----------------
		<section class="ftco-section ftco-services">
		<div class="container">
			<div class="row">
				<div class="col-md-4 ftco-animate">
					<div class="media d-block text-center block-6 services">
						<div
							class="icon d-flex justify-content-center align-items-center mb-5">
							<span class="flaticon-choices"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Easy to Order</h3>
							<p>Even the all-powerful Pointing has no control about the
								blind texts it is an almost unorthographic.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 ftco-animate">
					<div class="media d-block text-center block-6 services">
						<div
							class="icon d-flex justify-content-center align-items-center mb-5">
							<span class="flaticon-delivery-truck"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Fastest Delivery</h3>
							<p>Even the all-powerful Pointing has no control about the
								blind texts it is an almost unorthographic.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 ftco-animate">
					<div class="media d-block text-center block-6 services">
						<div
							class="icon d-flex justify-content-center align-items-center mb-5">
							<span class="flaticon-coffee-bean"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Quality Coffee</h3>
							<p>Even the all-powerful Pointing has no control about the
								blind texts it is an almost unorthographic.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	-------------황토색 3개짜리-------------- -->
	
	
	
	
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.stellar.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/aos.js"></script>	<!-- 요놈이 핵심 -->
	<script src="resources/js/jquery.animateNumber.min.js"></script>
	<script src="resources/js/bootstrap-datepicker.js"></script>
	<script src="resources/js/jquery.timepicker.min.js"></script>
	<script src="resources/js/scrollax.min.js"></script>
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="resources/js/google-map.js"></script>
	<script src="resources/js/main.js"></script>
	
	
	
	
</body>

</html>