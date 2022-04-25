<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="regVO" class="pack_EzPro.BoardVO" />
<jsp:useBean id="memMgr" class="pack_EzPro.BoardDAO" />
<jsp:setProperty name="regVO" property="*" />
<%
request.setCharacterEncoding("UTF-8");
boolean res = memMgr.mtdWrite(regVO);
String divisions = request.getParameter("divisions");
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
				<div class="tit-cont">
					<p class="resMsg">게시글이 성공적으로 등록되었습니다.</p>
				</div>
				<!--div.tit-cont  -->
					<div class="btnArea btn-cont writeResBtn">
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
</body>
</html>