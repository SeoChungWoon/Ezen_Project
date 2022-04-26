<%@page import="pack_Product.ProListBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 팝업 -->
<div class="pop_dimd"></div>

<!-- 판매자 문의  -->
<div class="pop_wrap modal" id="popup1">
	<div class="pop_body">
		<div class="pop_div">
			<p class="pop_tit">판매자 문의 작성</p>

			<form action="/product/listViewProc.jsp" method="post"
				class="listViewForm">
				<input type="hidden" id="pWSId" name="uId" value="<%=memberId%>">
				<input type="hidden" id="pWPNo" name="pNo" value="<%=pNo%>">
				<div class="inquiry-txt">
					<textarea name="qnaConts" id="qnaConts" class="qnaWrite"
						placeholder="문의를 작성해주세요."></textarea>
					<div class="txtLength">
						<span><em>0</em> / 500</span>
					</div>
				</div>

				<div class="btn-cont">
					<button type="button" class="inquiryBtn qnaContsSubmit">등록</button>
					<button type="button" class="reset">초기화</button>
				</div>
			</form>
		</div>
		<!-- // pop_div -->

		<div class="pop_close">
			<a href="javascript:" class="close-modal"><span class="blind">닫기</span></a>
		</div>
	</div>
	<!-- // pop_body -->
</div>
<!-- // pop_wrap -->

<!-- 리뷰 작성 -->
<div class="pop_wrap modal" id="popup2">
	<div class="pop_body">
		<div class="pop_div">
			<p class="pop_tit">관람리뷰 작성</p>

			<div class="pop_review">
				<form action="/product/listViewReviewProc.jsp" method="post" enctype="multipart/form-data" class="listViewRevForm" >
					<input type="hidden" name="pNo" id="pNo" value="<%=pNo%>" /> 
					<input type="hidden" name="uId" value="<%=memberId%>" /> 
					<input type="hidden" id="rateCalc" name="rateCalc" value="" />
					<input type="hidden" id="fileName" name="fileName" value="" />
	
					<div class="star-rating">
						<div class="rateChk">
							<div class="chk-group">
								<input type="checkbox" name="rate1" id="rate1" value=""
									title="1점" /> <label for="rate1"><a href="javascript:"><span
										class="blind">1점</span></a></label>
							</div>
							<div class="chk-group">
								<input type="checkbox" name="rate2" id="rate2" value=""
									title="2점" /> <label for="rate2"><a href="javascript:"><span
										class="blind">2점</span></a></label>
							</div>
							<div class="chk-group">
								<input type="checkbox" name="rate3" id="rate3" value=""
									title="3점" /> <label for="rate3"><a href="javascript:"><span
										class="blind">3점</span></a></label>
							</div>
							<div class="chk-group">
								<input type="checkbox" name="rate4" id="rate4" value=""
									title="4점" /> <label for="rate4"><a href="javascript:"><span
										class="blind">4점</span></a></label>
							</div>
							<div class="chk-group">
								<input type="checkbox" name="rate5" id="rate5" value=""
									title="5점" /> <label for="rate5"><a href="javascript:"><span
										class="blind">5점</span></a></label>
							</div>
						</div>
						<!-- // rateChk -->
					</div>
					<!--  // star-rating -->
	
					<ul class=txtList>
						<li>평점은 최소 별 한개이상 가능합니다.</li>
						<li>관람후기 평점은 실제 예매자의 평점만 반영됩니다.</li>
					</ul>
	
					<div class="inquiry-txt">
						<textarea name="qnaContRev" id="qnaContRev" class="qnaWrite"
							placeholder="리뷰를 작성해주세요."></textarea>
						<div class="txtLength">
							<span><em>0</em> / 500</span>
						</div>
						
						<div class="file-cont">
							<div class="file-group">
								<input type="file" name="pWfile" id="pWfile" onchange="fileVal(this)">
								<button type="button" class="fileBtn"><span>파일첨부</span></button>
								
								<div class="file-name">
									<span></span>
									<a href="javascript:" class="fileDel"><span class="blind">삭제</span></a>
								</div>
							</div>
							
							<p class="txt">* 첨부파일은 jpg, png, gif 파일로 1개만 가능합니다.(용량제한 : 10MB)</p>
						</div>
					</div>
	
					<div class="btn-cont">
						<button type="button" class="inquiryBtn qnaContRevSubmit">등록</button>
						<button type="button" class="reset">초기화</button>
					</div>
				</form>
			</div>
		</div>
		<!-- // pop_div -->

		<div class="pop_close">
			<a href="javascript:" class="close-modal"><span class="blind">닫기</span></a>
		</div>
	</div>
	<!-- // pop_body -->
</div>
<!-- // pop_wrap -->


<!-- 리뷰 이미지 미리보기 -->
<div class="pop_wrap modal imgPop" id="popup3">
	<div class="pop_body">
		<div class="pop_div">
			<p class="pop_tit">이미지 미리보기</p>

			<div class="img">
				<img src="" alt="" />
			</div>
		</div>
		<!-- // pop_div -->

		<div class="pop_close">
			<a href="javascript:" class="close-modal"><span class="blind">닫기</span></a>
		</div>
	</div>
	<!-- // pop_body -->
</div>
<!-- // pop_wrap -->


