<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket :마이페이지</title>
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
		<%@ include file="/include/header.jsp"%>
		<%
		if (memberId == null) {
		%>
		<script>
			location.href = "/index.jsp";
		</script>
		<%
		}
		%>
		<div class="sub-body">
			<div class="inner">
				<div class="mypageInner dFlex">
						<aside class="mypageAside">
							<div class="mypageMenu">
								<a href="/member/mypage.jsp">My page</a>
							</div>
							<div class="mypageMenu mLnbOn">
								<a href="/member/modify.jsp">회원정보 수정</a>
							</div>
							<div class="mypageMenu">
								<a href="/member/withdraw.jsp">회원 탈퇴</a>
							</div>
						</aside>
					<div class="mypageArea">
					<div class="mypageTit">
							<h1>회원정보 수정</h1>
						</div>
						<div id="modifyChkArea">
							<input type="password" id="modifyPw" name="modifyPw"
								placeholder="비밀번호 입력" maxlength="16">
							<button type="button" id="modifyPwBtn">확인</button>
						</div>
						<!-- div#modifyChkArea -->
						<div id="modifyChkRes">
							<p id="modifyErrMsg"></p>
						</div>
					</div>
					<!-- div.mypageArea -->
				</div>
				<!-- div.mypageInner -->
			</div>
			<!-- div.inner -->
		</div>
		<!-- div.sub-body -->
		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->

</body>
</html>