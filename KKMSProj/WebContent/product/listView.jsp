<%@page import="pack_product.proListBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="prodMgr" class="pack_product.productMgr" />
<%
request.setCharacterEncoding("UTF-8");

String pNo = request.getParameter("pNo");
int pNo1 = Integer.parseInt(pNo);

List objList = prodMgr.listOutput();
proListBean mList = (proListBean) objList.get(pNo1 - 1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=mList.getpTitle()%></title>
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

				<div class="proList-view">
					<div class="top-cont">
						<div class="flag-desc">
							<div class="flag">
								<span class="event"><%=mList.getpFlag1()%></span> <span
									class="event"><%=mList.getpFlag2()%></span>
							</div>
						</div>

						<div class="txt-desc">
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
									<img src="/images/product-list-img<%=pNo1%>.jpg" alt="" />
								</p>
								<div class="likeClk">
									<div class="chk-group">
										<input type="checkbox" value="" id="like"/>
										<label for="like">찜하기</label>
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
											<span class="date"><%=mList.getpDate1()%> - <%=mList.getpDate2()%></span>
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
												<span class="original"> <span class="rate-sale"><em><%=mList.getpSalePercent()%></em>%</span>
													<del><%=mList.getpOriPrice()%></del><span>원</span>
												</span> <span class="discount-price"> <ins></ins><span>원</span>
												</span>
											</div>
										</dd>
									</dl>
								</div>
							</div>
						</div>
						<!--  // infoBox -->
						
						<div class="reserveBox">
							<div class="selDate on">
								<p class="txt">날짜/시간 선택</p>
								
								<div class="date-desc">
									<div class="dateBox">
										date영역
									</div>
									<div class="timeBox">
										시간 선택 영역
									</div>
								</div>
							</div>
							<!-- // selDate -->
							
							<div class="selReserve">
								<p class="txt">예매 가능 좌석</p>
								
								<div class="resv-desc">
									리스트
								</div>
							</div>
						</div>
						<!--  // reserveBox -->
					</div>
					<!-- // detail-cont -->
					
				</div>
				<!--  // proList-view -->

			</div>
		</div>

		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->
</body>
</html>