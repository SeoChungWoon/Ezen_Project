<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<jsp:useBean id="pLBean" class="pack_Product.ProListBean" />
<jsp:setProperty name="pLBean" property="*" />


<%

//파일 업로드
String saveFolder = "D:/Ezen/infoProc_1119/scw/silsp/p07_JSP/DWProj_Community/WebContent/images/fileUpload"; // 각자 경로 설정해주세요 ★★★
int maxSize = 10 * 1024 * 1024;
String encType = "UTF-8";

String writer = "";
String txtArea = "";
String originalFName = "";   // 원본 파일명
String uploadFName = "";   // 업로드 파일명
String fileType = "";   // 파일의 종류(=형식, 타입)
int fileSize = 0;        // 파일의 크기

MultipartRequest mReq = null;
try {
	
	mReq  = new MultipartRequest(
						request, 
						saveFolder, 
						maxSize,   // 1회 업로드 허용 용량 (단위, Byte)
						encType,    // 인코딩
						new DefaultFileRenamePolicy()    // 동일파일명 정책을 관리하는 객체
					);

	/* file을 제외한 전송 데이터 처리 시작 */
	Enumeration objEnum = mReq.getParameterNames();

	// id
	String sLUId = mReq.getParameter("memberId");
	// flag
	String sLF1 = mReq.getParameter("sLF1");
	String sLF2 = mReq.getParameter("sLF2");
	String sLF3 = mReq.getParameter("sLF3");
	//지역
	String sLArea = mReq.getParameter("sLArea");
	//지역 상세
	String sListLocation = mReq.getParameter("sListLocation");
	//장르
	String sLGroup = mReq.getParameter("sLGroup");
	//리스트 목록에서 나오는 텍스트 정보
	String sListInfoTxt = mReq.getParameter("sListInfoTxt");
	// 상품 제목
	String sListTitle = mReq.getParameter("sListTitle");
	//날짜
	String sListDate1 = mReq.getParameter("sListDate1");
	String sListDate2 = mReq.getParameter("sListDate2");
	// 장소
	String sListContent = mReq.getParameter("sListContent");
	// 원가
	int sListOriPrice = Integer.parseInt(mReq.getParameter("sListOriPrice"));
	// 세일가
	int sListSalePercent = 0;
	if(mReq.getParameter("sListSalePercent") == null){
		sListSalePercent = 0;
	}else{
		sListSalePercent = Integer.parseInt(mReq.getParameter("sListSalePercent"));
	}

	//파일
	String fileName1 = mReq.getParameter("fileName1");
	String fileName2 = mReq.getParameter("fileName2");

	while (objEnum.hasMoreElements()) {
		String nameParam = (String)objEnum.nextElement();
	}


	boolean result = pMgr.sellerListRegist(sLUId, sLF1, sLF2,  sLF3, sListTitle, sLGroup, sLArea, sListLocation, sListInfoTxt, sListDate1, sListDate2, sListOriPrice, sListSalePercent, fileName1, fileName2, sListContent);
	
	/* file을 제외한 전송 데이터 처리 끝 */
	
	/* 전송된 file 데이터 처리 시작 */	
	Enumeration objFileEnum = mReq.getFileNames();
	while (objFileEnum.hasMoreElements()) {
		String nameFile = (String)objFileEnum.nextElement();
		
		File objFile = mReq.getFile(nameFile);
	}
	/* 전송된 file 데이터 처리 끝 */

	if( result) {
		%>
		<script>
		location.href="/sellerPage/sellerListRegisterChk.jsp"
		</script>
		<%
	}
} catch(IOException e){
	out.print(e.getMessage());
} catch(Exception e){
	out.print(e.getMessage());
}


%>
