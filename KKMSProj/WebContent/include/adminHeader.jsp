<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<header id="header" class="dFlex">
		<div class="inner">
			<div class="hLogo">
				<a href="/adminPage/adminMain.jsp"><img src="/images/h-logo.png" alt="LOGO" /></a>
			</div>

			<nav id="gnb">
				<div class="menu">
					<div class="one-dep">
						<a href="javascript:">메인페이지 관리</a>
						<ul class="two-dep">
							<li><a href="javascript:"><span>하위메뉴(메인 슬라이드 이미지 수정)</span></a></li>
							<li><a href="javascript:"><span>하위메뉴(What's hot 목록 수정)</span></a></li>
						</ul>
					</div>
					<div class="one-dep">
						<a href="javascript:">회원 관리</a>
						<ul class="two-dep">
							<li><a href="javascript:"><span>일반 회원</span></a></li>
							<li><a href="javascript:"><span>판매자 회원</span></a></li>
						</ul>
					</div>
					<div class="one-dep">
						<a href="javascript:">게시판 관리</a>
						<ul class="two-dep">
							<li><a href="javascript:"><span>공지사항</span></a></li>
							<li><a href="javascript:"><span>이용안내</span></a></li>
							<li><a href="javascript:"><span>FAQ</span></a></li>
						</ul>
					</div>
					<div class="one-dep">
						<a href="javascript:">이벤트 관리</a>
						<ul class="two-dep">
							<li><a href="javascript:"><span>공지사항</span></a></li>
							<li><a href="javascript:"><span>이용안내</span></a></li>
							<li><a href="javascript:"><span>FAQ</span></a></li>
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
					<li><a href="/member/logoutOther.jsp"><span>로그아웃</span></a></li>
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

