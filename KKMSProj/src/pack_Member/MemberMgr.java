package pack_Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import pack_DBCP.DBConnectionMgr;

public class MemberMgr {

	private DBConnectionMgr pool = null;
	private Connection objConn = null;
	private PreparedStatement objPstmt = null;
	private ResultSet objRS = null;
	private String sql = "";

	public MemberMgr() {

		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean chkId(String uId) {
		boolean flag = false;

		try {
			objConn = pool.getConnection();

			System.out.println("uId : " + uId);
			sql = "select count(*) from member where uId = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);
			objRS = objPstmt.executeQuery();

			objRS.next();
			if (objRS.getInt("count(*)") > 0) {
				flag = false;
			} else {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return flag;
	}

	public List<ZipcodeBean> zipChk(String area3) {
		
		List<ZipcodeBean> zipList = new Vector<ZipcodeBean>();
		
		try {
			objConn = pool.getConnection();
			sql = "select * from tblZipcode where area3 like ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, "%" + area3 + "%");
			objRS = objPstmt.executeQuery();
			while (objRS.next()) {
				ZipcodeBean zBean = new ZipcodeBean();
				zBean.setZipcode(objRS.getString(1));
				zBean.setArea1(objRS.getString(2));
				zBean.setArea2(objRS.getString(3));
				zBean.setArea3(objRS.getString(4));
				zBean.setArea4(objRS.getString(5));
				zipList.add(zBean);
			}
		} catch (Exception e) {
			System.out.println("e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return zipList;
	}

	public boolean joinMember(RegisterBean rBean) {
		
		boolean flag = false;

		try {
			objConn = pool.getConnection();
			sql = "insert into member (uId, uPw, uName, uBirthday, uGender, uEmail, uPhone, uZipcode, uAddr, termsAds) ";
			sql += "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, rBean.getuId());
			objPstmt.setString(2, rBean.getuPw());
			objPstmt.setString(3, rBean.getuName());
			objPstmt.setString(4, rBean.getuBirthday());
			objPstmt.setString(5, rBean.getuGender());
			objPstmt.setString(6, rBean.getuEmail());
			objPstmt.setString(7, rBean.getuPhone());
			objPstmt.setString(8, rBean.getuZipcode());
			objPstmt.setString(9, rBean.getuAddr());
			objPstmt.setString(10, rBean.getTermsAds());
			if (objPstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			System.out.println("e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
		return flag;
	}

	public String loginChk(String mId, String mPw) {
		
		String uName = "";

		System.out.println("id : "+mId+"   mPw : "+mPw);
		try {
			objConn = pool.getConnection();
			sql = "select count(*), uName from member where uId = ? and uPw = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, mId);
			objPstmt.setString(2, mPw);
			objRS = objPstmt.executeQuery();
			objRS.next();
			if (objRS.getInt("count(*)") > 0) {
				uName = objRS.getString("uName");
			}
			System.out.println("uName : "+uName);
		} catch (Exception e) {
			System.out.println("e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		return uName;
	}
	
	public boolean mPwChk(String mId, String mPw) {
		
		boolean flag = false;
		System.out.println(mId + " " + mPw);
		try {
			objConn = pool.getConnection();
			sql = "select count(*) from member where uId = ? and uPw = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, mId);
			objPstmt.setString(2, mPw);
			objRS = objPstmt.executeQuery();
			objRS.next();
			if(objRS.getInt("count(*)") > 0){
				flag = true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return flag;
	}
	
	public List<ZipcodeBean> myPage(String mId) {

		List mList = new Vector();

		try {
			objConn = pool.getConnection();
			sql = "select * from member where uId=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, mId);
			objRS = objPstmt.executeQuery();
			
			while(objRS.next()) {
				RegisterBean rBean = new RegisterBean();
				rBean.setuId(objRS.getString("uId"));
				rBean.setuName(objRS.getString("uName"));
				rBean.setuBirthday(objRS.getString("uBirthday"));
				rBean.setuGender(objRS.getString("uGender"));
				rBean.setuEmail(objRS.getString("uEmail"));
				rBean.setuPhone(objRS.getString("uPhone"));
				rBean.setuZipcode(objRS.getString("uZipcode"));
				rBean.setuAddr(objRS.getString("uAddr"));
				mList.add(rBean);
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return mList;
	}
	
	public boolean withdraw (String wId, String wPw) {
		
		boolean flag = false;
		
		try {
			objConn = pool.getConnection();
			sql = "delete from member where uId = ? and uPw = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, wId);
			objPstmt.setString(2, wPw);
			if (objPstmt.executeUpdate()>0)
			flag = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return flag;
		
	}
	
	public boolean modify (String uId, String nPw, String nEmail, String nZipcode, String nAddr, String nPhone) {
		boolean flag = false;
		
		try {
			objConn = pool.getConnection();
			if(nPw == "") {
				sql = "update member set uEmail = ?, uZipcode = ?, uAddr = ?, uPhone = ? where uId=?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, nEmail);
				objPstmt.setString(2, nZipcode);
				objPstmt.setString(3, nAddr);
				objPstmt.setString(4, nPhone);
				objPstmt.setString(5, uId);
				if (objPstmt.executeUpdate()>0)
					flag = true;
			} else if (nPw != "") {
				sql = "update member set uPw = ?, uEmail = ?, uZipcode = ?, uAddr = ?, uPhone = ? where uId=?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, nPw);
				objPstmt.setString(2, nEmail);
				objPstmt.setString(3, nZipcode);
				objPstmt.setString(4, nAddr);
				objPstmt.setString(5, nPhone);
				objPstmt.setString(6, uId);
				if (objPstmt.executeUpdate()>0)
					flag = true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
		
		return flag;
	}
	
	
}
