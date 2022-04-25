<%@page import="pack_Product.ProListBean"%>
<%@page import="pack_Member.RegisterBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />
<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket :마이페이지</title>
<link rel="stylesheet" href="/style/swiper.min.css">
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/swiper.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
</head>
<body>
	<div id="wrap">
		<%@ include file="/include/sellerHeader.jsp"%>
		<%
		if (memberId == null) {
		%>
		<script>
			location.href = "/index.jsp";
		</script>
		<%
		} else {
		List objWishList = pMgr.wishList(memberId);
		List objPList = pMgr.listOutput();
		List objList = mMgr.myPage(memberId);
		RegisterBean mList = (RegisterBean) objList.get(0);
		
		%>
		<div class="sub-body">
			<div class="inner">
				<div class="mypageInner dFlex">
					<aside class="mypageAside">
						<div class="mypageMenu mLnbOn">
							<a href="/sellerPage/sellerMypage.jsp">My page</a>
						</div>
						<div class="mypageMenu">
							<a href="/sellerPage/sellerModify.jsp">회원정보 수정</a>
						</div>
						<div class="mypageMenu">
							<a href="/sellerPage/sellerWithdraw.jsp">회원 탈퇴</a>
						</div>
					</aside>
					<div class="mypageArea">
						<div class="mypageTit">
							<h1>My page</h1>
						</div>
						<!-- div.mypageTit -->
						<div class="mypageRow dFlex">
							<div class="mypageTitle">아이디</div>
							<div class="mypageVal"><%=mList.getuId()%></div>
						</div>
						
						<div class="mypageRow dFlex">
							<div class="mypageTitle">이름</div>
							<div class="mypageVal"><%=mList.getuName()%></div>
						</div>
						
						<div class="mypageRow dFlex">
							<div class="mypageTitle">이메일 주소</div>
							<div class="mypageVal"><%=mList.getuEmail()%></div>
						</div>
						
						<div class="mypageRow dFlex">
							<div class="mypageTitle">휴대전화 번호</div>
							<div class="mypageVal"><%=mList.getuPhone() %></div>
						</div>
						
						<div class="mypageRow dFlex">
							<div class="mypageTitle">내 상품 <span class="smallFont">(<%=objWishList.size() %>개)</span></div>
								<div class="mypageVal">
								<%if(objWishList.size()>0) { %>
									<div class="wishSwiper swiper-container">
										<div class="swiper-wrapper">
											<%
											
											for(int i = 0; i<objWishList.size(); i++) {
												
												ProListBean wList = (ProListBean) objWishList.get(i);
												int pNo = wList.getpNo();
												ProListBean pList = (ProListBean) objPList.get(pNo-1);
												%>
													<div class="mypageWishList swiper-slide">
													<a href="/product/listView.jsp?pNo=<%=pNo%>">
													<img src="/images/<%=pList.getpImg()%>" alt="" />
													</a>
													</div>
												<%
											}
											%>
										</div>
											<div class="swiper-button-prev"></div>
				        					<div class="swiper-button-next"></div>
									</div>
									<%} else { %>
									<span>내 상품이 없습니다.</span>
									<%} %>
								</div>
							
						</div>
					</div>
					<!-- div.mypageArea -->
				</div>
				<!-- div.mypageInner -->
			</div>
			<!-- div.inner -->
		</div>
		<!-- div.sub-body -->
		<%
		}
		%>
		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->

</body>
</html>