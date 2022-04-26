<%@page import="pack_Member.ZipcodeBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />

<%
request.setCharacterEncoding("UTF-8");
String memberId = (String) session.getAttribute("memID");
if(memberId==null) {
	%>
	<script>
	location.href="/index.jsp";
	</script>
	<%
}

%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket :예매내역</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
</head>
<body>
	<div id="wrap">
		<div class="sub-body">
			<div class="inner myResInner">
					<div class="tit-cont">
						<!--  title -->
						<p class="tit">예매내역</p>
					</div>
					

					<div id="myReserveArea">

						
						<div class="resMsg">
							<span>예매한 전시가 없습니다.</span>
						</div>
						
						<div class="resMsg">
							<span> 개의 예매내역이 있습니다.
							</span>
						</div>
						<hr>
						
						<div class="myReserveList">
							<div class="myReserveTitle">
							전시 이미지
							</div>
							<div class="myReserve-cont">
								
							</div>
							<div class="myReserveDate">
							내 리뷰 날짜
							</div>
						</div>
						
					</div>
					<!-- div.myReserveArea -->
					<div class="mypagePopClose btn-cont">
						<button type="button">닫기</button>
					</div>
					<!-- div.mypagePopClose -->

			</div>
			<!-- div.inner -->
		</div>
		<!-- div.sub-body -->
	</div>
	<!-- div#wrap -->

</body>
</html>
