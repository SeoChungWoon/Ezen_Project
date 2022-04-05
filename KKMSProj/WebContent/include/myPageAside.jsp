<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My page</title>
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
			<div class="inner">
				<aside class="myPageAside">
					<div class="myPageMenu">
						<a href="/member/mypage.jsp">My page</a>
					</div>
					<div class="myPageMenu">
						<a href="/member/modify.jsp">회원정보 수정</a>
					</div>
					<div class="myPageMenu">
						<a href="/member/withdraw.jsp">회원 탈퇴</a>
					</div>
				</aside>
				<!-- aside.myPageAside -->
			</div>
		</div>
	</div>
	<!-- div#wrap -->

</body>
</html>