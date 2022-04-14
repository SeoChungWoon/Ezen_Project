<%@page import="pack_Product.ProListBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

int pNoPop = Integer.parseInt(request.getParameter("pNo"));
%>
<!-- 팝업 -->
<div class="pop_dimd"></div>


<div class="pop_wrap modal" id="popup1">
	<div class="pop_body">
		<div class="pop_div">
			<p class="pop_tit">판매자 문의 작성</p>

			<form action="/product/listViewProc.jsp" method="post" class="listViewForm">
				<input type="hidden" name="pNo" value=<%=pNoPop%> />
				<div class="inquiry-txt">
					<textarea name="qnaConts" id="qnaConts" placeholder="문의를 작성해주세요."></textarea>
					<div class="txtLength">
						<span><em>0</em> / 500</span>
					</div>
				</div>
				
				<div class="btn-cont">
					<button type="button" class="inquiryBtn">등록</button>
					<button type="button" class="reset">초기화</button>
				</div>
			</form>
		</div>
		<!-- // pop_div -->

		<div class="pop_close">
			<a href="javascript:" class="close-modal"><span class="blind">닫기</span></a>
		</div>
	</div>
	<!-- // pop_body -->
</div>
<!-- // pop_wrap -->


