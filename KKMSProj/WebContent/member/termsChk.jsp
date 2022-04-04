<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>:회원가입</title>
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
				<form action="/member/join.jsp" id="termsForm" method="get">
					<div id="termsArea">
						<div class="termsRow">
							<p>
								<span> <input type="checkbox" id="chkAll" name="chkAll">
									<label for="chkAll"> <span class="chkAllTxt">
											이용약관, 개인정보 수집(필수), 프로모션 정보 수신(선택)에 모두 동의합니다.--내용수정필요 </span>
								</label>
								</span>
							</p>
						</div>
						<div class="termsRow">
							<p>
								<input type="checkbox" id="chkService" name="chkService">
								<label for="chkService"> <span class="termsTitle">
										사이트 이용약관 동의<span class="req">(필수)</span>
								</span>
								</label>
							</p>
							<iframe src="/include/usingAgree.jsp" class="termsTxt"></iframe>
						</div>
						<div class="termsRow">
							<p>
								<input type="checkbox" id="chkPrivacy" name="chkPrivacy">
								<label for="chkPrivacy"> <span class="termsTitle">
										개인정보 이용 동의<span class="req">(필수)</span>
								</span>
								</label>
							</p>
							<iframe src="/include/privacyAgree.jsp" class="termsTxt"></iframe>
						</div>
						<div class="termsRow">
							<p>
								<input type="checkbox" id="termsAds" value="Y" name="termsAds">
								<label for="termsAds"> <span class="termsTitle">
										프로모션 정보 수신 동의<span class="termsOption">(선택)</span>
								</span>
								</label>
							</p>
							<iframe src="/include/adsAgree.jsp" class="termsTxt"></iframe>
						</div>
					</div>
					<!-- div#termsArea -->
					<div id="termsBtnArea">
						<button id="termsBtn" type="button" onclick="termsChk(this.form)">확인</button>
						<button type="reset">취소</button>
					</div>
				</form>
				<!-- termsForm -->
			</div>
		</div>
	</div>
	<!-- div#wrap -->

</body>
</html>