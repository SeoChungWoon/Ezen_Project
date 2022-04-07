<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전시</title>
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
	
		<%@ include file="/include/header.jsp" %>
	
		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont">
					<p class="tit">전시</p>
				</div>
				
				<div class="exhibit-cont">
					<ul class="exhibit-tab">
						<li class="on"><a href="javascript:"><span>전체</span></a></li>
						<li><a href="javascript:"><span>전시</span></a></li>
						<li><a href="javascript:"><span>체험/행사</span></a></li>
						<li><a href="javascript:"><span>기타</span></a></li>
					</ul>
					
					<div class="area-desc">
						<div class="desc-type">
							<p class="txt">지역별 보기</p>
							<div class="right-srh">
								<div class="select-group">
									<select name="area-select" id="">
										<option value="추천순">추천순</option>
										<option value="최신순">최신순</option>
										<option value="인기순">인기순</option>
									</select>
								</div>
								<button type="button">검색</button>					
							</div>
						</div>
						
						<ul class="area-tab">
							<li class="on"><a href="javascript">전체</a></li>
							<li><a href="javascript:">서울</a></li>
							<li><a href="javascript:">경기/인천</a></li>
							<li><a href="javascript:">대전/충청/강원</a></li>
						</ul>
					</div>
					
					<div class="exhibit-list">
						<p class="list-none">진행중인 전시가 없습니다.</p>
					</div><!--  // exhibit-list -->
				</div><!-- //exhibit-cont -->
				
			</div>
		</div>

		<%@ include file="/include/footer.jsp" %>
		
	</div>
	<!-- div#wrap -->
</body>
</html>