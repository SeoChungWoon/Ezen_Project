<%@page import="pack_Maincon.MainContentsBean"%>
<%@ page import="pack_Maincon.MainconMgr" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mCMgr" class="pack_Maincon.MainconMgr" />
<jsp:useBean id="mCBean" class="pack_Maincon.MainContentsBean"/>	
<%
	request.setCharacterEncoding("UTF-8");
	List mCBList = mCMgr.ListOutput();
	int mcnt = mCMgr.mListCount();
	int fCnt = mCBList.size();
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
	<link rel="stylesheet" href="/adminPage/style/style_admin_Common.css">
	<link rel="stylesheet" href="/adminPage/style/style_admin.css">
	<link rel="stylesheet" href="/adminPage/style/style_adminMain.css">
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
						<p>메인 관리 <span class="smallFont">&gt; 업로드 된 슬라이드 이미지파일 (<%=fCnt %>)</span></p>
					</div>
					
						<div class="manager-inner">
							<table class="mainSlideTable">
								<colgroup>
									<col width="15%" />
									<col width="15%" />
									<col width="70%" />
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>컨텐츠이름</th>
										<th>이미지</th>
									</tr>
								</thead>
								<tbody>
									<%
									if (mcnt != 0) {
										for (int i = 0; i < fCnt; i++) {
											MainContentsBean mList = (MainContentsBean) mCBList.get(i);
									%>
									<tr>
									
									<td><%=mList.getmNo() %></td>
									<td><%=mList.getmTitle()%></td>
									<td class="imgView"><img src="/images/main_images/<%=mList.getmFileName()%>"
											alt="슬라이드 이미지"></td>
									<%-- <div class="imgbox">
										<p class="title"><%=mList.getmTitle()%></p>
										<img src="/images/main_images/<%=mList.getmFileName()%>"
											alt="슬라이드 이미지">
									</div> --%>
									</tr>
									<%
									}

									}
									%>
								</tbody>
							</table>
						</div>
						<!-- div.manager-inner -->
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