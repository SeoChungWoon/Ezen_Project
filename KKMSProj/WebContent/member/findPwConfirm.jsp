<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />

<%
request.setCharacterEncoding("UTF-8");
String fId = request.getParameter("fId");
String fPw = request.getParameter("fPw");

boolean flag = mMgr.fChangePw(fId, fPw);
if(flag) {
	%>
	<script>
	alert("비밀번호 설정이 완료되었습니다.");
	location.href="/member/login.jsp";
	</script>
	<%
} else {
	%>
	<script>
	alert("오류가 발생했습니다. 다시 시도해주세요.");
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
    <title>Document</title>
    <link rel="stylesheet" href="/style/style_Common.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script.js"></script>
</head>
<body>
</body>
</html>