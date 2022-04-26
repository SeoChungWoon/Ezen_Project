<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />

<%
request.setCharacterEncoding("UTF-8");
String chkData = request.getParameter("data");
int pNo = Integer.parseInt(request.getParameter("pNo"));
boolean chk = pMgr.productOnOff(chkData, pNo);

if(chk) {
	%>
	<script>
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