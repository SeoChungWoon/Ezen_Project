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
		<div class="sub-body">
			<div class="inner">
				<div class="mypageInner dFlex">
					<aside class="mypageAside">
						<div class="mypageMenu">
							<a href="/member/mypage.jsp">My page</a>
						</div>
						<div class="mypageMenu mLnbOn">
							<a href="/member/modify.jsp">회원정보 수정</a>
						</div>
						<div class="mypageMenu">
							<a href="/member/withdraw.jsp">회원 탈퇴</a>
						</div>
					</aside>

					<div class="mypageArea">
						<div class="mypageTit">
							<h1>회원정보 수정</h1>
						</div>
						<form action="/member/modifyConfirm.jsp" id="modifyForm"
							method="post">
							<div class="modifyRow">
								<div class="modifyTitle">
									<span>아이디</span>
								</div>
								<!-- div.modifyTitle -->
								<div class="modifyVal">
									<input type="text" value="<%=mList.getuId()%>" readonly>
								</div>
								<!-- div.modifyVal -->
							</div>
							<!-- div.modifyRow -->


							<div class="modifyRow">
								<div class="modifyTitle">
									<span>비밀번호 변경</span>
								</div>
								<!-- div.modifyTitle -->
								<div class="modifyVal">
									<div class="modifyPwTitle">
										<span>변경할 비밀번호</span>
									</div>
									<!-- div.modifyValTitle -->
									<input type="password" id="uPw" class="joinPw" name="nPw"
										maxlength="16" onkeyup="pwChk(this.form)">
								</div>
								<!-- div.modifyVal -->
								<div class="modifyVal">
									<div class="modifyPwTitle">
										<span>변경할 비밀번호 확인</span>
									</div>
									<!-- div.modifyValTitle -->
									<input type="password" id="uPwChk" class="joinPw" name="nPwChk"
										maxlength="16" onkeyup="pwChk(this.form)"> <input
										type="hidden" id="pwMatch"> <input type="hidden"
										id="mPw" name="mPw" value="<%=mPw%>">

								</div>
								<!-- div.modifyVal -->
								<div id="pwChkRes" class="hidden">
									<p id="pwChkMsg">* 비밀번호가 일치하지 않습니다.</p>
								</div>
							</div>
							<!-- div.modifyRow -->


							<div class="modifyRow">
								<div class="modifyTitle">
									<span>이름</span>
								</div>
								<!-- div.modifyTitle -->
								<div class="modifyVal">
									<input type="text" value="<%=mList.getuName()%>" readonly>
								</div>
								<!-- div.modifyVal -->
							</div>
							<!-- div.modifyRow -->


							<div class="modifyRow">
								<div class="modifyTitle">
									<span>생년월일</span>
								</div>
								<!-- div.modifyTitle -->
								<div class="modifyVal">
									<input type="text" value="<%=mList.getuBirthday()%>" readonly>
								</div>
								<!-- div.modifyVal -->
							</div>
							<!-- div.modifyRow -->


							<div class="modifyRow">
								<div class="modifyTitle">
									<span>이메일 주소</span>
								</div>
								<!-- div.modifyTitle -->
								<div class="modifyVal">
									<input type="text" id="nEmail" name="nEmail"
										value="<%=mList.getuEmail()%>" readonly>
								</div>
								<!-- div.modifyVal -->
								<div class="modifyBtnArea">
									<button type="button" class="modifyBtn">수정</button>
								</div>
								<!-- div.modifyBtn -->
							</div>
							<!-- div.modifyRow -->

							<div class="modifyAddrArea">
								<div class="modifyRow">
									<div class="modifyTitle">
										<span>주소</span>
									</div>
									<!-- div.modifyTitle -->
									<div class="modifyVal">
										<input type="text" value="<%=mList.getuZipcode()%>" readonly>
									</div>
									<!-- div.modifyVal -->
								</div>
								<!-- div.modifyRow -->


								<div class="modifyRow">
									<div class="modifyTitle">
										<span>상세 주소</span>
									</div>
									<!-- div.modifyTitle -->
									<div class="modifyVal">
										<input type="text" value="<%=mList.getuAddr()%>" readonly>
									</div>
									<!-- div.modifyVal -->
									<div class="modifyBtnArea">
										<button type="button" class="modifyAddrBtn">수정</button>
									</div>
									<!-- div.modifyBtn -->
								</div>
								<!-- div.modifyRow -->
							</div>
							<!-- div.modifyAddrArea -->

							<div id="changeAddr" class="hidden">
								<div class="modifyRow">
									<div class="modifyTitle">
										<span>주소</span>
									</div>
								</div>
								<div class="modifyRow">
									<div class="modifyVal">
										<input type="text" id="uZipcode" name="nZipcode"
											value="<%=mList.getuZipcode()%>" readonly>
									</div>
									<div class="modifyBtnArea">
										<button type="button" id="zipChk">우편번호 찾기</button>
									</div>
								</div>


								<div class="modifyRow">
									<input type="text" id="addr1" name="addr1" readonly>
								</div>

								<div class="modifyRow">
									<div class="modifyTitle">
										<span>상세 주소</span>
									</div>
								</div>
								<div class="modifyRow">
									<input type="text" id="addr2" name="addr2"
										onkeyup="addr(this.form)">
								</div>
								<input type="hidden" id="uAddr" name="nAddr"
									value="<%=mList.getuAddr()%>">
							</div>

							<div class="modifyRow">
								<div class="modifyTitle">
									<span>휴대전화 번호</span>
								</div>
								<!-- div.modifyTitle -->
								<div class="modifyVal">
									<input type="text" id="uPhone" name="nPhone" maxlength="11"
										placeholder="숫자만 입력" onkeyup="pNum(this.form)"
										value="<%=mList.getuPhone()%>" readonly>
								</div>
								<!-- div.modifyVal -->
								<div class="modifyBtnArea">
									<button type="button" class="modifyBtn">수정</button>
								</div>
								<!-- div.modifyBtn -->
							</div>
							<!-- div.modifyRow -->
							<%
							}
							%>
							<div class="modifyRow">
								<div class="modifyFinal">
									<button type="button" class="modifyFinalBtn"
										onclick="modifyConfirm(this.form)">저장</button>
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