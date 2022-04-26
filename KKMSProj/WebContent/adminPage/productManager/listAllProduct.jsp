<%@page import="pack_Product.ProListBean"%>
<%@page import="pack_Admin.AdminBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<%
List proList = pMgr.adminListOutput();

int pCnt = proList.size();

String pageNo = request.getParameter("pageNo");
if (pageNo == null) {
	pageNo = "1";
}
int nowPage = Integer.parseInt(pageNo);
int pageSize = 9;
int listSize = proList.size();
int pageCnt = pCnt % 9 == 0 ? pCnt / 9 : pCnt / 9 + 1;
int start = nowPage * pageSize - 9;
int end = start + pageSize;
int startPage = (nowPage - 9 <= 0) ? 1 : nowPage - 9;
int endPage = nowPage < pageCnt - 4 ? startPage + 8 : pageCnt;
if (pageCnt - 4 > 1 && pageCnt - 4 <= nowPage) {
	startPage = pageCnt - 8;
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Ticket관리자 :상품 관리</title>
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
								상품 관리 <span class="sub-tit">전체상품 목록 (<%=pCnt %>)</span>
							</p>
						</div>
						<div class="manager-inner">
							<table class="memberTable">
								<colgroup>
									<col width="7%" />
									<col width="10%" />
									<col width="10%" />
									<col width="33%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
								</colgroup>
								<thead>
									<tr>
										<th>상품번호</th>
										<th>이미지</th>
										<th>판매자</th>
										<th>상품명</th>
										<th>정상판매가</th>
										<th>할인율</th>
										<th>할인가</th>
										<th>노출여부</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (int i = start; i < end; i++) {
										if (i == proList.size())
											break;
										ProListBean pList = (ProListBean) proList.get(i);
										int oriPrice = pList.getpOriPrice();
										int sale = pList.getpSalePercent();
										int salePrice = oriPrice - ((oriPrice*sale)/100);
									%>
									<tr>
										<td class="adminPNo"><%=pList.getpNo()%></td>
										<td class="adminPImg"><img src="/images/<%=pList.getpImg()%>" alt="" /></td>
										<td><%=pList.getpUId()%></td>
										<td class="adminPTitle"><%=pList.getpTitle()%></td>
										<td><%=oriPrice%></td>
										<td><%=sale%>％</td>
										<td><%=salePrice%></td>
										<td class="proViewOnOff btn-cont">
											<input type="hidden" class="joinWaitVal" value="<%=pList.getjoinWait()%>">
											<select name="joinWait" class="joinWaitSelect">
												<option value="Y">Y</option>
												<option value="N">N</option>
											</select>
											<button type="button" class="proViewOnOffBtn">저장</button>
											<div class="proViewOnOffRes"></div>
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
						if (proList.size()!=0) {
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
									<option value="pUId">판매자</option>
									<option value="pTitle">상품명</option>
									<option value="joinWait">노출여부</option>
								</select> <input type="text" id="mSrh-txt" />
								<button type="button" class="listProductSearch">검색</button>
							</div>
							<!-- div.memberListSearch -->
						</div>
						<!-- div.memberListFooter -->
						<%} %>
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