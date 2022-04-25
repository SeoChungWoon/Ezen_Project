<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<%
request.setCharacterEncoding("UTF-8");

int pWpNo = Integer.parseInt(request.getParameter("pWpNo"));
String pWUId = request.getParameter("pWUId");

String pTextarea = request.getParameter("qnaContsWrite");

boolean chk = pMgr.writeModChk(pWpNo, pWUId, pTextarea);

if(chk) {
	%>
	<script>
	alert("수정되었습니다.");
	window.location = document.referrer;
	</script>
	<%
}

%>