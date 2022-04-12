<%@page import="pack_Event.eventBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="eMgr" class="pack_Event.eventMgr" />
<%
request.setCharacterEncoding("UTF-8");
String uId = request.getParameter("uId");
int eNo = Integer.parseInt(request.getParameter("eNo"));
boolean flag = eMgr.eventChk(uId, eNo);

if(flag) {
	%>
	<script>
	alert("응모가 완료되었습니다.");
	history.back();
	</script>
	<%
} else {
	%>
	<script>
	alert("이미 응모한 이벤트입니다.")
	history.back();
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
<link rel="stylesheet" href="/style/style_Event.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
<script src="/script/eventScript.js"></script>
</head>
<body>
</body>
</html>