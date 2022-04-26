<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<%
// 나의 리뷰 삭제
request.setCharacterEncoding("UTF-8");

String wUId = request.getParameter("wUId");
int wPNo = Integer.parseInt(request.getParameter("wPNo"));
boolean chk = pMgr.revDelCnt(wUId, wPNo);

%>