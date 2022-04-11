<%@page import="pack_product.proListBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="prodMgr" class="pack_product.productMgr" />
<%
request.setCharacterEncoding("UTF-8");

String pNo = request.getParameter("pNo");
int pNo1 = Integer.parseInt(pNo);
String pTitle = request.getParameter("pTitle");

List objList = prodMgr.listOutput();
proListBean mList = (proListBean) objList.get(pNo1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=mList.getpTitle()%></title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/memberScript.js"></script>
</head>
<body>
	<div id="wrap">

		<%@ include file="/include/header.jsp"%>

		<div class="sub-body">
			<div class="inner">
				
				<div class="proList-cont">
					<div class="tit-cont">
						<div class="flag">
							<span class="event"><%= mList.getpFlag1()%></span>
							<span class="event"><%= mList.getpFlag2()%></span>
						</div>
					</div>
				</div><!--  // proList-cont -->

			</div>
		</div>

		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->
</body>
</html>