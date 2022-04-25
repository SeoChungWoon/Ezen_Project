<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<%
request.setCharacterEncoding("UTF-8");

int pWPNo = Integer.parseInt(request.getParameter("pNo"));
String uId = request.getParameter("uId");
String pTextarea = request.getParameter("qnaConts");

boolean chk = pMgr.writeChk(pWPNo, uId, pTextarea);

if(chk) {
	%>
	<script>
	alert("판매자 문의가 등록되었습니다.");
	window.location = document.referrer;
	</script>
	<%
}
	%>