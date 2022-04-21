<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regDAO" class="pack_EzPro.BoardDAO" />
<jsp:useBean id="regVO" class="pack_EzPro.BoardVO" />

<%
	request.setCharacterEncoding("UTF-8");
	
	
	int no = Integer.parseInt(request.getParameter("no"));
	boolean deleteChk = false;
	
	if(regDAO.Delete(no)){
		deleteChk = true;
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Document</title>
     <link rel="stylesheet" href="/style/style_Common.css">
     <link rel="stylesheet" href="/style/style1.css">
	 <link rel="stylesheet" href="/style/style2.css">
     <link rel="stylesheet" href="/style/style3.css">
     <script src="/source/jquery-3.6.0.min.js"></script>
	 <script src="/source/gsap.min.js"></script>
	<script src="/script/script.js"></script>
	 <script src="/script/script_bbs.js"></script>
	 <script src="/script/memberScript.js"></script>
<title>Insert title here</title>
</head>
<body>

  <div id="wrap">
  		<%@ include file="/include/header.jsp"%>
		<div class="sub-body">
			<div class="inner">
	
				<div class="tit-cont"> <!--  title -->
					<p class="tit">게시물이 성공적으로 삭제 되었습니다.</p>
				</div>
				<!--div.tit-cont  -->
					<div class="btnArea">
						<button type="button" class="dlBtn list">목록으로</button>
						<button type="button"class="dlBtn mainMove">메인으로</button>
					</div>
					<!-- div.get-send -->
				
				
	</div>
	<!-- div.inner -->
	</div>
	<!-- div.subbody -->
		<%@ include file="/include/footer.jsp"%>
  </div>
  <!-- div#wrap -->
</body>
</html>