<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />
<%
request.setCharacterEncoding("UTF-8");
String pPwId = request.getParameter("pPwId");
String pPwName = request.getParameter("pPwName");
String pPwPhone = request.getParameter("pPwPhone");
String ePwId = request.getParameter("ePwId");
String ePwName = request.getParameter("ePwName");
String ePwEmail = request.getParameter("ePwEmail");

String howTo = "";
String fId = "";
boolean flag = false;
if (pPwName == "") {
	howTo = "ePw";
	flag = mMgr.findPw(ePwId, ePwName, ePwEmail, howTo);
	fId = ePwId;
} else if (pPwName != "") {
	howTo = "pPw";
	flag = mMgr.findPw(pPwId, pPwName, pPwPhone, howTo);
	fId = pPwId;
}
if (flag==false) {
	%>
	<script>
	alert("입력하신 내용과 일치하는 정보가 없습니다.");
	location.href="/member/findPw.jsp";
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
<title></title>
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
					<form action="/member/findPwConfirm.jsp" id="fPwForm" method="post">
						<div class="findResRow">
								<input type="hidden" name="fId" value="<%=fId%>">
								<div class="findResTitle">
									<span>비밀번호 재설정</span>
								</div>
								<!-- div.findResTitle -->
								<div class="findResVal">
									<div class="findResPwTitle">
										<span>새로운 비밀번호</span>
									</div>
									<!-- div.findResValTitle -->
									<input type="password" id="fPw" class="findPw" name="fPw" maxlength="16">
								</div>
								<!-- div.findResVal -->
								<div class="findResVal">
									<div class="findResPwTitle">
										<span>새로운 비밀번호 확인</span>
									</div>
									<!-- div.findResValTitle -->
									<input type="password" id="fPwChk" class="findPw" name="fPwChk"	maxlength="16">
									<input type="hidden" id="pwMatch">

								</div>
								<!-- div.findResVal -->
								<div id="pwChkRes" class="hidden">
									<p id="pwChkMsg">* 비밀번호가 일치하지 않습니다.</p>
								</div>
							</div>
							<!-- div.findResRow -->
							<div class="findResBtnArea">
							<button type="button" id="fPwSubmit">확인</button>
							<button type="reset">취소</button>
							</div>
						
						</form>
						<!-- form#fPwForm -->
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