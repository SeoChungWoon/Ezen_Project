<%@page import="pack_Product.ProListBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 팝업 -->
<div class="pop_dimd"></div>


<!-- 리뷰 이미지 미리보기 -->
<div class="pop_wrap modal" id="popup1">
	<div class="pop_body">
		<div class="pop_div">
			<p class="pop_tit">내가 쓴 리뷰</p>
				<div class="scroll_div">
				<%
					if (objRList.size() == 0) {
				%>
				<div id="myReviewArea">

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

				<%
				for (int i = 0; i < objRList.size(); i++) {
					ProRevBean rBean = (ProRevBean) objRList.get(i);
					int pNo = rBean.getpRevPNo();
					ProListBean pBean = (ProListBean) objPList.get(pNo - 1);
				%>
				<div class="myReviewRow">
					<div class="myReviewBanner">
						<a href="/product/listView.jsp?pNo=<%=pNo%>"> <img
							src="/images/<%=pBean.getpImg()%>" alt="" />
						</a>
					</div>
					<div class="myReview-cont">
						<div class="myReviewContent">
							<span><%=rBean.getpRevCont()%></span> <img
								src="/images/<%=rBean.getpRevImg()%>" alt="" />
						</div>
						<div class="myReviewStar">
							<%
							for (int j = 0; j < rBean.getpRevStar(); j++) {
							%>
							<div class="myReviewStarpoint">
								<img src="/images/product-detail-star.png" alt="" />
							</div>
							<%
							}
							%>
						</div>
						<div class="myReviewDate">
							<span><%=rBean.getpRevDate()%></span>
						</div>
						<div class="myReviewRecom">
							<%=rBean.getpRevRecom()%>
						</div>
						<div class="myReviewDel">
							<img src="/images/icon-delete-btn.png" alt="" />
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




<div class="pop_close">
	<a href="javascript:" class="close-modal reviewBtn"><span
		class="blind">닫기</span></a>
</div>
</div>
<!-- // pop_body -->
</div>
<!-- // pop_wrap -->