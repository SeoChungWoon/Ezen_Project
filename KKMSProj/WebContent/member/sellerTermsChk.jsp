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
							<li>step 1. 회원 선택</li>
							<li>&gt;</li>
							<li class="nowStep">step 2. 약관 동의</li>
							<li>&gt;</li>
							<li>step 3. 정보 입력</li>
							<li>&gt;</li>
							<li>step 4. 가입 완료</li>
						</ul>
					</div>
				</div>
				
				<form action="/member/sellerJoin.jsp" id="termsForm" method="post">
					<div id="termsArea">
						<div class="termsRow">
							<p>
								<span>
								<input type="checkbox" id="chkAll" class="hidden" name="chkAll">
								<label for="chkAll" class="unchecked">
								<span class="chkAllTxt">
											E-Ticket 판매자 이용약관, 개인정보 수집 및 이용에 모두 동의합니다.
								</span>
								</label>
								</span>
							</p>
						</div>
						<div class="termsRow usingTerms">
							<p>
								<input type="checkbox" id="chkService" class="hidden" name="chkService">
								<label for="chkService" class="unchecked"> <span class="termsTitle">
										E-Ticket 판매자 이용약관 동의<span class="req">(필수)</span>
								</span>
								</label>
							</p>
							<iframe src="/include/usingAgree.jsp" class="termsTxt"></iframe>
						</div>
						<div class="termsRow usingTerms">
							<p>
								<input type="checkbox" id="chkPrivacy" class="hidden" name="chkPrivacy">
								<label for="chkPrivacy" class="unchecked"> <span class="termsTitle">
										개인정보 수집 및 이용 동의<span class="req">(필수)</span>
								</span>
								</label>
							</p>
							<iframe src="/include/privacyAgree.jsp" class="termsTxt"></iframe>
						</div>
					</div>
					<!-- div#termsArea -->
					<div id="termsBtnArea">
						<button type="button" id="termsBtn" >확인</button>
						<button type="button" id="termsReset">취소</button>
					</div>
				</form>
				<!-- termsForm -->
			</div>
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->

</body>
</html>