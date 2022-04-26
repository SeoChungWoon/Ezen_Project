
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />
<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<jsp:useBean id="pResvBean" class="pack_Product.ProReservBean" />
<jsp:setProperty name="pResvBean" property="*" />

<%
request.setCharacterEncoding("UTF-8");
int rPrice = pResvBean.getpResRemainM();
String pResUId = request.getParameter("pResUId");
boolean result = pMgr.listRsvOutput(pResvBean);
boolean chk = mMgr.remainPriceCng(rPrice, pResUId);

if(result && chk){
%>
	<script>
	location.href="/product/listReserveComplete.jsp";
	</script>
<%
}
%>
