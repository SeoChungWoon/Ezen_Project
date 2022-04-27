<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack_DBCP.DBConnectionMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="regVO" class="pack_EzPro.BoardVO" />
<jsp:useBean id="memMgr" class="pack_EzPro.BoardDAO" />
<jsp:setProperty name="regVO" property="*" />
<%
request.setCharacterEncoding("UTF-8");
String divisions = "FAQ";
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
						<p>게시판 관리 <span class="smallFont">&gt; FAQ 관리 &gt; 글쓰기</span></p>
					</div>

        <div class="main">
        <form action="/adminPage/bbsManager/faqWriteRes.jsp" id="writeFrm" method="get">
        
 		<div id="header">
        	<hr id="headHR">
        </div>
        <!-- div#header -->
       
        <div class="writeArea">

        		<div class="writerArea">
        		<input type="hidden" name="wName" value="관리자">
        			<span id="writer">작성자 : 관리자</span>
        		</div>
        		<!-- div.writerArea -->

        			<div class="hidden">
        				<input type="hidden" id="writeChk" name="divisions" value="<%=divisions %>">
        			</div>
        			<!-- div.hidden-->

        			<div class="titleArea">
        				<input type="text" name="title" placeholder="제목을 입력해 주세요."
        					class="titleBox" onfocus="this.placeholder=''"
        					onblur="this.placeholder='제목을 입력해 주세요.'">
        			</div>
        			<!-- div.titleArea -->
    
        			<div class="cont-Area">
        				<textarea name="content" class="txtArea" id="content" cols="50" rows="15"
        				  placeholder="내용을 입력해주세요" 
        				  onfocus="this.placeholder=''"
        				  onblur="this.placeholder='내용을 입력해주세요'"></textarea>
        			</div>
        			<!-- div.cont-Area -->
        </div>
        <!-- writeArea -->
 		<div class="btnArea btn-cont writeBtnArea">
 			<button type="submit" class="writeBtn" id="formSave">작성하기</button>
 			<button type="button" class="writeBtn" id="cancel">취소</button>
 		</div>
 		<!-- div#btnArea -->

         </form>
        </div>
 		<!-- div#main -->

					</div>
					<!-- div.manager-cont -->
				</div>
				<!-- div.managerPage -->

</div>
<!-- div.inner -->
</div>
<!-- div.sub-body -->
	<%@ include file="/include/footer.jsp"%>
  </div>
  <!-- div#wrap -->
</body>
</html>