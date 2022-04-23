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
		}
		%>
		<div class="sub-body">
			<div class="inner">
				<div class="mypageInner dFlex">
					<aside class="mypageAside">
						<div class="mypageMenu">
							<a href="/member/mypage.jsp">My page</a>
						</div>
						<div class="mypageMenu">
							<a href="/member/modify.jsp">회원정보 수정</a>
						</div>
						<div class="mypageMenu mLnbOn">
							<a href="/member/withdraw.jsp">회원 탈퇴</a>
						</div>
					</aside>
					
					<div class="mypageArea">
						<div class="withdrawChkMsg">
							<h2>아래의 내용을 꼭 확인해주세요.</h2>
						</div>

						<div class="withdrawTxt">
							<h3>회원정보 및 계좌내역 삭제</h3>
							<p>
								<span class="point">회원탈퇴 즉시 회원정보는 모두 삭제되며, 재가입시에도 복원되지
									않습니다.</span>
							</p>
							<ul>
								<li>삭제되는 정보 : 구매하신 eBook, 개인정보, 계좌내역(E포인트, E머니, 예치금 등)</li>
								<li>회원탈퇴 시 구매하신 상품은 모두 삭제됩니다. 회원탈퇴 후 타 ID로 사용 권한을 양도하실 수
									없습니다.</li>
								<li>탈퇴 후 이용기록(ex.상품리뷰)은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</li>
								<li>게시판형 서비스에 등록한 게시물은 삭제되지 않고 유지됩니다.</li>
							</ul>
							<hr class="withdrawHR">
							<h3>탈퇴 후 정보보관</h3>
							<p>
								<span>전자상거래 등에서의 소비자보호에 관한 법률 제6조에 의거 성명, 주소 등 거래의 주체를
									식별할 수 있는 정보에 한하여 서비스 이용에 관한 동의를 철회한 경우에도 이를 보존할 수 있으며, 동법 시행령
									제6조에 의거 다음과 같이 거래 기록을 보관합니다.</span>
							</p>
							<ul>
								<li>표시, 광고에 관한 기록 : 6개월</li>
								<li>계약 또는 청약철회 등에 관한 기록 : 5년</li>
								<li>대금결제 및 재화등의 공급에 관한 기록 : 5년</li>
								<li>소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</li>
							</ul>
						</div>

						<div id="withdrawBtnArea">
							<button type="button" id="withdrawAgree">확인</button>
							<input type="hidden" id="withdrawPw" value="<%=mPw%>">
							<button type="button" id="withdrawDisagree">취소</button>
						</div>
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