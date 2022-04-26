<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<jsp:useBean id="pLBean" class="pack_Product.ProListBean" />
<jsp:setProperty name="pLBean" property="*" />


<%

// id
String sLUId = request.getParameter("memberId");
// flag
String sLF1 = request.getParameter("sLF1");
String sLF2 = request.getParameter("sLF2");
String sLF3 = request.getParameter("sLF3");
//지역
String sLArea = request.getParameter("sLArea");
//지역 상세
String sListLocation = request.getParameter("sListLocation");
//장르
String sLGroup = request.getParameter("sLGroup");
//리스트 목록에서 나오는 텍스트 정보
String sListInfoTxt = request.getParameter("sListInfoTxt");
// 상품 제목
String sListTitle = request.getParameter("sListTitle");
//날짜
String sListDate1 = request.getParameter("sListDate1");
String sListDate2 = request.getParameter("sListDate2");
// 장소
String sListContent = request.getParameter("sListContent");
// 원가
int sListOriPrice = Integer.parseInt(request.getParameter("sListOriPrice"));
// 세일가
int sListSalePercent = 0;
if(request.getParameter("sListSalePercent") == null){
	sListSalePercent = 0;
}else{
	sListSalePercent = Integer.parseInt(request.getParameter("sListSalePercent"));
}
//파일
String fileName1 = request.getParameter("fileName1");
String fileName2 = request.getParameter("fileName2");


boolean result = pMgr.sellerListRegist(sLUId, sLF1, sLF2,  sLF3, sListTitle, sLGroup, sLArea, sListLocation, sListInfoTxt, sListDate1, sListDate2, sListOriPrice, sListSalePercent, fileName1, fileName2, sListContent);

if(result){
%>
	<script>
	location.href="/sellerPage/sellerListRegisterChk.jsp"
	</script>
<%
}
%>
