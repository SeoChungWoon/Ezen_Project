<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memMgr" class="pack_Member.MemberMgr" /> 
<jsp:useBean id="regBean" class="pack_Member.RegisterBean" />
    
    <%
    request.setCharacterEncoding("UTF-8");
    
    String id = request.getParameter("joinId");
    String pw = request.getParameter("joinPw");
    String name = request.getParameter("joinName");
    String gender = request.getParameter("joinGender");
    String email = request.getParameter("joinEmail");
    String birthday = request.getParameter("joinBirthDay");
    String zipcode = request.getParameter("joinZipcode");
    String addr = request.getParameter("joinAddr");
    String hobby = request.getParameter("joinHobby");
    String job = request.getParameter("joinJob");
    
    memMgr.mtdJoin(id, pw, name, gender, email, birthday, zipcode, addr, hobby, job);
    
    
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
    <%=id %> <br>
    <%=pw %> <br>
    <%=name %> <br>
    <%=gender %> <br>
    <%=email %> <br>
    <%=birthday %> <br>
    <%=zipcode %> <br>
    <%=addr %> <br>
    <%=hobby %> <br>
    <%=job %> <br>
    
    </div> <!-- div#wrap -->
    
</body>
</html>