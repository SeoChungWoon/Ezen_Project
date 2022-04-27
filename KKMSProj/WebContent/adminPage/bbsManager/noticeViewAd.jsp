<%@page import="java.io.File"%>
<%@page import="pack_EzPro.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="pack_EzPro.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:useBean id="regDAO" class="pack_EzPro.BoardDAO" />
<jsp:useBean id="regVO" class="pack_EzPro.BoardVO" />
<jsp:setProperty name="regVO" property="*" />

<%
request.setCharacterEncoding("UTF-8");
String divisions = "공지사항";
int no = Integer.parseInt(request.getParameter("no"));
int prevNext = 1;
String header = (String)request.getParameter("header");

//조회수 가져오기
int nowCnt = regDAO.viewCnt(no);

//no 가져오기
List ntcList = regDAO.mtdSelect(no,divisions);

//데이터 갯수 가져오기
int cnt = regDAO.BoardCount(divisions);

//공지사항 no 가져오기
int[] ntcNo = regDAO.ntcNoChk(divisions);
int idx=0;
for(int i = 0; i<ntcNo.length; i++){
	if(ntcNo[i]==no){
		idx = i;

	}
}
String saveFolder = "D:/infoProc_1119/kmj/silsp/p07_JSP/KKMSProj/WebContent/images/bbsFileUpload";


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
						<p>게시판 관리 <span class="smallFont">&gt; 공지사항 관리 &gt; 공지사항 리스트</span></p>
					</div>
        <hr id="headHR">
				<div id="ntcViewInner">				
        					<%
        					for(int i=0; i<ntcList.size(); i++){
        						BoardVO objVO = (BoardVO)ntcList.get(i);
        						String str = objVO.getFileName();
        					%>

        				<div class="ntcTitle dFlex">
        						<div class="ntcTitle-left">
        							<span><%=header%>&ensp;</span>
        							<span><%=objVO.getTitle() %></span>
        						</div>
        						<!-- div.ntcTitle-left -->
        						<div class="ntcTitle-right">
        							<span>등록일 : <%=objVO.getPostDate()%>&ensp;|&ensp;</span>
        						
        							<span>조회수 : <%=nowCnt %></span>	
        						</div>
        						<!-- div.nteTitle-right -->
        				</div>
        				<!-- div.ntcTitle -->
        				


        		<div class="nt-content">
        		<%
        		if(objVO.getFileName()!=null){%>
					<br><img src = "/images/bbsFileUpload/<%=objVO.getFileName() %>" alt="사진" id="imgView"><br><br>
        			<pre><%=objVO.getContent() %></pre>
        		<% }else{%>
        			<pre><%=objVO.getContent() %></pre>
        		<%} %>
        		</div>
        		<!-- div.content -->
        		<hr id="fileLine">
        		<div class="filePath">
        		<% if(objVO.getFileName()!=null){%>
        		<a href="/images/bbsFileUpload/<%=objVO.getFileName() %>"><%=objVO.getFileName() %></a>
        		<%}else{ %>
        		<span>첨부파일이 없습니다.</span>
        		<%} %>
        		</div>
        		<!-- div.filePath -->
        		<hr>
        		<div class="ntcFooter dFlex">

        		           <div class="footerLeft">
					<%if(idx==(cnt-1)){ %>
					<a class="noData">이전글</a>
					<%}else{ %>
					<a href="noticeViewAd.jsp?no=<%=ntcNo[idx+1] %>&header=<%=header%>">이전글</a>
					<%} %>
					<%if(idx==0) {%>
					<a class="noData">다음글</a>
					<%}else{ %>
        			<a href="noticeViewAd.jsp?no=<%=ntcNo[idx-1] %>&header=<%=header%>">다음글</a>
        			<%} %>
        				</div>
        				<!-- div.footerLeft -->
        				<div class="footerRight btn-cont">
        					<input type="hidden" id="inputNo" value="<%=objVO.getNo() %>">
        					<input type="hidden" id="inputTi" value="<%=objVO.getTitle() %>">
        					<input type="hidden" id="inputCont" value="<%=objVO.getContent() %>">
        					<input type="hidden" id="inputHd" value="<%=header %>">
        					<input type="hidden" class="orgDV" value="<%=divisions %>">
                			<button type="button" class="list">목록으로</button>
        					<button type="button" id="update">수정하기</button>
        					<button type="button" id="delKey">삭제하기</button>
        				</div>
        				<!-- div.footerRight -->
        				</div>
        				<!-- div.ntcFooter -->
        		<%} %>
        			</div>
        			<!-- div.ntcViewInner -->
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