<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<header id="header" class="dFlex">
		<div class="inner">
			<div class="hLogo">
				<a href="/index.jsp"><img src="" alt="" />LOGO</a>
			</div>

			<nav id="gnb">
				<div class="menu">
					<div class="one-dep">
						<a href="javascript:">전시</a>
						<ul class="two-dep">
							<li><a href="javascript:"><span>전체보기</span></a></li>
							<li><a href="javascript:"><span>전시</span></a></li>
							<li><a href="javascript:"><span>체험/행사</span></a></li>
							<li><a href="javascript:"><span>기타</span></a></li>
						</ul>
					</div>
					<div class="one-dep">
						<a href="javascript:">고객지원</a>
						<ul class="two-dep">
							<li><a href="javascript:"><span>공지사항</span></a></li>
							<li><a href="javascript:"><span>이용안내</span></a></li>
							<li><a href="javascript:"><span>FAQ</span></a></li>
						</ul>
					</div>
					<div class="one-dep">
						<a href="javascript:">새소식</a>
						<ul class="two-dep">
							<li><a href="javascript:"><span>이벤트</span></a></li>
							<li><a href="javascript:"><span>보도자료</span></a></li>
							<li><a href="javascript:"><span>000 소식</span></a></li>
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
					<li id="loginId"><%=memberId%>님 안녕하세요.</li>
					<li id="logout"><a href="/member/logout.jsp">로그아웃</a></li>
					<%
					} else {
					%>
					<li><a href="/member/login.jsp"><span>로그인</span></a></li>
					<li><a href="/member/termsChk.jsp"><span>회원가입</span></a></li>
					<%
					}
					%>
				</ul>

			</div>
			<!-- // hUtil -->

		</div>
	</header>

