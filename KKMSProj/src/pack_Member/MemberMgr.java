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
	
	// 아이디 중복확인
	public boolean chkId(String uId) {
		boolean flag = false;

		try {
			objConn = pool.getConnection();

			
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
			System.out.println("chkId e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return flag;
	}
	
	// 우편번호 찾기
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
			System.out.println("zipChk e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return zipList;
	}

	// 일반 회원가입
	public boolean joinMember(RegisterBean rBean, String mType) {
		
		boolean flag = false;
		try {
			objConn = pool.getConnection();
			sql = "insert into member (uId, uPw, uName, uBirthday, uGender, uEmail, uPhone, uZipcode, uAddr, termsAds, mType, ePay, joinDate) ";
			sql += "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 5000, date_format(now(), '%Y-%m-%d'))";
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
			objPstmt.setString(11, mType);
			if (objPstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			System.out.println("joinMember e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
		return flag;
	}
	
	// 판매자 회원가입
	public boolean sellerJoinMember(RegisterBean rBean, String mType) {
		
		boolean flag = false;
		try {
			objConn = pool.getConnection();
			sql = "insert into member (uId, uPw, uName, uBirthday, uGender, uEmail, uPhone, mType, joinWait, joinDate) ";
			sql += "values (?, ?, ?, ?, ?, ?, ?, ?, ?, date_format(now(), '%Y-%m-%d'))";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, rBean.getuId());
			objPstmt.setString(2, rBean.getuPw());
			objPstmt.setString(3, rBean.getuName());
			objPstmt.setString(4, rBean.getuBirthday());
			objPstmt.setString(5, rBean.getuGender());
			objPstmt.setString(6, rBean.getuEmail());
			objPstmt.setString(7, rBean.getuPhone());
			objPstmt.setString(8, mType);
			objPstmt.setString(9, "N");
			if (objPstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			System.out.println("sellerJoinMember e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
		return flag;
	}

	
	// 가입 승인 대기 조회 ('N' 대기상태)
	public boolean waitChk(String mId, String mPw) {
		
		boolean flag = false;
		String chk = "";

		
		try {
			objConn = pool.getConnection();
			sql = "select joinWait from member where uId = ? and uPw = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, mId);
			objPstmt.setString(2, mPw);
			objRS = objPstmt.executeQuery();
			objRS.next();
			
			chk = objRS.getString("joinWait");
			if(chk != null) {
				if(chk.equals("N")) {
					flag = true;
				}					
			}
			
		} catch (Exception e) {
			System.out.println("waitChk e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		return flag;
	}
	
	// 로그인, 회원 타입 조회 (관리자, 일반, 판매자)
	public String mTypeChk(String mId, String mPw) {
		
		boolean flag = false;
		String mType = "";

		
		try {
			objConn = pool.getConnection();
			sql = "select mType from member where uId = ? and uPw = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, mId);
			objPstmt.setString(2, mPw);
			objRS = objPstmt.executeQuery();
			objRS.next();
			
			mType = objRS.getString("mType");
						
		} catch (Exception e) {
			System.out.println("mTypeChk e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		return mType;
	}
			
	// 마이페이지 비밀번호 확인
	public boolean mPwChk(String mId, String mPw) {
		
		boolean flag = false;
		
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
			System.out.println("mPwChk e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return flag;
	}
	
	// 마이페이지 정보조회
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
				rBean.setePay(objRS.getInt("ePay"));
				mList.add(rBean);
			}
			

		} catch (Exception e) {
			System.out.println("myPage e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}

		return mList;
	}
	
	// 회원 탈퇴
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
			System.out.println("withdraw e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return flag;
		
	}
	
	// 회원정보 수정
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
			System.out.println("modify e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
		
		return flag;
	}
	
	// 판매자 회원정보 수정
		public boolean sellerModify (String uId, String nPw, String nEmail, String nPhone) {
			boolean flag = false;
			
			try {
				objConn = pool.getConnection();
				if(nPw == "") {
					sql = "update member set uEmail = ?, uPhone = ? where uId=?";
					objPstmt = objConn.prepareStatement(sql);
					objPstmt.setString(1, nEmail);
					objPstmt.setString(2, nPhone);
					objPstmt.setString(3, uId);
					if (objPstmt.executeUpdate()>0)
						flag = true;
				} else if (nPw != "") {
					sql = "update member set uPw = ?, uEmail = ?, uPhone = ? where uId=?";
					objPstmt = objConn.prepareStatement(sql);
					objPstmt.setString(1, nPw);
					objPstmt.setString(2, nEmail);
					objPstmt.setString(3, nPhone);
					objPstmt.setString(4, uId);
					if (objPstmt.executeUpdate()>0)
						flag = true;
				}
			} catch (Exception e) {
				System.out.println("modify e : " + e.getMessage());
			} finally {
				pool.freeConnection(objConn, objPstmt);
			}
			
			return flag;
		}
	
	// 아이디 찾기
	public String findId (String fName, String fData, String howTo) {
		
		String id = "";
		
		try {
			objConn = pool.getConnection();
			if(howTo == "eId") {				
				sql = "select uId from member where uName=? and uEmail=?";
			} else if (howTo == "pId") {
				sql = "select uId from member where uName=? and uPhone=?";
			}
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, fName);
			objPstmt.setString(2, fData);
			objRS = objPstmt.executeQuery();
			if(objRS.next()) {
			id = objRS.getString("uId");
			} else {
				id="";
			}
		} catch (Exception e) {
			System.out.println("findId e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return id;
		
	}
	
	// 비밀번호 찾기
	public boolean findPw (String fId, String fName, String fData, String howTo) {
		
		String id = "";
		boolean flag = false;
		
		try {
			objConn = pool.getConnection();
			if(howTo == "ePw") {				
				sql = "select count(*) from member where uId=? and uName=? and uEmail=?";
			} else if (howTo == "pPw") {
				sql = "select count(*) from member where uId=? and uName=? and uPhone=?";
			}
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, fId);
			objPstmt.setString(2, fName);
			objPstmt.setString(3, fData);
			objRS = objPstmt.executeQuery();
			objRS.next();
			if(objRS.getInt("count(*)")>0) {
				flag = true;
			}
			
		} catch (Exception e) {
			System.out.println("findPw e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt, objRS);
		}
		
		return flag;
		
	}
	
	// 비밀번호 찾기 새로운 비밀번호 설정
	public boolean fChangePw (String uId, String uPw) {
		boolean flag = false;
	
		System.out.println(uId + " " + uPw);
		try {
			objConn = pool.getConnection();
				sql = "update member set uPw = ? where uId=?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, uPw);
				objPstmt.setString(2, uId);
				if (objPstmt.executeUpdate()>0)
					flag = true;
			
		} catch (Exception e) {
			System.out.println("fChangePw e : " + e.getMessage());
		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
		
		return flag;
	}
		
}
