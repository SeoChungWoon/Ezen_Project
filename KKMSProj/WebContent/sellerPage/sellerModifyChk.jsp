<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />
<jsp:useBean id="zBean" class="pack_Member.RegisterBean" />


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
<form id="mPwChkFrm" action="/sellerPage/sellerModifyPage.jsp" method="post">
<%
		String mId = (String) session.getAttribute("memID");
		String mPw = request.getParameter("modifyPw");
		boolean chkRes = mMgr.mPwChk(mId, mPw);
		if (chkRes) {
			%>
			<script>
			mPwChkFrm.submit();
			</script>
			<%
		} else {
			out.print("비밀번호가 일치하지 않습니다.");
		}
%>
<input type="hidden" name="mPw" value="<%=mPw%>">
</form>
</body>
</html>