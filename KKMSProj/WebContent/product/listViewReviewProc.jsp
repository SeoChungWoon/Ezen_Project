<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" />
<%
request.setCharacterEncoding("UTF-8");

//파일 업로드
String saveFolder = "D:/goo/silsp/p07_JSP/KKMSProj/WebContent/images/fileUpload"; // 각자 경로 설정해주세요 ★★★
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

	int pRevWNo = Integer.parseInt(mReq.getParameter("pNo"));
	String uId = mReq.getParameter("uId");
	String pRevWrite = mReq.getParameter("qnaContRev");
	int pRevWStar = Integer.parseInt(mReq.getParameter("rateCalc"));
	String pRevWPhoto = mReq.getParameter("fileName");

	while (objEnum.hasMoreElements()) {
		String nameParam = (String)objEnum.nextElement();
	}
	
	boolean listChk = 	pMgr.listRevChk(pRevWNo, uId, pRevWrite, pRevWStar, pRevWPhoto);
	
	if( listChk) {
		%>
		<script>
		alert("리뷰가 작성되었습니다.");
		window.location = document.referrer;
		</script>
		<%
	}
	/* file을 제외한 전송 데이터 처리 끝 */
	
	/* 전송된 file 데이터 처리 시작 */	
	Enumeration objFileEnum = mReq.getFileNames();
	while (objFileEnum.hasMoreElements()) {
		String nameFile = (String)objFileEnum.nextElement();
		
		File objFile = mReq.getFile(nameFile);
	}
	/* 전송된 file 데이터 처리 끝 */

} catch(IOException e){
	out.print(e.getMessage());
} catch(Exception e){
	out.print(e.getMessage());
}
%>