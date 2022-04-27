<%@page import="java.util.List"%>
<%@page import="pack_EzPro.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pack_EzPro.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	BoardDAO objDAO = new BoardDAO();
	String divisions = "공지사항";
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
					<p class="tit">공지게시판</p>
				</div>
				<!--div.tit-cont  -->
		      		<div class="resMsg">
							<span id="scWord">"<%=searchText %>"</span>(으)로 조회된 결과는 <span id="scCnt"><%=list.size() %></span>개 입니다.
					</div>
					<!-- div.resMsg -->
				<div class="scTblArea">
					<table>
		      		<colgroup>
		      			<col width="8%" />
		      			<col width="10%"/>
		      			<col width="40%"/>
		      			<col width="12%"/>
		      			<col width="15%"/>
		      			<col width="15%"/>
		      		</colgroup>
		      			<thead>
		      				<tr>
		      					<th>번호</th>
		      					<th>구분</th>
		      					<th>제목</th>
		      					<th>작성자</th>
		      					<th>게시일</th>
		      					<th>조회수</th>
		      				</tr>
		      			</thead>
						<%
		      				// JSP 코드 영역
		      				for(int i=0; i<list.size(); i++){
		      					BoardVO objVO = (BoardVO)list.get(i);
		      			%>
		      				<tbody>
		      					<tr>
		      						<td><a href="bbsList.jsp?no=<%=objVO.getNo() %>"><%=objVO.getNo() %></a></td>
		      						<td><%=objVO.getDivisions() %></td>
		      						<td>
		      						<a href="noticeView.jsp?no=<%=objVO.getNo() %>&title=<%=objVO.getTitle() %>&count=<%=objVO.getCount() %>&header=<%=objVO.getHeader()%>"><%=objVO.getTitle() %></a></td>
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
				<!--div.scTblArea  -->
					<div class="btnArea btn-cont" id="scBtn">
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