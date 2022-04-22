<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<%
// 나의 리뷰 삭제
request.setCharacterEncoding("UTF-8");

String wUId = request.getParameter("wUId");
boolean chk = pMgr.revDelCnt(wUId);
out.print(chk);

if(chk) {
	%>
	<script>
	if(confirm("리뷰를 삭제하시겠습니까?") == true){
		alert("리뷰가 삭제되었습니다.");
		location.reload();
	}
	</script>
<%
}
%>