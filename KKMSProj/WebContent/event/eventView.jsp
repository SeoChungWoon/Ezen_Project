<%@page import="pack_Event.eventBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="eMgr" class="pack_Event.eventMgr" />
<%
request.setCharacterEncoding("UTF-8");
int eNo = Integer.parseInt(request.getParameter("eNo"));
List eList = eMgr.eventList();
eventBean evList = (eventBean) eList.get(eNo-1);
String tag = evList.geteTag();
tag = tag.trim();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 페이지</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<link rel="stylesheet" href="/style/style_Event.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
<script src="/script/eventScript.js"></script>
</head>
<body>
	<div id="wrap">

		<%@ include file="/include/header.jsp"%>

		<div class="sub-body">
			<div class="inner">
				<div class="proList-view">
					<div class="top-cont">
						<div class="flag-desc">
							<div class="flag">
								<span class="eventType"><%=evList.geteType()%></span>
								<span class="eventTag"><%=tag%></span>
							</div>
						</div>

						<div class="txt-desc">
							<p class="tit"><%=evList.geteTitle()%></p>
							<div class="sns">
								<a href="javascript:"><img src="/images/icon-share.png"
									alt="" /></a>
								<div class="sns-list">
									<a href="javascript:" class="url"><img
										src="/images/icon-sns-url.png" alt="" /></a> <a
										href="javascript:" class="facebook"><img
										src="/images/icon-sns-facebook.png" alt="" /></a> <a
										href="javascript:" class="twitter"><img
										src="/images/icon-sns-twitter.png" alt="" /></a>
								</div>
							</div>
						</div>
					</div>
					<!-- // top-cont -->
					<div class="eventContent">
					이벤트 내용 영역
					</div>
					<div class="eventBtnArea">
					<%
					if(memberId == null){
					%>
					<p>로그인 후 이벤트 참여가 가능합니다.</p>
					<%
						
					} else if (tag.equals("종료") || tag.equals("당첨자발표")) {
						%>
						<p>
						이미 종료된 이벤트입니다.
						</p>
						<%
					} else {
					%>
					<form action="/event/eventProc.jsp" id="eventForm">
					<input type="hidden" name="uId" value="<%=memberId%>">
					<input type="hidden" name="eNo" value="<%=eNo%>">
					<button type="submit">응모하기</button>
					</form>
					<%
					}
					%>
					</div>
				</div>
				<!-- div.eventPageArea -->
			</div>
			<!-- div.inner -->
		</div>
		<!-- div.sub-body -->

		<%@ include file="/include/footer.jsp"%>

	</div>
	<!-- div#wrap -->

</body>
</html>