<%@page import="pack_Member.RegisterBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
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
		String mPw = request.getParameter("mPw");
		if (memberId == null || mPw == "" || mPw == null) {
		%>
		<script>
			location.href = "/index.jsp";
		</script>
		<%
		} else {
		List objList = mMgr.myPage(memberId);
		RegisterBean mList = (RegisterBean) objList.get(0);
		%>
		<div class="sub-body dFlex">
			<%@ include file="/include/myPageAside.jsp"%>
			<div class="inner">
				<div id="mypageArea">
					<div class="mypageRow dFlex">
						<div id="modifyTitle">
							<span>아이디</span>
						</div>
						<!-- div.modifyTitle -->
						<div class="modifyVal">
							<input type="text" value="<%=mList.getuId()%>" readonly>
						</div>
						<!-- div.modifyVal -->
					</div>
					<!-- div.mypageRow -->


					<div class="mypageRow dFlex">
						<div id="modifyTitle">
							<span>비밀번호</span>
						</div>
						<!-- div.modifyTitle -->
						<div class="modifyVal">
							<input type="text">
						</div>
						<!-- div.modifyVal -->
					</div>
					<!-- div.mypageRow -->


					<div class="mypageRow dFlex">
						<div id="modifyTitle">
							<span>이름</span>
						</div>
						<!-- div.modifyTitle -->
						<div class="modifyVal">
							<input type="text" value="<%=mList.getuName()%>" readonly>
						</div>
						<!-- div.modifyVal -->
					</div>
					<!-- div.mypageRow -->


					<div class="mypageRow dFlex">
						<div id="modifyTitle">
							<span>생년월일</span>
						</div>
						<!-- div.modifyTitle -->
						<div class="modifyVal">
							<input type="text" value="<%=mList.getuBirthday()%>" readonly>
						</div>
						<!-- div.modifyVal -->
					</div>
					<!-- div.mypageRow -->


					<div class="mypageRow dFlex">
						<div id="modifyTitle">
							<span>이메일 주소</span>
						</div>
						<!-- div.modifyTitle -->
						<div class="modifyVal">
							<input type="text" value="<%=mList.getuEmail()%>" readonly>
						</div>
						<!-- div.modifyVal -->
					</div>
					<!-- div.mypageRow -->


					<div class="mypageRow dFlex">
						<div id="modifyTitle">
							<span>우편번호</span>
						</div>
						<!-- div.modifyTitle -->
						<div class="modifyVal">
							<input type="text" value="<%=mList.getuZipcode()%>" readonly>
						</div>
						<!-- div.modifyVal -->
					</div>
					<!-- div.mypageRow -->


					<div class="mypageRow dFlex">
						<div id="modifyTitle">
							<span>주소</span>
						</div>
						<!-- div.modifyTitle -->
						<div class="modifyVal">
							<input type="text" value="<%=mList.getuAddr()%>" readonly>
						</div>
						<!-- div.modifyVal -->
					</div>
					<!-- div.mypageRow -->


					<div class="mypageRow dFlex">
						<div id="modifyTitle">
							<span>휴대전화 번호</span>
						</div>
						<!-- div.modifyTitle -->
						<div class="modifyVal">
							<input type="text" value="<%=mList.getuPhone()%>" readonly>
						</div>
						<!-- div.modifyVal -->
					</div>
					<!-- div.mypageRow -->
					<%
					}
					%>

				</div>
			</div>
		</div>
		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->

</body>
</html>