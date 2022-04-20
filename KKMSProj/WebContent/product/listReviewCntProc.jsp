<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<%
request.setCharacterEncoding("UTF-8");

int wRecom = Integer.parseInt(request.getParameter("wRecom"));
String wUId = request.getParameter("wUId");
int wPNo = Integer.parseInt(request.getParameter("wPNo"));

boolean recomCnt = pMgr.revRecomCnt(wRecom, wUId, wPNo);

if(recomCnt){
%>
	<script>
		location.reload();
	</script>	
<%
}
%>