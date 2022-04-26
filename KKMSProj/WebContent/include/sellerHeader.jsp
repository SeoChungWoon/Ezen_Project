<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<header id="header" class="dFlex">
		<div class="inner">
			<div class="hLogo">
				<a href="/sellerPage/sellerMain.jsp"><img src="/images/h-logo.png" alt="LOGO" /></a>
			</div>

			<nav id="gnb">
				<div class="menu">
					<div class="one-dep">
						<a href="javascript:">상품관리</a>
						<ul class="two-dep">
							<li><a href="/sellerPage/sellerListRegister.jsp"><span>상품 등록</span></a></li>
							<li><a href="javascript:"><span>판매중인 상품</span></a></li>
							<li><a href="javascript:"><span>대기중인 상품</span></a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- // nav -->


			<div class="hUtil">
				<ul class="login">
					<%
					String memberId = (String) session.getAttribute("memID");
					if (memberId != null) {
					%>
					<li><a href="javascript:"><span><%=memberId%>님</span></a></li>
					<li><a href="/sellerPage/sellerMypage.jsp"><span>My page</span></a></li>
					<li><a href="/sellerPage/sellerLogout.jsp"><span>로그아웃</span></a></li>
					<%
					} else {
					%>
					<li><a href="/member/login.jsp"><span>로그인</span></a></li>
					<li><a href="/member/joinType.jsp"><span>회원가입</span></a></li>
					<%
					}
					%>
				</ul>

			</div>
			<!-- // hUtil -->

		</div>
	</header>

