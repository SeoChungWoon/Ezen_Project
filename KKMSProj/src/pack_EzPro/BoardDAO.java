package pack_EzPro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;


public class BoardDAO {

	private Connection objConn = null;
	private PreparedStatement objPstmt = null;
	private ResultSet objRS = null;
	private Statement objStmt = null;
	private DBConnectionMgr pool = null;
	
	public BoardDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public List BoardList(int firstData, int pageSize) {
		List boardList = new Vector();
			try {
				objConn = pool.getConnection();
				String sql = "select * from bbsList order by no desc limit ?,?";
				
				objPstmt = objConn.prepareStatement(sql);
				
				objPstmt.setInt(1, firstData);
				objPstmt.setInt(2, pageSize);
				
				objRS = objPstmt.executeQuery();
				
				while(objRS.next()) {
					
					BoardVO objVO = new BoardVO();
					
					objVO.setNo(objRS.getInt("no"));
					objVO.setDivision(objRS.getString("division"));
					objVO.setTitle(objRS.getString("title"));
					objVO.setwName(objRS.getString("wName"));
					objVO.setPostDate(objRS.getString("postDate"));
					objVO.setCount(objRS.getInt("count"));
					
					boardList.add(objVO);
					
				}
				
			}catch(Exception e) {
				System.out.println("Exception : " + e.getMessage());
			}
		
		return boardList;
	}
	public int BoardCount() {
		int count = 0;
		
		try {
			objConn = pool.getConnection();
			String sql = "select count(*) from bbsList";
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
	public boolean mtdWrite(BoardVO vo) {
			
		boolean res = false;
		
		DBConnectionMgr pool = DBConnectionMgr.getInstance();
	 	
	 	Connection objConn = null;
	 	PreparedStatement objPstmt = null;
	 	
	 	try{
	 		objConn = pool.getConnection();
	 		
	 		String sql = "insert into bbsList (division, title, wName, postDate, count) values";
	 				sql += "(?,?,?,date_format(now(),'%Y-%m-%d'),?)";
	 		objPstmt = objConn.prepareStatement(sql);
	 		objPstmt.setString(1,vo.getDivision());
	 		objPstmt.setString(2,vo.getTitle());
	 		objPstmt.setString(3,vo.getwName());
	 		objPstmt.setString(4,vo.getPostDate());
	 		objPstmt.setInt(5, 0);
	 		
	 		objPstmt.executeUpdate();
		

	}catch (Exception e) {
		System.out.println("Exception : " + e.getMessage());
	}
		return res;
}
	//공지사항 조회수
	public int viewCnt(int no) {
		
		String sql="";
		int count = 0;
		try{
			objConn = pool.getConnection();
			
			sql = "select count from bbsList where no=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, no);
			objRS = objPstmt.executeQuery();
			objRS.next();
			count = objRS.getInt("count");
			count++;
			
			sql = "update bbsList set count=? where no=?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, count);
			objPstmt.setInt(2, no);
			
			objPstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("Exception : " + e.getMessage());
		}finally {
			pool.freeConnection(objConn, objPstmt);
		}
		
		
		return count;
	}
	public List mtdSelect(int no) {
		List objList = new Vector();
		
		try {
			objConn = pool.getConnection();
			
			String sql = "select * from bbsList where no=?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, no);
			objRS = objPstmt.executeQuery();
			while(objRS.next()) {
				BoardVO objVO = new BoardVO();
				
				objVO.setNo(objRS.getInt("no"));
				objVO.setDivision(objRS.getString("division"));
				objVO.setTitle(objRS.getString("title"));
				objVO.setwName(objRS.getString("wName"));
				objVO.setPostDate(objRS.getString("postDate"));
				objVO.setCount(objRS.getInt("count"));
				objVO.setContent(objRS.getString("content"));
				
				objList.add(objVO);
			}
		}catch(Exception e) {
			System.out.println("Exception: " + e.getMessage());
		}finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		return objList;
	}
	public ArrayList getSearch(String searchField, String searchText){
			ArrayList	list = new ArrayList();
			String sql = "select * from bbsList where "+searchField.trim();
			try {
				objConn = pool.getConnection();
				if(searchText != null && !searchText.equals("")) {
					sql += " like '%"+searchText.trim()+"%' order by no desc";
				}
					objPstmt = objConn.prepareStatement(sql);
					objRS = objPstmt.executeQuery();
					while(objRS.next()) {
						BoardVO objVO = new BoardVO();
						
						objVO.setNo(objRS.getInt("no"));
						objVO.setDivision(objRS.getString("division"));
						objVO.setTitle(objRS.getString("title"));
						objVO.setwName(objRS.getString("wName"));
						objVO.setPostDate(objRS.getString("postDate"));
						objVO.setCount(objRS.getInt("count"));
						objVO.setContent(objRS.getString("content"));
						
						list.add(objVO);
					
					}
			} catch (Exception e) {
				System.out.println("Exception :" +e.getMessage());
			}
			return list;
	}
}


