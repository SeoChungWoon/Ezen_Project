<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<link rel="stylesheet" href="/style/style_Event.css">
<link rel="stylesheet" href="/style/style_sellerList.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
<script src="/script/eventScript.js"></script>
<script src="/script/script_seller.js"></script>
</head>

<body>
	<div id="wrap">

		<%@ include file="/include/sellerHeader.jsp"%>

		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont">
					<!--  title -->
					<p class="tit">상품 등록이 완료되었습니다.</p>
				</div>
				
				<div class="register-chk">
					<p class="txt">* 등록 승인은 2~3일 정도 소요됩니다.</p>
	
					<div class="btn-cont">
						<button type="button">대기중인 상품으로</button>
						<button type="button" onclick="location.href='/sellerPage/sellerMain.jsp'">메인으로</button>
					</div>
				</div>
			</div>
			<!-- div.inner -->
		</div>
		<!-- div.sub-body -->

		<%@ include file="/include/footer.jsp"%>


	</div>
	<!-- div#wrap -->
</body>

</html>