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
	String divisions = "공지사항";
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
						<p>게시판 관리<span class="smallFont">&gt; 공지사항 관리 &gt; 글쓰기</span></p>
					</div>

        <div class="main">
        <form action="/adminPage/bbsManager/writeRes.jsp" id="writeFrm" method="get">
        
 		<div id="header">
        	<hr id="headHR">
        </div>
        <!-- div#header -->
       
        <table id="writeTbl">
        	<tbody>
        	<tr>
        		<td>
        		<input type="hidden" name="wName" value="관리자">
        			<span id="writer">작성자 : 관리자</span>
        		</td>
        	</tr>
        		<tr>
        			<td>
        				<input type="hidden" id="writeChk" name="divisions" value="<%=divisions %>">
        				<select name="header" id="header">
        					<option value="" id="standard">구 분</option>
        					<option value="[공지]" id="otNotice">[공지]</option>
        					<option value="[안내]" id="otInfo">[안내]</option>
        					<option value="[이벤트]" id="otEvent">[이벤트]</option>
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
 		<div class="btnArea btn-cont writeBtnArea">
 			<button type="submit" class="writeBtn" id="formSave">작성하기</button>
 			<button type="button" class="writeBtn" id="cancel">취소</button>
 		</div>
 		<!-- div#btnArea -->

         </form>
        </div>
 		<!-- div#main -->


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