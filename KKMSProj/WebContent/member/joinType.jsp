<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket :회원가입</title>
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
		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont"> <!--  title -->
					<p class="tit">회원가입</p>
					<div class="joinStep">
						<ul class="dFlex">
							<li class="nowStep">step 1. 회원 선택</li>
							<li>&gt;</li>
							<li>step 2. 약관 동의</li>
							<li>&gt;</li>
							<li>step 3. 정보 입력</li>
							<li>&gt;</li>
							<li>step 4. 가입 완료</li>
						</ul>
					</div>
				</div>

					<div class="choiceJoin">
						<a href="/member/sellerTermsChk.jsp" id="sellerMember">
						<img src="/images/join-seller.png" alt="" />
						</a>
						<a href="/member/termsChk.jsp" id="generalMember">
						<img src="/images/join-general.png" alt="" />
						</a>
					</div>
			</div>
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->

</body>
</html>