package pack_Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class AsideMgr {
	private DBConnectionMgr pool = null;
	private Connection objConn = null;
	private Statement objStmt = null;
	private PreparedStatement objPstmt = null;
	private ResultSet objRS = null;
	private String sql = "";
	
	public AsideMgr() {

		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	
}
