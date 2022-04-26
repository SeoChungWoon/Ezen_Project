<%@page import="jdk.internal.misc.FileSystemOption"%>
<%@ page import="pack_Maincon.FileDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		<%
			String saveFolder = "C:/Users/user/Documents/GitHub/munPJ/mainPJ_MJH/KKMSProj/WebContent/images/main_images";
			String encType = "UTF-8";
			int maxSize = 10 * 1024 * 1024;
			
			try{
				MultipartRequest mReq = null;
				
				mReq  = new MultipartRequest(
						request, 
						saveFolder, 
						maxSize,   
						encType,    
						new DefaultFileRenamePolicy());
				
				
				int mNo = Integer.parseInt(mReq.getParameter("mNo"));
				String mFileName = mReq.getParameter("title");
				String mFileRealName = mReq.getParameter("file");
				String mDate1 = mReq.getParameter("mDate1");
				String mDate2 = mReq.getParameter("mDate2");
				
				new FileDAO().upload(mNo, mFileRealName, mFileName, mDate1, mDate2);
				
				
			}catch(Exception e){
				e.getMessage();
			}
		
			
		%>
		
	</div>
    <!-- div#wrap -->

</body>
</html>