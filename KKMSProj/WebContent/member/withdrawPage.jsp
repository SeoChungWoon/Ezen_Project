<%@page import="pack_Member.RegisterBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
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
		String mPw = request.getParameter("mPw");
		if (memberId == null || mPw == "" || mPw == null) {
		%>
		<script>
			location.href = "/index.jsp";
		</script>
		<%
		}
		%>
		<div class="sub-body dFlex">
		<%@ include file="/include/myPageAside.jsp"%>
			<div class="inner">
				정말로 회원 탈퇴 할거니?
				<button type="button" id="withdrawAgree">응할거야</button>
				<input type="hidden" id="withdrawPw" value="<%=mPw%>">
				<button type="button" id="withdrawDisagree">아니 안할거야</button>
			</div>
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->

</body>
</html>