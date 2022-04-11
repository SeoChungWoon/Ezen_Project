<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack_DBCP.DBConnectionMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="regVO" class="pack_EzPro.BoardVO" />
<jsp:useBean id="memMgr" class="pack_EzPro.BoardDAO" />
<jsp:setProperty name="regVO" property="*" />
<% 
boolean flag = memMgr.mtdWrite(regVO);
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
	 <script src="/script/memberScript.js"></script>
</head>
<body>

  <div id="wrap">
  <%@ include file="/include/header.jsp"%>
		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont"> <!--  title -->
					<p class="tit">글쓰기</p>
				</div>
				<!-- div.tit-cont -->
 		<div id="header">
        <hr id="headHR">
        </div>
        <!-- div#header -->
        
        
        <form action="/data/bbsList.jsp" id="writeFrm" method="post">
        <div id="main">
       
        <table id="writeTbl">
        	<tbody>
        	<tr>
        		<td>
        			<span>작성자 : </span>
					<input type="text" id="writer" readonly name="wName">
        		</td>
        	</tr>
        		<tr>
        			<td>
        				<select name="division" id="division">
        					<option value="">구 분</option>
        					<option>공지사항</option>
        					<option>FAQ</option>
        					<option>이용안내</option>
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
        				<textarea name="script" id="content" cols="50" rows="15"
        				  placeholder="내용을 입력해주세요" 
        				  onfocus="this.placeholder=''"
        				  onblur="this.placeholder='내용을 입력해주세요'"></textarea>
        			</td>
        		</tr>
        	</tbody>
        </table>
        </div>
 		<!-- div#main -->
 		<div id="setPwArea">
 			<div id="setPw">
 				<span>공개 여부 : </span>
 				공개 <input type="radio" class="setPw" id="openChk" name="gender">
 				비공개 <input type="radio" class="setPw" id="lockChk" name="gender">
 			</div>
 			<!-- div#setPw -->
 			<div id="contentPw">
 				<span>비밀번호 :</span> 
 				<input type="password" class="cPwBox" id="inputPw">
 			</div>
 			<div id="alert"></div>
 		</div>
 		<!-- div#setPwArea -->
 		<div id="btnArea">
 			<button type="submit" class="writeBtn">저장하기</button>
 			<button type="button" class="writeBtn">취소</button>
 		</div>
 		<!-- div#btnArea -->
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