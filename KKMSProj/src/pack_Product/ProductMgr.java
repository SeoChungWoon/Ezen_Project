package pack_Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class ProductMgr {

	private DBConnectionMgr pool = null;
	private Connection objConn = null;
	private PreparedStatement objPstmt = null;
	private ResultSet objRS = null;
	private String sql = "";

	public ProductMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 데이터 출력
	public List<ProListBean> listOutput() {

		List<ProListBean> pList = new Vector<ProListBean>();

		try {
			objConn = pool.getConnection();
			sql = "select * from proList order by pNo Asc";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();
			while (objRS.next()) {
				ProListBean pLBean = new ProListBean();
				pLBean.setpNo(objRS.getInt("pNo"));
				pLBean.setpFlag1(objRS.getString("pFlag1"));
				pLBean.setpFlag2(objRS.getString("pFlag2"));
				pLBean.setpArea(objRS.getString("pArea"));
				pLBean.setpLocation(objRS.getString("pLocation"));
				pLBean.setpInfoTxt(objRS.getString("pInfoTxt"));
				pLBean.setpTitle(objRS.getString("pTitle"));
				pLBean.setpDate1(objRS.getString("pDate1"));
				pLBean.setpDate2(objRS.getString("pDate2"));
				pLBean.setpContent(objRS.getString("pContent"));
				pLBean.setpOriPrice(objRS.getInt("pOriPrice"));
				pLBean.setpSalePercent(objRS.getInt("pSalePercent"));
				pLBean.setpGroup(objRS.getString("pGroup"));
				pLBean.setpViewTime(objRS.getString("pViewTime"));
				pLBean.setpClass(objRS.getString("pClass"));
				pLBean.setpDelivery(objRS.getString("pDelivery"));
				pList.add(pLBean);
			}
		} catch (Exception e) {
			System.out.println("listOutput e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return pList;
	}

	// Write Seller List
	public List<ProWSelBean> listWSOutput() {

		List<ProWSelBean> pWSList = new Vector<ProWSelBean>();

		try {
			objConn = pool.getConnection();
			sql = "select * from pWSel";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();
			while (objRS.next()) {
				ProWSelBean pWSBean = new ProWSelBean();
				pWSBean.setpWUId(objRS.getString("pWUId"));
				pWSBean.setpWrite(objRS.getString("pWrite"));
				pWSList.add(pWSBean);
			}
		} catch (Exception e) {
			System.out.println("listWSOutput e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return pWSList;
	}

	// Review List
	public List<ProRevBean> listRevOutput() {

		List<ProRevBean> pRevList = new Vector<ProRevBean>();

		try {
			objConn = pool.getConnection();
			sql = "select * from pRevList order by pRevDate Desc";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();
			while (objRS.next()) {
				ProRevBean pRBean = new ProRevBean();
				pRBean.setpRevPNo(objRS.getInt("pRevPNo"));
				pRBean.setpRevNo(objRS.getInt("pRevNo"));
				pRBean.setpRevUId(objRS.getString("pRevUId"));
				pRBean.setpRevPhoto(objRS.getInt("pRevPhoto"));
				pRBean.setpRevImg(objRS.getString("pRevImg"));
				pRBean.setpRevCont(objRS.getString("pRevCont"));
				pRBean.setpRevDate(objRS.getString("pRevDate"));
				pRBean.setpRevRecom(objRS.getInt("pRevRecom"));
				pRBean.setpRevStar(objRS.getInt("pRevStar"));
				pRevList.add(pRBean);
			}
		} catch (Exception e) {
			System.out.println("listRevOutput e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return pRevList;
	}

	// 데이터 있는 지 확인
	public int proListCount() {
		int count = 0;

		try {
			objConn = pool.getConnection();
			String sql = "select count(*) from proList";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				count = objRS.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("proListCount e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return count;
	}

	// 판매자 문의 등록
	public boolean writeChk(String uId, String pTextarea) {
		boolean chk = false;

		try {
			objConn = pool.getConnection();
			sql = "insert into pWSel values (?, ?)";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);
			objPstmt.setString(2, pTextarea);

			if (objPstmt.executeUpdate() > 0) {
				chk = true;
			}

		} catch (Exception e) {
			System.out.println("writeChk e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return chk;
	}

	// 판매자 문의 수정
	public boolean writeModChk(String pWUId, String pTextarea) {
		boolean chk = false;

		try {
			objConn = pool.getConnection();
			sql = "update pWSel set pWrite = ? where pWUId = '" + pWUId + "'";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, pTextarea);
			objPstmt.executeUpdate();

			if (objPstmt.executeUpdate() > 0) {
				chk = true;
			}

		} catch (Exception e) {
			System.out.println("writeModChk e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return chk;
	}

	// 판매자 문의 삭제
	public boolean writeDelChk(String pWUId) {
		boolean chkDel = false;

		try {
			objConn = pool.getConnection();
			sql = "delete from pWSel where pWUId = '" + pWUId + "'";
			objPstmt = objConn.prepareStatement(sql);

			if (objPstmt.executeUpdate() > 0) {
				chkDel = true;
			}

		} catch (Exception e) {
			System.out.println("writeDelChk e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return chkDel;
	}


	// 판매자 데이터 있는 지 확인
	public int writeListChk(String pWUId) {
		int count = 0;

		try {
			objConn = pool.getConnection();
			String sql = "select count(*) from pWSel where pWUId = '" + pWUId + "'";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				count = objRS.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("writeListChk e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return count;
	}

	// 리뷰 작성
	public boolean writeRevChk(int pRevWNo,String pRevWUId, String pRevWrite, int pRevWStar, String pRevWPhoto) {
		boolean chk = false;

		try {
			objConn = pool.getConnection();
			sql = "insert into pRevWrite (pRevWNo, pRevWUId, pRevWrite, pRevWStar, pRevWPhoto, pRevWTime, pRevWRecom) values (?, ?, ?, ?, ?, now(), 0)";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, pRevWNo);
			objPstmt.setString(2, pRevWUId);
			objPstmt.setString(3, pRevWrite);
			objPstmt.setInt(4, pRevWStar);
			objPstmt.setString(5, pRevWPhoto);

			if (objPstmt.executeUpdate() > 0) {
				chk = true;
			}

		} catch (Exception e) {
			System.out.println("writeRevChk e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return chk;
	}
	public boolean listRevChk(int pRevPNo,String pRevUId, String pRevCont, int pRevStar, String pRevImg) {
		boolean chk = false;

		try {
			objConn = pool.getConnection();
			sql = "insert into pRevList (pRevPNo, pRevUId, pRevCont, pRevStar, pRevImg, pRevDate, pRevRecom, pRevPhoto) values (?, ?, ?, ?, ?, now(), 0, ?)";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, pRevPNo);
			objPstmt.setString(2, pRevUId);
			objPstmt.setString(3, pRevCont);
			objPstmt.setInt(4, pRevStar);
			objPstmt.setString(5, pRevImg);
			if(pRevImg.equals(null) || pRevImg.equals("")) {
				objPstmt.setInt(6, 0);
			}else {
				objPstmt.setInt(6, 1);
			}

			if (objPstmt.executeUpdate() > 0) {
				chk = true;
			}

		} catch (Exception e) {
			System.out.println("writeRevChk e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return chk;
	}

	// 리뷰 이미지 리스트
	public int proRevCount() {
		int count = 0;

		try {
			objConn = pool.getConnection();
			String sql = "select count(*) from pRevList where pRevPhoto = 1";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				count = objRS.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("proRevCount e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return count;
	}
	// 리뷰 썼는지(로그인 시)
	public int revWCnt(String uId) {
		int count = 0;

		try {
			objConn = pool.getConnection();
			String sql = "select count(*) from pRevWrite where pRevWUId = '" + uId + "'";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				count = objRS.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("revWCnt e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return count;
	}
	
	// 리뷰 좋아요
	public boolean revRecomCnt(int pRevRecom, String uId, int pNo) {
		boolean chk = false;

		try {
			objConn = pool.getConnection();
			String sql = "update pRevList set pRevRecom = ? where pRevUId = '" + uId + "'and pRevPNo = " + pNo;
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, pRevRecom);
			objPstmt.executeUpdate();

			if (objPstmt.executeUpdate() > 0) {
				chk = true;
			}
		} catch (Exception e) {
			System.out.println("revWCnt e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return chk;
	}



	// 찜 목록 추가
	public boolean wishAdd(String uId, int pNo) {
		boolean flag = false;

		try {
			objConn = pool.getConnection();
			String sql = "insert into wishList values (?, ?)";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);
			objPstmt.setInt(2, pNo);
			if (objPstmt.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}

		return flag;
	}

	// 찜 목록 제거
	public boolean wishDel(String uId, int pNo) {
		boolean flag = false;

		try {
			objConn = pool.getConnection();
			String sql = "delete from wishList where uId=? and pNo=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);
			objPstmt.setInt(2, pNo);
			if (objPstmt.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}

		return flag;
	}

	// 찜 목록 불러오기
	public List wishList(String uId) {
		List wList = new Vector();
		List pList = new Vector();

		try {
			objConn = pool.getConnection();
			String sql = "select pNo from wishList where uId=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);
			objRS = objPstmt.executeQuery();
			while (objRS.next()) {
				pList.add(objRS.getInt("pNo"));
			}
			
			for (int i = 0; i<pList.size(); i++) {
				int pNo = (int) pList.get(i);
				sql = "select * from proList where pNo = ?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setInt(1, pNo);
				objRS = objPstmt.executeQuery();
				objRS.next();
				ProListBean pLBean = new ProListBean();
				pLBean.setpNo(objRS.getInt("pNo"));
				pLBean.setpTitle(objRS.getString("pTitle"));
				pLBean.setpDate1(objRS.getString("pDate1"));
				pLBean.setpDate2(objRS.getString("pDate2"));
				pLBean.setpContent(objRS.getString("pContent"));
				wList.add(pLBean);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}

		return wList;
	}
}
