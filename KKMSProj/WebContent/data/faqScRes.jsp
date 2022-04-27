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
		      	<div class="tblArea">
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
											<img src="/images/icon-arrow-open-blue.png" alt="펼치기" class="detailIcon">
		      							</label>
		      							<input type="checkbox" class="faqBtn hidden" id="faqRow<%=i+1 %>">
		      						</div>
		      						<!-- div.title -->
		      						</div>
		      						<!-- div.row -->
		      						<div class="content hidden">
		      							<pre><%=objVO.getContent() %></pre>
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
										<div class="noData">
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
		      		<div class="btn-cont" id="faqScRes">
						<input type="hidden" class="orgDV" value="<%=divisions %>">
						<button type="button" class="searchBtn list-notAd">목록으로</button>
						<button type="button"class="searchBtn mainMove">메인으로</button>
					</div>
					<!-- div.get-send -->
					</div>
					</div>
					<!-- tblArea -->
							      </div>
		      <!-- div.main -->
		</div>
        <!-- div.inner -->
	</div>
	<!-- div.sub-body -->
		<%@ include file="/include/footer.jsp"%>
  </div>
  <!-- div#wrap -->
</body>
</html>