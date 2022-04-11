package pack_product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class productMgr {

	private DBConnectionMgr pool = null;
	private Connection objConn = null;
	private PreparedStatement objPstmt = null;
	private ResultSet objRS = null;
	private String sql = "";

	public productMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 데이터 출력
	public List<proListBean> listOutput() {

		List<proListBean> pList = new Vector<proListBean>();

		try {
			objConn = pool.getConnection();
			sql = "select * from proList order by pNo Asc";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();
			while(objRS.next()){
				proListBean pLBean = new proListBean();
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
			System.out.println("e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return pList;
	}
	
	// 데이터 있는 지 확인
	public int proListCount() {
		int count = 0;
		
		try {
			objConn = pool.getConnection();
			String sql = "select count(*) from proList";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();
			
			if(objRS.next()) {
				count = objRS.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return count;
	}
}
