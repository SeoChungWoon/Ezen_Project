<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="regVO" class="pack_EzPro.BoardVO" />
<jsp:useBean id="memMgr" class="pack_EzPro.BoardDAO" />
<jsp:setProperty name="regVO" property="*" />
<%

request.setCharacterEncoding("UTF-8");

String saveFolder = "D:/infoProc_1119/kmj/silsp/p07_JSP/KKMSProj/WebContent/images/bbsFileUpload";		
String encType = "UTF-8";				//변환형식
int maxSize=5*1024*1024;				//사진의 size


//ServletContext context = this.getServletContext();		//절대경로
//realFolder = //context.getRealPath(saveFolder);			//saveFolder의 절대경로를 얻음
		
MultipartRequest multi = null;

try{
//파일업로드를 직접적으로 담당		
multi = new MultipartRequest(request,saveFolder,maxSize,encType,new DefaultFileRenamePolicy());
Enumeration objFileEnum = multi.getFileNames();

String fileName = multi.getFilesystemName("fileName");
String nameFile = (String)objFileEnum.nextElement();
fileName = multi.getFilesystemName(nameFile);

/*
String bbsTitle = multi.getParameter("title");
String bbsContent = multi.getParameter("content");

if(fileName != null){
	File oldFile = new File(saveFolder+"\\"+fileName);
	File newFile = new File(saveFolder+"\\사진.jpg");
	oldFile.renameTo(newFile);

}
*/
String divisions = multi.getParameter("divisions");
String header = multi.getParameter("header");
String title = multi.getParameter("title");
String wName = multi.getParameter("wName");
String content = multi.getParameter("content");

boolean res = false;
if(memMgr.mtdWrite(divisions,header,title,wName,content,fileName)){
	res = true;
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket :회원 관리</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<link rel="stylesheet" href="/style/style3.css">
<link rel="stylesheet" href="/adminPage/style/style_admin.css">
<link rel="stylesheet" href="/style/style_Event.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/script_bbs.js"></script>
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
						<p>게시판 관리 <span class="smallFont">&gt; 공지사항 관리 &gt; 글쓰기</span></p>
					</div>
				<div class="tit-cont">
					<p class="resMsg">게시글이 성공적으로 등록되었습니다.</p>
				</div>
				<!--div.tit-cont  -->
					<div class="btnArea btn-cont">					
					<input type="hidden" class="orgDV" value="<%=divisions %>">
					<button type="button" class="dlBtn list">목록으로</button>
					</div>
					<!-- div.btnArea -->
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
	<%}catch (IOException e) {
	}%>
</body>
</html>