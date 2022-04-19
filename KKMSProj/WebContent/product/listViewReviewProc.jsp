<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<%
request.setCharacterEncoding("UTF-8");

int pNo = Integer.parseInt(request.getParameter("pNo"));
String memberId = (String) session.getAttribute("memID");
int rate = Integer.parseInt(request.getParameter("rateCalc"));
String pReview = request.getParameter("qnaContRev");

boolean chk = pMgr.writeRevChk(pNo, pReview);

if(chk) {
	%>
	<script>
	alert("리뷰가 작성되었습니다.");
	window.location = document.referrer;
	</script>
	<%
}

%>