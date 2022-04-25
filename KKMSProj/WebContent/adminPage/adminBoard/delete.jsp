
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regDAO" class="pack_EzPro.BoardDAO" />
<jsp:useBean id="regVO" class="pack_EzPro.BoardVO" />

<%
	request.setCharacterEncoding("UTF-8");
	String divisions = (String)request.getParameter("divisions");
	int no = Integer.parseInt(request.getParameter("no"));
	boolean deleteChk = false;
	
	if(regDAO.Delete(no, divisions)){
		deleteChk = true;
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
						<%if(divisions.equals("FAQ")){ %>
						<p>게시판 관리 <span class="smallFont">&gt; FAQ 관리 &gt; 삭제하기</span></p>
						<%}else{ %>
						<p>게시판 관리 <span class="smallFont">&gt; 공지사항 관리 &gt; 삭제하기</span></p>
						<%} %>
					</div>
	
				<div class="tit-cont"> <!--  title -->
					<p class="resMsg">게시물이 성공적으로 삭제 되었습니다.</p>
					
				</div>
				<!--div.tit-cont  -->
					<div class="btnArea btn-cont">
						<input type="hidden" class="orgDV" value="<%=divisions %>">
						<button type="button" class="dlBtn list">목록으로</button>
					</div>
					<!-- div.get-send -->
						</div>
					<!-- div.manager-cont -->
				</div>
				<!-- div.managerPage -->			
				
	</div>
	<!-- div.inner -->
	</div>
	<!-- div.subbody -->
  </div>
  <!-- div#wrap -->
</body>
</html>