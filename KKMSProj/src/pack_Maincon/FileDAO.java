package pack_Maincon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class FileDAO {
	private Connection objConn = null;
	private PreparedStatement objPstmt = null;
	private ResultSet objRS = null;
	private Statement objStmt = null;
	private DBConnectionMgr pool = null;
	private String sql = "";
	
	public FileDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int upload(int mNo, String mFileName) {
		sql = "INSERT INTO mainslidelist VALUES (?,?,?,?,?)";
		try {
			objConn=pool.getConnection();
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, mNo);
			objPstmt.setString(2, mFileName);
			objPstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
