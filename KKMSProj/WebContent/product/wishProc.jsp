<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
    
<%
request.setCharacterEncoding("UTF-8");
String uId = request.getParameter("uId");
String wish = request.getParameter("wish");
int pNo = Integer.parseInt(request.getParameter("pNo"));
if(wish.equals("false")) {
	pMgr.wishAdd(uId, pNo);	
} else if (wish.equals("true")) {
	pMgr.wishDel(uId, pNo);
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