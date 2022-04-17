<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<%
request.setCharacterEncoding("UTF-8");

int pNo = Integer.parseInt(request.getParameter("pNo"));
String pTextarea = request.getParameter("qnaContsWrite");

boolean delChk = pMgr.writeDelChk(pNo);


if(delChk) {
	%>
	<script>
	alert("문의가 삭제되었습니다.");
	window.location = document.referrer;
	</script>
<%
}
%>