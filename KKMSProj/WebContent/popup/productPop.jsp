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

			<form action="/product/listViewReviewProc.jsp" method="post"
				class="listViewRevForm">
				<input type="hidden" name="pNo" value="<%=pNo%>" /> <input
					type="hidden" name="uId" value="<%=memberId%>" /> <input
					type="hidden" id="rateCalc" name="rateCalc" value="" />

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
				</div>

				<div class="btn-cont">
					<button type="button" class="inquiryBtn qnaContRevSubmit">등록</button>
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
					<div class="review-star star-rating">
						<div class="rateChk">
							<div class="chk-group checked">
								<input type="checkbox" name="rateStar" id="rateStar" value="" />
								<label for="rateStar"><a href="javascript:"><span
										class="blind">점</span></a></label>
							</div>
							<div class="chk-group">
								<input type="checkbox" name="rateStar" id="rateStar" value="" />
								<label for="rateStar"><a href="javascript:"><span
										class="blind">점</span></a></label>
							</div>
						</div>
					</div>


					<p class="txt"></p>
					
					<ul class="txtInfo">
						<li class="wUseId"><span></span></li>
						<li class="wDate"><span></span></li>
						<li class="wRecom"><a href="javascript:"><span class="blind">추천하기</span><em class="cnt"></em></a></li>
					</ul>
				</div>
				<!-- // right-desc -->
			</div>
			<!-- // pop_photo -->
		</div>
		<!-- // pop_div -->

		<div class="pop_close">
			<a href="javascript:" class="close-modal"><span class="blind">닫기</span></a>
		</div>
	</div>
	<!-- // pop_body -->
</div>
<!-- // pop_wrap -->