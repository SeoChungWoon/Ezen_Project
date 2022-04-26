<%@page import="pack_Admin.AdminBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="aMgr" class="pack_Admin.AdminMgr" />
<%
String mType = "판매자";
String joinWait = "N";
List memList = aMgr.memberList(mType, joinWait);

int mCnt = memList.size();

String pageNo = request.getParameter("pageNo");
if (pageNo == null) {
	pageNo = "1";
}
int nowPage = Integer.parseInt(pageNo);
int pageSize = 10;
int listSize = memList.size();
int pageCnt = mCnt % 10 == 0 ? mCnt / 10 : mCnt / 10 + 1;
int start = nowPage * pageSize - 10;
int end = start + pageSize;
int startPage = (nowPage - 2 <= 0) ? 1 : nowPage - 2;
int endPage = nowPage < pageCnt - 2 ? startPage + 9 : pageCnt;
if (pageCnt - 2 > 1 && pageCnt - 2 <= nowPage) {
	startPage = pageCnt - 9;
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket관리자 :가입 승인</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<link rel="stylesheet" href="/adminPage/style/admin_Common.css">
<link rel="stylesheet" href="/adminPage/style/style_admin2.css">
<link rel="stylesheet" href="/style/style_Event.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/adminPage/script/adminScript.js"></script>
</head>
<body>
	<div id="wrap">

		<div class="sub-body">
			<div class="inner">
				<div class="managerPage dFlex">
					<%@ include file="/adminPage/inc/managerAside.jsp"%>
					<div class="manager-cont">
						<div class="manager-tit">
							<!--  title -->
							<p>
								회원 관리 <span class="sub-tit">가입대기 목록 (<%=mCnt %>)</span>
							</p>
						</div>
						<div class="manager-inner">
							<table class="memberTable">
								<colgroup>
									<col width="6%" />
									<col width="8%" />
									<col width="8%" />
									<col width="8%" />
									<col width="5%" />
									<col width="14%" />
									<col width="9%" />
									<col width="20%" />
									<col width="21%" />
								</colgroup>
								<thead>
									<tr>
										<th>회원번호</th>
										<th>아이디</th>
										<th>이름</th>
										<th>생년월일</th>
										<th>성별</th>
										<th>이메일 주소</th>
										<th>휴대전화</th>
										<th>승인 요청일</th>
										<th>가입 승인</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (int i = 0; i < memList.size(); i++) {
										AdminBean mList = (AdminBean) memList.get(i);
									%>
									<tr>
										<td><%=mList.getNo()%></td>
										<td class="reqId"><%=mList.getuId()%></td>
										<td><%=mList.getuName()%></td>
										<td><%=mList.getuBirthday()%></td>
										<td><%=mList.getuGender()%></td>
										<td><%=mList.getuEmail()%></td>
										<td><%=mList.getuPhone()%></td>
										<td><%=mList.getJoinDate()%></td>
										<td class="btn-cont">
											<button class="memberBtn agree">가입 승인</button>
											<button class="memberBtn disagree">가입 거부</button>
										</td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
						<!-- div.manager-inner -->

						<%
						if (memList.size() != 0) {
						%>
						<div class="memberListFooter dFlex">
							<div class="memberListPaging dFlex pagingComm">
								<div class="memberListPagingPrev">
									<%
									if (pageCnt > 1 && nowPage != 1) {
									%>
									<a href="?pageNo=1" class="firMove"><span class="blind">맨 처음으로 이동</span></a>
									<a href="?pageNo=<%=nowPage - 1%>" class="prevMove"><span class="blind">이전으로 이동</span></a>
									<%
									}
									%>
								</div>
								<%
								for (int i = startPage; i <= endPage; i++) {
								%>
								<a href="?pageNo=<%=i%>"
									class="pageNum memberListPagingNo <%if (i == nowPage) {%>selected<%}%>"><%=i%></a>
								<%
								}
								%>
								<div class="memberListPagingNext">
									<%
									if (pageCnt != nowPage) {
									%>
									<a href="?pageNo=<%=nowPage + 1%>" class="nextMove"><span class="blind">다음으로 이동</span></a>
									<a href="?pageNo=<%=pageCnt%>" class="endMove"><span class="blind">맨 뒤로 이동</span></a>
									<%
									}
									%>
								</div>
							</div>
							<!-- div.memberListPaging -->
							<div class="memberListSearch">
								<select id="mSrh-tag">
									<option value="uId">아이디</option>
									<option value="uName">이름</option>
									<option value="uPhone">연락처</option>
								</select> <input type="text" id="mSrh-txt" />
								<button type="button" class="memberListSearchBtnW">검색</button>
							</div>
							<!-- div.memberListSearch -->
						</div>
						<!-- div.memberListFooter -->
						<%
						}
						%>
					</div>
					<!-- div.manager-cont -->
				</div>
				<!-- div.managerPage -->
			</div>
			<!-- div.inner -->
		</div>
		<!-- div.sub-body -->

	</div>
	<!-- div#wrap -->

</body>
</html>