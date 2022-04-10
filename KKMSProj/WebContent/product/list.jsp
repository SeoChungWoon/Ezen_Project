<%@page import="pack_product.proListBean"%>
<%@page import="java.util.List"%>
<%@page import="pack_product.productMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:useBean id="prodMgr" class="pack_product.productMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전시 목록</title>
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
					
				 	if(cnt != 0){
	      				for(int i = 0; i < objList.size(); i++){
							proListBean mList = (proListBean) objList.get(i);
						%>
						<div class="listBox">
							<a href="javascript:">
								<p class="img">
									<img src="/images/product-list-img<%= i+1 %>.jpg" alt="" />
								</p>
								<div class="txt-info">
									<p class="flag">
										<span class="event"><%= mList.getpFlag1()%></span>
										<span class="event"><%= mList.getpFlag2()%></span>
									</p>

									<p class="sub-txt">
										<span class="location"><%= mList.getpArea()%></span> 
										<span class="info"><%= mList.getpInfoTxt()%></span>
									</p>

									<p class="tit">
										[<span class="area"><%= mList.getpArea()%></span><em>, </em><span class="group"><%= mList.getpGroup()%></span>] <%= mList.getpTitle()%></p>
									<p class="explain-txt">
										<span class="date"><%= mList.getpDate1()%> - <%= mList.getpDate2()%></span> 
										<span class="content"><%= mList.getpContent()%></span>
									</p>
									<p class="price">
										<span class="original"> 
											<span class="rate-sale"><em><%= mList.getpSalePercent()%></em>%</span> 
											<del><%= mList.getpOriPrice()%></del><span>원</span>
										</span> 
										<span class="discount-price">
											<ins></ins><span>원</span>
										</span>
									</p>
								</div>
							</a>
						</div>
						<!-- // listBox -->
		      				<% 
		      				}
				 	}else{
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
</body>
</html>