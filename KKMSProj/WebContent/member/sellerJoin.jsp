<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<%
request.setCharacterEncoding("UTF-8");
String TermsAds = request.getParameter("termsAds");
String reqChk = request.getParameter("chkService");
String chkAll = request.getParameter("chkAll");
if (TermsAds == null) {
	TermsAds = "N";
} else {
	TermsAds = "Y";
}
if (reqChk == null) {
%>
<script>
	location.href = "/member/sellerTermsChk.jsp";
</script>
<%
}
%>

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
				<div class="tit-cont">
					<!--  title -->
					<p class="tit">회원가입</p>
						<div class="joinStep">
							<ul class="dFlex">
								<li>step 1. 회원 선택</li>
								<li>&gt;</li>
								<li>step 2. 약관 동의</li>
								<li>&gt;</li>
								<li class="nowStep">step 3. 정보 입력</li>
								<li>&gt;</li>
								<li>step 4. 가입 완료</li>
							</ul>
						</div>
				</div>
				<form action="/member/sellerJoinProc.jsp" id="joinForm" method=post>
					<div id="joinArea">

						<div class="joinRow">
							<span class="joinTitle">아이디 <span class="smallFont">(5~15자, 영문자와 숫자로만 입력)</span><span class="point"> *</span></span>
						</div>
						<div class="joinRow">
							<input type="text" id="uId" name="uId" maxlength="15"
								onkeyup="idChk(this.form)"> <input type="hidden"
								id="uIdChk">
							<div id="idChkRes" class="hidden">

								<p id="idChkMsg"></p>
							</div>
							<!-- div#idChkRes -->
						</div>


						<div class="joinRow">
							<span class="joinTitle">비밀번호 <span class="smallFont">(8~16자 사이의 비밀번호를 설정)</span><span class="point"> *</span></span>
						</div>
						<div class="joinRow">
							<input type="password" id="uPw" class="joinPw" name="uPw"
								maxlength="16" onkeyup="pwChk(this.form)">
						</div>

						<div class="joinRow">
							<span class="joinTitle">비밀번호 확인</span>
						</div>
						<div class="joinRow">
							<input type="password" id="uPwChk" class="joinPw" name="uPwChk"
								maxlength="16" onkeyup="pwChk(this.form)"> <input
								type="hidden" id="pwMatch">
							<div id="pwChkRes" class="hidden">
								<p id="pwChkMsg">* 비밀번호가 일치하지 않습니다.</p>
							</div>
						</div>


						<div class="joinRow">
							<span class="joinTitle">이름<span class="point"> *</span></span>
						</div>
						<div class="joinRow">
							<input type="text" id="uName" name="uName"
								onkeyup="nameChk(this.form)">
						</div>


						<div class="joinRow">
							<span class="joinTitle">생년월일 <span class="smallFont">(ex. 20220102)</span><span class="point"> *</span></span>
						</div>
						<div class="joinRow">
							<input type="text" id="uBirthday" maxlength="8" name="uBirthday"
								onkeyup="birthChk(this.form)" placeholder="YYYYMMDD">
						</div>


						<div class="joinRow">
							<span class="joinTitle">성별<span class="point"> *</span></span>
						</div>
						<div class="joinRow">
							<div id="genderArea">
								<input type="radio" id="male" class="hidden" name="uGender" value="male">
								<label for="male" class="genderUnchecked"> <span class="genderTxt">남성</span>
								</label> <input type="radio" id="female" class="hidden" name="uGender" value="female">
								<label for="female" class="genderUnchecked"> <span class="genderTxt">여성</span>
								</label>
							</div>
						</div>


						<div class="joinRow">
							<span class="joinTitle">이메일 주소<span class="point"> *</span></span>
						</div>
						<div class="joinRow">
							<input type="text" name="uEmail">
						</div>


						<div class="joinRow">
							<span class="joinTitle">휴대전화 번호<span class="point"> *</span></span>
						</div>
						<div class="joinRow">
							<input type="text" id="uPhone" name="uPhone" maxlength="11"
								placeholder=" '-' 없이 숫자만 입력" onkeyup="pNum(this.form)">
						</div>


						<div class="joinRow">
							<input type="hidden" id="TermsAds" name="termsAds"
								value="<%=TermsAds%>">
						</div>


						<div class="joinRow">
							<button type="button" onclick="sellerJoin(this.form)">가입하기</button>
							<button type="reset">다시쓰기</button>
						</div>

					</div>
					<!-- div#joinArea -->
				</form>
				<!-- joinForm -->
			</div>
		</div>

		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->


</body>
</html>