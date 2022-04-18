package pack_Event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class eventMgr {

	private DBConnectionMgr pool = null;
	private Connection objConn = null;
	private Statement objStmt = null;
	private PreparedStatement objPstmt = null;
	private ResultSet objRS = null;
	private String sql = "";

	public eventMgr() {
		try {
			pool = DBConnectionMgr.getInstance();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int eListCnt() {
		int eCnt = 0;
		try {
			objConn = pool.getConnection();

			sql = "select count(*) from eventList";
			objStmt = objConn.createStatement();
			objRS = objStmt.executeQuery(sql);
			objRS.next();
			eCnt = objRS.getInt("count(*)");

		} catch (Exception e) {
			System.out.println("e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return eCnt;
	}

	public List eventList() {

		List eList = new Vector();

		try {
			objConn = pool.getConnection();

			sql = "select * from eventList";
			objStmt = objConn.createStatement();
			objRS = objStmt.executeQuery(sql);
			
			while (objRS.next()) {
				eventBean eBean = new eventBean();
				eBean.seteNo(objRS.getInt("eNo"));
				eBean.seteTitle(objRS.getString("eTitle"));
				eBean.seteContent(objRS.getString("eContent"));
				eBean.seteMainImg(objRS.getString("eMainImg"));
				eBean.seteInnerImg(objRS.getString("eInnerImg"));
				eBean.seteStart(objRS.getString("eStart"));
				eBean.seteEnd(objRS.getString("eEnd"));
				eBean.seteRes(objRS.getString("eRes"));
				eBean.seteTag(objRS.getString("eTag"));
				eBean.seteType(objRS.getString("eType"));
				eList.add(eBean);
			}
			
		} catch (Exception e) {
			System.out.println("e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objStmt, objRS);
		}

		return eList;
	}
	
	public boolean eventChk (String uId, int eNo) {
		
		boolean flag = false;
		
		try {
			objConn = pool.getConnection();
			sql = "select * from event where uId=? and eNo=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);
			objPstmt.setInt(2, eNo);
			objRS = objPstmt.executeQuery();
			if(objRS.next()==false) {
				sql = "insert into event value (?, ?)";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, uId);
				objPstmt.setInt(2, eNo);
				if (objPstmt.executeUpdate() == 1) {
					flag=true;
				}
			} 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return flag;
	}

	public List eventReplyList (int eNo) {

		List rList = new Vector();

		try {
			objConn = pool.getConnection();

			sql = "select * from replyEvent where eNo=? order by rNo desc";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, eNo);
			objRS = objPstmt.executeQuery();
			while (objRS.next()) {
				eventBean eBean = new eventBean();
				eBean.setuId(objRS.getString("uId"));
				eBean.seteNo(objRS.getInt("eNo"));
				eBean.seteTxt(objRS.getString("eTxt"));
				eBean.seteDate(objRS.getString("eDate"));
				rList.add(eBean);
			}

		} catch (Exception e) {
			System.out.println("e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return rList;
	}
	
	public boolean eventReplyEnter (String uId, int eNo, String eTxt) {
		boolean flag = false;
		
		try {
			objConn = pool.getConnection();
			sql = "insert into replyEvent (uId, eNo, eTxt, eDate) values (?, ?, ?, now())";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);
			objPstmt.setInt(2, eNo);
			objPstmt.setString(3, eTxt);
			if(objPstmt.executeUpdate()>0) {
				flag = true;
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
		
		return flag;
	}
	
	public boolean eventReplyDel (String uId, int eNo, String eTxt, String eDate) {
		boolean flag = false;
		
		eDate = eDate.trim();
		
		try {
			objConn = pool.getConnection();
			sql = "delete from replyEvent where uId = ? and eNo = ? and eTxt = ? and eDate = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);
			objPstmt.setInt(2, eNo);
			objPstmt.setString(3, eTxt);
			objPstmt.setString(4, eDate);
			if(objPstmt.executeUpdate()>0) {
				flag = true;
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
		
		return flag;
	}
	
	public int eventReplyCnt () {
		int eCnt = 0;
		
		try {
			objConn = pool.getConnection();
			sql = "select count(*) from replyEvent";
			objStmt = objConn.createStatement();
			objRS = objStmt.executeQuery(sql);
			objRS.next();
			eCnt = objRS.getInt("count(*)");
		} catch (Exception e) {
			
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		
		return eCnt;
	}

}
