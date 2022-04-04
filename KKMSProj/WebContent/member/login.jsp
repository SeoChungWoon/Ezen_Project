<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="/style/style2.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/memberScript.js"></script>
</head>
<body>
	<div id="wrap">
		<%@ include file="/include/header.jsp"%>
		<h1>로그인</h1>
		<hr id="headHR">
		<form action="/member/loginProc.jsp" id="loginForm" method="post">
			<div id="loginArea" class="dFlex">
				<div id="idPwArea">
					<div id="idArea">
						<input type="text" id="memberid" name="memberid" maxlength="15" placeholder="아이디">
					</div>

					<div id="pwArea">
						<input type="password" id="memberpw" name="memberpw" maxlength="16" placeholder="비밀번호">
					</div>

				</div>
				<!-- div#idPwArea -->

				<div id="loginBtnArea">
					<button type="button" id="loginBtn">로그인</button>
				</div>
			</div>
			<!-- div#loginArea -->
			<div id="loginResArea">
				<p id="loginErrMsg">
				
				</p>
			</div>
			<div id="utilArea">
				<a href="/member/join.jsp">회원가입</a> <span> / </span> <a href="">아이디
					찾기</a> <span> / </span> <a href="">비밀번호 찾기</a>
			</div>
		</form>
		<!-- loginForm -->

		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->

</body>
</html>