<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack_DBCP.DBConnectionMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="regVO" class="pack_EzPro.BoardVO" />
<jsp:useBean id="memMgr" class="pack_EzPro.BoardDAO" />
<jsp:setProperty name="regVO" property="*" />
<% 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Document</title>
     <link rel="stylesheet" href="/style/style_Common.css">
     <link rel="stylesheet" href="/style/style2.css">
     <link rel="stylesheet" href="/style/style3.css">
     <script src="/source/jquery-3.6.0.min.js"></script>
	 <script src="/source/gsap.min.js"></script>
	 <script src="/script/script_bbs.js"></script>
	 <script src="/script/memberScript.js"></script>
</head>
<body>

  <div id="wrap">
  <%@ include file="/include/header.jsp"%>
		<div class="sub-body dFlex">
				<div class="mypageInner">
					<%@include file="/include/myPageAside.jsp" %>				        
         		</div>
				<!-- div.mypageInner -->			
			<div class="inner">
				<div class="tit-cont"> <!--  title -->
					<p class="tit">글쓰기</p>
				</div>
				<!-- div.tit-cont -->

        <form action="/data/writeRes.jsp" id="writeFrm" method="get">
        <div id="main">
        
 		<div id="header">
        <hr id="headHR">
        </div>
        <!-- div#header -->
       
        <table id="writeTbl">
        	<tbody>
        	<tr>
        		<td>
        		<input type="hidden" name="wName" value="<%=memberId %>">
        			<span id="writer">작성자 : <%=memberId %></span>
        		</td>
        	</tr>
        		<tr>
        			<td>
        				<select name="division" id="division">
        					<option value="">구 분</option>
        					<option value="공지사항">공지사항</option>
        					<option value="FAQ">FAQ</option>
        				</select>
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<input type="text" name="title" placeholder="제목을 입력해 주세요."
        					id="titleBox" onfocus="this.placeholder=''"
        					onblur="this.placeholder='제목을 입력해 주세요.'">
        			</td>
        		</tr>
        		<tr>
        			<td id="bg">
        				<img src="/images/fileIcon.png" alt="파일" class='icon'>
        				<img src="/images/pictureIcon.png" alt="사진" class='icon'>
        				<img src="/images/videoIcon.png" alt="동영상" class='icon'>
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<textarea name="content" id="content" cols="50" rows="15"
        				  placeholder="내용을 입력해주세요" 
        				  onfocus="this.placeholder=''"
        				  onblur="this.placeholder='내용을 입력해주세요'"></textarea>
        			</td>
        		</tr>
        	</tbody>
        </table>
 		<div class="btnArea">
 			<button type="submit" class="writeBtn" id="formSave">작성하기</button>
 			<button type="button" class="writeBtn" id="cancel">취소</button>
 		</div>
 		<!-- div#btnArea -->

        </div>
 		<!-- div#main -->
         </form>



</div>
<!-- div.inner -->
</div>
<!-- div.sub-body -->
	<%@ include file="/include/footer.jsp"%>
  </div>
  <!-- div#wrap -->
</body>
</html>