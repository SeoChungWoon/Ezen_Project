<%@page import="java.util.List"%>
<%@page import="pack_EzPro.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:useBean id="regDAO" class="pack_EzPro.BoardDAO" />
<jsp:useBean id="regVO" class="pack_EzPro.BoardVO" />

<%
request.setCharacterEncoding("UTF-8");
int no = Integer.parseInt(request.getParameter("no"));
int count = Integer.parseInt(request.getParameter("count"));

int nowCnt = regDAO.viewCnt(count, no);



%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Document</title>
     <link rel="stylesheet" href="/style/style_Common.css">
     <script src="/source/jquery-3.6.0.min.js"></script>
     <script src="/script/script.js"></script>
<title>Insert title here</title>
</head>
<body>

  <div id="wrap">
  <%@ include file="/include/header.jsp"%>
		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont"> <!--  title -->
					<p class="tit">공지게시판</p>
				</div>
				<!--div.tit-cont  -->
        <hr id="headHR">
       		<div id="cnt">
       			<a href="">아</a>
       		</div>
        </div>
        <!-- div.inner -->
	</div>
	<!-- div.sub-body -->
  </div>
  <!-- div#wrap -->
</body>
</html>