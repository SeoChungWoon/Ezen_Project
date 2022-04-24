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
<title>E-Ticket관리자 :로그인</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<link rel="stylesheet" href="/adminPage/style/style_admin2.css">
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
				<div class="tit-cont">
					<!--  title -->
					<p class="tit">관리자 로그인</p>
				</div>

				<div class="login-desc">
					<div id="loginArea" class="dFlex">
						<div id="idPwArea">
							<div id="idArea">
								<input type="text" id="memberid" name="memberid" maxlength="15"
									placeholder="아이디">
							</div>

							<div id="pwArea">
								<input type="password" id="memberpw" name="memberpw"
									maxlength="16" placeholder="비밀번호">
							</div>

						</div>
						<!-- div#idPwArea -->

						<div id="loginBtnArea">
							<button type="button" id="adminLoginBtn">로그인</button>
						</div>
					</div>
					<!-- div#loginArea -->
					<div id="loginResArea">
						<p id="loginErrMsg"></p>
					</div>
				</div>

			</div>
			<!-- div.inner -->
		</div>
		<!-- div.sub-body -->

	</div>
	<!-- div#wrap -->

</body>
</html>