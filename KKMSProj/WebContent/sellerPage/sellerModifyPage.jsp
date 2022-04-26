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
<title>E-Ticket :회원정보 수정</title>
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
		<%@ include file="/include/sellerHeader.jsp"%>
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
		String uId = mList.getuId();
		String uName = mList.getuName();
		String uBirth = mList.getuBirthday();
		%>
		<div class="sub-body">
			<div class="inner">
				<div class="mypageInner dFlex">
					<aside class="mypageAside">
						<div class="mypageMenu">
							<a href="/sellerPage/sellerMypage.jsp">My page</a>
						</div>
						<div class="mypageMenu mLnbOn">
							<a href="/sellerPage/sellerModify.jsp">회원정보 수정</a>
						</div>
						<div class="mypageMenu">
							<a href="/sellerPage/sellerWithdraw.jsp">회원 탈퇴</a>
						</div>
					</aside>

					<div class="mypageArea">
						<div class="mypageTit">
							<h1>회원정보 수정</h1>
						</div>
						<form action="/sellerPage/sellerModifyConfirm.jsp" id="modifyForm"
							method="post">
							<div class="modifyRow dFlex">
								<div class="modifyTitle">
									<span>아이디</span>
								</div>
								<!-- div.modifyTitle -->
								<div class="modifyVal">
									<%=uId%>
									<input type="hidden" value="<%=uId%>" readonly>
								</div>
								<!-- div.modifyVal -->
							</div>
							<!-- div.modifyRow -->


							<div class="modifyRow dFlex">
								<div class="modifyTitle">
									<span>비밀번호 변경</span>
								</div>
								<!-- div.modifyTitle -->
								<div class="modifyVal mPwArea">
									<div class="mPwWrap dFlex">
										<div class="modifyPwTitle">
											<span class="mPwTit">변경할 비밀번호</span> <input type="password" id="uPw"
												class="joinPw" name="nPw" maxlength="16"
												onkeyup="pwChk(this.form)">
										</div>
										<!-- div.modifyValTitle -->

										<div class="modifyPwTitle">
											<span class="mPwTit">변경할 비밀번호 확인</span> <input type="password" id="uPwChk"
												class="joinPw" name="nPwChk" maxlength="16"
												onkeyup="pwChk(this.form)"> <input type="hidden"
												id="pwMatch"> <input type="hidden" id="mPw"
												name="mPw" value="<%=mPw%>">
										</div>
										<!-- div.modifyValTitle -->
									</div>
									<!-- div.mPwWrap -->

									<div id="pwChkRes" class="hidden">
										<p id="pwChkMsg">* 비밀번호가 일치하지 않습니다.</p>
									</div>
								</div>
								<!-- div.modifyVal -->

							</div>
							<!-- div.modifyRow -->


							<div class="modifyRow dFlex">
								<div class="modifyTitle">
									<span>이름</span>
								</div>
								<!-- div.modifyTitle -->
								<div class="modifyVal">
									<%=uName%>
									<input type="hidden" value="<%=uName%>" readonly>
								</div>
								<!-- div.modifyVal -->
							</div>
							<!-- div.modifyRow -->


							<div class="modifyRow dFlex">
								<div class="modifyTitle">
									<span>생년월일</span>
								</div>
								<!-- div.modifyTitle -->
								<div class="modifyVal">
									<%=uBirth%>
									<input type="hidden" value="<%=uBirth%>" readonly>
								</div>
								<!-- div.modifyVal -->
							</div>
							<!-- div.modifyRow -->


							<div class="modifyRow dFlex">
								<div class="modifyTitle lh2">
									<span>이메일 주소</span>
								</div>
								<!-- div.modifyTitle -->
								<div class="modifyVal">
									<input type="text" id="nEmail" class="readonlyInput"
										name="nEmail" value="<%=mList.getuEmail()%>" readonly>
								</div>
								<!-- div.modifyVal -->
								<div class="modifyBtnArea lh2">
									<button type="button" class="modifyBtn">수정</button>
								</div>
								<!-- div.modifyBtn -->
							</div>
							<!-- div.modifyRow -->


							<div class="modifyRow dFlex">
								<div class="modifyTitle lh2">
									<span>휴대전화 번호</span>
								</div>
								<!-- div.modifyTitle -->
								<div class="modifyVal">
									<input type="text" id="uPhone" class="readonlyInput"
										name="nPhone" maxlength="11"
										placeholder="휴대전화 번호 입력('-'없이 숫자만 입력)"
										onkeyup="pNum(this.form)" value="<%=mList.getuPhone()%>"
										readonly>
								</div>
								<!-- div.modifyVal -->
								<div class="modifyBtnArea lh2">
									<button type="button" class="modifyBtn">수정</button>
								</div>
								<!-- div.modifyBtn -->
							</div>
							<!-- div.modifyRow -->
							<%
							}
							%>
							<div class="modifyRow">
								<div class="modifyFinal btn-cont">
									<button type="button" class="modifyFinalBtn"
										onclick="sellerModifyConfirm(this.form)">저장</button>
									<button type="reset" id="modifyResetBtn" class="modifyFinalBtn">취소</button>
								</div>
								<!-- div.modifyBtn -->
							</div>
						</form>
					</div>
					<!-- div.mypageArea -->
				</div>
				<!-- div.mypageInner -->
			</div>
			<!-- div.inner -->
		</div>
		<!-- div.sub-body -->
		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->

</body>
</html>