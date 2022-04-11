<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<link rel="stylesheet" href="/style/style_bbs.css">
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
				<div class="tit-cont">
					<!--  title -->
					<p class="tit">비밀번호 찾기<span class="smallFont">/ <a href="/member/findId.jsp">아이디 찾기</a></span></p>
				</div>
					<div class="findIdPwArea">
						<form action="/member/findPwProc.jsp" id="pwFindForm" method="post">
							<div class="findIdPwRow">
								<div class="howToFind">
									<label for="pPwFind">
									<span class="fTitle">휴대전화 번호로 찾기</span>
									</label>
									<input type="checkbox" id="pPwFind" class="fToggle hidden">
								</div>
								<div class="hidden">
									<input type="text" name="pPwId" placeholder="아이디 입력">
									<input type="text" name="pPwName" placeholder="이름 입력">
									<input type="text" name="pPwPhone" placeholder="휴대전화 번호 입력('-'없이 숫자만 입력)">
									<div class="pwFindBtnArea">
										<button type="button">확인</button>
									</div>
								</div>
							</div>
	
	
							<div class="findIdPwRow">
								<div class="howToFind">
									<label for="ePwFind">
									<span class="fTitle">이메일 주소로 찾기</span>
									</label>
									<input type="checkbox" id="ePwFind" class="fToggle hidden">
								</div>
	
								<div class="hidden">
									<input type="text" name="ePwId" placeholder="아이디 입력">
									<input type="text" name="ePwName" placeholder="이름 입력">
									<input type="text" name="ePwEmail" placeholder="이메일 주소 입력">
									<div class="pwFindBtnArea">
										<button type="button">확인</button>
									</div>
								</div>
							</div>
	
							<div class="findIdPwRow">
								<div class="howToFind">
									<label for="iPwFind">
									<span class="fTitle">본인인증으로 찾기</span>
									</label>
									<input type="checkbox" id="iPwFind" class="fToggle hidden">
								</div>
	
								<div class="hidden">
									<div class="otherFindBtnArea">
										<button type="button">휴대전화 인증</button>
										<button type="button">I-Pin 인증</button>
									</div>
								</div>
							</div>
						</form>
						<!-- findForm -->
					</div>
					<!-- div.findIdPwArea -->
			</div>
			<!-- div.inner -->
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->

</body>
</html>