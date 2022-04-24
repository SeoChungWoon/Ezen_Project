<%@page import="pack_Product.ProListBean"%>
<%@page import="pack_Product.ProductMgr"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:useBean id="prodMgr" class="pack_Product.ProductMgr" />	
<jsp:useBean id="eMgr" class="pack_Event.eventMgr" />
<%
int eCount = eMgr.eListCnt();

List eList = eMgr.eventList();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Ticket :메인페이지 관리</title>
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style1.css">
	<link rel="stylesheet" href="/style/style2.css">
	<link rel="stylesheet" href="/adminPage/style/style_admin.css">
	<link rel="stylesheet" href="/style/style_Event.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script src="/source/gsap.min.js"></script>
	<script src="/script/script.js"></script>
	<script src="/script/memberScript.js"></script>
	<script src="/script/eventScript.js"></script>
</head>




<body>
   <div id="wrap">
        <div class="sub-body">
			<div class="inner">
				<div class="managerPage dFlex">
					<%@ include file="/adminPage/inc/managerAside.jsp" %>
					<div class="manager-cont">
					<div class="manager-tit">
						<!--  title -->
						<p>메인 관리 <span class="smallFont">&gt; 메인 슬라이드 수정</span></p>
					</div>
					
						<div class="slide-select">
							<%
							request.setCharacterEncoding("UTF-8");
							List objList = prodMgr.listOutput();
						 	int cnt = prodMgr.proListCount();
							
						 	if(cnt != 0){
					      		for(int i = 0; i < 1; i++){
									ProListBean mList = (ProListBean) objList.get(i);
							%>
							<div class="imgbox">
							 	<img src="/images/main_images/product-list-slideimg<%= i+1%>.jpg" alt="슬라이드 이미지" class="slideimg" />
							</div>
							<%} }%>
							
								
							
						</div>
										
					</div>
					<!-- div.manager-cont -->
				</div>
				<!-- div.managerPage -->
			</div>
			<!-- div.inner -->
		</div>
		<!-- div.sub-body -->

    </div>
    <!-- div#wrap -->

</body>
</html>