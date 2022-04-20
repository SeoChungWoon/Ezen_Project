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
<title>My page</title>
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
		<%@ include file="/include/header.jsp"%>
		<%
		if (memberId == null) {
		%>
		<script>
			location.href = "/index.jsp";
		</script>
		<%
		} else {
		List objWishList = pMgr.wishList(memberId);
		List objList = mMgr.myPage(memberId);
		RegisterBean mList = (RegisterBean) objList.get(0);
		
		%>
		<div class="sub-body">
			<div class="inner">
				<div class="mypageInner dFlex">
					<%@ include file="/include/myPageAside.jsp"%>
					<div class="mypageArea">
						<div class="mypageTit">
							<h1>My page</h1>
						</div>
						<!-- div.mypageTit -->
						<div class="mypageRow">
							<div class="mypageTitle">아이디</div>
							<div class="mypageVal"><input type="text" value="<%=mList.getuId()%>" readonly></div>
						</div>
						
						<div class="mypageRow">
							<div class="mypageTitle">이름</div>
							<div class="mypageVal"><input type="text" value="<%=mList.getuName()%>" readonly></div>
						</div>
						
						<div class="mypageRow">
							<div class="mypageTitle">이메일 주소</div>
							<div class="mypageVal"><input type="text" value="<%=mList.getuEmail()%>" readonly></div>
						</div>
						
						<div class="mypageRow">
							<div class="mypageTitle">휴대전화 번호</div>
							<div class="mypageVal"><input type="text" value="<%=mList.getuPhone() %>" readonly></div>
						</div>
						
						<div class="mypageRow">
							<div class="mypageTitle">예약 내역</div>
							<div class="mypageVal">예약 내역 보기 버튼 (추가해야함)</div>
						</div>
						
						<div class="mypageRow">
							<div class="mypageTitle">찜 목록 <span class="smallFont">(<%=objWishList.size() %>개)</span></div>
								<div class="mypageVal">
								<%if(objWishList.size()>0) { %>
									<div class="wishSwiper swiper-container">
										<div class="swiper-wrapper">
											<%
											
											for(int i = 0; i<objWishList.size(); i++) {
												
												ProListBean wList = (ProListBean) objWishList.get(i);
												int pNo = wList.getpNo();
												%>
													<div class="mypageWishList swiper-slide">
													<a href="/product/listView.jsp?pNo=<%=pNo%>">
													<img src="/images/product-list-img<%=pNo%>.jpg" alt="" />
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
									<span>찜 목록이 비었습니다.</span>
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