<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<%
request.setCharacterEncoding("UTF-8");

int pWpNo = Integer.parseInt(request.getParameter("pWpNo"));
String pWUId = request.getParameter("pWUId");
boolean delChk = pMgr.writeDelChk(pWpNo, pWUId);


if(delChk) {
	%>
	<script>
	alert("문의가 삭제되었습니다.");
	window.location = document.referrer;
	</script>
<%
}
%>