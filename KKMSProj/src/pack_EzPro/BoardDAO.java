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
	
	public List BoardList(int firstData, int pageSize, String divisions) {
		List boardList = new Vector();
			try {
				objConn = pool.getConnection();
				String sql = "select * from bbsList where divisions=? order by no desc limit ?,?";
				objPstmt = objConn.prepareStatement(sql);
				
				objPstmt.setString(1, divisions);
				objPstmt.setInt(2, firstData);
				objPstmt.setInt(3, pageSize);
				
				objRS = objPstmt.executeQuery();
				
				while(objRS.next()) {
					
					BoardVO objVO = new BoardVO();
					
					objVO.setNo(objRS.getInt("no"));
					objVO.setDivisions(objRS.getString("divisions"));
					objVO.setHeader(objRS.getString("header"));
					objVO.setTitle(objRS.getString("title"));
					objVO.setContent(objRS.getString("content"));
					objVO.setwName(objRS.getString("wName"));
					objVO.setPostDate(objRS.getString("postDate"));
					objVO.setCount(objRS.getInt("count"));
					
					boardList.add(objVO);
					
				}
				
			}catch(Exception e) {
				System.out.println("Exception : " + e.getMessage());
			}finally {
				pool.freeConnection(objConn, objPstmt, objRS);
			}
		
		return boardList;
	}
	public int BoardCount(String divisions) {
		int count = 0;
		
		try {
			objConn = pool.getConnection();
			String sql = "select count(*) from bbsList where divisions=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, divisions);
			objRS = objPstmt.executeQuery();
			
			if(objRS.next()) {
				count = objRS.getInt("count(*)");
			}

		}catch(Exception e2) {
			System.out.println("Exception : " + e2.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		
		return count;
	}
	public boolean mtdWrite(String divisions,String header,String title,String wName,String content) {
			
		boolean res = false;
		
		DBConnectionMgr pool = DBConnectionMgr.getInstance();
	 	
	 	Connection objConn = null;
	 	PreparedStatement objPstmt = null;
	 	
	 	try{
	 		objConn = pool.getConnection();
	 		
	 		String sql = "insert into bbsList (divisions,header, title, wName,content,postDate, count) values ";
	 				sql += "(?,?,?,?,?,date_format(now(), '%Y-%m-%d'),0)";
	 		objPstmt = objConn.prepareStatement(sql);
	 		objPstmt.setString(1,"divisions");
	 		objPstmt.setString(2,"header");
	 		objPstmt.setString(3,"title");
	 		objPstmt.setString(4,"wName");
	 		objPstmt.setString(5, "content");
	 		
	 		if(objPstmt.executeUpdate()>0) {
	 			res = true;
	 		}
		

	}catch (Exception e) {
		System.out.println("Exception : " + e.getMessage());
	}finally {
		pool.freeConnection(objConn, objPstmt);
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
	public List mtdSelect(int no, String divisions) {
		List objList = new Vector();
		
		try {
			objConn = pool.getConnection();
			
			String sql = "select * from bbsList where no=? and divisions=?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, no);
			objPstmt.setString(2, divisions);
			objRS = objPstmt.executeQuery();
			while(objRS.next()) {
				BoardVO objVO = new BoardVO();
				
				objVO.setNo(objRS.getInt("no"));
				objVO.setDivisions(objRS.getString("divisions"));
				objVO.setHeader(objRS.getString("header"));
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
	public ArrayList getSearch(String searchField, String searchText, String divisions){
		ArrayList	list = new ArrayList();
		String sql = "select * from bbsList where divisions =? and "+searchField.trim();
		try {
			objConn = pool.getConnection();
			if(searchText != null && !searchText.equals("")) {
				sql += " like '%"+searchText.trim()+"%' order by no desc";
			}
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, divisions);
				objRS = objPstmt.executeQuery();
				while(objRS.next()) {
					BoardVO objVO = new BoardVO();
					
					objVO.setNo(objRS.getInt("no"));
					objVO.setDivisions(objRS.getString("divisions"));
					objVO.setHeader(objRS.getString("header"));
					objVO.setTitle(objRS.getString("title"));
					objVO.setwName(objRS.getString("wName"));
					objVO.setPostDate(objRS.getString("postDate"));
					objVO.setCount(objRS.getInt("count"));
					objVO.setContent(objRS.getString("content"));
					
					list.add(objVO);
				
				}
		} catch (Exception e) {
			System.out.println("Exception :" +e.getMessage());
		}finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		return list;
}
	public boolean Update(String title, String content, int no, String divisions) {
		boolean udChk = false;
			String sql = "update bbsList set title=? , content=? where divisions=? and no=?";
			
			try {
				objConn=pool.getConnection();
				
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, title);
				objPstmt.setString(2, content);
				objPstmt.setString(3,divisions);
				objPstmt.setInt(4, no);
				
				objPstmt.executeUpdate();
				
				if(objPstmt.executeUpdate()>0) {
					udChk = true;
				}
			} catch (Exception e) {
				System.out.println("Exception :" + e.getMessage());
			}finally {
				pool.freeConnection(objConn, objPstmt);
			}
		
		return udChk;

	}
	public int[] ntcNoChk(String divisions) {
		int count = 0;
		String sql = "";
		int[] ntcNo = null;
		
		try {
			objConn= pool.getConnection();
			sql ="select count(*) from bbsList where divisions=?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, divisions);
			objRS=objPstmt.executeQuery();
			while(objRS.next()) {
				count = objRS.getInt("count(*)");
			}
		ntcNo = new int[count];
		
			sql="select no from bbsList where divisions=?";
			
			objPstmt=objConn.prepareStatement(sql);
			objPstmt.setString(1, divisions);
			objRS=objPstmt.executeQuery();
			for(int i = count-1; i >= 0;i--) {
				objRS.next();
				ntcNo[i] = objRS.getInt("no");
			}

		} catch (Exception e) {
			System.out.println("Exception:"+e.getMessage());
		}finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		return ntcNo;
	}
	public boolean Delete(int no, String divisions) {
		boolean dlChk = false;
		String sql = "delete from bbsList where divisions=? and no=?";
		
		try {
			objConn = pool.getConnection();
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, divisions);
			objPstmt.setInt(2, no);
			
			objPstmt.executeUpdate();
			
			if(objPstmt.executeUpdate()>0) {
				dlChk = true;
			}
		} catch (Exception e) {
			System.out.println("Exception :" +e.getMessage());
		}finally {
			pool.freeConnection(objConn, objPstmt);
		}
		return dlChk;
	}
}


