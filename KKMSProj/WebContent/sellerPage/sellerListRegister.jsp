<%@page import="pack_Event.eventBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket :상품 등록</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<link rel="stylesheet" href="/style/style_Event.css">
<link rel="stylesheet" href="/style/style_sellerList.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
<script src="/script/eventScript.js"></script>
</head>
<body>
	<div id="wrap">

		<%@ include file="/include/sellerHeader.jsp"%>

		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont">
					<!--  title -->
					<p class="tit">상품 등록</p>
				</div>

				<form action="" method="post" class="">
					<input type="hidden" name="sListFlag" id="sListFlag" value="" class="event" />
					<input type="hidden" name="sListName" id="sListName" value=""/>
					<input type="hidden" name="sListImgFile" id="sListImgFile" value=""/>
					<input type="hidden" name="" id="" value=""/>
					
					<div class="sRegister-cont">
						<div class="top-cont">
							<p class="blue txt">* 최대 3개까지 선택 가능</p>
							<div class="flag-desc">
								<div class="flag chk">
									<div class="chk-sList">
										<input type="checkbox" name="sLF1" id="sLF1" class="event today" />
										<label for="sLF1">투데이특가</label>
									</div>
									<div class="chk-sList">
										<input type="checkbox" name="sLF2" id="sLF2" class="event now" />
										<label for="sLF2">바로사용</label>
									</div>
									<div class="chk-sList">
										<input type="checkbox" name="sLF3" id="sLF3" class="event md" />
										<label for="sLF3">MD</label>
									</div>
								</div>
							</div>
	
							<div class="txt-desc">
								<input type="text" name="sListName" id="sListName" placeholder="상품 제목을 등록해주세요."/>
							</div>
						</div>
						<!-- // top-cont -->
	
						<div class="detail-cont">
							<div class="infoBox">
								<div class="left">
									<p class="img">
										<input type="file" name="sListImgFile" id="sListImgFile" />
									</p>
								</div>
								
								<div class="right">
									<div class="info-desc">
										<dl>
											<dt>장르</dt>
											<dd>
												<div class="group radio">
													<div class="radio-sList">
														<input type="radio" name="sLArea" id="sLArea" class="" />
														<label for="sLArea">전시</label>
													</div>
													<div class="radio-sList">
														<input type="radio" name="sLArea" id="sLArea" class="" />
														<label for="sLArea">체험/행사</label>
													</div>
													<div class="radio-sList">
														<input type="radio" name="sLArea" id="sLArea" class="" />
														<label for="sLArea">기타</label>
													</div>
												</div>
												<p class="txt blue">* 1개만 선택 가능</p>
											</dd>
										</dl>
										<dl>
											<dt>지역</dt>
											<dd>
												<div class="area radio">
													<div class="radio-sList">
														<input type="radio" name="sLGroup" id="sLGroup" class="" />
														<label for="sLArea">서울</label>
													</div>
													<div class="radio-sList">
														<input type="radio" name="sLGroup" id="sLGroup" class="" />
														<label for="sLGroup">경기/인천</label>
													</div>
													<div class="radio-sList">
<!-- 														<input type="radio" name="sLGroup" id="sLGroup" class="" /> -->
														<label for="sLGroup">대전/충청/강원</label>
													</div>
												</div>
												<p class="txt blue">* 1개만 선택 가능</p>
											</dd>
										</dl>
										<dl>
											<dt>관람등급</dt>
											<dd>전체관람가</dd>
										</dl>
										<dl>
											<dt>관람장소</dt>
											<dd>
												<input type="text" name="sListLocation" id="sListLocation" placeholder="전시 장소를 등록해주세요."/>
											</dd>
										</dl>
										<dl>
											<dt>관람날짜</dt>
											<dd class="date">
												<input type="text" name="sListDate1" id="sListDate1" class="date startDate" placeholder="시작 날짜를 지정해주세요."/>
												<span> - </span>
												<input type="text" name="sListDate2" id="sListDate2" class="date endDate" placeholder="끝나는 날짜를 지정해주세요."/>
											</dd>
										</dl>
										<dl>
											<dt>관람시간</dt>
											<dd>10:00 ~ 19:00 (입장 마감 18:00) / 매주 일요일 휴관(공휴일일 경우 정상
												운영, 홈페이지 참조)</dd>
										</dl>
										<dl>
											<dt>배송정보</dt>
											<dd>현장수령</dd>
										</dl>
									</div>
									<div class="detail-desc">
										<dl>
											<dt>가격</dt>
											<dd>
												<div class="price sale">
													<input type="text" name="sListOriPrice" id="sListOriPrice" placeholder="판매 가격을 지정해주세요." maxlength="5"/>
													
													<div class="saleChk chk">
														<div class="chk-sList">
															<input type="checkbox" name="" id="" class="" />
															<label for="">할인</label>
														</div>
														<input type="text" name="sListSalePercent" id="sListSalePercent" placeholder="할인 가격을 지정해주세요." maxlength="2" disabled/>
													</div>
												</div>
												<!-- // price sale -->
											</dd>
										</dl>
									</div>
									<!-- // detail-desc -->
								</div>
							</div>
							<!--  // infoBox -->
						</div>
						<!-- // detail-cont -->
						<div class="btn-cont ">
							<button type="button" class="sListResigBtn">
								<span>등록하기</span>
							</button>
						</div>
					</div>
				</form>
			</div>
			<!-- div.inner -->
		</div>
		<!-- div.sub-body -->

		<%@ include file="/include/footer.jsp"%>

	</div>
	<!-- div#wrap -->

</body>
</html>