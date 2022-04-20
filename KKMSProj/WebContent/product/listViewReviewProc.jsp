<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<%
request.setCharacterEncoding("UTF-8");

int pRevWNo = Integer.parseInt(request.getParameter("pNo"));
String uId = request.getParameter("uId");
String pRevWrite = request.getParameter("qnaContRev");
int pRevWStar = Integer.parseInt(request.getParameter("rateCalc"));
String pRevWPhoto = request.getParameter("fileName");

boolean chk = pMgr.writeRevChk(pRevWNo, uId, pRevWrite, pRevWStar, pRevWPhoto);
boolean listChk = 	pMgr.listRevChk(pRevWNo, uId, pRevWrite, pRevWStar, pRevWPhoto);

if(chk && listChk) {
	%>
	<script>
	alert("리뷰가 작성되었습니다.");
	window.location = document.referrer;
	</script>
	<%
}

%>