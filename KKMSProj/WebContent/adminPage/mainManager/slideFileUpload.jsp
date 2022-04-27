<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Ticket :메인페이지 관리</title>
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style1.css">
	<link rel="stylesheet" href="/style/style2.css">
	<link rel="stylesheet" href="/adminPage/style/style_admin_Common.css">
	<link rel="stylesheet" href="/adminPage/style/style_admin.css">
	<link rel="stylesheet" href="/adminPage/style/style_adminMain.css">
	<link rel="stylesheet" href="/style/style_Event.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script src="/source/gsap.min.js"></script>
	<script src="/script/script.js"></script>
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
						<p>메인 관리 <span class="smallFont">&gt; 슬라이드 파일 업로드</span></p>
					</div>
					
						<div class="slide-upload">
							<form name="file" method="post" enctype="multipart/form-data" action="fileAction.jsp">
								 <div class="manager-inner">
									<table class="mainSlideTable">
										<colgroup>
											<col width="14%" />
											<col width="14%" />
											<col width="13%" />
											<col width="13%" />
											<col width="13%" />
											<col width="13%" />
											<col width="13%" />
											<col width="7%" />
										</colgroup>
											 <thead>
												<tr>
													<th>이미지 선택</th>
													<th>제목</th>
													<th>설명</th>
													<th>종류</th>
													<th>시작일</th>
													<th>종료일</th>
													<th>장소</th>
													<th>전송</th>														
												</tr>
								  		     </thead>
												<tr>
									
													<td><input type="file" name="mFileName"></td>
													<td><input type="text" name="mTitle"></td>												
								  		     		<td><input type="text" name="mExplain"></td>
								  		     		<td><input type="text" name="mType"></td>
								  		     		<td><input type="text" name="mDate1"></td>
								  		     		<td><input type="text" name="mDate2"></td>
								  		     		<td><input type="text" name="mPlace"></td>
								  		     		<td>
								  		     		<div class="btn-cont">								  		     		
								  		     		<!-- <input type="submit" value="파일 업로드" > --> 
								  		     		<button type="submit" class="btnIMg">등록하기</button>
								  		     		</div>
													</td>
											  
											  
								  		     </tr>
								  	</table>
								  </div>
								  
							</form>
								
							
						</div>
										
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