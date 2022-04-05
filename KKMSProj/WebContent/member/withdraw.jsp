<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My page</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
</head>
<body>
	<div id="wrap">
		<%@ include file="/include/header.jsp"%>
		<%
		if (memberId == null){
			%>
			<script>
			location.href="/index.jsp";
			</script>
			<%
		}
		%>
		<div class="sub-body dFlex">
			<%@ include file="/include/myPageAside.jsp"%>
			<div class="inner">

				<div id="withdrawChkArea">
					<input type="password" id="withdrawPw" name="withdrawPw"
						placeholder="비밀번호 입력" maxlength="16">
					<button type="button" id="withdrawPwBtn">확인</button>
				</div>
				<!-- div#withdrawChkArea -->
				<div id="withdrawChkRes">
					<p id="withdrawErrMsg"></p>
				</div>

			</div>
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->

</body>
</html>