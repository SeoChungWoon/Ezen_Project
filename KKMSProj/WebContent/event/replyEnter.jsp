<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="eMgr" class="pack_Event.eventMgr" />

<%

String uId = request.getParameter("uId");
int eNo = Integer.parseInt(request.getParameter("eNo"));
String eTxt = request.getParameter("eTxt");

boolean flag = eMgr.eventReplyEnter(uId, eNo, eTxt);

if(flag) {
	%>
	<script>
	alert("등록이 완료되었습니다.");
	location.reload();
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