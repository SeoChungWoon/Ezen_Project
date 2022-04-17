<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인페이지</title>
<!-- main 용 -->
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_main.css">

<!-- main 용 -->
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
<script src="/script/script_maintab.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
</head>
<body>
	<div id="wrap" class="main">
		<%@ include file="/include/header.jsp"%>

		<div class="mainslide swiper">
			<!-- 헤더 밑 메인 슬라이드 영역 -->
			<div class="swiper-wrapper">
				<!-- 슬라이드 이미지 삽입란 -->
				<div class="swiper-slide">
					<img src="/images/main_images/01.jpeg" alt="뮤지컬 공연 포스터">
				</div>
				<div class="swiper-slide">
					<img src="/images/main_images/02.jpeg" alt="뮤지컬 공연 포스터">
				</div>
				<div class="swiper-slide">
					<img src="/images/main_images/03.jpeg" alt="뮤지컬 공연 포스터">
				</div>
				<div class="swiper-slide">
					<img src="/images/main_images/04.jpeg" alt="뮤지컬 공연 포스터">
				</div>
				<div class="swiper-slide">
					<img src="/images/main_images/05.jpeg" alt="뮤지컬 공연 포스터">
				</div>
				<div class="swiper-pagination"></div>
				<div class="swiper-button-prev"></div>
        		<div class="swiper-button-next"></div>
        		<div class="swiper-scrollbar"></div>
			</div>
		</div>
		
	<!--  	
	<div class="section_sub-menu section">
		<div class="sub-menu-wrapper">
			<div>공지사항</div>
			<div>게시판</div>
			<div>게시판</div>
			<div>게시판</div>
		</div>
	</div> 
	-->
	<div class="section_hot section">
		<h1>WHAT'S HOT</h1>
		<article>
			<div>
				<div class="hot-list_first">
					<img src="images/main_images/01_thumb.jpeg" alt="지킬 앤 하이드 포스터">
					<div class="hot-list-text">
						<p>지킬 앤 하이드</p>
						<p>2022. 06. 18 ~ 2022. 06. 19 드림씨어터</p>
					</div>
				</div>
			</div>
			<div class="hot-list-wrapper">
				<div class="hot-list">
					<img src="images/main_images/02_thumb.jpeg" alt="뮤지컬 공연 포스터">
				</div>
				<div class="hot-list">
					<img src="images/main_images/03_thumb.jpeg" alt="뮤지컬 공연 포스터">
				</div>
				<div class="hot-list">
					<img src="images/main_images/04_thumb.jpeg" alt="뮤지컬 공연 포스터">
				</div>
				<div class="hot-list">
					<img src="images/main_images/05_thumb.jpeg" alt="뮤지컬 공연 포스터">
				</div>
				<div class="hot-list">
					<img src="images/main_images/06_thumb.jpeg" alt="뮤지컬 공연 포스터">
				</div>
				<div class="hot-list">
					<img src="images/main_images/07_thumb.jpeg" alt="뮤지컬 공연 포스터">
				</div>
			</div>
		</article>
	</div>
	
	
<!-- 탭메뉴 -->	


<div class="tab_container">

  <ul class="tabs">
    <li class="tab-link current" data-tab="tab-1">전체</li>
    <li class="tab-link" data-tab="tab-2">전시</li>
    <li class="tab-link" data-tab="tab-3">체험/행사</li>
    <li class="tab-link" data-tab="tab-4">기타</li>
  </ul>

  <div id="tab-1" class="tab-content current">전체</div>
  <div id="tab-2" class="tab-content">전시</div>
  <div id="tab-3" class="tab-content">체험/행사</div>
  <div id="tab-4" class="tab-content">기타</div>

</div>
	
<!-- 탭메뉴 -->


	<div class="section_musical section">
        <h1>Musical & Play</h1>
        <div class="product_list">
          <div><img src="images/main_images/02_thumb.jpeg" alt="뮤지컬" /></div>
          <div><img src="images/main_images/02_thumb.jpeg" alt="뮤지컬" /></div>
          <div><img src="images/main_images/02_thumb.jpeg" alt="뮤지컬" /></div>
          <div><img src="images/main_images/02_thumb.jpeg" alt="뮤지컬" /></div>
          <div><img src="images/main_images/02_thumb.jpeg" alt="뮤지컬" /></div>
          <div><img src="images/main_images/02_thumb.jpeg" alt="뮤지컬" /></div>
        </div>
	
	</div>
	
	<div class="section_notice section">
		<h1>NOTICE</h1>
		<article>
			<ul class="notice-list">
				<li>
					<div>새로운 소식입니다.</div>
					<div>04.12</div>
				</li>
				<li>
					<div>새로운 소식입니다.</div>
					<div>04.12</div>
				</li>
				<li>
					<div>새로운 소식입니다.</div>
					<div>04.12</div>
				</li>
				<li>
					<div>새로운 소식입니다.</div>
					<div>04.12</div>
				</li>
				<li>
					<div>새로운 소식입니다.</div>
					<div>04.12</div>
				</li>
			</ul>
		</article>
	</div>
	<!-- div.sub-body -->

	
	<%@ include file="/include/footer.jsp"%>

	
	
	<!-- div#wrap -->
	<script src="/script/main_sup_script.js"></script>
</body>
</html>