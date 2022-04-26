package pack_Maincon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class MainconMgr {
	
	private DBConnectionMgr pool = null;
	private Connection objConn = null;
	private PreparedStatement objPstmt = null;
	private ResultSet objRS = null;
	private String sql = "";
	
	public MainconMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace(); 

		}
	}
	
	// 데이터 출력용
	public List<MainContentsBean> ListOutput(){
		
		List<MainContentsBean> mList = new Vector<MainContentsBean>();
		
		try {
			objConn = pool.getConnection();
			sql = "select * from proList order by pNo Asc";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();
			while(objRS.next()) {
				MainContentsBean mCBean = new MainContentsBean();
				mCBean.setmNo(objRS.getInt("mNo"));
				mCBean.setmFileRealName(objRS.getString("mFileRealName"));
				mCBean.setmFileName(objRS.getString("mFileName"));
				mCBean.setmDate1(objRS.getString("mDate1"));
				mCBean.setmDate1(objRS.getString("mDate2"));
				mList.add(mCBean);
				
				
			}
		}catch (Exception e) {
			System.out.println("listOutput e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return mList;
	}
	
	public int mListCount() {
		int count = 0;
		
		try {
			objConn = pool.getConnection();
			sql = "select * from proList order by pNo Asc";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();
			
			if(objRS.next()) {
				count = objRS.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("mListCount e : "+ e.getMessage());
		}finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		return count;
	}
	



}
