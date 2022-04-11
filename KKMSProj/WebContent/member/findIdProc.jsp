<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />
<%
request.setCharacterEncoding("UTF-8");
String pIdName = request.getParameter("pIdName");
String pIdPhone = request.getParameter("pIdPhone");
String eIdName = request.getParameter("eIdName");
String eIdEmail = request.getParameter("eIdEmail");
String howTo = "";
String fId = "";
if (pIdName == "") {
	howTo = "eId";
	fId = mMgr.findId(eIdName, eIdEmail, howTo);
} else if (pIdName != "") {
	howTo = "pId";
	fId = mMgr.findId(pIdName, pIdPhone, howTo);
}
if (fId == "") {
	%>
	<script>
	alert("입력하신 내용과 일치하는 정보가 없습니다.");
	location.href="/member/findId.jsp";
	</script>
	<%
} else {
	String str = fId.substring(fId.length()-2);
	fId = fId.replace(str, "**");
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
<link rel="stylesheet" href="/style/style_bbs.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
</head>
<body>
<div id="wrap">
		<%@ include file="/include/header.jsp"%>
		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont">
					<!--  title -->
					<p class="tit">아이디 찾기<span class="smallFont">/ <a href="/member/findPw.jsp">비밀번호 찾기</a></span></p>
				</div>
					<div class="findIdPwArea">
						<div class="findResArea">
						일치하는 정보의 아이디는 <strong>' <%=fId %> '</strong> 입니다.
						</div>
						<div class="findResBtnArea">
						<a href="/member/login.jsp">로그인</a>
						<a href="/index.jsp">메인으로</a>
						</div>
					</div>
					<!-- div.findIdPwArea -->
			</div>
			<!-- div.inner -->
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->
</body>
</html>