<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전시</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
</head>
<body>
	<div id="wrap">

		<%@ include file="/include/header.jsp"%>

		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont">
					<p class="tit">전시</p>
				</div>

				<div class="exhibit-cont">
					<ul class="exhibit-tab">
						<li class="on"><a href="javascript:"><span>전체</span></a></li>
						<li><a href="javascript:"><span>전시</span></a></li>
						<li><a href="javascript:"><span>체험/행사</span></a></li>
						<li><a href="javascript:"><span>기타</span></a></li>
					</ul>

					<div class="area-desc">
						<div class="desc-type">
							<p class="txt">지역별 보기</p>
							<div class="right-srh">
								<div class="select-group">
									<select name="area-select" id="">
										<option value="추천순">추천순</option>
										<option value="최신순">최신순</option>
										<option value="인기순">인기순</option>
									</select>
								</div>
								<button type="button" class="srh-btn">검색</button>
							</div>
						</div>

						<ul class="area-tab">
							<li class="on"><a href="javascript">전체</a></li>
							<li><a href="javascript:">서울</a></li>
							<li><a href="javascript:">경기/인천</a></li>
							<li><a href="javascript:">대전/충청/강원</a></li>
						</ul>
					</div>

					<div class="exhibit-list">
						<div class="listBox">
							<a href="javascript:">
								<p class="img">
									<img src="/images/product-list-img1.jpg" alt="" />
								</p>
								<div class="txt-info">
									<p class="flag">
										<span class="today event">투데이특가</span>
									</p>

									<p class="sub-txt">
										<span class="location">용산</span> 
										<span class="info">온라인 예매 투데이 특가 할인</span>
									</p>

									<p class="tit">영국 현대미술의 거장, 마이클 크레이그 마틴展</p>
									<p class="explain-txt">
										<span class="date">2022.04.08 - 2022.05.22</span> 
										<span class="content">예술의 전당 한가람미술관 1층</span>
									</p>
									<p class="price">
										<span class="original"> 
											<span class="rate-sale">30%</span> 
											<del>20000</del><span>원</span>
										</span> 
										<span class="discount-price">
											<ins>14000</ins><span>원</span>
										</span>
									</p>
								</div>
							</a>
						</div>
						<!-- // listBox -->
						<div class="listBox">
							<a href="javascript:">
								<p class="img">
									<img src="/images/product-list-img2.jpg" alt="" />
								</p>

								<div class="txt-info">
									<p class="flag">
										<span class="now event">바로사용</span> 
										<span class="coupon event">쿠폰할인</span>
									</p>

									<p class="sub-txt">
										<span class="location">성수</span> 
										<span class="info">온라인 예매할인 당일사용가능</span>
									</p>

									<p class="tit">로그아웃 - 지금 당신에게 필요한 순간</p>
									<p class="explain-txt">
										<span class="date">2021.12.21 ~2023.03.01</span> 
										<span class="content">뚝섬미술관</span>
									</p>
									
									<p class="price">
										<span class="original"> 
											<span class="rate-sale">10%</span> 
											<del>15000</del><span>원</span>
										</span> 
										<span class="discount-price">
											<ins>13500</ins><span>원</span>
										</span>
									</p>
								</div>
							</a>
						</div>
						<!-- // listBox -->
						<div class="listBox">
							<a href="javascript:">
								<p class="img">
									<img src="/images/product-list-img3.jpg" alt="" />
								</p>
								<div class="txt-info">
									<p class="flag">
										<span class="md event">MD추천</span> 
										<span class="coupon event">쿠폰할인</span>
									</p>

									<p class="sub-txt">
										<span class="location">여의도</span> 
										<span class="info">온라인 예매 쿠폰 할인 전시정상운영중</span>
									</p>

									<p class="tit">어느 봄날,테레사 프레이타스 사진전</p>
									<p class="explain-txt">
										<span class="date">2022.01.29 ~ 2022.04.24</span> 
										<span class="content">더현대 서울 ALT.1</span>
									</p>
									
									<p class="price">
										<span class="original"> 
											<span class="rate-sale">8%</span> 
											<del>13000</del><span>원</span>
										</span> 
										<span class="discount-price">
											<ins>11900</ins><span>원</span>
										</span>
									</p>
								</div>
							</a>
						</div>
						<!-- // listBox -->
						<div class="listBox">
							<a href="javascript:">
								<p class="img">
									<img src="/images/product-list-img4.jpg" alt="" />
								</p>

								<div class="txt-info">
									<p class="flag">
										<span class="today event">투데이특가</span> 
										<span class="now event">바로사용</span>
									</p>

									<p class="sub-txt">
										<span class="location">파주</span> 
										<span class="info">오늘 마지막!! 온라인 예매 투데이 특가 할인 당일사용가능</span>
									</p>

									<p class="tit">빈센트 반 고흐: 향기를 만나다展</p>
									<p class="explain-txt">
										<span class="date">2022.04.16 - 2022.08.28</span> 
										<span class="content">갤러리 헤이리스</span>
									</p>
									
									<p class="price">
										<span class="original"> 
											<span class="rate-sale">50%</span> 
											<del>10000</del><span>원</span>
										</span> 
										<span class="discount-price">
											<ins>5000</ins><span>원</span>
										</span>
									</p>
								</div>
							</a>
						</div>
						<!-- // listBox -->
						<div class="listBox">
							<a href="javascript:">
								<p class="img">
									<img src="/images/product-list-img5.jpg" alt="" />
								</p>

								<div class="txt-info">
									<p class="flag">
										<span class="now event">바로사용</span>
									</p>

									<p class="sub-txt">
										<span class="location">양재</span> 
										<span class="info">온라인 예매 시 당일사용가능</span>
									</p>

									<p class="tit">앤서니 브라운의 원더랜드 뮤지엄展 - 예술의전당</p>
									<p class="explain-txt">
										<span class="date">2022.04.28 - 2022.05.31</span> 
										<span class="content">예술의 전당 한가람미술관 2층</span>
									</p>
									
									<p class="price">
										<span class="original"> 
											<span class="rate-sale">58%</span> 
											<del>20000</del><span>원</span>
										</span> 
										<span class="discount-price">
											<ins>8500</ins><span>원</span>
										</span>
									</p>
								</div>
							</a>
						</div>
						<!-- // listBox -->
					</div>
					<!--  // exhibit-list -->
				</div>
				<!-- //exhibit-cont -->

			</div>
		</div>

		<%@ include file="/include/footer.jsp"%>

	</div>
	<!-- div#wrap -->
</body>
</html>