<%@ page import="pack_Maincon.FileDAO" %>
<%@ page import="java.io.File" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.*" %>
<%@page import="java.io.IOException"%>
<%@ page import="pack_Maincon.MainconMgr" %>
<%@ page import="pack_Maincon.MainContentsBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="slideMgr" class="pack_Maincon.MainconMgr" />
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
						<%
						String saveFolder = "C:/Users/Mun/Documents/GitHub/mainPJ_MJH/KKMSProj/WebContent/images/main_images";
						String encType = "UTF-8";
						int maxSize = 10 * 1024 * 1024;

						try {
							MultipartRequest mReq = null;

							mReq = new MultipartRequest(request, 
																		saveFolder, 
																		maxSize, 
																		encType, 
																		new DefaultFileRenamePolicy());
							
							String mFileName = mReq.getFilesystemName("mFileName");
							String mTitle = mReq.getParameter("mTitle");
							String mExpalin = mReq.getParameter("mExpalin");
							String mType = mReq.getParameter("mType");
							String mDate1 = mReq.getParameter("mDate1");
							String mDate2 = mReq.getParameter("mDate2");
							String mPlace = mReq.getParameter("mPlace");
									
							new FileDAO().upload(mFileName, mTitle, mExpalin, mType, mDate1, mDate2, mPlace);
 							/* out.write("파일명 : " + mFileName); */
						} catch (Exception e) {
							e.getMessage();
						}
						
						
						%>
   <div id="wrap">
		
		   
        <div class="sub-body">
			<div class="inner">
				<div class="managerPage dFlex">
					<%@ include file="/adminPage/inc/managerAside.jsp" %>
					<div class="manager-cont">
					<div class="manager-tit">
						<!--  title -->
						<p>메인 관리 <span class="smallFont">&gt; 이미지 업로드완료</span></p>
					</div>

					
					<div class="slide-list">
						이미지 업로드완료
					</div>
					
					
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