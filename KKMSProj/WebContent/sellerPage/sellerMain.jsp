<%@page import="pack_Event.eventBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket :판매자메뉴</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<link rel="stylesheet" href="/style/style_Event.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
<script src="/script/eventScript.js"></script>
</head>
<body>
	<div id="wrap">

		<%@ include file="/include/sellerHeader.jsp"%>

		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont">
					<!--  title -->
					<p class="tit">판매자페이지 메인</p>
				</div>
			</div>
			<!-- div.inner -->
		</div>
		<!-- div.sub-body -->

		<%@ include file="/include/footer.jsp"%>

	</div>
	<!-- div#wrap -->

</body>
</html>