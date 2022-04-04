<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memMgr" class="pack_Member.MemberMgr" /> 
<jsp:useBean id="regBean" class="pack_Member.RegisterBean" />
<jsp:setProperty name="regBean" property="*" />
    <%
    request.setCharacterEncoding("UTF-8");
    
    boolean result = memMgr.joinMember(regBean);
	out.print(result);
       
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
    
    <h1>회원가입 완료메세지</h1>
    <hr id="headHR">
    <h2>
    <a href="/login.jsp">로그인하러 가기</a>
    <a href="/index.jsp">메인으로 이동하는 아이콘</a></h2>
    </div> <!-- div#wrap -->
    
</body>
</html>