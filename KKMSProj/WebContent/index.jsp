<%@page import="pack_Product.ProListBean"%>
<%@page import="java.util.List"%>
<%@page import="pack_Product.ProductMgr"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:useBean id="prodMgr" class="pack_Product.ProductMgr" />	
	
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
		<%@ include file="/include/header.jsp"%>
	 <div class="mainfront"> 

		<div class="mainslide swiper">
			<!-- 헤더 밑 메인 슬라이드 영역 -->
			
			<div class="swiper-wrapper">
				<!-- 슬라이드 이미지 삽입란 -->
                    <%
					request.setCharacterEncoding("UTF-8");
					List objList = prodMgr.listOutput();
				 	int cnt = prodMgr.proListCount();
					
				 	if(cnt != 0){
			      		for(int i = 0; i < objList.size(); i++){
							ProListBean mList = (ProListBean) objList.get(i);
					%>
				<div class="swiper-slide">
					<a href="/product/listView.jsp?pNo=<%=mList.getpNo() %>">
					<img src="/images/main_images/product-list-slideimg<%= i+1%>.jpg" alt="뮤지컬 공연 포스터">
					</a>
				</div>
				<%} }%>
				
				
				<div class="swiper-pagination"></div>
				<div class="swiper-button-prev"></div>
        		<div class="swiper-button-next"></div>
        		<div class="swiper-scrollbar"></div>
			</div>
		</div>
		
		
		<section class="sec01">
			<h1>WHAT'S HOT</h1>


			<div class="hot_list_section">
				<%
				if (cnt != 0) {
					for (int i = 0; i < objList.size(); i++) {
						ProListBean mList = (ProListBean) objList.get(i);
				%>
				<div class="listcontainer">
					<div class="hot_list">
						<a href="/product/listView.jsp?pNo=<%=mList.getpNo()%>"> <img
							src="/images/main_images/product-list-img<%=i + 1%>.jpg" alt="포스터">
							<div class="hotproduct">
								<h2>앤서니 브라운의 원더랜드 뮤지엄</h2>
								<p>2022.04.28~2022.05.31</p>
								<p>예술의 전당 한가람미술관 2층</p>
							</div>
					</div>
					</a>
				</div>
				<%
				}	}
				%>
			</div>
		</section>



<section class="mainprolist">
	<div class="viewtitle">
		<h1>TICKET OPEN</h1>
	</div>
	<!-- <div class="viewbox">
		<div class="list_grid"></div>
		<div class="list_grid"></div>
		<div class="list_grid"></div>
		<div class="list_grid"></div>
		<div class="list_grid"></div>
	</div> -->



</section>




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
	</div>
	<!-- div.sub-body -->

	
	<%@ include file="/include/footer.jsp"%>

	
	
	<!-- div#wrap -->
	<script src="/script/main_sup_script.js"></script>
</body>
</html>