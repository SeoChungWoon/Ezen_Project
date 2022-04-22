<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String mType = request.getParameter("mType");
mType = "판매자";
%>
<jsp:useBean id="memMgr" class="pack_Member.MemberMgr" />
<jsp:useBean id="regBean" class="pack_Member.RegisterBean" />
<jsp:setProperty name="regBean" property="*" />
<%
boolean result = memMgr.sellerJoinMember(regBean, mType);
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
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
</head>
<body>
	<div id="wrap">

		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont">
					<!--  title -->
					<p class="tit">회원가입 신청이 완료되었습니다.</p>
						<div class="joinStep">
							<ul class="dFlex">
								<li>step 1. 회원 선택</li>
								<li>&gt;</li>
								<li>step 2. 약관 동의</li>
								<li>&gt;</li>
								<li>step 3. 정보 입력</li>
								<li>&gt;</li>
								<li class="nowStep">step 4. 가입 완료</li>
							</ul>
						</div>
					<p class="sellerJoinInfo">※ 관리자의 가입 승인 이후 사이트 이용이 가능합니다.</p>
				</div>
				<div class="joinOkBtnArea">
				<a href="/index.jsp">메인으로</a>
				</div>
			</div>
		</div>
	</div>
	<!-- div#wrap -->

</body>
</html>