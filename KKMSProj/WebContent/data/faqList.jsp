
<%@page import="pack_EzPro.BoardDAO"%>
<%@page import="pack_EzPro.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="regDAO" class="pack_EzPro.BoardDAO" />
<jsp:useBean id="regVO" class="pack_EzPro.BoardVO" />

<%
request.setCharacterEncoding("UTF-8");
String divisions = "FAQ";
BoardDAO objDAO = new BoardDAO();
int cnt = objDAO.BoardCount(divisions);		//데이터 갯수
int pageSize = 7;

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
					<p class="tit">FAQ</p>
				</div>
				<!--div.tit-cont  -->
  	<form action="faqScRes.jsp" method="get" name="search">
  		<div class="searchArea dFlex">
  			<div class="searchTxt">
<!--   			<span>Search</span> -->
  			<select name="searchField" class="searchDV">
  				<option value="0">선택</option>
  				<option value="title">제목</option>
  				<option value="content">내용</option>
  			</select>
  			<input type="text" placeholder="제목 및 내용을 검색해보세요" id="searchBox" name="searchText" size="30"
  			  onfocus="this.placeholder=''" onblur="this.placeholder='제목 및 내용을 검색해보세요'">
  			  </div>
  			  <!-- div.searchTxt -->
  			  <div class="btn-cont">
  			<button type="submit" class="btnImg">검색</button>
  			</div>
  			<!-- div.btn-cont -->
  		</div>
  		<!-- div.searchArea -->
  		</form>
	<%
	
	    		
	    		if(cnt != 0){
	    			int pageCount = cnt/pageSize + (cnt%pageSize == 0?0:1);
	    			
	    			int pageBlock = 3;		//전체 페이지 갯수
	    			
	    		 	int startPage = ((nowPage-1)/pageBlock) * pageBlock + 1;
		          	
		          	//8-4. 페이지블럭의 끝페이지번호
		          	int endPage = startPage + pageBlock - 1;
		          	if(endPage > pageCount){
		          		endPage = pageCount;
	    		}
	    		
		      %>
		      <!-- HTML 코드 시작  -->
		      	<div class="tblTop right">
		      		<span>페이지 : <%=nowPage %> / <%=pageCount %></span>
		      	</div>
		      	<!-- div.tblTop 끝 -->
		    <div class="main">
<!-- 					<div class="listTop dFlex"> -->
<!-- 						<div class="th-title">제목</div> -->
<!-- 						<div class="th-btn">내용</div> -->
<!-- 					</div> -->
					<!-- div.listTop -->
					<%
					for (int i = 0; i < objList.size(); i++) {
						BoardVO objVO = (BoardVO) objList.get(i);
					%>
					<div class="sub-main">
						<div class="td-title">
							<div class="row dFlex">
								<div class="title">
									<label for="faqRow<%=i + 1%>"> 
										<span>&ensp;<%=objVO.getTitle()%></span>
										<img src="/images/icon-arrow-open-blue.png" alt="" />
									</label> 
									<input type="checkbox" class="faqBtn hidden" id="faqRow<%=i + 1%>">
								</div>
								<!-- div.title -->
							</div>
							<!-- div.row -->
							<div class="content hidden">
								<pre><%=objVO.getContent()%></pre>
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
		      			<script>location.href = "/data/faqNoData.jsp";</script>
		      		<%
		      			}
					%>
	    	 		
</div>
<!-- div.footerArea -->
</div>

</div>
<!-- div.inner -->

</div>
<!-- div.subbody -->
		<%@ include file="/include/footer.jsp"%>
  </div>
  <!-- div#wrap -->
</body>
</html>