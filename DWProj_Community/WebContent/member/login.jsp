<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <%@ include file="/include/header.jsp"%>
        <form action="" id="loginForm">
        <div id="loginArea">
<table>
		<tbody>
			<tr>
				<td>아이디</td>
				<td>
				<input type="text" name="uId" placeholder="아이디">
				</td>
				<td rowspan="2">
				<button type="submit">로그인</button>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
				<input type="password" name="uPw" placeholder="비밀번호">
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<a href="/member/join.jsp">회원가입</a>
				 <span> / </span> 
				<a href="">아이디 찾기</a>
				 <span> / </span> 				 
				<a href="">비밀번호 찾기</a>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	<!-- div#loginArea -->
	</form>
	<!-- loginForm -->

<%@ include file="/include/footer.jsp"%>
    </div> <!-- div#wrap -->
    
</body>
</html>