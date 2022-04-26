<%@page import="pack_Product.ProListBean"%>
<%@page import="pack_Product.ProRevBean"%>
<%@page import="pack_Member.ZipcodeBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />
<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />

<%
request.setCharacterEncoding("UTF-8");
String memberId = (String) session.getAttribute("memID");
if(memberId==null) {
	%>
	<script>
	location.href="/index.jsp";
	</script>
	<%
}
List objRList = mMgr.myReviewList(memberId);
List objPList = pMgr.listOutput();
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket :내가 쓴 리뷰</title>
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
		<div class="sub-body">
			<div class="inner myRevInner">
					<div class="tit-cont">
						<!--  title -->
						<p class="tit">내가 쓴 리뷰</p>
					</div>
					
					<%
					if (objRList.size() == 0){
					%>
					<div id="myReviewArea">
						
						<div class="resMsg">
							<span>작성한 리뷰가 없습니다.</span>
						</div>
					<%} else { %>
						<div class="resMsg">
							<span> <%=objRList.size() %>개의 리뷰가 있습니다.
							</span>
						</div>
						<hr>
						
						<%
						for (int i = 0; i<objRList.size(); i++) {
							ProRevBean rBean = (ProRevBean) objRList.get(i);
							int pNo = rBean.getpRevPNo();
							ProListBean pBean = (ProListBean) objPList.get(pNo-1);
						
						%>
						<div class="myReviewRow">
							<div class="myReviewBanner">
								<a href="/product/listView.jsp?pNo=<%=pNo%>">
									<img src="/images/<%=pBean.getpImg() %>" alt="" />
								</a>
							</div>
							<div class="myReview-cont">
								<div class="myReviewContent">
									<span><%=rBean.getpRevCont() %></span>
									<img src="/images/<%=rBean.getpRevImg() %>" alt="" />
								</div>
								<div class="myReviewStar">
									<%
									for(int j=0; j < rBean.getpRevStar(); j++) {
										%>
										<div class="myReviewStarpoint">
											<img src="/images/product-detail-star.png" alt="" />
										</div>
										<%
									}
									%>
								</div>
								<div class="myReviewDate">
									<span><%=rBean.getpRevDate() %></span>
								</div>
								<div class="myReviewRecom">
									<%=rBean.getpRevRecom() %>
								</div>
								<div class="myReviewDel">
									<img src="/images/icon-delete-btn.png" alt="" />
								</div>
							</div>
						</div>
						<%
							}
						}%>
					</div>
					<!-- div.myReviewArea -->
					<div class="mypagePopClose btn-cont">
						<button type="button">닫기</button>
					</div>
					<!-- div.mypagePopClose -->
			</div>
		</div>
	</div>
	<!-- div#wrap -->

</body>
</html>
