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
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script.js"></script>
</head>
<body>

	<header id="header" class="dFlex">
		<div id="headerLogo">로고영역</div>
		<nav id="gnb" class="dFlex">
			<div class="headerMenu">
				<a href="">메뉴1</a>
			</div>
			<div class="headerMenu">
				<a href="">메뉴2</a>
			</div>
			<div class="headerMenu">
				<a href="">메뉴3</a>
			</div>
			<div class="headerMenu">
				<a href="">메뉴4</a>
			</div>
			<div class="headerMenu">
				<a href="">메뉴5</a>
			</div>
		</nav>
		<!-- nav#gnb -->
		<div id="util">
			<div id="loginMenu">
				<a href="/member/login.jsp">로그인버튼 이미지</a>
			</div>
			<!-- div#loginMenu  -->
			<div id="utilMenu">
				<%
				String memberId = (String) session.getAttribute("memID");
				if (memberId != null) {
				%>
				<div id="loginId"><%=memberId%>
					님 안녕하세요.
				</div>
				
				<div id="logout">
					<a href="/member/logout.jsp">로그아웃</a>
				</div>
				<%
				} else {
				%>
				<a href="/member/termsChk.jsp">회원가입</a> <span> / </span> <a
					href="/member/find.jsp">아이디 찾기</a> <span> / </span> <a
					href="/member/find.jsp">비밀번호 찾기</a>
				<%
				}
				%>
			</div>
			<!-- div#utilMenu -->

		</div>
		<!-- div#util -->
	</header>




</body>
</html>