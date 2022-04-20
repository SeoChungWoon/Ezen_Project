<%@page import="pack_Product.ProListBean"%>
<%@page import="java.util.List"%>
<%@page import="pack_Product.ProductMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="prodMgr" class="pack_Product.ProductMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전시 리스트</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
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
						<li class="area-color"><a href="javascript:"><span>서울</span></a></li>
						<li class="area-color"><a href="javascript:"><span>경기/인천</span></a></li>
						<li class="area-color"><a href="javascript:"><span>대전/충청/강원</span></a></li>
					</ul>

					<div class="area-desc">
						<!-- 
						<div class="desc-type">
							<p class="txt">지역별 보기</p>
						</div>

						<ul class="area-tab">
							<li class="on"><a href="javascript:">전체</a></li>
							<li><a href="javascript:">서울</a></li>
							<li><a href="javascript:">경기/인천</a></li>
							<li><a href="javascript:">대전/충청/강원</a></li>
						</ul>
						 -->
						<div class="right-srh">
							<ul class="rank-tab">
								<li class="on"><a href="javascript:">인기순</a></li>
								<li><a href="javascript:">할인순</a></li>
								<li><a href="javascript:">최신순</a></li>
								<li><a href="javascript:">종료임박순</a></li>
							</ul>
						</div>
					</div>

					<div class="exhibit-list">
						<%
						request.setCharacterEncoding("UTF-8");
						List objList = prodMgr.listOutput();
						int cnt = prodMgr.proListCount();
						boolean wishChk = false;

						if (cnt != 0) {
							for (int i = 0; i < objList.size(); i++) {
								ProListBean mList = (ProListBean) objList.get(i);

								int pNo = mList.getpNo();
								if (memberId != null) {
									List objWishList = prodMgr.wishList(memberId);
									for (int j = 0; j < objWishList.size(); j++) {
										ProListBean wList = (ProListBean) objWishList.get(j);
										int wish = wList.getpNo();
										if (i + 1 == wish) {
											wishChk = true;
											break;
										} else {
											wishChk = false;
										}
									}
								}
						%>
						<div class="listBox">
							<a href="/product/listView.jsp?pNo=<%=pNo%>">
								<div class="likeClk">
									<div class="chk-group">
										<input type="checkbox" value="" id="like"/>
										<input type="hidden" value="<%=memberId%>">
										<input type="hidden" value="<%=pNo %>">
										<input type="checkbox" value="<%=wishChk %>" class="wishChk" id="like"/>
										<label for="like"></label>
										<div class="wishRes hidden"></div>
									</div>
								</div>
								<p class="img">
									<img src="/images/product-list-img<%=i + 1%>.jpg" alt="" />
								</p>
								<div class="txt-info">
									<div class="flag-desc">
										<p class="flag">
											<span class="event"><%=mList.getpFlag1()%></span> <span
												class="event"><%=mList.getpFlag2()%></span>
										</p>
									</div>

									<p class="sub-txt">
										<span class="location"><%=mList.getpArea()%></span> <span
											class="info"><%=mList.getpInfoTxt()%></span>
									</p>

									<p class="tit">
										[<span class="area"><%=mList.getpArea()%></span><em>, </em><span
											class="group"><%=mList.getpGroup()%></span>]
										<%=mList.getpTitle()%></p>
									<p class="explain-txt">
										<span class="date"><%=mList.getpDate1()%> - <%=mList.getpDate2()%></span>
										<span class="content"><%=mList.getpContent()%></span>
									</p>
									<p class="price sale">
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
									</p>
								</div>
							</a>
						</div>
						<!-- // listBox -->
						<%
						}
						} else {
						%>
						<%@ include file="/product/listNodata.jsp"%>
						<%
						}
						%>
					</div>
					<!--  // exhibit-list -->
				</div>
				<!-- //exhibit-cont -->

			</div>
		</div>

		<%@ include file="/include/footer.jsp"%>

	</div>
	<!-- div#wrap -->
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script src="/source/gsap.min.js"></script>
	<script src="/script/script.js"></script>
	<script src="/script/memberScript.js"></script>
</body>
</html>