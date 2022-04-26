<%@page import="pack_Product.ProListBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 팝업 -->
<div class="pop_dimd"></div>


<!-- 내가 쓴 리뷰 보기 -->
<div class="pop_wrap modal" id="popup1">
	<div class="pop_body">
		<div class="pop_div">
			<p class="pop_tit">내가 쓴 리뷰</p>
				<%
					if (objRList.size() == 0) {
				%>

				<div class="resMsg">
					<span>작성한 리뷰가 없습니다.</span>
				</div>
				<%
					} else {
				%>
				<div class="resMsg">
					<span> <%=objRList.size()%>개의 리뷰가 있습니다.
					</span>
				</div>
				<hr>
				<div class="scroll_div">
				<div class="myReviewArea">

				<%
				for (int i = 0; i < objRList.size(); i++) {
					ProRevBean rBean = (ProRevBean) objRList.get(i);
					int pNo = rBean.getpRevPNo();
					ProListBean pBean = (ProListBean) objPList.get(pNo - 1);
				%>
				
				<div class="myReviewRow dFlex">
					<div class="myReviewBanner">
						<input type="hidden" class="rPNo" value="<%=pNo%>">
						<a href="/product/listView.jsp?pNo=<%=pNo%>"> <img
							src="/images/<%=pBean.getpImg()%>" alt="" />
						</a>
					</div>
					<div class="myReview-cont">
						<div class="myReviewContent dFlex">
							<div class="myReviewTxt"><%=rBean.getpRevCont()%></div> <img
								src="/images/fileUpload/<%=rBean.getpRevImg()%>" alt="" />
						</div>
						<div class="myReviewStar">
							<input type="hidden" class="myReviewStarpoint" value="<%=rBean.getpRevStar() %>">
							<img src="/images/product-detail-star.png" alt="" />
						</div>
						<div class="myReviewDate">
							<span><%=rBean.getpRevDate()%></span>
						</div>
						<div class="myReviewRecom revRecomBtn">
							<span><%=rBean.getpRevRecom()%></span>
							
						</div>
						<div class="myReviewDel">
							<a href="javascript:" class="myReviewDel"><img src="/images/icon-delete-btn.png" alt="" /></a>
							<div class="reviewRef"></div>							
						</div>
					</div>
				</div>
				<%
					}
				}
				%>
			</div>
			<!-- div.myReviewArea -->
			</div>
			<!-- div.scroll_div -->
		</div>
		<!-- // pop_div -->

		<div class="pop_close">
			<a href="javascript:" class="close-modal"><span class="blind">닫기</span></a>
		</div>
	</div>
	<!-- // pop_body -->
</div>
<!-- // pop_wrap -->


<!-- 내 예매내역 보기 -->
<div class="pop_wrap modal" id="popup2">
	<div class="pop_body rsvWidth">
		<div class="pop_div">
			<p class="pop_tit">예매 내역</p>
				<div class="resMsg">
					<span> <%=objRsvList.size()%>건의 예매 내역이 있습니다.
					</span>
				</div>
				<hr>
				<div class="scroll_div">
				<div class="myReserveArea">

				<%
				for (int i = 0; i < objRsvList.size(); i++) {
					ProReservBean rsvBean = (ProReservBean) objRsvList.get(i);
					int pNo = rsvBean.getpResPNo();
					ProListBean pBean = (ProListBean) objPList.get(pNo - 1);
				%>
				<div class="myReserveRow dFlex">
					<div class="myReserveBanner">
						<input type="hidden" class="rPNo" value="<%=pNo%>">
						<a href="/product/listView.jsp?pNo=<%=pNo%>"> <img
							src="/images/<%=pBean.getpImg()%>" alt="" />
						</a>
					</div>
					<div class="myReserve-cont">
						<div class="myReserveContent">
							<div class="myReserveTitle"><%=pBean.getpTitle()%></div> 
						</div>
						<div class="myReserveDate">
							<div class="reserveDate"><span>예약 일자 : </span><%=rsvBean.getpResDate() %></div>
							<div class="reserveTime"><span>예약 시간 : </span><%=rsvBean.getpResTime() %></div>
						</div>
						<div class="myReserveHead">
							<span>총 인원 : </span><%=rsvBean.getpResHead()%> 명
						</div>
						<div class="myReservePrice">
							<span>총 결제 금액 : </span> <span class="reservePrice"><%=rsvBean.getpResPrice()%></span>
						</div>
						<div class="myReservePay">
							<div class="howToPay"><span>결제 수단 : </span><%=rsvBean.getpResCPay() %></div>
							<div class="payAccount">
								<div class="payAccountTitle">결제 계좌</div>
								<div class="payAccountVal"><%=rsvBean.getpResCAccount() %></div>
							</div>
							<!-- div.payAccount -->
						</div>
						<!-- div.myReservePay -->
					</div>
				</div>
				<%
					}
				
				%>
			</div>
			<!-- div.myReserveArea -->
			</div>
			<!-- div.scroll_div -->
		</div>
		<!-- // pop_div -->

		<div class="pop_close">
			<a href="javascript:" class="close-modal"><span class="blind">닫기</span></a>
		</div>
	</div>
	<!-- // pop_body -->
</div>
<!-- // pop_wrap -->





<div class="pop_close">
	<a href="javascript:" class="close-modal reviewBtn"><span
		class="blind">닫기</span></a>
</div>
</div>
<!-- // pop_body -->
</div>
<!-- // pop_wrap -->