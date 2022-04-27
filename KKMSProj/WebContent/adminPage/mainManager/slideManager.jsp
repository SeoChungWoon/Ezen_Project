<%@page import="pack_Maincon.MainContentsBean"%>
<%@ page import="pack_Maincon.MainconMgr" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mCMgr" class="pack_Maincon.MainconMgr" />
<jsp:useBean id="mCBean" class="pack_Maincon.MainContentsBean"/>	


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
						<p>메인 관리 <span class="smallFont">&gt; 업로드 된 슬라이드 이미지파일</span></p>
					</div>
					
						
						<div class="slide-select">
							<%
							request.setCharacterEncoding("UTF-8");
							List objList = mCMgr.ListOutput();
						 	int cnt = mCMgr.mListCount();
							
						 	if(cnt != 0){
					      		for(int i = 0; i < objList.size(); i++){
					      			MainContentsBean mList = (MainContentsBean) objList.get(i);
							%>
							<div class="imgbox">
								<p class="title"><%=mList.getmTitle() %></p>
							 	<img src="/images/main_images/<%=mList.getmFileName()%>" alt="슬라이드 이미지">
							</div>
							<%}
								
							}else{
								out.print("데이터가없습니다.");
							}
								%>
							
							
								
							
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