<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String admin = (String) session.getAttribute("adminID");
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
%>
				<aside class="managerAside">
					<div class="managerMenu">
						<a href="javscript:">회원 관리</a>
						<ul>
							<li><a href="javascript:">일반회원 목록</a></li>
							<li><a href="javascript:">판매회원 목록</a></li>
							<li><a href="javascript:">가입대기 승인</a></li>
						</ul>
					</div>
					<div class="managerMenu">
						<a href="javscript:">상품 관리</a>
						<ul>
							<li><a href="javascript:">전체상품 리스트</a></li>
							<li><a href="javascript:">상품 등록요청</a></li>
						</ul>
					</div>
					<div class="managerMenu">
						<a href="javscript:">메인 관리</a>
						<ul>
							<li><a href="javascript:">메인 슬라이드 수정</a></li>
							<li><a href="javascript:">a</a></li>
							<li><a href="javascript:">b</a></li>
						</ul>
					</div>
					<div class="managerMenu">
						<a href="javscript:">게시판 관리</a>
						<ul>
							<li><a href="javascript:">글쓰기</a></li>
							<li><a href="javascript:">수정</a></li>
							<li><a href="javascript:">삭제</a></li>
						</ul>
					</div>
					<div class="managerMenu">
						<a href="javscript:">이벤트 관리</a>
						<ul>
							<li><a href="javascript:">이벤트 등록</a></li>
							<li><a href="javascript:">이벤트 목록</a></li>
						</ul>
					</div>
				</aside>
				<!-- aside.myPageAside -->
