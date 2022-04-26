<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%
String imgFolder = "C:/Users/user/Documents/GitHub/munPJ/mainPJ_MJH/KKMSProj/WebContent/images/main_images";
int maxSize = 10 * 1024 * 1024;
String encType = "UTF-8";
String mFileRealName = "";
String mFileName = "";
String mDate1= "";
String mDate2="";


try{
MultipartRequest multi = new MultipartRequest(
												request, 
												imgFolder, 
												maxSize, 
												encType, 
												new DefaultFileRenamePolicy());
	mFileRealName=multi.getParameter("mFileRealName");
	mFileName = multi.getParameter("mFileName");
	mDate1 = multi.getParameter("mData1");
	mDate2 = multi.getParameter("mData2");
}catch(Exception e){
	e.printStackTrace();
}
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
						<p>메인 관리 <span class="smallFont">&gt; 슬라이드 파일 관리</span></p>
					</div>
					
						<div class="slide-upload">
							<form name="file" method="post" enctype="multipart/form-data" action="fileAction.jsp">
								  이미지 업로드 : <input type="file"	name="uploadFile"><br>
								  
								     <input type="submit" value="파일 업로드">
								  
							</form>
								
							
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