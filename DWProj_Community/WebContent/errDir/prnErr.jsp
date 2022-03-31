<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>

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
    
		<%@ include file="/include/header.jsp" %>
		
        <h1>Sorry!!!</h1>
        <hr id="headHR">
        <h4>
        죄송합니다. 작업중 문제가 발생했습니다. <br>
        문제가 계속될 경우 아래 번호로 연락바랍니다.
        </h4>
        <p>02-1234-4567</p>	
        <p><a href="/forStmt/ins.html">입력페이지로</a></p>	
        
                
		<%@ include file="/include/footer.jsp" %>
    </div>
    <!-- div#wrap -->

</body>
</html>