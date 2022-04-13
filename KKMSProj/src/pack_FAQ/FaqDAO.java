package pack_FAQ;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;
import pack_EzPro.BoardVO;

public class FaqDAO {

	private Connection objConn = null;
	private PreparedStatement objPstmt = null;
	private ResultSet objRS = null;
	private Statement objStmt = null;
	private DBConnectionMgr pool = null;
	
	public FaqDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	public List FaqList(int firstData, int pageSize) {
		List faqList = new Vector();
		
		try {
			objConn = pool.getConnection();
			String sql = "select * from faqList order by fNo desc limit ?,?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, firstData);
			objPstmt.setInt(2, pageSize);
			
			objRS = objPstmt.executeQuery();
			
			while(objRS.next()) {
				FaqVO objVO = new FaqVO();
				
				objVO.setfNo(objRS.getInt("fNo"));
				objVO.setfDivision(objRS.getString("fDivision"));
				objVO.setfTitle(objRS.getString("fTitle"));
				objVO.setfContent(objRS.getString("fContent"));
				
				faqList.add(objVO);
			}
		} catch (Exception e) {
			System.out.println("Exception: "+ e.getMessage());
		}
		return faqList;
	}
	public int BoardCount() {
		int count = 0;
		
		try {
			objConn = pool.getConnection();
			String sql = "select count(*) from faqList";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();
			
			if(objRS.next()) {
				count = objRS.getInt(1);
			}
		}catch(Exception e2) {
			System.out.println("Exception : " + e2.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		
		return count;
	}
	public List mtdSelect(int no) {
		List faqList = new Vector();
		
		try {
			objConn = pool.getConnection();
			
			String sql = "select * from faqList where fNo=?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, no);
			objRS = objPstmt.executeQuery();
			while(objRS.next()) {
				FaqVO objVO = new FaqVO();
				
				objVO.setfNo(objRS.getInt("fNo"));
				objVO.setfDivision(objRS.getString("fDivision"));
				objVO.setfTitle(objRS.getString("fTitle"));
				objVO.setfContent(objRS.getString("fContent"));
				
				faqList.add(objVO);
			}
		}catch(Exception e) {
			System.out.println("Exception: " + e.getMessage());
		}finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		return faqList;
	}
	public ArrayList getSearch(String searchField, String searchText){
		ArrayList	list = new ArrayList();
		String sql = "select * from faqList where "+searchField.trim();
		try {
			objConn = pool.getConnection();
			if(searchText != null && !searchText.equals("")) {
				sql += " like '%"+searchText.trim()+"%' order by fNo desc";
			}
				objPstmt = objConn.prepareStatement(sql);
				objRS = objPstmt.executeQuery();
				while(objRS.next()) {
					
					FaqVO objVO = new FaqVO();
					
					objVO.setfNo(objRS.getInt("fNo"));
					objVO.setfDivision(objRS.getString("fDivision"));
					objVO.setfTitle(objRS.getString("fTitle"));
					objVO.setfContent(objRS.getString("fContent"));
					
					list.add(objVO);
				
				}
		} catch (Exception e) {
			System.out.println("Exception :" +e.getMessage());
		}
		return list;
}
}
