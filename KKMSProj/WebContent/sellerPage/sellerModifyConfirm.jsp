<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />

<%
request.setCharacterEncoding("UTF-8");
String memberId = (String) session.getAttribute("memID");
String nPw = request.getParameter("nPw");
String nEmail = request.getParameter("nEmail");
String nPhone = request.getParameter("nPhone");
boolean modifyRes = mMgr.sellerModify(memberId, nPw, nEmail, nPhone);
if(modifyRes) {
	%>
	<script>
	alert("회원정보 수정이 완료되었습니다.");
	location.href="/sellerPage/sellerMypage.jsp";
	</script>
	<%
} else {
	%>
	<script>
	alert("회원정보가 수정되지 않았습니다.");
	location.href="/sellerPage/sellerMypage.jsp";
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
</body>
</html>