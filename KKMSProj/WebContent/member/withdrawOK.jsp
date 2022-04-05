<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />
    
<%
String memberId = (String) session.getAttribute("memID");
	if (memberId == null) {
		%>
		<script>
		location.href="index.jsp";
		</script>
		<%
	}
String wPw = request.getParameter("wPw");
boolean withdraw = mMgr.withdraw(memberId, wPw);
if(withdraw){
	session.invalidate();
	%>
	<script>
	alert("회원 탈퇴가 완료되었습니다.");
	location.href="/index.jsp";	
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
    <div id="wrap">
        <h1></h1>
        <hr id="headHR">



    </div> <!-- div#wrap -->
    
</body>
</html>