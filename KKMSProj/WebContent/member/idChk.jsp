<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />

<%
request.setCharacterEncoding("UTF-8");
String uId = request.getParameter("uId");

boolean result = mMgr.chkId(uId);

String idChkRes = "";
if (result == true) {
	idChkRes = "Y";
} else {
	idChkRes = "N";
}

out.print(idChkRes);
%>