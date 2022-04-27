<%@page import="pack_Product.ProListBean"%>
<%@page import="pack_Event.eventBean"%>
<%@page import="java.util.List"%>
<%@page import="pack_Product.ProductMgr"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="prodMgr" class="pack_Product.ProductMgr" />
<jsp:useBean id="eMgr" class="pack_Event.eventMgr" />
<%
int eCount = eMgr.eListCnt();

List eList = eMgr.eventList();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket</title>
<link rel="stylesheet" href="/style/swiper.min.css">
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_main.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<!-- <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" /> -->
<!-- swiper cdn -->
<!-- <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" /> -->
<!-- slick-slider cnd -->
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/swiper.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
<script src="/script/script_maintab.js"></script>
<!-- <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script> -->
<!-- swiper cdn -->
<!-- <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> -->
<!-- slick-slider cnd -->

</head>
<body>
	<%@ include file="/include/header.jsp"%>
	<div class="mainfront">

		<div class="mainslide swiper">
			<!-- 헤더 밑 메인 슬라이드 영역 -->

			<div class="swiper-container">
				<div class="swiper-wrapper">
					<!-- 슬라이드 이미지 삽입란 -->
					<div class="swiper-slide">
						<div class="bg">
							<img src="/images/main_images/main-slide-img1.jpg" alt="">
						</div>
						<div class="txt-area">
							<p class="sub-tit" >용광로 속으로 사라진 작은 우주</p>
							<p class="main-tit"> 뮤지컬<br>스톤 THE STONE
							</p>
							<p class="info-tit">2022. 02. 27. ~ 2022. 05. 22. 예스24스테이지 3관</p>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="bg">
							<img src="/images/main_images/main-slide-img2.jpg" alt="">
						</div>
						<div class="txt-area">
							<p class="sub-tit" >모두의 워너비 그녀가 돌아왔다주</p>
							<p class="main-tit"> 뮤지컬<br>차미
							</p>
							<p class="info-tit">2022. 04. 22. ~ 2022. 07. 16. 플러스씨어터</p>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="bg">
							<img src="/images/main_images/main-slide-img3.jpg" alt="">
						</div>
						<div class="txt-area">
							<p class="sub-tit" >모두가 기다려온 완벽한 뮤지컬</p>
							<p class="main-tit"> 뮤지컬<br>넥스트 투 노멀
							</p>
							<p class="info-tit">2022. 05. 17. ~ 2022. 07. 31. 광림아트센터 BBCH홀</p>
						</div>
					</div>
				</div>
			</div>
		</div>


		<section class="sec01">
			<h1>WHAT'S HOT</h1>
			<div class="hot_list_section">
				<%
				request.setCharacterEncoding("UTF-8");
				List objList = prodMgr.listOutput();
				int cnt = prodMgr.proListCount();
				if (cnt != 0) {
					for (int i = 0; i < objList.size(); i++) {
						ProListBean mList = (ProListBean) objList.get(i);
				%>
				<div class="listcontainer">
					<div class="hot_list">
						<a href="/product/listView.jsp?pNo=<%=mList.getpNo()%>"> <img
							src="/images/main_images/product-list-img<%=i + 1%>.jpg"
							alt="포스터">
							<div class="hotproduct">
								<h2><%=mList.getpTitle()%></h2>
								<p><%=mList.getpDate1()%>
									-
									<%=mList.getpDate2()%></p>
								<p><%=mList.getpContent()%></p>
							</div>
						</a>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
		</section>



	</div>
	<%@ include file="/include/footer.jsp"%>



	<!-- div#wrap -->
<!-- 	<script src="/script/main_sup_script.js"></script> -->
	<script>
		$(function() {
// 			$('.event-box').slick()
		});
	</script>
</body>
</html>