<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regVO" class="pack_EzPro.BoardVO" />
<jsp:useBean id="regDAO" class="pack_EzPro.BoardDAO" />
<jsp:setProperty name="regVO" property="*" />
<%
request.setCharacterEncoding("UTF-8");


String saveFolder = "D:/infoProc_1119/kmj/silsp/p07_JSP/KKMSProj/WebContent/images/bbsFileUpload";		
String encType = "UTF-8";				//변환형식
int maxSize=5*1024*1024;				//사진의 size

MultipartRequest multi = null;


try{
//파일업로드를 직접적으로 담당		
multi = new MultipartRequest(request,saveFolder,maxSize,encType,new DefaultFileRenamePolicy());
Enumeration objFileEnum = multi.getFileNames();

String fileName = multi.getFilesystemName("fileName");
String nameFile = (String)objFileEnum.nextElement();
fileName = multi.getFilesystemName(nameFile);


int no = Integer.parseInt(multi.getParameter("no"));
String divisions = multi.getParameter("divisions");
String header = multi.getParameter("header");
String title = multi.getParameter("title");
String wName = multi.getParameter("wName");
String content = multi.getParameter("content");


boolean res = false;
if(regDAO.Update(title, content, no, divisions,header,fileName)){
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
						<p>게시판 관리	 <span class="smallFont">&gt; 공지사항 관리 &gt; 수정하기</span></p>
					</div>
				<div class="tit-cont"> <!--  title -->
					<p class="resMsg">수정이 완료되었습니다.</p>
				</div>
				<!-- div.tit-cont -->
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