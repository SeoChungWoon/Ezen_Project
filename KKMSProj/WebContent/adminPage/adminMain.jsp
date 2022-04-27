<%@page import="pack_Event.eventBean"%>
<%@page import="java.util.List"%>
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
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket관리자 :메인</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<link rel="stylesheet" href="/adminPage/style/admin_Common.css">
<link rel="stylesheet" href="/adminPage/style/style_admin2.css">
<link rel="stylesheet" href="/style/style_Event.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
<script src="/script/eventScript.js"></script>
</head>
<body>
	<div id="wrap">

		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont">
					<!--  title -->
					<p class="tit">관리자 메뉴</p>
				</div>
				
				<div class="adminMain-cont">
					<div class="adminMainTab">
						<p class="adminMainTabTitle">
							회원 관리
						</p>
						<div class="adminSubTab">
							<ul>
								<li><a href="/adminPage/memberManager/listGeneral.jsp">일반회원 목록</a></li>
								<li><a href="/adminPage/memberManager/listSeller.jsp">판매회원 목록</a></li>
								<li><a href="/adminPage/memberManager/listWait.jsp">가입대기 회원</a></li>
							</ul>
						</div>
					</div>
					<!-- div.adminMainTab -->
					
					<div class="adminMainTab">
						<p class="adminMainTabTitle">
							상품 관리
						</p>
						<div class="adminSubTab">
							<ul>
								<li><a href="/adminPage/productManager/listAllProduct.jsp">전체상품 리스트</a></li>
								<li><a href="javascript:">상품 등록요청</a></li>
							</ul>
						</div>
					</div>
					<!-- div.adminMainTab -->
					
					<div class="adminMainTab">
						<p class="adminMainTabTitle">
							메인 관리
						</p>
						<div class="adminSubTab">
							<ul>
								<li><a href="/adminPage/mainManager/slideManager.jsp">업로드 된 슬라이드 이미지파일</a></li>
								<li><a href="/adminPage/mainManager/slideFileUpload.jsp">슬라이드 이미지 업로드</a></li>
								<li><a href="javascript:">b</a></li>
							</ul>
						</div>
					</div>
					<!-- div.adminMainTab -->
					
					<div class="adminMainTab">
						<p class="adminMainTabTitle">
							게시판 관리
						</p>
						<div class="adminSubTab">
							<ul>
								<li><a href="/adminPage/bbsManager/bbsListAd.jsp">공지게시판</a></li>
								<li><a href="/adminPage/bbsManager/faqListAd.jsp">FAQ</a></li>
							</ul>
						</div>
					</div>
					<!-- div.adminMainTab -->
					
					<div class="adminMainTab">
						<p class="adminMainTabTitle">
							이벤트 관리
						</p>
						<div class="adminSubTab">
							<ul>
								<li><a href="javascript:">이벤트 등록</a></li>
								<li><a href="javascript:">이벤트 목록</a></li>
							</ul>
						</div>
					</div>
					<!-- div.adminMainTab -->
					
				</div>
				<!-- div.adminMain-cont -->
			</div>
			<!-- div.inner -->
		</div>
		<!-- div.sub-body -->

	</div>
	<!-- div#wrap -->

</body>
</html>