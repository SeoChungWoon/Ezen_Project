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
<script src="/script/script_seller.js"></script>
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

				<form action="/sellerPage/sellerListRegisterProc.jsp" method="post" class="sellerListRegisterForm">
					<input type="hidden" id="sLF1" name="sLF1" value="">
					<input type="hidden" id="sLF2" name="sLF2" value="">
					<input type="hidden" id="sLF3" name="sLF3" value="">
					<input type="hidden" id="fileName1" name="fileName1" value="">
					<input type="hidden" id="fileName2" name="fileName2" value="">
					
					<div class="sRegister-cont">
						<div class="top-cont">
							<p class="blue txt">* 최대 2개까지 선택 가능</p>
							<div class="flag-desc">
								<div class="flag chk">
									<div class="chk-sList">
										<input type="checkbox" name="sLF1" id="sLF1" class="event today" value="투데이특가"/>
										<label for="sLF1">투데이특가</label>
									</div>
									<div class="chk-sList">
										<input type="checkbox" name="sLF2" id="sLF2" class="event now" value="바로사용" />
										<label for="sLF2">바로사용</label>
									</div>
									<div class="chk-sList">
										<input type="checkbox" name="sLF3" id="sLF3" class="event md" value="MD" />
										<label for="sLF3">MD</label>
									</div>
								</div>
							</div>
	
							<div class="txt-desc">
								<input type="text" name="sListTitle" id="sListTitle" placeholder="상품 제목을 등록해주세요."/>
							</div>
						</div>
						<!-- // top-cont -->
	
						<div class="detail-cont">
							<div class="infoBox">
								<div class="left">
									<div class="img file-cont">
										<div class="file-group">
											<input type="file" name="pWfile" id="pWfile" onchange="fileValM(this)" data-target="fileName1" />
											<button type="button" class="fileBtn"><span>썸네일 이미지 파일 첨부</span></button>
											
											<div class="file-name">
												<span></span>
												<a href="javascript:" class="fileDel"><span class="blind">삭제</span></a>
											</div>
										</div>
										<p class="txt">* 첨부파일은 jpg, png, gif 파일로 1개만 가능합니다.(용량제한 : 10MB)</p>
									</div>
									
									<div class="contImg file-cont">
										<div class="file-group">
											<input type="file" name="sListImgFile" id="sListImgFile" onchange="fileValM(this)" data-target="fileName2" />
											<button type="button" class="fileBtn"><span>상세 내용 이미지 파일 첨부</span></button>
											
											<div class="file-name">
												<span></span>
												<a href="javascript:" class="fileDel"><span class="blind">삭제</span></a>
											</div>
										</div>
										<p class="txt">* 첨부파일은 jpg, png, gif 파일로 1개만 가능합니다.(용량제한 : 10MB)</p>
									</div>
								</div>
								
								<div class="right">
									<div class="info-desc">
										<dl>
											<dt>상품 <br />소개멘트</dt>
											<dd>
												<input type="text" name="sListInfoTxt" id="sListInfoTxt" placeholder="내용을 등록해주세요."/></dd>
										</dl>
										<dl>
											<dt>장르</dt>
											<dd>
												<div class="group radio">
													<div class="radio-sList rChecked">
														<input type="radio" name="sLGroup" id="sLGroup1" class="" value="전시"/>
														<label for="sLGroup1">전시</label>
													</div>
													<div class="radio-sList">
														<input type="radio" name="sLGroup" id="sLGroup2" class="" value="체험" />
														<label for="sLGroup2">체험</label>
													</div>
													<div class="radio-sList">
														<input type="radio" name="sLGroup" id="sLGroup3" class="" value="행사" />
														<label for="sLGroup3">행사</label>
													</div>
													<div class="radio-sList">
														<input type="radio" name="sLGroup" id="sLGroup4" class="" value="기타" />
														<label for="sLGroup4">기타</label>
													</div>
												</div>
												<p class="txt blue">* 1개만 선택 가능</p>
											</dd>
										</dl>
										<dl>
											<dt>지역</dt>
											<dd>
												<div class="area radio">
													<div class="radio-sList rChecked">
														<input type="radio" name="sLArea" id="sLArea1" class="" value="서울" />
														<label for="sLArea1">서울</label>
													</div>
													<div class="radio-sList">
														<input type="radio" name="sLArea" id="sLArea2" class="" value="경기" />
														<label for="sLArea2">경기</label>
													</div>
													<div class="radio-sList">
														<input type="radio" name="sLArea" id="sLArea3" class="" value="인천" />
														<label for="sLArea3">인천</label>
													</div>
													<div class="radio-sList">
														<input type="radio" name="sLArea" id="sLArea4" class="" value="대전" />
														<label for="sLArea4">대전</label>
													</div>
													<div class="radio-sList">
														<input type="radio" name="sLArea" id="sLArea5" class="" value="충청" />
														<label for="sLArea5">충청</label>
													</div>
													<div class="radio-sList">
														<input type="radio" name="sLArea" id="sLArea6" class="" value="강원" />
														<label for="sLArea6">강원</label>
													</div>
												</div>
												<p class="txt blue">* 1개만 선택 가능</p>
											</dd>
										</dl>
										<dl>
											<dt>관람장소</dt>
											<dd>
												<input type="text" name="sListContent" id="sListContent" placeholder="전시 장소를 등록해주세요."/>
											</dd>
										</dl>
										<dl>
											<dt>관람등급</dt>
											<dd>전체관람가</dd>
										</dl>
										<dl>
											<dt>지역상세</dt>
											<dd>
												<input type="text" name="sListLocation" id="sListLocation" placeholder="지역상세를 등록해주세요."/>
											</dd>
										</dl>
										<dl>
											<dt>관람날짜</dt>
											<dd class="date">
												<input type="text" name="sListDate1" id="sListDate1" class="date startDate" placeholder="시작 날짜 (ex. 2022.04.08)"/>
												<span> - </span>
												<input type="text" name="sListDate2" id="sListDate2" class="date endDate" placeholder="종료 날짜 (ex. 2022.04.08)"/>
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