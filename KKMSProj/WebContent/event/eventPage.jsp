<%@page import="pack_Event.eventBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="eMgr" class="pack_Event.eventMgr" />
<jsp:useBean id="eBean" class="pack_Event.eventBean" />
<%
int eCount = eMgr.eListCnt();

List eList = eMgr.allEvent();

if (eList.size() < 1) {
	String empty = "진행중인 이벤트가 없습니다.";
}
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
</head>
<body>
	<div id="wrap">

		<%@ include file="/include/header.jsp"%>

		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont">
					<!--  title -->
					<p class="tit">이벤트</p>
				</div>
				<div class="eventPageArea">
					<ul class="event-tab dFlex">
						<li class="on"><a href="javascript:"> <span
								class="eventTabTitle">전체</span></a></li>
						<li><a href="javascript:"><span class="eventTabTitle">진행
									중 이벤트</span></a></li>
						<li><a href="javascript:"><span class="eventTabTitle">당첨자
									발표</span></a></li>
						<li><a href="javascript:"><span class="eventTabTitle">종료된
									이벤트</span></a></li>
					</ul>
					<hr class="eventHR">
					<div class="eventInner dFlex">
						<%
						if (eList.size() < 1) {
						%>
						<div class="eventRow">
							<span class="noEvent">진행중인 이벤트가 없습니다.</span>
						</div>
						<%
						} else {
							for (int i = 0; i < eList.size(); i++) {
							eventBean evList = (eventBean) eList.get(i);
						%>

						<div class="eventRow">
							<div class="eventBanner">
								<img src="/images/<%=evList.geteMainImg()%>1.jpg" alt="메인이미지">
							</div>
							<div class="eventType">
								<%=evList.geteType()%>
							</div>
							<div class="eventTag">
								<%=evList.geteTag() %>
							</div>
							
							<div class="eventTitle">
								<%=evList.geteTitle()%>
							</div>
							<div class="eventDate">
								<span class="eDate"><%=evList.geteStart()%> ~ </span> <span
									class="eDate"><%=evList.geteEnd()%> | </span> <span
									class="eDate"><%=evList.geteRes()%> 발표</span>
							</div>
						</div>

						<%
							}
						}
						%>
					</div>
					<!-- div.eventInner -->
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