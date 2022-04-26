<%@page import="pack_Member.RegisterBean"%>
<%@page import="pack_Product.ProWSelBean"%>
<%@page import="pack_Product.ProRevBean"%>
<%@page import="pack_Product.ProListBean"%>
<%@page import="pack_Product.ProReservBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="prodMgr" class="pack_Product.ProductMgr" />
<jsp:useBean id="prodBean" class="pack_Product.ProListBean" />
<jsp:setProperty name="prodBean" property="*" />
<jsp:useBean id="prodRevBean" class="pack_Product.ProRevBean" />
<jsp:setProperty name="prodRevBean" property="*" />
<jsp:useBean id="prodWSBean" class="pack_Product.ProWSelBean" />
<jsp:setProperty name="prodWSBean" property="*" />
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />

<%
request.setCharacterEncoding("UTF-8");

int pNo = Integer.parseInt(request.getParameter("pNo"));
int pNo1 = pNo - 1;

List objList = prodMgr.listOutput();
ProListBean mList = (ProListBean) objList.get(pNo1);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket : 전시 정보</title>
<link rel="stylesheet" href="/style/swiper.min.css">
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<link rel="stylesheet" href="/style/style_calendar.css">
</head>
<body>
	<div id="wrap">

		<%@ include file="/include/header.jsp"%>

		<div class="sub-body">
			<div class="inner">

				<div class="proList-view">
					<div class="top-cont">
						<div class="flag-desc">
							<div class="flag">
								<span class="event"><%=mList.getpFlag1()%></span> <span
									class="event"><%=mList.getpFlag2()%></span>
							</div>
						</div>

						<div class="txt-desc sns-line">
							<p class="tit"><%=mList.getpTitle()%></p>
							<div class="sns">
								<a href="javascript:"><img src="/images/icon-share.png"
									alt="" /></a>
								<div class="sns-list">
									<a href="javascript:" class="url"><img
										src="/images/icon-sns-url.png" alt="" /></a> <a
										href="javascript:" class="facebook"><img
										src="/images/icon-sns-facebook.png" alt="" /></a> <a
										href="javascript:" class="twitter"><img
										src="/images/icon-sns-twitter.png" alt="" /></a>
								</div>
							</div>
						</div>
					</div>
					<!-- // top-cont -->

					<div class="detail-cont">
						<div class="infoBox">
							<div class="left">
								<p class="img">
									<img src="/images/<%=mList.getpImg()%>" alt="" />
								</p>
								
								<%
								boolean wishChk = false;
								if (memberId != null) {
									List objWishList = prodMgr.wishList(memberId);
									for (int j = 0; j < objWishList.size(); j++) {
										ProListBean wList = (ProListBean) objWishList.get(j);
										int wish = wList.getpNo();
										if (pNo == wish) {
											wishChk = true;
											break;
										} else {
											wishChk = false;
										}
									}
								}
								%>
								<div class="likeClk">
									<div class="chk-group like">
										<input type="hidden" value="<%=memberId%>">
										<input type="hidden" value="<%=pNo %>">
										<input type="checkbox" value="<%=wishChk %>" class="wishChk" id="like<%=pNo%>"/>
										<label for="like<%=pNo%>"></label>
										<div class="wishRes hidden"></div>
									</div>
								</div>
							</div>
							<div class="right">
								<div class="info-desc">
									<dl>
										<dt>장르</dt>
										<dd>
											<span class="group"><%=mList.getpGroup()%></span>
										</dd>
									</dl>
									<dl>
										<dt>관람등급</dt>
										<dd><%=mList.getpClass()%></dd>
									</dl>
									<dl>
										<dt>관람장소</dt>
										<dd>
											<span class="content">[<%=mList.getpArea()%>] <%=mList.getpContent()%></span>
										</dd>
									</dl>
									<dl>
										<dt>관람날짜</dt>
										<dd>
											<span class="date startDate"><%=mList.getpDate1()%></span> - <span class="date endDate"><%=mList.getpDate2()%></span>
										</dd>
									</dl>
									<dl>
										<dt>관람시간</dt>
										<dd><%=mList.getpViewTime()%></dd>
									</dl>
									<dl>
										<dt>배송정보</dt>
										<dd><%=mList.getpDelivery()%></dd>
									</dl>
								</div>
								<div class="detail-desc">
									<dl>
										<dt>가격</dt>
										<dd>
											<div class="price sale">
												<%
												int salePrice = mList.getpSalePercent();
												if (salePrice == 0) {
												%>
												<span class="original"> <del><%=mList.getpOriPrice()%></del><span>원</span>
												</span>
												<%
												} else {
												%>
												<span class="original"> <span class="rate-sale"><em><%=mList.getpSalePercent()%></em>%</span>
													<del><%=mList.getpOriPrice()%></del><span>원</span>
												</span> <span class="discount-price"> <ins></ins><span>원</span>
												</span>
												<%
												}
												%>
											</div>
										</dd>
									</dl>
								</div>
							</div>
						</div>
						<!--  // infoBox -->
						
						<%
						if(memberId != null) {
							List objMList = mMgr.myPage(memberId);
							RegisterBean mPList = (RegisterBean) objMList.get(0);
						%>
							<input type="hidden" name="rUId" id="rUId" value="<%=memberId %>"/>
							<input type="hidden" name="rPNo" id="rPNo" value="<%=pNo %>"/>
							
							<input type="hidden" name="oriPrice" id="oriPrice" value="<%=mList.getpOriPrice()%>"/>
							<input type="hidden" name="salePrice" id="salePrice" value="<%=mList.getpSalePercent()%>"/>
							<!-- 총 결제 금액 --> 
							<input type="hidden" name="oriRealPrice" id="oriRealPrice" value=""/>
							<!-- 총 결제 금액(적립금 사용한 원가) --> 
							<input type="hidden" name="orisavelPrice" id="orisavelPrice" value=""/>
							<!-- 총 결제 금액(적립금 사용하면 바뀜) --> 
							<input type="hidden" name="realPrice" id="realPrice" value=""/>
							
							<input type="hidden" name="selectedDate" id="selectedDate" value=""/>
							<input type="hidden" name="selectedTime" id="selectedTime" value=""/>
							
							<!-- 기본 설정 적립금 --> 
							<input type="hidden" name="oriMPrice" id="oriMPrice" value="<%=mPList.getePay() %>"/>
							<!-- 사용한 적립금 --> 
							<input type="hidden" name="savePrice" id="savePrice" value=""/>
							<!-- 남은 적립금 --> 
							<input type="hidden" name="remainPrice" id="remainPrice" value=""/>
							<!-- 인원 수 --> 
							<input type="hidden" name="headCnt" id="headCnt" value="1"/>
							<div class="reserveHidden"></div>
						<%	
						}
						%>
						
							<div class="reserveBox">
								<div class="selDate">
									<p class="txt">날짜/시간 선택</p>
	
									<div class="date-desc">
										<div class="dateBox">
											<div class="dateYM">
												<a href="javascript:" onclick="prevCalendar()" title="전"
													class="prev"></a>
												<p class="dateTxt" id="dateTxt"></p>
												<p id="date"></p>
												<a href="javascript:" onclick="nextCalendar()" title="후"
													class="next"></a>
											</div>
											<table id="calendar">
												<caption>전시 예매를 위한 날짜 선택의 대한 정보</caption>
	
												<colgroup>
													<col />
												</colgroup>
												<tbody>
													<tr>
														<th><span class="red">일</span></th>
														<th><span>월</span></th>
														<th><span>화</span></th>
														<th><span>수</span></th>
														<th><span>목</span></th>
														<th><span>금</span></th>
														<th><span class="blue">토</span></th>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- // dateBox -->
										<div class="timeBox">
											<div class="choiceBlock">
												<p class="timeChoice">
													<a href="javascript:">오전 10시 30분</a>
												</p>
												<p class="timeChoice">
													<a href="javascript:">오후 1시 00분</a>
												</p>
												<p class="timeChoice">
													<a href="javascript:">오후 4시 00분</a>
												</p>
											</div>
										</div>
										<div class="reservRst">
											<dl>
												<dt>날짜</dt>
												<dd><span class="date"></span></dd>
											</dl>
											<dl>
												<dt>시간</dt>
												<dd><span class="time"></span></dd>
											</dl>
						<%
						if(memberId != null) {
							List objMList = mMgr.myPage(memberId);
							RegisterBean mPList = (RegisterBean) objMList.get(0);
						%>
											<dl class="resSMList">
												<dt>
													<div class="resSMChk resChk">
														<input type="checkbox" name="" id="resSM" />
														<label for="resSM">적립금</label>
													</div>
												</dt>
												<dd>
													<div class="maxSMChk resChk">
														<input type="checkbox" name="maxSM" id="maxSM"/>
														<label for="maxSM">최대 사용</label>
													</div>
													<p>	
														
														<input type="text" class="" name="resSMP" id="resSMP" value="0" disabled="disabled"/> <span>원</span>
													</p>
													<p class="redTxt">* 최대 5000원까지 사용가능합니다.</p>
													<p class="redOverTxt">* 남은 적립금의 초과 금액은 사용불가합니다.</p>
												</dd>
												<dd>
													<div class="remainSM">
														<p class="txt">현재 남은 적립금 : <span class="charge"><%=mPList.getePay() %></span> 원</p>
													</div>
												</dd>
											</dl>
													
							<% 
						}
							%>
											<dl class="resHeadCnt">
												<dt>인원</dt>
												<dd>
													<div class="headCnt">
														<button type="button" class="decrease"><span class="blind">- 1</span></button>
														<span class="cntNum">1</span>
														<button type="button" class="increase"><span class="blind">+ 1</span></button>
													</div>
													<div class="txt">
														<p class="increseRed">* 최대 5명까지 가능합니다.</p>
														<p class="decreseRed">* 최소 1명까지 가능합니다.</p>
													</div>
												</dd>
											</dl>
											<dl class="resCPrice">
												<dt>가격</dt>
												<dd>
													<p><span class="localString price">0</span> <span>원</span></p>
												</dd>
											</dl>
										</div>
										<!-- // reservRst -->
									</div>
									
									<ul class="contInfo">
										<li>* 적립금은 5000원까지 사용가능합니다.</li>
										<li>* 적립은 결제 금액의 1% 적립됩니다.</li>
										<li>* 적립금 최대 사용은 5천원 이상 남아있을 시 사용가능합니다.</li>
									</ul>
								</div>
								<!-- // selDate -->
								
								<%
								if(memberId != null){
								%>
								<div class="btn-cont">
									<button type="button" class="btn open-modal resBtn" data-target="popup5">예매하기</button>
								</div>
								<%
								} else {
								%>
								<div class="btn-cont">
									<button type="button" onclick="alert('날짜를 선택해주세요.');">예매하기</button>
								</div>
								<%
								}
								%>
							</div>
							<!--  // reserveBox -->

						<div class="detailBox">
							<div class="detail-tab">
								<a href="javascript:" class="on"><span>상세정보</span></a> <a
									href="javascript:"><span>판매자 문의</span></a> <a
									href="javascript:"><span>관람후기</span></a> <a
									href="javascript:"><span>예매안내</span></a>
							</div>

							<div class="detail-desc">
								<section class="sec1" id="sec1">
									<p class="img">
										<img src="/images/<%=mList.getpDetailImg()%>" alt="" />
									</p>
								</section>
								<section class="sec2" id="sec2">
									<div class="inquiryBox">
										<p class="tit">판매자 문의</p>

										<ul class="sec-list">
											<li>예매/배송 및 환불 관련 문의사항은 마이페이지 내 1:1문의를 이용해주세요.</li>
											<li>판매자 문의 게시판을 통한 취소나 환불 신청은 처리되지 않습니다.</li>
											<li>상품과 관련되지 않은 내용이나 비방, 홍보글, 도배글, 개인정보가 포함된 글, 불법양도글 및
												거래글은 예고없이 삭제될 수 있습니다.</li>
										</ul>

										<%
										if(memberId != null){
											if(prodMgr.listWSOutput(pNo, memberId).size() > 0){
												List objWSList = prodMgr.listWSOutput(pNo, memberId);
	
												for (int i = 0; i < objWSList.size(); i++) {
														ProWSelBean pWSList = (ProWSelBean) objWSList.get(i);
										%>
										<div class="inquiry-writeCont">
											<p class="tit">나의 판매자 문의 내역</p>

											<div class="write-cont">
												<form action="/product/listViewReProc.jsp" method="post"
													class="listViewFormRe">
													<input type="hidden" name="pWpNo" value=<%=pNo%> />
													<input type="hidden" name="pWUId" value=<%=memberId%> />
													<textarea name="qnaContsWrite" id="qnaContsWrite"
														class="qnaWrite" placeholder="" disabled><%=pWSList.getpWrite()%></textarea>
													<div class="txtLength">
														<span><em></em> / 500</span>
													</div>
													<div class="btn-cont">
														<button type="button" class="modBtn">수정</button>
														<button type="button" class="delBtn">삭제</button>
													</div>
												</form>

												<p class="txt">판매자 문의 작성은 1개만 가능합니다. 기존 문의 삭제 후 다시
													작성가능합니다.</p>
											</div>
											<!--  // write-cont -->
										</div>
										<!-- // inquiry-writeCont -->
										<%
													}
												} else{
										%>
										<div class="btn-cont">
											<button type="button" class="btn open-modal write" data-target="popup1">문의 작성하기</button>
										</div>
										<%
												}
											}else {
										%>
											<div class="btn-cont">
												<button type="button" class="btn write"
													onclick="alert('로그인 후 작성가능합니다.'); location.href='/member/login.jsp'">문의
													작성하기</button>
											</div>
										<%
										}
										%>
									</div>
									<!-- // "inquiryBox" -->
								</section>
								<section class="sec3" id="sec3">
									<div class="reviewBox">
										<p class="tit">관람후기</p>
										<%
										List objRevList = prodMgr.listRevOutput(pNo);
										int cnt = prodMgr.proRevCount(pNo);
										if(cnt != 0){
										%>
										<div class="only-photo">
											<p class="txt">
												포토 리뷰 <span>총 <em><%=cnt%></em>개</span>
											</p>

											<div class="photo-list swiper-container">
												<!-- Add Arrows -->
												<div class="swiper-button-next"></div>
												<div class="swiper-button-prev"></div>
												<div class="swiper-wrapper">
										<%
										
											for (int i = 0; i < objRevList.size(); i++) {
												ProRevBean revList = (ProRevBean) objRevList.get(i);
												if(revList.getpRevImg() != null){
										%>
													<div class="swiper-slide">
														<a href="javascript:" class="btn open-modal photoList pPreview" data-target="popup4"><img
															src="/images/fileUpload/<%=revList.getpRevImg()%>" alt=""  /></a>
													</div>
										<%
												}
											}
										%>
												</div>
											</div>
										</div>
										<!--  // only-photo -->
										<%
										}
										%>

										<div class="review-top">
										<%
										if(prodMgr.listRevOutput(pNo).size() > 0){
										%>
											<ul class="left-tab">
												<li><a href="javascript:" class="on"><span>최신순</span></a></li>
												<li><a href="javascript:"><span>좋아요순</span></a></li>
											</ul>
										<%
										}
										
										boolean revWCnt = prodMgr.revWCnt(memberId, pNo);
										if (memberId != null && !revWCnt) {
										%>
											<div class="btn-cont">
												<button type="button" class="btn open-modal review"
													data-target="popup2">관람리뷰 작성하기</button>
											</div>
										<%
										} else if(memberId == null){
										%>
											<div class="btn-cont">
												<button type="button" class="btn review"
													onclick="alert('로그인 후 작성가능합니다.'); location.href='/member/login.jsp'">관람리뷰 작성하기</button>
											</div>
										<%
										} // if (memberId != null && revWCnt == 0) 
										%>
										</div>

										<%
										if(memberId != null){
										%>
										<p class="logTxt">* 나의 리뷰 수정은 마이페이지에서 가능합니다.</p>
										<%
										}
										%>
										
										<ul class="revList">
										<%
										if(prodMgr.listRevOutput(pNo).size() > 0){
											
											for (int i = 0; i < objRevList.size(); i++) {
												ProRevBean revList = (ProRevBean) objRevList.get(i);
										%>
											<li>
												<div class="reviewInfo">
													<div class="txt-area">
										<%
												int revPhotoChk = revList.getpRevPhoto();
												String revRecom = revList.getpRevDate();
												String[] revRecom1 = revRecom.split(" ");
												int revStar = revList.getpRevStar();
												String pRevUId = revList.getpRevUId();
												
												if (revPhotoChk > 0) {
										%>
															<a href="javascript:" class="photo pPreview btn open-modal" data-target="popup3"><img
															src="/images/fileUpload/<%=revList.getpRevImg()%>" alt="" /><span
															class="blind">포토리뷰</span></a>
										<%
												}
										%>
														
														<div class="reviewRef"></div>
														<p class="txt"><%=revList.getpRevCont()%></p>
														<ul class="txtInfo">
															<input type="hidden" name="wRecom" id="wRecom" value="<%=revList.getpRevRecom()%>" />
															<input type="hidden" name="wPNo" id="wPNo" value="<%=pNo %>" />
															<input type="hidden" name="wUId" id="wUId" value="<%=revList.getpRevUId()%>" />
															
															<li class="wUseId"><span><%=revList.getpRevUId()%></span></li>
															<li class="wDate"><span><%=revRecom1[0]%></span></li>
										<%
												if (memberId != null) {
										%>
															<li class="wRecom"><a href="javascript:" class="revRecomBtn"><span
																	class="blind">추천하기</span><em class="cnt"><%=revList.getpRevRecom()%></em></a></li>
										<%
													if (memberId.equals(pRevUId)) {
										%>
															<li class="wDel"><a href="javascript:" title="나의 리뷰 삭제" class="revDelBtn"><img src="/images/icon-delete-btn.png"></a></li>
																	
										<%
													}
												}else {
										%>
															<li class="wRecom"><a href="javascript:"  class="revRecomBtn"
																onclick="alert('로그인 후 가능합니다.'); location.href='/member/login.jsp'"><span
																	class="blind">추천하기</span><%=revList.getpRevRecom()%></a></li>
																	
										<%
												}
										%>
														</ul>
														<div class="review-star star-rating">
															<div class="rateChk">
										<%
												for(int t = 1; t <= revStar; t++){
										%>
																<div class="chk-group checked">
																	<input type="checkbox" name="rateStar" id="rateStar" value=""/> 
																	<label for="rateStar"><a href="javascript:"><span class="blind"></span></a></label>
																</div>
										<%
												}
													
												for(int t = 1; t <= 5 - revStar; t++){
										%>
																<div class="chk-group">
																	<input type="checkbox" name="rateStar" id="rateStar" value=""  /> 
																	<label for="rateStar"><a href="javascript:"><span class="blind"></span></a></label>
																</div>
										<%
												}
										%>
															</div>
														</div>
													</div>
												</div>
											</li>
										<%
											}
										}
										%>
										</ul>
									</div>
								</section>
								<section class="sec4" id="sec4">
									<div class="bInfoBox">
										<p class="tit">티켓 수령안내</p>
										<p class="txt">현장수령</p>

										<ul class="sec-list">
											<li>관람일 당일 예매내역 또는 예매자의 신분증을 제시 후 티켓을 수령하여 입장합니다.</li>
											<li>상품별로 티켓수령방법 및 입장 정책이 상이할 수 있습니다. 상품 상세정보를 확인해주시기
												바랍니다.</li>
										</ul>

										<p class="txt">배송</p>

										<ul class="sec-list">
											<li>관람일 당일 예매내역 또는 예매자의 신분증을 제시 후 티켓을 수령하여 입장합니다.</li>
											<li>상품별로 티켓수령방법 및 입장 정책이 상이할 수 있습니다. 상품 상세정보를 확인해주시기
												바랍니다.</li>
										</ul>

										<p class="txt">모바일티켓</p>

										<ul class="sec-list">
											<li>관람일 당일 예매내역 또는 예매자의 신분증을 제시 후 티켓을 수령하여 입장합니다.</li>
											<li>상품별로 티켓수령방법 및 입장 정책이 상이할 수 있습니다. 상품 상세정보를 확인해주시기
												바랍니다.</li>
										</ul>

										<p class="tit">취소/환불 안내</p>
										<p class="txt">예매취소/변경</p>

										<ul class="sec-list">
											<li>예매취소는 ‘마이페이지>공연티켓 예매확인/취소’에서 직접취소 또는 전화(위메프 고객센터 <a
												href="tel:1661-4764">1661-4764</a>)로 가능합니다.
											</li>
											<li>취소마감시간 이후 또는 관람일 당일 예매하신 건에 대해서는 취소/변경/환불이 불가합니다.
												(취소마감시간은 상품/관람일에 따라 다를 수 있으며 예매 시 확인할 수 있습니다.)</li>
											<li>예매완료 후 관람일, 좌석 등의 변경을 원하실 경우 기존 예매건을 취소 후 재예매하셔야
												합니다.</li>
										</ul>

										<p class="tit">취소 수수료</p>

										<table class="bInfo-table">
											<caption>취소 수수료</caption>
											<colgroup>
												<col width=230px />
												<col width=* />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">취소일</th>
													<th scope="col">취소수수료</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row">예매 후 7일이내</th>
													<td>없음</td>
												</tr>
												<tr>
													<th scope="row">예매 후 8일 ~ 관람일 10일전</th>
													<td>없음</td>
												</tr>
												<tr>
													<th scope="row">관람일 9일전 ~ 7일전</th>
													<td>없음</td>
												</tr>
												<tr>
													<th scope="row">관람일 6일전 ~ 3일전</th>
													<td>없음</td>
												</tr>
												<tr>
													<th scope="row">관람일 2일전 ~ 1일전</th>
													<td>없음</td>
												</tr>
												<tr></tr>
											</tbody>
										</table>

										<ul class="sec-list">
											<li>예매 당일 밤 12시 이내 취소 시에는 취소수수료가 부과되지 않습니다. (취소마감시간 내에
												한함)</li>
											<li>예매수수료는 예매 당일 밤 12시 이내 취소 시 환불 가능하며, 그 이후에는 환불되지
												않습니다.</li>
											<li>관람일 당일 취소/변경/환불은 불가합니다.</li>
											<li>단, 관람일 당일 취소가 가능한 일부 상품의 경우 당일 취소 시 티켓금액의 90%가
												취소수수료로 부과됩니다.</li>
											<li>관람일 당일 취소가 가능한 상품인 경우에도 취소마감일시가 지난 경우 취소하실 수 없습니다.</li>
										</ul>
										<p class="txt">미사용티켓 환불 대상 상품</p>

										<ul class="sec-list">
											<li>사용기간 내 사용하지 못한 티켓은 사용기간 종료일로부터 7일 내 위메프 포인트로
												적립해드립니다.</li>
											<li>미사용티켓 환불 시 예매수수료를 제외한 금액이 위메프 포인트로 적립됩니다.</li>
											<li>티켓을 배송 받으신 경우 미사용 티켓 환불을 받으실 수 없습니다.</li>
										</ul>
									</div>
								</section>
							</div>
							<!-- // detail-desc -->
						</div>
						<!-- // detail-box -->
					</div>
					<!-- // detail-cont -->
					<div class="btn-cont proListMov">
						<button type="button" class="" onclick=" location.href='/product/list.jsp' "><span>목록</span></button>
					</div>
				</div>
				<!--  // proList-view -->

			</div>
		</div>

		<%@ include file="/include/footer.jsp"%>
		<%@ include file="/popup/productPop.jsp"%>
	</div>
	<!-- div#wrap -->
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script src="/source/swiper.min.js"></script>
	<script src="/source/gsap.min.js"></script>
	<script src="/script/script.js"></script>
	<script src="/script/memberScript.js"></script>
	<script src="/script/calendar.js"></script>
</body>
</html>