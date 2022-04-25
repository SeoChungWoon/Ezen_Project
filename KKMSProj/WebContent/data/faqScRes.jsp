<%@page import="pack_EzPro.BoardVO"%>
<%@page import="pack_EzPro.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String divisions = "FAQ";
	BoardDAO objDAO = new BoardDAO();
	String searchField = request.getParameter("searchField");
	String searchText = request.getParameter("searchText");
	ArrayList list = objDAO.getSearch(searchField, searchText,divisions);
	
	
	

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
					<p class="tit">F A Q</p>
				</div>
				<!--div.tit-cont  -->
		      		<div class="resMsg">
							<span id="scWord">"<%=searchText %>"</span>(으)로 조회된 결과는 <span id="scCnt"><%=list.size() %></span>개 입니다.
					</div>
					<!-- div.resMsg -->
		      <div class="main">
		      		<div class="listTop dFlex">
		      				<div class="th-title">제목</div>
		      				<div class="th-btn">내용</div>
		      		</div>
		      		<!-- div.listTop -->
		      		<%
		      			for(int i=0; i<list.size(); i++){
		      				BoardVO objVO = (BoardVO)list.get(i);
		      			
		      		%>
		      		<div class="sub-main">
		      				<div class="td-title">
		      				<div class="row dFlex">
		      						<div class="title">
		      							<label for="faqRow<%=i+1 %>">
		      								<span>&ensp;<%=objVO.getTitle() %></span>
		      							</label>
		      							<input type="checkbox" class="faqBtn hidden" id="faqRow<%=i+1 %>">
		      						</div>
		      						<!-- div.title -->
		      							<div class="slideBtn">
		      								<label for="faqRow<%=i + 1 %>">
											<img src="/images/detailIcon.png" alt="펼치기" class="detailIcon">
											</label>
		      							</div>
		      						</div>
		      						<!-- div.row -->
		      						<div class="content hidden">
		      							<pre>&ensp;<%=objVO.getContent() %></pre>
		      						</div>
		      						<!-- div.content -->
		      				</div>
		      				<!-- div.td-title-->
		      		</div>
		      		<!-- div.sub-main -->
		      		<%} %>
		      </div>
		      <!-- div.main -->
		      		<div class="btnArea btn-cont" id="faqScRes">
						<input type="hidden" class="orgDV" value="<%=divisions %>">
						<button type="button" class="searchBtn list-notAd">목록으로</button>
						<button type="button"class="searchBtn mainMove">메인으로</button>
					</div>
					<!-- div.get-send -->
		</div>
        <!-- div.inner -->
	</div>
	<!-- div.sub-body -->
  </div>
  <!-- div#wrap -->
</body>
</html>