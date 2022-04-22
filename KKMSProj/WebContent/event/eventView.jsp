<%@page import="pack_Event.eventBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="eMgr" class="pack_Event.eventMgr" />
<%
request.setCharacterEncoding("UTF-8");
int eNo = Integer.parseInt(request.getParameter("eNo"));
List eList = eMgr.eventList();
eventBean evList = (eventBean) eList.get(eNo - 1);
List rList = eMgr.eventReplyList(eNo);
String tag = evList.geteTag();
String type = evList.geteType();
tag = tag.trim();
type = type.trim();
int eCnt = eMgr.eventReplyCnt(eNo);

String pageNo = request.getParameter("pageNo");
if(pageNo == null) {
	pageNo = "1";
}
int nowPage = Integer.parseInt(pageNo);
int pageSize = 6;
int listSize = rList.size();
int pageCnt = eCnt % 6 == 0 ? eCnt / 6 : eCnt / 6 + 1;
int start = nowPage * pageSize - 6;
int end = start + pageSize;
int startPage = (nowPage-2<=0) ? 1 : nowPage-2;
int endPage = nowPage<pageCnt-2 ? startPage+4 : pageCnt;
if(pageCnt-2>1 && pageCnt-2<=nowPage){
	startPage = pageCnt-4;
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket :<%=evList.geteTitle() %></title>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js">

</script>

<script>

$(document).ready(function(){

$('img[usemap]').rwdImageMaps();

});

</script>
	<div id="wrap">

		<%@ include file="/include/header.jsp"%>

		<div class="sub-body">
			<div class="inner">
				<div class="eventViewArea">
					<div class="eventTop">
						<div class="eventFlagDesc">
							<div class="flag">
								<span class="eventType"><%=evList.geteType()%></span> <span
									class="eventTag"><%=tag%></span>
							</div>
						</div>

						<div class="eventTxtDesc sns-line">
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
					<!-- // eventTop -->
					
					<%
					if(type.equals("출석체크")) {
					%>
					<div class="eventContent">
						<img src="/images/event-spring-attend-0.png" usemap="#image-map">
						<map name="image-map">
						    <area target="" alt="" title="출석하기" href="javascript:" coords="215,1157,692,1237" shape="rect">
						</map>
						
						<div class="eventRef">
							<span class="eventRefTitle">참고해주세요</span>
							<hr class="eventRefHR">
							<span id="eventRefTxt">
								<ul>
									<li>본 이벤트는 ID 1개당 1회 참여만 가능합니다.</li>
									<li>중복으로 참여하시더라도 당첨 확률에는 영향을 미치지 않습니다.</li>
									<li>본 이벤트는 예고없이 사전에 종료될 수 있습니다.</li>
									<li>본 이벤트는 부적절한 행위 확인 시 당첨이 취소될 수 있습니다.</li>
									<li>기타 이벤트 관련 문의사항은 1:1문의 게시판을 이용해주세요.</li>
								</ul>
							</span>
							<hr class="eventRefHR">
						</div>
						<!-- div.eventRef -->
					</div>
					<!-- div.eventContent -->
					
					<%
					} else if(type.equals("기대평이벤트")) {
					%>
					<div class="eventContent">
						<img src="/images/<%=evList.geteInnerImg()%>" alt="" />
						<div class="eventRef">
							<span class="eventRefTitle">참고해주세요</span>
							<hr class="eventRefHR">
							<span id="eventRefTxt">
								<ul>
									<li>본 이벤트는 ID 1개당 1회 참여만 가능합니다.</li>
									<li>중복으로 참여하시더라도 당첨 확률에는 영향을 미치지 않습니다.</li>
									<li>본 이벤트는 예고없이 사전에 종료될 수 있습니다.</li>
									<li>본 이벤트는 부적절한 행위 확인 시 당첨이 취소될 수 있습니다.</li>
									<li>기타 이벤트 관련 문의사항은 1:1문의 게시판을 이용해주세요.</li>
								</ul>
							</span>
							<hr class="eventRefHR">
						</div>
						<!-- div.eventRef -->
					</div>
					<!-- div.eventContent -->
					<%
					if(type.equals("기대평이벤트")) {
					%>
					<div class="eventViewTab">
					<ul>
						<li class="eventReplyTab">댓글 (<%=eCnt %>)</li>
					</ul>
					</div>
					<!-- div.eventViewTab -->
					<%} %>
					<div class="eventBtnArea">
						<%
						if (tag.equals("종료") || tag.equals("당첨자발표")) {
						%>
						<p>이미 종료된 이벤트입니다.</p>
						<% } else if (memberId == null) {
						%>
						<div id="eventReplyArea">
							<textarea name="eventReplyTxt" id="eventReplyTxt" class="guest" maxlength="255"
								placeholder="로그인 후 기대평을 작성해주세요."></textarea>
							<button type="button" id="eventReplyBtn">등록</button>
						</div>
						<% } else {%>
						<div id="eventReplyArea">
							<textarea name="eventReplyTxt" id="eventReplyTxt" maxlength="255"
								placeholder="내용을 입력해주세요."></textarea>
							<input type="hidden" id="evId" name="uId" value="<%=memberId%>">
							<input type="hidden" id="evNo" name="eNo" value="<%=eNo%>">
							<button type="button" id="eventReplyBtn">등록</button>
							<span id="eventReplySize"></span>
						</div>
						<%} %>
						<div class="eventReplyRes"></div>
						<div class="eventReplyList">
							<%
							if (rList.size() > 0) {
								for (int i = start; i < end; i++) {
									if(i==rList.size()) break;
									eventBean evReply = (eventBean) rList.get(i);
									String uId = evReply.getuId();
									String eId = uId.substring(0, uId.length() - 2);
									eId+="**";
							%>
							<div class="eventReplyRow dFlex">
								<div class="eventReplyId">
									<%=eId%>
								</div>
								<div class="eventReplyInnerTxt">
									<pre><%=evReply.geteTxt()%></pre>
								</div>
								<%
								if (memberId!=null){
									if (memberId.equals(uId)) {
								%>
								<div class="eventReplyDel">
									<a href="javascript:"><img
										src="/images/icon-delete-btn.png"></a>
								</div>
								<%
									}
								}
								%>
								<div class="eventReplyDate">
									<%=evReply.geteDate()%>
								</div>
							</div>
							<%
							}
							%>
							<div class="eventReplyPaging dFlex">
								<div class="eventReplyPagingPrev">
									<%
									if (pageCnt>1&&nowPage!=1) {
									%>
									<a href="?pageNo=1&eNo=<%=eNo %>#eventRefTxt" id="eventReplyPagingStartBtn">&lt;&lt;</a>
									<a href="?pageNo=<%=nowPage-1 %>&eNo=<%=eNo %>#eventRefTxt" id="eventReplyPagingPrevBtn">&lt;</a>
									<% } %>
								</div>
								<%
								for (int i = startPage; i <= endPage; i++) {
								%>
								<a href="?pageNo=<%=i %>&eNo=<%=eNo %>#eventRefTxt" class="eventReplyPagingNo <%
								if(i==nowPage) {
								%>selected<%} %>"><%=i%></a>
								<% } %>
								<div class="eventReplyPagingNext">
									<%
									if (pageCnt != nowPage) {
									%>
									<a href="?pageNo=<%=nowPage+1 %>&eNo=<%=eNo %>#eventRefTxt" id="eventReplyPagingNextBtn">&gt;</a>
									<a href="?pageNo=<%=pageCnt %>&eNo=<%=eNo %>#eventRefTxt" id="eventReplyPagingEndBtn">&gt;&gt;</a>
									<% } %>
								</div>
							</div>
							<%
							} else {
							%>
							<div class="eventReplyRow">등록된 기대평이 없습니다.</div>
							<%
							}
						
							%>
						</div>
						<!-- div.eventReplyList -->
					</div>
					<!-- div.eventBtnArea -->
					<%} else {%>
					<div class="eventContent">
						<img src="/images/<%=evList.geteInnerImg()%>" alt="" />
						<div class="eventRef">
							<span class="eventRefTitle">참고해주세요</span>
							<hr class="eventRefHR">
							<span id="eventRefTxt">
								<ul>
									<li>본 이벤트는 ID 1개당 1회 참여만 가능합니다.</li>
									<li>중복으로 참여하시더라도 당첨 확률에는 영향을 미치지 않습니다.</li>
									<li>본 이벤트는 예고없이 사전에 종료될 수 있습니다.</li>
									<li>본 이벤트는 부적절한 행위 확인 시 당첨이 취소될 수 있습니다.</li>
									<li>기타 이벤트 관련 문의사항은 1:1문의 게시판을 이용해주세요.</li>
								</ul>
							</span>
							<hr class="eventRefHR">
						</div>
						<!-- div.eventRef -->
					</div>
					<!-- div.eventContent -->
					<div class="eventBtnArea">
						<%
						if (tag.equals("종료") || tag.equals("당첨자발표")) {
						%>
						<p>이미 종료된 이벤트입니다.</p>
						<%
						} else if (memberId == null) {
						%>
						<p>로그인 후 이벤트 참여가 가능합니다.</p>
						<%
						} else {
						%>
						<form action="/event/eventProc.jsp" id="eventForm">
							<input type="hidden" name="uId" value="<%=memberId%>"> <input
								type="hidden" name="eNo" value="<%=eNo%>">
							<button type="submit">응모하기</button>
						</form>
						<%
								}
						}
						%>
					</div>
					<!-- div.eventBtnArea -->
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