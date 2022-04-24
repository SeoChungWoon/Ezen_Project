<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="asMgr" class="pack_Admin.AsideMgr" />
<%
	String admin = (String) session.getAttribute("adminID");
	String txt = "N";
	if (admin==null) {
		admin = "";
	}
	if (!admin.equals("admin")) {
		%>
		<script>
		location.href="/adminPage/adminLogin.jsp";
		</script>
		<%
	}
	
	int wCnt = asMgr.waitCnt();
	
%>
				<aside class="managerAside">
					<div class="managerMenu">
						<a href="javascript:">회원 관리</a>
						<ul>
							<li><a href="/adminPage/memberManager/listGeneral.jsp">일반회원 목록</a></li>
							<li><a href="/adminPage/memberManager/listSeller.jsp">판매회원 목록</a></li>
							<li><a href="/adminPage/memberManager/listWait.jsp">가입대기 승인 (<%=wCnt %>)</a></li>
						</ul>
					</div>
					<div class="managerMenu">
						<a href="javascript:">상품 관리</a>
						<ul>
							<li><a href="javascript:">전체상품 리스트</a></li>
							<li><a href="javascript:">상품 등록요청</a></li>
						</ul>
					</div>
					<div class="managerMenu">
						<a href="javascript:">메인 관리</a>
						<ul>
							<li><a href="/adminPage/mainManager/slideManager.jsp">메인 슬라이드 수정</a></li>
							<li><a href="javascript:">a</a></li>
							<li><a href="javascript:">b</a></li>
						</ul>
					</div>
					<div class="managerMenu">
						<a href="javascript:">게시판 관리</a>
						<ul>
							<li><a href="/data/bbsListAd.jsp">공지게시판</a></li>
							<li><a href="/data/faqListAd.jsp">FAQ</a></li>
						</ul>
					</div>
					<div class="managerMenu">
						<a href="javascript:">이벤트 관리</a>
						<ul>
							<li><a href="javascript:">이벤트 등록</a></li>
							<li><a href="javascript:">이벤트 목록</a></li>
						</ul>
					</div>
				</aside>
				<!-- aside.myPageAside -->
