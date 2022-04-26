package pack_Maincon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;
import pack_Member.RegisterBean;

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
			sql = "select * from mainslidelist order by mNo Asc";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();
			while(objRS.next()) {
				MainContentsBean mCBean = new MainContentsBean();
				mCBean.setmNo(objRS.getInt("mNo"));
				mCBean.setmFileName(objRS.getString("mFileName"));
				mCBean.setmTitle(objRS.getString("mTitle"));
				mList.add(mCBean);
				
				
			}
		}catch (Exception e) {
			System.out.println("listOutput e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return mList;
	}
	
	
	// 업로드된 파일 DB insert
	public boolean insertImgFile(MainContentsBean mCBean) {
		
		boolean flag = false;
		try {
			objConn = pool.getConnection();
			sql = "insert into mainslidelist (mNo, mFileName) values (?, ?) ";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, mCBean.getmNo());
			objPstmt.setString(2, mCBean.getmFileName());
			
			if (objPstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			System.out.println("insertImgFile e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
		return flag;
	}
	
	
	
	// 데이터 있는지 확인
	public int mListCount() {
		int count = 0;
		
		try {
			objConn = pool.getConnection();
			sql = "select * from mainslidelist order by mNo Asc";
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
