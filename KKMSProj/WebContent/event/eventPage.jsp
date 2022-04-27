<%@page import="pack_Event.eventBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="eMgr" class="pack_Event.eventMgr" />
<%
int eCount = eMgr.eListCnt();

List eList = eMgr.eventList();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket :이벤트</title>
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
				<div class="tit-cont">
					<!--  title -->
					<p class="tit">이벤트</p>
				</div>
				<div class="eventPageArea" id="eventAlarm">
					<ul class="event-tab dFlex">
						<li class="on"><a href="javascript:"><span
								class="eventTabTitle">전체</span></a> <input type="hidden" value="전체"></li>
						<li><a href="javascript:"><span class="eventTabTitle">진행
									중 이벤트</span></a> <input type="hidden" value="진행중"></li>
						<li><a href="javascript:"><span class="eventTabTitle">당첨자
									발표</span></a> <input type="hidden" value="당첨자발표"></li>
						<li><a href="javascript:"><span class="eventTabTitle">종료된
									이벤트</span></a> <input type="hidden" value="종료"></li>
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
						for (int i = eList.size() - 1; i >= 0; i--) {
							eventBean evList = (eventBean) eList.get(i);
							String tag = evList.geteTag();
						%>

						<div class="eventRow">
							<%
							if(tag.equals("종료")) {
							%>
							<a>							
							<%} else { %>
							<a href="/event/eventView.jsp?eNo=<%=evList.geteNo()%>">
							<%} %>
								<div class="eventLink">
									<div class="eventBanner">
										<img src="/images/<%=evList.geteMainImg()%>" alt="메인이미지">
									</div>
									<div class="eventType">
										<%=evList.geteType()%>
									</div>
									<div class="eventTag">
										<%=tag%>
									</div>

									<div class="eventTitle">
										<%=evList.geteTitle()%>
									</div>
									<div class="eventDate">
										<span class="eDateTit">이벤트 기간 : </span><span
											class="eDate"><%=evList.geteStart()%> ~ </span> <span
											class="eDate"><%=evList.geteEnd()%></span>
									</div>
									<div class="eventDate">
									<%
									if (evList.geteRes() != null) {
									%>
										<span class="resDateTit">당첨자 발표 : </span><span
											class="resDate"><%=evList.geteRes()%> </span>
									<%
									}
									%>
									</div>
									<div class="eventDday"></div>
									<div class="eventDdayBar">
										<span class="percentBar"></span>
									</div>
								</div>
								<!-- div.eventLink -->
							</a>
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