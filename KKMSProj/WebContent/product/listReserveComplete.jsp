<%@page import="pack_Product.ProReservBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="prodMgr" class="pack_Product.ProductMgr" />

<%
request.setCharacterEncoding("UTF-8");

String pResDate = request.getParameter("pResDate");
String pResTime = request.getParameter("pResTime");
String pResHead = request.getParameter("pResHead");
String pResPrice = request.getParameter("pResPrice");
String pResCPay = request.getParameter("pResCPay");
String pResCAccount = request.getParameter("pResCAccount");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>E-Ticket : 예매 확인</title>
	<link rel="stylesheet" href="/source/style_Reset.css">
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style1.css">
	<link rel="stylesheet" href="/style/style2.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script src="/script/script_Common.js"></script>
	<script src="/source/gsap.min.js"></script>
	<script src="/script/script.js"></script>
</head>

<body>
	<div id="wrap">    	    	

		<%@ include file="/include/header.jsp"%>

		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont">
					<p class="tit">예매 확인</p>
				</div>
				
				<div class="rComplete-cont">
					<dl class="date">
						<dt>날짜</dt>
						<dd><%=pResDate %></dd>
					</dl>
					<dl class="time">
						<dt>시간</dt>
						<dd><%=pResTime %></dd>
					</dl>
					<dl class="headCnt">
						<dt>인원</dt>
						<dd>
							<span class="num"><%=pResHead %></span> <span>명</span>
						</dd>
					</dl>
					<dl class="getPrice">
						<dt>결제 금액</dt>
						<dd>
							<span class="price"><%=pResPrice %></span> <span>원</span>
						</dd>
					</dl>
					<dl>
						<dt>결제 수단</dt>
						<dd>
							<%=pResCPay %>
						</dd>
					</dl>
					<dl>
						<dt>결제 정보</dt>
						<dd>
							<%=pResCAccount %>
						</dd>
					</dl>
				</div>
				<!-- //rComplete-cont -->
				<div class="btn-cont">
					<button type="button" onclick="location.href='/product/list.jsp'">전시보기</button>
					<button type="button" onclick="location.href='/member/mypage.jsp'">마이페이지</button>
				</div>
			</div>
		</div>
    	
	<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->
</body>

</html>