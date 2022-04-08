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
	location.href="/member/termsChk.jsp";
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
<title>회원가입</title>
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
				<form action="/member/joinProc.jsp" id="joinForm" method="post">
					<div id="joinArea">

						<div class="joinRow">
							<span class="joinTitle">아이디</span>
						</div>
						<div class="joinRow">
							<input type="text" id="uId" name="uId" maxlength="15"
								onkeyup="idChk(this.form)"> <input type="hidden"
								id="uIdChk">
							<div id="idChkRes" class="hidden">

								<span id="idChkMsg"> </span>
							</div>
							<!-- div#idChkRes -->
						</div>


						<div class="joinRow">
							<span class="joinTitle">비밀번호</span>
						</div>
						<div class="joinRow">
							<input type="password" id="uPw" class="joinPw" name="uPw" maxlength="16"
								onkeyup="pwChk(this.form)">
						</div>

						<div class="joinRow">
							<span class="joinTitle">비밀번호 확인</span>
						</div>
						<div class="joinRow">
							<input type="password" id="uPwChk" class="joinPw" name="uPwChk" maxlength="16"
								onkeyup="pwChk(this.form)"> <input type="hidden"
								id="pwMatch">
							<div id="pwChkRes" class="hidden">
								<p id="pwChkMsg">비밀번호가 일치하지 않습니다.</p>
							</div>
						</div>


						<div class="joinRow">
							<span class="joinTitle">이름</span>
						</div>
						<div class="joinRow">
							<input type="text" id="uName" name="uName"
								onkeyup="nameChk(this.form)">
						</div>


						<div class="joinRow">
							<span class="joinTitle">생년월일</span>
						</div>
						<div class="joinRow">
							<input type="text" id="uBirthday" maxlength="8" name="uBirthday"
								onkeyup="birthChk(this.form)" placeholder="YYYYMMDD">
						</div>


						<div class="joinRow">
							<span class="joinTitle">성별</span>
						</div>
						<div class="joinRow">
							<div id="genderArea">
								<input type="radio" id="male" name="uGender" value="male">
								<label for="male"> <span class="genderTxt">남성</span>
								</label> <input type="radio" id="female" name="uGender" value="female">
								<label for="female"> <span class="genderTxt">여성</span>
								</label>
							</div>
						</div>


						<div class="joinRow">
							<span class="joinTitle">이메일 주소</span>
						</div>
						<div class="joinRow">
							<input type="text" name="uEmail">
						</div>


						<div class="joinRow">
							<span class="joinTitle">주소</span>
						</div>
						<div class="joinRow">

							<input type="text" id="uZipcode" name="uZipcode" readonly>

							<button type="button" id="zipChk">우편번호 찾기</button>

						</div>


						<div class="joinRow">
							<input type="text" id="addr1" name="addr1" readonly>
						</div>

						<div class="joinRow">
							<span class="joinTitle">상세 주소</span>
						</div>
						<div class="joinRow">
							<input type="text" id="addr2" name="addr2"
								onkeyup="addr(this.form)">
						</div>
						<input type="hidden" id="uAddr" name="uAddr">


						<div class="joinRow">
							<span class="joinTitle">휴대전화 번호</span>
						</div>
						<div class="joinRow">
							<input type="text" id="uPhone" name="uPhone" maxlength="11"
								placeholder="숫자만 입력" onkeyup="pNum(this.form)">
						</div>


						<div class="joinRow">
							<input type="hidden" id="TermsAds" name="termsAds"
								value="<%=TermsAds%>">
						</div>


						<div class="joinRow">
							<button type="button" onclick="join(this.form)">가입하기</button>
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