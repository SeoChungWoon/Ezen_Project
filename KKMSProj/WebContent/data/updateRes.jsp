<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regVO" class="pack_EzPro.BoardVO" />
<jsp:useBean id="regDAO" class="pack_EzPro.BoardDAO" />
<jsp:setProperty name="regVO" property="*" />
<%
request.setCharacterEncoding("UTF-8");
String title = (String)request.getParameter("title");
String content = (String)request.getParameter("content");
int no = Integer.parseInt(request.getParameter("no"));
String division = (String)request.getParameter("division");

boolean res = false;
if(regDAO.Update(title, content, no, division)){
	res = true;
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
		<div class="sub-body dFlex">
				<div class="mypageInner">
					<%@include file="/include/myPageAside.jsp" %>				        
         		</div>
				<!-- div.mypageInner -->			
			<div class="inner">
				<div class="tit-cont"> <!--  title -->
					<p class="tit">수정이 완료되었습니다.</p>
				</div>
				<!-- div.tit-cont -->
					<div class="get-send">
						<input type="hidden" class="orgDV" value="<%=division %>">
						<button type="button" class="writeBtn list">목록으로</button>
						<button type="button" class="writeBtn mainMove">메인으로</button>
					</div>
					<!-- div.get-send -->
</div>
<!-- div.inner -->
</div>
<!-- div.sub-body -->
	<%@ include file="/include/footer.jsp"%>
  </div>
  <!-- div#wrap -->
</body>
</html>