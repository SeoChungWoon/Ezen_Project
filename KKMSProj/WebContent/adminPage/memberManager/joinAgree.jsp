<%@page import="pack_Admin.AdminBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="aMgr" class="pack_Admin.AdminMgr" />
<%
request.setCharacterEncoding("UTF-8");
String uId = request.getParameter("uId");

boolean flag = aMgr.joinDisagree(uId);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
</head>
<body></body>
</html>