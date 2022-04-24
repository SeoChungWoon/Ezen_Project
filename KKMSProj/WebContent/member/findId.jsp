<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기</title>
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
			<div class="inner findIdPwInner">
				<div class="tit-cont">
					<!--  title -->
					<p class="tit">
					<span>아이디 찾기</span><a href="/member/findPw.jsp">비밀번호 찾기</a>
					</p>
				</div>
					<div class="findIdPwArea">
						<form action="/member/findIdProc.jsp" id="idFindForm" method="post">
							<div class="findIdPwRow">
								<div class="howToFind">
									<label for="pIdFind">
									<span class="fTitle">휴대전화 번호로 찾기</span>
									<img src="/images/icon-arrow-open-blue.png" alt="" />
									</label>
									<input type="checkbox" id="pIdFind" class="fToggle">
								</div>
								<div class="findValArea hidden">
									<input type="text" name="pIdName" placeholder="이름 입력">
									<input type="text" name="pIdPhone" placeholder="휴대전화 번호 입력('-'없이 숫자만 입력)">
									<div class="idFindBtnArea btn-cont">
										<button type="button">확인</button>
									</div>
								</div>
							</div>
	
	
							<div class="findIdPwRow">
								<div class="howToFind">
									<label for="eIdFind">
									<span class="fTitle">이메일 주소로 찾기</span>
									<img src="/images/icon-arrow-open-blue.png" alt="" />
									</label>
									<input type="checkbox" id="eIdFind" class="fToggle">
								</div>
	
								<div class="findValArea hidden">
									<input type="text" name="eIdName" placeholder="이름 입력">
									<input type="text" name="eIdEmail" placeholder="이메일 주소 입력">
									<div class="idFindBtnArea btn-cont">
										<button type="button">확인</button>
									</div>
								</div>
							</div>
	
							<div class="findIdPwRow">
								<div class="howToFind">
									<label for="iIdFind">
									<span class="fTitle">본인인증으로 찾기</span>
									<img src="/images/icon-arrow-open-blue.png" alt="" />
									</label>
									<input type="checkbox" id="iIdFind" class="fToggle">
								</div>
	
								<div class="findValArea hidden">
									<div class="otherFindBtnArea btn-cont">
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