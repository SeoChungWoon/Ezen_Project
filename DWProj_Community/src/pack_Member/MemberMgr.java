package pack_Member;

import java.sql.Connection;
import java.sql.PreparedStatement;


import pack_DBCP.DBConnectionMgr;

public class MemberMgr {

	private DBConnectionMgr pool = null;
	
	public MemberMgr() {
		
		try {
			pool = DBConnectionMgr.getInstance();	
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
	
	public void mtdJoin(
			String id, String pw, String name, String gender, String email, String birthday, String zipcode, String addr, String hobby, String job
			) {
		Connection objConn = null;
		PreparedStatement objPstmt = null;
		
		try {
			objConn = pool.getConnection();
			
			String sql = "insert into member ";
			sql += "(uId, uPw, uName, uGender, uEmail, uBirthday, uZipcode, uAddr, uHobby, uJob)";
			sql += " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, id);
			objPstmt.setString(2, pw);
			objPstmt.setString(3, name);
			objPstmt.setString(4, gender);
			objPstmt.setString(5, email);
			objPstmt.setString(6, birthday);
			objPstmt.setString(7, zipcode);
			objPstmt.setString(8, addr);
			objPstmt.setString(9, hobby);
			objPstmt.setString(10, job);
			objPstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("여기 : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
	}
	 
}

