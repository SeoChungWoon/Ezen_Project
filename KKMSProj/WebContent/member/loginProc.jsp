<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />

<%
String memberId = request.getParameter("memberid");
String memberPw = request.getParameter("memberpw");
String mType = mMgr.mTypeChk(memberId, memberPw);
boolean waitChk = mMgr.waitChk(memberId, memberPw);

if (mType.equals("관리자")) {
	session.setAttribute("memID", memberId);	
	%>
	<script>
	alert("관리자 로그인");
	location.href = "/index.jsp";
	</script>
	<%
} else if (mType.equals("판매자")) {
	if (waitChk) {
	%>
	<script>
	alert("판매자 로그인");
	alert("가입 승인 대기중인 회원입니다.");
	location.href = "/member/login.jsp";
	</script>
	<%
	} else {
		session.setAttribute("memID", memberId);
		%>
		<script>
		alert("판매자 로그인");
		location.href = "/index.jsp";
		</script>
		<%
	}
} else if (mType.equals("일반")) {
	session.setAttribute("memID", memberId);	
	%>
	<script>
	alert("일반회원 로그인");
	let ref = document.referrer;
	let jpIdx = ref.indexOf("joinProc.jsp");
	let lIdx = ref.indexOf("login.jsp");
	let jP = ref.substring(jpIdx);
	jP = jP.trim();
	let login = ref.substring(lIdx);
	login = login.trim();
	if(jP == "joinProc.jsp" || login == "login.jsp") {
		location.href = "/index.jsp";
	} else {
		window.location = document.referrer;	
	}
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