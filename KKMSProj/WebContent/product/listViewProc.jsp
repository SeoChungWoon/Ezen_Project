<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<%
request.setCharacterEncoding("UTF-8");

int pNo = Integer.parseInt(request.getParameter("pNo"));
String pTextarea = request.getParameter("qnaConts");

boolean chk = pMgr.writeChk(pNo, pTextarea);

if(chk) {
	%>
	<script>
	alert("판매자 문의가 등록되었습니다.");
	window.location = document.referrer;
	</script>
	<%
}
	%>