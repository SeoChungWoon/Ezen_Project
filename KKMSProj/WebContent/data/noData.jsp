<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
  <div class="noDataInner">
      <div class="tblArea">
		      	<div class="tblTop">
		      		<span>전체 게시물 : 0개</span>
		      		<span>페이지 : 0 / 0</span>
		      	</div>
		      	<!-- div.tblTop 끝 -->
		      	
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
		      					<th>내용보기</th>
		      					<th>조회수</th>
		      				</tr>
		      			</thead>
		      				<tbody>
		    					<tr>
		      						<td colspan=6>등록된 게시물이 없습니다.</td>
		      					</tr>
		      				
	
		      				</tbody>
		      	</table>
		      </div>
		      <!-- div.tblArea 끝 -->
		      	
		      	  <div class="rpBtn">
		      	  	<button type="button" onclick="main()">메인으로</button>
	    			<button type="button" onclick="writeMove()">글쓰기</button>
	    		</div> 		
</div>
<!-- noDataInner -->
</div>
<!-- div.inner -->
</div>
<!-- div.subbody -->
		<%@ include file="/include/footer.jsp"%>
  </div>
  <!-- div#wrap -->
</body>
</html>