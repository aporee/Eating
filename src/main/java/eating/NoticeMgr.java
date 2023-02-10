package eating;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class NoticeMgr {

	// 업로더 저장 위치
	public static final String SAVEFOLDER = "C:/Jsp/myapp/src/main/webapp/ch15/storage/";
	// 업로더 파일명 인코딩
	public final String ENCODING = "UTF-8";
	// 업로도 파일 크기
	public final int MAXSIZE = 1024*1024*10;//10MB
	
	private DBConnectionMgr pool;
	public NoticeMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<NoticeBoardBean> showNoticeEditList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<NoticeBoardBean> vlist = new Vector<NoticeBoardBean>();
		try {
			con = pool.getConnection();
			sql = "select * from NoticeBoard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeBoardBean bean = new NoticeBoardBean();
				bean.setNotice_id(rs.getInt("notice_id"));
				bean.setNotice_userid(rs.getString("user_id"));
				bean.setRest_id(rs.getInt("rest_id"));
				bean.setNotice_content(rs.getString("notice_content"));
				bean.setNotice_datetime(rs.getString("notice_datetime"));				
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public boolean deleteNotice(int notice_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "delete from NoticeBoard where notice_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_id);
			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean editNotice(NoticeBoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update NoticeBoard SET "
					+ "notice_userid = ? "
					+ "notice_content = ? ";
			pstmt = con.prepareStatement(sql);

			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	
	}

}