<!-- 포토 리뷰 이미지 상세정보 -->
<div class="pop_wrap modal imgPop" id="popup4">
	<div class="pop_body">
		<div class="pop_div">
			<p class="pop_tit">포토리뷰 상세보기</p>
			<div class="pop_photo">
				<div class="left-desc">
					<div class="img">
						<img src="" alt="" />
					</div>
				</div>

				<div class="right-desc">
					<div class="reviewInfo">
						<div class="reviewRef"></div>
						
						<div class="review-star star-rating">
							<div class="rateChk">
							</div>
						</div>

						<p class="txt"></p>
					
						<ul class="txtInfo">
							<li class="wUseId"><span></span></li>
							<li class="wDate"><span></span></li>
							<li class="wRecom"><a href="javascript:" class="revRecomBtn"><span class="blind">추천하기</span><em class="cnt"></em></a></li>
						</ul>
					</div>
				</div>
				<!-- // right-desc -->
			</div>
			<!-- // pop_photo -->
		</div>
		<!-- // pop_div -->

		<div class="pop_close">
			<a href="javascript:" class="close-modal reviewBtn"><span class="blind">닫기</span></a>
		</div>
	</div>
	<!-- // pop_body -->
</div>
<!-- // pop_wrap -->


<!-- 예매하기 확인 -->
<div class="pop_wrap modal reservePop" id="popup5">

	<div class="pop_body">
		<div class="pop_div">
			<p class="pop_tit">예매 내역</p>
	
			<form action="/product/listReserveComplete.jsp" method="post" class="reserveForm">
				<input type="hidden" name="pResPNo" id="pResPNo" value="<%=pNo %>"/>
				<input type="hidden" name="pResUId" id="pResUId" value="<%=memberId %>"/>
				<!-- 시간 -->
				<input type="hidden" name="pResDate" id="pResDate" value=""/>
				<!-- 날짜 -->
				<input type="hidden" name="pResTime" id="pResTime" value=""/>
				<!-- 사용한 적립금 -->
				<input type="hidden" name="pResUseM" id="pResUseM" value=""/>
				<!-- 남은 적립금 -->
				<input type="hidden" name="ePay" id="ePay" value=""/>
				<!-- 적립 예정 적립금 -->
				<input type="hidden" name="pResplanM" id="pResplanM" value=""/>
				<!-- 인원 수 -->
				<input type="hidden" name="pResHead" id="pResHead" value=""/>
				<!-- 결제 가격 -->
				<input type="hidden" name="pResPrice" id="pResPrice" value=""/>
				<!-- 무통장 입금 -->
				<input type="hidden" name="pResCPay" id="pResCPay" value=""/>
				<!-- 입금 계좌 번호 -->
				<input type="hidden" name="pResCAccount" id="pResCAccount" value=""/>
				
				<div class="pop_reserve">
					<div class="tit"><%=mList.getpTitle() %></div>
					
					<div class="desc-type">
						<div class="left">
							<p class="img"><img src="/images/<%=mList.getpImg() %>" alt="" /></p>
						</div>
						
						<div class="right">
							<dl class="date">
								<dt>날짜</dt>
								<dd></dd>
							</dl>
							<dl class="time">
								<dt>시간</dt>
								<dd></dd>
							</dl>
							<dl class="headCnt">
								<dt>인원</dt>
								<dd>
									<span class="num"></span> <span>명</span>
								</dd>
							</dl>
							<dl class="useSM">
								<dt>사용한 적립금</dt>
								<dd class="use"></dd>
							</dl>
							<dl class="remainSM">
								<dt>현재 남은 적립금</dt>
								<dd class="remain"></dd>
							</dl>
							<dl class="planSM">
								<dt>적립 예정 적립금</dt>
								<dd class="plan"></dd>
							</dl>
							<dl class="getPrice">
								<dt>결제 금액</dt>
								<dd>
									<span class="price"></span> <span>원</span>
								</dd>
							</dl>
							<dl>
								<dt>결제 수단 선택</dt>
								<dd>
									<div class="charge-cont">
										<div class="radio-desc">
											<div class="radio-group">
												<input type="radio" name="rCharge" id="credit" disabled/>
												<label for="credit">신용카드</label>
											</div>
											<div class="radio-group rChecked">
												<input type="radio" name="rCharge" id="account" />
												<label for="account">무통장 입금</label>
											</div>
										</div>
										<select name="resSel" id="resSel" title="입금 계좌번호 선택">
											<option value="">계좌 선택하기</option>
											<option value="신한 110-000-000000 (예금주 : 서청운)">신한 110-000-000000 (예금주 : 서청운)</option>
											<option value="우리 1002-000-000000 (예금주 : 서청운)">농협 1002-000-000000 (예금주 : 서청운)</option>
											<option value="기업 010-1111-2222 (예금주 : 서청운)">기업 010-1111-2222 (예금주 : 서청운)</option>
										</select>
									</div>
									<p class="txtRed">* 죄송합니다.현재 무통장입금 결제만 가능합니다.</p>
								</dd>
							</dl>
						</div>
					</div>
					<!-- // desc-type -->
					<div class="btn-cont">
						<button type="button" class="chargeBtn">결제하기</button>
					</div>
				</div>
				<!-- // pop_reserve -->
			</form>
	
		</div>
		<!-- // pop_div -->

		<div class="pop_close">
			<a href="javascript:" class="close-modal reviewBtn"><span class="blind">닫기</span></a>
		</div>
	</div>
	<!-- // pop_body -->
</div>
<!-- // pop_wrap -->