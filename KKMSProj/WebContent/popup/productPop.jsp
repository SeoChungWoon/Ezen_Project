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



<div class="pop_wrap modal" id="popup2" style="display:block;">
	<div class="pop_body">
		<div class="pop_div">
			<p class="pop_tit">관람리뷰 작성</p>

			<form action="" method="post" class="listViewForm">
				<input type="hidden" name="pNo" value=<%=pNoPop%> /> 
				<div class="star-rating">
					<div class="rateChk">
						<div class="chk-group">
							<input type="checkbox" name="rate1" id="rate1" value="" title="1점"/>
							<label for="rate1"><a href="javascript:"><span class="blind">1점</span></a></label>
						</div>
						<div class="chk-group">
							<input type="checkbox" name="rate2" id="rate2" value="" title="2점"/>
							<label for="rate2"><a href="javascript:"><span class="blind">1점</span></a></label>
						</div>
						<div class="chk-group">
							<input type="checkbox" name="rate3" id="rate3" value="" title="3점"/>
							<label for="rate3"><a href="javascript:"><span class="blind">1점</span></a></label>
						</div>
						<div class="chk-group">
							<input type="checkbox" name="rate4" id="rate4" value="" title="4점"/>
							<label for="rate4"><a href="javascript:"><span class="blind">1점</span></a></label>
						</div>
						<div class="chk-group">
							<input type="checkbox" name="rate5" id="rate5" value="" title="5점"/>
							<label for="rate5"><a href="javascript:"><span class="blind">1점</span></a></label>
						</div>
					</div>
					<!-- // rateChk -->
					<div class="rateCalc">
						<span><em class="set"></em> / <em class="max"></em> 점</span>
					</div>
					
					<p class="txt">별을 선택하시면 점수가 표시됩니다.</p>
				</div>
				<!--  // star-rating -->
				<div class="inquiry-txt">
					<textarea name="qnaConts" id="qnaConts" placeholder="리뷰를 작성해주세요."></textarea>
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
