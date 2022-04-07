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
BoardDAO objDAO = new BoardDAO();
int cnt = objDAO.BoardCount();		//데이터 갯수
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
	objList = objDAO.BoardList(firstData,pageSize);
}
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
  		
  		<div class="searchArea">
  			<span>Search</span>
  			<input type="text" placeholder="제목 및 내용을 검색해보세요" id="searchBox" size="30"
  			  onfocus="this.placeholder=''" onblur="this.placeholder='제목 및 내용을 검색해보세요'">
  			<button type="button" class="btnImg">검색</button>
  		</div>
  		<!-- div.searchArea -->
        <hr id="headHR">
	<%
			DBConnectionMgr pool = DBConnectionMgr.getInstance();
	
	    	Connection 		objConn = null;     	// DB 접속 담당
	    	Statement			objStmt = null; 		// SQL(=쿼리문) 담당
	    	                                                    // Select에 사용
	    	ResultSet 			objRS = null; 			// 반환된 데이터셋 담당
	    	
	    	try {
		    /*	Class.forName("com.mysql.cj.jdbc.Driver");   // MySQL에서 만든 Driver 클래스 등록하기
		    	
		    	String url = "jdbc:mysql://localhost:3306/bbs?";
		         url += "serverTimezone=UTC&";
		         url += "useSSL=false&";
		         url += "useUnicode=true&";
		         url += "setCharacterEncoding=UTF-8";	    	
		        String user = "root";	    	
		        String password = "1234";    	*/
		        objConn = pool.getConnection();
	    		//out.print("DB 접속 성공!");
	    		
	    		String sql = "select * from bbsList order by no desc";
	    		objStmt = objConn.createStatement();
	    		objRS = objStmt.executeQuery(sql);
	    		
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
		      			<col width="8%" />
		      			<col width="10%"/>
		      			<col width="40%"/>
		      			<col width="12%"/>
		      			<col width="10%"/>
		      			<col width="10%"/>
		      			<col width="10%"/>
		      		</colgroup>
		      			<thead>
		      				<tr>
		      					<th>번호</th>
		      					<th>구분</th>
		      					<th>제목</th>
		      					<th>작성자</th>
		      					<th>게시일</th>
		      					<th>조회수</th>
		      					<th>내용보기</th>
		      				</tr>
		      			</thead>
		      				<tbody>
		      				<%
		      				// JSP 코드 영역
		      				for(int i=0; i<objList.size(); i++){
		      					BoardVO objVO = (BoardVO)objList.get(i);
		      				%>
		      					<tr>
		      						<td><a href="bbsList.jsp?no=<%=objVO.getNo() %>&pageNum=<%=pageNum %>"><%=objVO.getNo() %></a></td>
		      						<td><%=objVO.getDivision() %></td>
		      						<td><%=objVO.getTitle() %></td>
		      						<td><%=objVO.getwName() %></td>
		      						<td><%=objVO.getPostDate() %></td>
		      						<td><%=objVO.getCount() %></td>
		      						<td><img src="/images/detailIcon.png" alt="펼침버튼"></td>
		      					</tr>
		      				
		      				<% 
		      				}
		      				%>
		      		
		      				</tbody>
		      	</table>
		      </div>
		      <!-- div.tblArea 끝 -->
		      
		      <div class="footerArea">
		      	<div class="pageArea">
		      		<%
		      		//처음 페이지 이동 할 때
		      			if(startPage > pageBlock){
		      				%>
		      				<a href="bbsList.jsp?pageNum=<%=startPage-pageBlock %>">&lt;&lt;</a>
		      				<%
		      			}else{
		      				%>
		      				<a href="javascript:">&lt;&lt;</a>
		      				<%
		      			}
		      		// 이전 페이지 이동 할 때 
		      		if(nowPage > 1){
		      		%>
		      		<a href="bbsList.jsp?pageNum=<%=nowPage-1 %>">&lt;</a>
		      		<%
		      			
		      		}else if(nowPage == startPage){
		      		%>
		      		<a href="bbsList.jsp?pageNum=<%=nowPage %>">&lt;</a>
		      		<%
		      		}
		      		
		      		int pageCnt = 1;
		      		
		      		// 페이지 표시
		      		for(int i = startPage; i <= endPage ; i++){
		      			pageCnt++;
		      			if(i == nowPage){		//현재 페이지 일때
		      		%>
		      			<a href="bbsList.jsp?pageNum=<%=i %>" class="nowPage"><%=i %></a>
		      		<%
		      			}else{		//현재 페이지가 아닐때
		      		%>
		      			<a href="bbsList.jsp?pageNum=<%=i %>"><%=i %></a>
		      		<%
		      			}
		      		}
		      		//다음 페이지 이동 할 때
		      		if(nowPage < pageCount){
		      		%>
		      			<a href="bbsList.jsp?pageNum=<%=nowPage+1 %>">&gt;</a>
		      		<%
		      		}else{
		      		%>
		      			<a href="javascript:">&gt;</a>	
		      		<%
		      		}
		      		
		      		// 끝 페이지로 이동 할 때
		      		if(endPage < pageCount){
		      		%>
		      			<a href="bbsList.jsp?pageNum=<%=startPage+pageBlock %>">&gt;&gt;</a>
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
		      			<!-- <script>location.href = "/data/noData.jsp";</script> -->
		      		<%
		      			}
			
	    		
	    	}catch (ClassNotFoundException e){
	    		out.print("CNFE : " + e.getMessage());
	    	}catch (SQLException e){
	    		out.print("SQLException : " + e.getMessage());
	    	}finally{
	    		pool.freeConnection(objConn, objStmt, objRS);
	    	}
	    	 %>
	    	 		
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