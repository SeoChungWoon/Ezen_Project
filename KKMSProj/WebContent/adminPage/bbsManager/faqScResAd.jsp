<%@page import="java.util.List"%>
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
	

	int cnt = objDAO.BoardCount(divisions);		//데이터 갯수
	int pageSize = 8;

	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum = "1";
	}

	int nowPage = Integer.parseInt(pageNum);
	int firstData = (nowPage-1)*pageSize;
	int lastData = nowPage * pageSize-1;

	List objList = null;

	if(cnt != 0){
		objList = objDAO.BoardList(firstData,pageSize,divisions);
	}
	
	BoardVO objVO = null;
	
	

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
						<p>게시판 관리 <span class="smallFont">&gt; FAQ 관리 &gt; 검색결과</span></p>
					</div>
		      		<div class="resMsg">
							<span id="scWord">"<%=searchText %>"</span>(으)로 조회된 결과는 <span id="scCnt"><%=list.size() %></span>개 입니다.
					</div>
					<!-- div.resMsg -->
			<%
	
	    		
	    		if(list.size() != 0){
	    			int pageCount = cnt/pageSize + (cnt%pageSize == 0?0:1);
	    			
	    			int pageBlock = 3;		//전체 페이지 갯수
	    			
	    		 	int startPage = ((nowPage-1)/pageBlock) * pageBlock + 1;
		          	
		          	//8-4. 페이지블럭의 끝페이지번호
		          	int endPage = startPage + pageBlock - 1;
		          	if(endPage > pageCount){
		          		endPage = pageCount;
	    		}
	    		
		      %>

		      	<div class="tblTop">
		      		<span>전체 게시물 : <%=cnt %>개</span>
		      		<span>페이지 : <%=nowPage %> / <%=pageCount %></span>
		      	</div>
		      	<!-- div.tblTop 끝 -->
		      <div class="main">
		      		<%
		      			for(int i=0; i<list.size(); i++){
		      				objVO = (BoardVO)list.get(i);
		      			
		      		%>
		      		<div class="sub-main">
		      				<div class="td-title">
		      					<div class="row dFlex">
		      						<div class="title">
		      							<label for="faqRow<%=i+1 %>">
		      								<span><%=objVO.getTitle() %></span>
									<img src="/images/icon-arrow-open-blue.png" alt="펼치기" >
		      							</label>
		      							<input type="checkbox" class="faqBtn hidden" id="faqRow<%=i+1 %>">
		      						</div>
		      						<!-- div.title -->
		      						</div>
		      						<!-- div.row -->
		      						<div class="content hidden">
		      							<pre><%=objVO.getContent() %></pre>
		      							<div class="btnArea btn-cont" id="faqScBtn">
									<input type="hidden" class="hdNo" value="<%=objVO.getNo()%>">
									<input type="hidden" class="hdDV"
										value="<%=divisions%>">
									<button type="button" class="udBtn" id="faq-update">수정</button>
									<button type="button" class="faq-del" >삭제</button>
									<input type="hidden" class="hdTitle" value="<%=objVO.getTitle() %>">
									<input type="hidden" class="hdCont" value="<%=objVO.getContent() %>">
								</div>
								<!-- div.btnArea -->
		      						</div>
		      						<!-- div.content -->
		      				</div>
		      				<!-- div.td-title-->
		      		</div>
		      		<!-- div.sub-main -->
		      		<%} %>
		        <div class="footerArea dFlex">
					<div class="dFlex pagingComm">
					<div class="pagingPrev">
						<%
						if (startPage > pageBlock) {
						%>
						<a href="?pageNum=<%=startPage-pageBlock %>" class="firMove"><span class="blind">맨 처음으로 이동</span></a>
						<%
						} else if(nowPage > 1) {
						%>
						<a href="?pageNum=<%=nowPage-1 %>" class="prevMove"><span class="blind">이전으로 이동</span></a>
						<%
						}
						%>
					</div>
					<%
					for (int i = startPage; i <= endPage; i++) {
					%>
					<a href="?pageNum=<%=i %>"
						class="pageNum <%if (i == nowPage) {%>selected<%}%>"><%=i%></a>
					<%
					}
					%>
					<div class="pagingNext">
						<%
						if (nowPage < pageCount) {
						%>
						<a href="?pageNum=<%=nowPage+1 %>" class="nextMove"><span class="blind">다음으로 이동</span></a>
						<%}
						if(endPage < pageCount) {
						%>
						<a href="?pageNum=<%=startPage+pageBlock %>" class="endMove"><span class="blind">맨 뒤로 이동</span></a>
						<%
						}
						%>
					</div>
				</div>
				<%
	    		}else{
				%>
					<div class="tblArea">
						<div class="tblTop">
							<span>전체 게시물 : 0개</span> <span>페이지 : 0 / 0</span>
						</div>
						<!-- div.tblTop 끝 -->

						<div class="main">

							<div class="sub-main">
								<div class="td-title">
									<div class="row dFlex">
										<div class="title">
											<span>등록된 게시물이 없습니다</span>
										</div>
										<!-- div.title -->
									</div>
									<!-- div.td-title -->
								</div>
								<!-- div.row -->

							</div>
							<!-- div.sub-main -->

						</div>
						<!-- div.main -->
					</div>
					<!-- div.tblArea 끝 -->
					<%} %>
		      <div class="btnArea btn-cont scBtnArea">
						<input type="hidden" class="orgDV" value="<%=divisions %>">
						<button type="button" class="searchBtn list">목록으로</button>
					</div>
					<!-- div.get-send -->
					</div>
					</div>

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