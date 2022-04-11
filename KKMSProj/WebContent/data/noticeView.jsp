<%@page import="pack_EzPro.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="pack_EzPro.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:useBean id="regDAO" class="pack_EzPro.BoardDAO" />
<jsp:useBean id="regVO" class="pack_EzPro.BoardVO" />

<%
request.setCharacterEncoding("UTF-8");
int no = Integer.parseInt(request.getParameter("no"));
int prevNext = 1;

//조회수 가져오기
int nowCnt = regDAO.viewCnt(no);

//no 가져오기
List ntcList = regDAO.mtdSelect(no);

//데이터 갯수 가져오기
int cnt = regDAO.BoardCount();


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
  	<form action="/data/bbsList.jsp" id="noticeFrm">
		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont"> <!--  title -->
					<p class="tit">공지게시판</p>
				</div>
				<!--div.tit-cont  -->
        <hr id="headHR">
				<div id="ntcViewInner">				
        			<div class="header">
        				<div class="headerTop dFlex">
        					<div class="headerTop-left">
        						<span>공지사항</span>
        					</div>
        					<div class="headerTop-right">
        					<%
        					for(int i=0; i<ntcList.size(); i++){
        						BoardVO objVO = (BoardVO)ntcList.get(i);
        		
        					%>
        						<span>등록일 : <%=objVO.getPostDate()%>&ensp;|&ensp;</span>
        						
        						<span>조회수 : <%=nowCnt %></span>	
        					</div>
        					<!-- headerTop-right -->
        				</div>
        				<!-- div.headerTop -->
        				<div class="ntcTitle">
        					<span><%=objVO.getTitle() %></span>
        				</div>
        				<!-- div.ntcTitle -->
        		</div>
        		<!-- div.header -->
        		<div class="content">
        			<pre><%=objVO.getContent() %></pre>
        		</div>
        		<!-- div.content -->
        		<div class="ntcFooter dFlex">
        
        		       <div class="footerLeft">
					<%if(no==1){ %>
					<a class="noData">이전글</a>
					<%}else{ %>
					<a href="noticeView.jsp?no=<%=no-prevNext %>">이전글</a>
					<%} %>
					<%if(no==cnt) {%>
					<a class="noData">다음글</a>
					<%}else{ %>
        			<a href="noticeView.jsp?no=<%=no+prevNext %>">다음글</a>
        			<%} %>
        				</div>
        				<!-- div.footerLeft -->
        				<div class="footerRight">
        					<a href="/data/bbsList.jsp">목록으로</a>
        				</div>
        				<!-- div.footerRight -->
        		</div>
        		<!-- div.ntcFooter -->
        		<%} %>
        	</div>
        	<!-- div.ntcViewInner -->
        </div>
        <!-- div.inner -->
	</div>
	<!-- div.sub-body -->
	</form>
  </div>
  <!-- div#wrap -->
</body>
</html>