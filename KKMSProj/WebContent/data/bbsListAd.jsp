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
String division = "공지사항";
BoardDAO objDAO = new BoardDAO();
int cnt = objDAO.BoardCount(division);		//데이터 갯수
int pageSize = 10;

String pageNum = request.getParameter("pageNum");
if(pageNum==null){
	pageNum = "1";
}

int nowPage = Integer.parseInt(pageNum);
int firstData = (nowPage-1)*pageSize;
int lastData = nowPage * pageSize-1;

List objList = null;

if(cnt != 0){
	objList = objDAO.BoardList(firstData,pageSize,division);
}
BoardVO objVO = null;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>공지사항</title>
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
					<p class="tit">공지게시판</p>
				</div>
				<!--div.tit-cont  -->
  		<form action="searchRes.jsp" method="post" name="search">
  		<div class="searchArea">
  			<span>Search</span>
  			<select name="searchField" class="searchDV">
  				<option value="0">선택</option>
  				<option value="title">제목</option>
  				<option value="content">내용</option>
  			</select>
  			<input type="text" placeholder="제목 및 내용을 검색해보세요" name='searchText' id="searchBox" size="30"
  			  onfocus="this.placeholder=''" onblur="this.placeholder='제목 및 내용을 검색해보세요'">
  			<button type="submit" class="btnImg">검색</button>
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
		      			<col width="10%"/>
		      			<col width="40%"/>
		      			<col width="20%"/>
		      			<col width="15%"/>
		      			<col width="15%"/>
		      		</colgroup>
		      			<thead>
		      				<tr>	    
		      					<th>구분</th>
		      					<th>제목</th>
		      					<th>작성자</th>
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
		      						<td><%=objVO.getDivision() %></td>
		      						<td>
		      						<a href="noticeViewAd.jsp?no=<%=objVO.getNo() %>&title=<%=objVO.getTitle() %>&count=<%=objVO.getCount() %>&division=<%=division%>"><%=objVO.getTitle() %></a></td>
		      						<td><%=objVO.getwName() %></td>
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
		      	<div class="pageArea">
		      		<%
		      		//처음 페이지 이동 할 때
		      			if(startPage > pageBlock){
		      				%>
		      				<a href="bbsListAd.jsp?pageNum=<%=startPage-pageBlock %>">&lt;&lt;</a>
		      				<%
		      			}else{
		      				%>
		      				<a href="javascript:">&lt;&lt;</a>
		      				<%
		      			}
		      		// 이전 페이지 이동 할 때 
		      		if(nowPage > 1){
		      		%>
		      		<a href="bbsListAd.jsp?pageNum=<%=nowPage-1 %>">&lt;</a>
		      		<%
		      			
		      		}else if(nowPage == startPage){
		      		%>
		      		<a href="bbsListAd.jsp?pageNum=<%=nowPage %>">&lt;</a>
		      		<%
		      		}
		      		
		      		int pageCnt = 1;
		      		
		      		// 페이지 표시
		      		for(int i = startPage; i <= endPage ; i++){
		      			pageCnt++;
		      			if(i == nowPage){		//현재 페이지 일때
		      		%>
		      			<a href="bbsListAd.jsp?pageNum=<%=i %>" class="nowPage"><%=i %></a>
		      		<%
		      			}else{		//현재 페이지가 아닐때
		      		%>
		      			<a href="bbsListAd.jsp?pageNum=<%=i %>"><%=i %></a>
		      		<%
		      			}
		      		}
		      		//다음 페이지 이동 할 때
		      		if(nowPage < pageCount){
		      		%>
		      			<a href="bbsListAd.jsp?pageNum=<%=nowPage+1 %>">&gt;</a>
		      		<%
		      		}else{
		      		%>
		      			<a href="javascript:">&gt;</a>	
		      		<%
		      		}
		      		
		      		// 끝 페이지로 이동 할 때
		      		if(endPage < pageCount){
		      		%>
		      			<a href="bbsListAd.jsp?pageNum=<%=startPage+pageBlock %>">&gt;&gt;</a>
		      		<%
		      		}else{
		      		%>
		      			<a href="javascript:">&gt;&gt;</a>	
		      		<%
		      		}
		      		%>
		      	</div>
		      	<!-- div.pageArea -->
		      		<%
		      			}else{
		      		%>
		      			  <script>location.href = "/data/noData.jsp";</script>
		      		<%
		      			}
	    	 		%>
					
	    		<div class="btnArea">
	    			<input type="hidden" class="chkWrite" value="<%=division %>">
	    			<button type="button" class="write">글쓰기</button>
	    		</div> 		
	   
</div>
<!-- div.footerArea -->
</div>
<!-- div.inner -->
</div>
<!-- div.subbody -->
		<%@ include file="/include/footer.jsp"%>
  </div>
  <!-- div#wrap -->
</body>
</html>