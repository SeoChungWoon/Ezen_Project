<%@page import="pack_DBCP.DBConnectionMgr"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="pack_EzPro.BoardDAO" import="pack_EzPro.BoardVO"%>

<%
request.setCharacterEncoding("UTF-8");
String divisions = "공지사항";
BoardDAO objDAO = new BoardDAO();
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
     <title>E-Ticket : 회원 관리</title>
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
					<div class="bbssListArea">
  		<form action="searchResAd.jsp" method="get" name="search">
  		<div class="searchArea dFlex">
  			<div class="seachTxt">
  			<span>Search</span>
  			<select name="searchField" class="searchDV">
  				<option value="0">선택</option>
  				<option value="title">제목</option>
  				<option value="content">내용</option>
  			</select>
  			<input type="text" placeholder="제목 및 내용을 검색해보세요" name='searchText' id="searchBox" size="30"
  			  onfocus="this.placeholder=''" onblur="this.placeholder='제목 및 내용을 검색해보세요'">
  			  </div>
  			  <!-- div.seatchTxt -->
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
		      <div class="tblArea">
		      	<div class="tblTop">
		      		<span>전체 게시물 : <%=cnt %>개</span>
		      		<span>페이지 : <%=nowPage %> / <%=pageCount %></span>
		      	</div>
		      	<!-- div.tblTop 끝 -->
		      	
		      	<table>
		      		<colgroup>
		      			<col width="15%"/>
		      			<col width="45%"/>
		      			<col width="25%"/>
		      			<col width="15%"/>
		      		</colgroup>
		      			<thead>
		      				<tr>	    
		      					<th>구분</th>
		      					<th>제목</th>
		      					<th>게시일</th>
		      					<th>조회수</th>
		      				</tr>
		      			</thead>
		      				<tbody>
		      				<%
		      				// JSP 코드 영역
		      				for(int i=0; i<objList.size(); i++){
		      					objVO = (BoardVO)objList.get(i);
		      				%>
		      					<tr>
		      						<td><%=objVO.getHeader() %></td>
		      						<td>
		      						<a href="noticeViewAd.jsp?no=<%=objVO.getNo() %>&title=<%=objVO.getTitle() %>&count=<%=objVO.getCount() %>&divisions=<%=divisions%>&header=<%=objVO.getHeader()%>&fileName=<%=objVO.getFileName()%>"><%=objVO.getTitle() %></a></td>
		      						<td><%=objVO.getPostDate() %></td>
		      						<td><%=objVO.getCount() %></td>
		      					</tr>
		      				
		      				<% 
		      				}
		      				%>
		      		
		      				</tbody>
		      	</table>
		      </div>
		      <!-- div.tblArea 끝 -->
		      
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
		      		<span>전체 게시물 : 0개</span>
		      		<span>페이지 : 0 / 0</span>
		      	</div>
		      	<!-- div.tblTop 끝 -->
		      	
		      	<table>
		      		<colgroup>
		      			<col width="15%"/>
		      			<col width="45%"/>
		      			<col width="25%"/>
		      			<col width="15%"/>
		      		</colgroup>
		      			<thead>
		      				<tr>	    
		      					<th>구분</th>
		      					<th>제목</th>
		      					<th>게시일</th>
		      					<th>조회수</th>
		      				</tr>
		      			</thead>
		      				<tbody>
		      					<tr>
		      						<td colspan=4><span>등록된 게시물이 없습니다.</span></td>
		      					</tr>
		      				</tbody>
		      	</table>
		      </div>
		      <!-- div.tblArea 끝 -->
		      		<%
		      			}
	    	 		%>
					
	    		<div class="btnArea btn-cont">
	    			<input type="hidden" class="chkWrite" value="<%=divisions %>">
	    			<button type="button" class="write">글쓰기</button>
	    		</div> 		
	   
</div>
<!-- div.footerArea -->
</div>
<!-- div.bbsListArea -->
			</div>
			<!-- div.manager-cont -->
		</div>
		<!-- div.managerPage -->
</div>
<!-- div.inner -->
</div>
<!-- div.subbody -->
  </div>
  <!-- div#wrap -->
</body>
</html>