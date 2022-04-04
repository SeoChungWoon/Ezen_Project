package pack_Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class MemberMgr {

	private DBConnectionMgr pool = null;
	
	public MemberMgr() {
		
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean chkId (String uId) {
		Connection objConn = null;
		PreparedStatement objPstmt = null;
		ResultSet objRS = null;
		String sql = "";
		boolean flag = false;
		
		try {
			objConn = pool.getConnection();
			
			System.out.println("uId : " + uId);
			sql = "select count(*) from member where uId = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);
			objRS = objPstmt.executeQuery();
			
			objRS.next();
			if(objRS.getInt("count(*)") > 0) {
				flag = false;
			} else {
				flag = true;
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		
		return flag;
	}
	
	public List<ZipcodeBean> zipChk (String area3) {
		Connection objConn = null;
		PreparedStatement objPstmt = null;
		ResultSet objRS = null;
		String sql = "";
		List<ZipcodeBean> zipList = new Vector<ZipcodeBean>();
		try {
			objConn = pool.getConnection();
			sql = "select * from tblZipcode where area3 like ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, "%" + area3 + "%");
			objRS = objPstmt.executeQuery();
			while (objRS.next()) {
				ZipcodeBean zBean = new ZipcodeBean();
				zBean.setZipcode(objRS.getString(1));
				zBean.setArea1(objRS.getString(2));
				zBean.setArea2(objRS.getString(3));
				zBean.setArea3(objRS.getString(4));
				zBean.setArea4(objRS.getString(5));
				zipList.add(zBean);
			}
		} catch (Exception e) {
			System.out.println("e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return zipList;
	}
	
	public boolean joinMember (RegisterBean rBean) {
		Connection objConn = null;
		PreparedStatement objPstmt = null;
		String sql = "";
		boolean flag = false;
		
		try {
			objConn = pool.getConnection();
			sql = "insert into member (uId, uPw, uName, uBirthday, uGender, uEmail, uPhone, uZipcode, uAddr, termsAds) ";
			sql += "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, rBean.getuId());
			objPstmt.setString(2, rBean.getuPw());
			objPstmt.setString(3, rBean.getuName());
			objPstmt.setString(4, rBean.getuBirthday());
			objPstmt.setString(5, rBean.getuGender());
			objPstmt.setString(6, rBean.getuEmail());
			objPstmt.setString(7, rBean.getuPhone());
			objPstmt.setString(8, rBean.getuZipcode());
			objPstmt.setString(9, rBean.getuAddr());
			objPstmt.setString(10, rBean.getTermsAds());
			
			if(objPstmt.executeUpdate()==1) flag = true;
		} catch (Exception e) {
			System.out.println("e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
		return flag;
	}
}
