<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />

<%
String memberId = request.getParameter("memberid");
String memberPw = request.getParameter("memberpw");
String mType = mMgr.mTypeChk(memberId, memberPw);
boolean waitChk = mMgr.waitChk(memberId, memberPw);

if (mType.equals("관리자")) {
	session.setAttribute("adminID", memberId);	
	%>
	<script>
	location.href = "/adminPage/adminMain.jsp";
	</script>
<%
} else {
	out.print("아이디와 비밀번호를 확인해주세요.");
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
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
</head>
<body>
</body>
</html>