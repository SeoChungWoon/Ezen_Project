<%@page import="pack_Member.ZipcodeBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="zipChk" class="pack_Member.MemberMgr" />

<%
request.setCharacterEncoding("UTF-8");
String check = request.getParameter("check");
String area3 = null;
List<ZipcodeBean> zList = null;

	area3 = request.getParameter("area3");
	zList = zipChk.zipChk(area3);

%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>우편번호 찾기</title>
<link rel="stylesheet" href="/style/style2.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/memberScript.js"></script>
</head>
<body>
	<div id="wrap">
		<form method="post" name="zipFrm">

			<div id="findArea">
				<input type="text" id="findTxt" name="area3" placeholder="동 이름 입력">
				<input type="button" id="findBtn" value="검색" onclick="dongChk()">
			</div>


			<div id="findresArea">

				<%
				
					if (zList.isEmpty()) {
				%>
				<div class="resMsg">
					<span>검색된 결과가 없습니다.</span>
				</div>
				<%
				} else {
				%>
				<div class="resMsg">
					<span>※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</span>
				</div>
				<%
				for (int i = 0; i < zList.size(); i++) {
					ZipcodeBean zBean = zList.get(i);
					String rZipcode = zBean.getZipcode();
					String rArea1 = zBean.getArea1();
					String rArea2 = zBean.getArea2();
					String rArea3 = zBean.getArea3();
					String rArea4 = zBean.getArea4();
				%>
				<div class="addrList">
					<a href="#"
						onclick="javascript:sendAdd('<%=rZipcode%>', '<%=rArea1%>', '<%=rArea2%>', '<%=rArea3%>', '<%=rArea4%>',)">
						<%=rZipcode%>&nbsp; <%=rArea1%>&nbsp; <%=rArea2%>&nbsp; <%=rArea3%>&nbsp;
						<%=rArea4%>&nbsp;
					</a>
				</div>
				<%
				}
				}
				
				%>
			</div>

			
		</form>
	</div>
	<!-- div#wrap -->

</body>
</html>
