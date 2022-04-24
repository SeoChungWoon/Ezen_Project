package pack_Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class AdminMgr {

	private DBConnectionMgr pool = null;
	private Connection objConn = null;
	private Statement objStmt = null;
	private PreparedStatement objPstmt = null;
	private ResultSet objRS = null;
	private String sql = "";
	
	public AdminMgr() {

		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//회원 목록 조회
	public List memberList (String mType, String joinWait) {
		List objList = new Vector();
		try {
			objConn = pool.getConnection();
			if(joinWait==null) {
				sql = "select * from member where mType=?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, mType);				
			} else {
				sql = "select * from member where mType=? and joinWait=?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, mType);
				objPstmt.setString(2, joinWait);
			}
			objRS = objPstmt.executeQuery();
			
			while(objRS.next()) {
				AdminBean aBean = new AdminBean();
				aBean.setNo(objRS.getInt("No"));
				aBean.setuId(objRS.getString("uId"));
				aBean.setuName(objRS.getString("uName"));
				aBean.setuBirthday(objRS.getString("uBirthday"));
				aBean.setuGender(objRS.getString("uGender"));
				aBean.setuEmail(objRS.getString("uEmail"));
				aBean.setuPhone(objRS.getString("uPhone"));
				aBean.setuZipcode(objRS.getString("uZipcode"));
				aBean.setuAddr(objRS.getString("uAddr"));
				aBean.setTermsAds(objRS.getString("TermsAds"));
				aBean.setmType(objRS.getString("mType"));
				aBean.setePay(objRS.getInt("ePay"));
				aBean.setJoinDate(objRS.getString("joinDate"));
				objList.add(aBean);
			}
			
		} catch (Exception e) {
			System.out.println("memberList e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return objList; 
	}
	
	//회원 목록 검색
		public List searchMemberList (String mType, String joinWait, String Tag, String Txt) {
			List objList = new Vector();
			try {
				objConn = pool.getConnection();
				if(joinWait==null) {
					sql = "select * from member where mType=? and "+Tag+" like '%"+Txt+"%'";
					objPstmt = objConn.prepareStatement(sql);
					objPstmt.setString(1, mType);
				} else {
					sql = "select * from member where mType=? and joinWait=? and " + Tag + " like '%"+Txt+"%'";
					objPstmt = objConn.prepareStatement(sql);
					objPstmt.setString(1, mType);
					objPstmt.setString(2, joinWait);
				}
				objRS = objPstmt.executeQuery();
				
				while(objRS.next()) {
					AdminBean aBean = new AdminBean();
					aBean.setNo(objRS.getInt("No"));
					aBean.setuId(objRS.getString("uId"));
					aBean.setuName(objRS.getString("uName"));
					aBean.setuBirthday(objRS.getString("uBirthday"));
					aBean.setuGender(objRS.getString("uGender"));
					aBean.setuEmail(objRS.getString("uEmail"));
					aBean.setuPhone(objRS.getString("uPhone"));
					aBean.setuZipcode(objRS.getString("uZipcode"));
					aBean.setuAddr(objRS.getString("uAddr"));
					aBean.setTermsAds(objRS.getString("TermsAds"));
					aBean.setmType(objRS.getString("mType"));
					aBean.setePay(objRS.getInt("ePay"));
					aBean.setJoinDate(objRS.getString("joinDate"));
					objList.add(aBean);
				}
				
			} catch (Exception e) {
				System.out.println("searchMemberList e : " + e.getMessage());
			} finally {
				pool.freeConnection(objConn, objPstmt, objRS);
			}
			
			return objList; 
		}
	
	//가입승인 대기 인원
	public int waitCnt () {
		int wCnt = 0;
		try {
			objConn = pool.getConnection();
			sql = "select count(*) from member where joinWait='N'";
			objStmt = objConn.createStatement();
			objRS = objStmt.executeQuery(sql);
			objRS.next();
			wCnt = objRS.getInt("count(*)");
			
		} catch (Exception e) {
			System.out.println("waitCnt e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return wCnt;
	}
	
	//판매자 가입 승인
	public boolean joinAgree (String uId) {
		boolean flag = false;
		
		try {
			objConn = pool.getConnection();
			sql = "update member set joinWait='Y' where uId=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);
			if(objPstmt.executeUpdate()>0)
				flag=true;
			
		} catch (Exception e) {
			System.out.println("joinAgree e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
		
		return flag;
	}
	
	//판매자 가입 거부
		public boolean joinDisagree (String uId) {
			boolean flag = false;
			
			try {
				objConn = pool.getConnection();
				sql = "delete from member where joinWait='N' and uId=?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, uId);
				if(objPstmt.executeUpdate()>0)
					flag=true;
			} catch (Exception e) {
				System.out.println("joinDisagree e : " + e.getMessage());
			} finally {
				pool.freeConnection(objConn, objPstmt);
			}
			
			return flag;
		}
	
}
