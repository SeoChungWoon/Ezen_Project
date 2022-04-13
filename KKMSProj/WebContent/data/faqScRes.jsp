<%@page import="pack_FAQ.FaqVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pack_FAQ.FaqDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	FaqDAO objDAO = new FaqDAO();
	String searchField = request.getParameter("searchField");
	String searchText = request.getParameter("searchText");
	ArrayList list = objDAO.getSearch(searchField, searchText);
	
	
	

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
					<p class="tit">FAQ게시판</p>
				</div>
				<!--div.tit-cont  -->
		      		<div class="resMsg">
							<span id="scWord">"<%=searchText %>"</span>(으)로 조회된 결과는 <span id="scCnt"><%=list.size() %></span>개 입니다.
					</div>
					<!-- div.resMsg -->
				<div class="scTblArea">
					<table>
		      		<colgroup>
		      			<col width="20%" />
		      			<col width="60%"/>
		      			<col width="20%"/>
		      		</colgroup>
		      			<thead>
		      				<tr>
		      					<th>구분</th>
		      					<th>제목</th>
		      					<th>내용보기</th>
		      				</tr>
		      			</thead>
						<%
		      				// JSP 코드 영역
		      				for(int i=0; i<list.size(); i++){
		      					FaqVO objVO = (FaqVO)list.get(i);
		      					
		      			%>
		      				<tbody>
		      					<tr>
		      						<td><%=objVO.getfDivision() %></td>
		      						<td>
		      						<a href="noticeView.jsp?no=<%=objVO.getfNo() %>&title=<%=objVO.getfTitle() %>"><%=objVO.getfTitle() %></a>
		      						</td>
		      						<td>
		      						<label for="faqRow<%=i+1%>">
		      						<img src="/images/detailIcon.png" alt="펼침버튼" class="detailIcon">
		      						</label>
		      						<input type="checkbox" class="faqBtn hidden" id="faqRow<%=i+1 %>">
		      						</td>
		      					</tr>
		      					<tr class="hidden">
		      						<td class="hide" colspan="3">
		      							<pre><%=objVO.getfContent() %></pre>
		      						</td>
		      					</tr>		      		
		      				<% 
		      				}
		      				%>
		      		
		      				</tbody>
		      	</table>

				</div>
				<!--div.scTblArea  -->
		</div>
        <!-- div.inner -->
	</div>
	<!-- div.sub-body -->
  </div>
  <!-- div#wrap -->
</body>
</html>