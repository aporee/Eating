package eating;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class TestMgr {


	// 업로더 저장 위치
	public static final String SAVEFOLDER = "C:/Jsp/myapp/src/main/webapp/ch15/storage/";
	// 업로더 파일명 인코딩
	public final String ENCODING = "UTF-8";
	// 업로도 파일 크기
	public final int MAXSIZE = 1024*1024*10;//10MB
	
	private DBConnectionMgr pool;
	public TestMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public ReviewBean testoutput(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		ReviewBean bean = new ReviewBean();
		try {
			con = pool.getConnection();
			sql = "select * from review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setReview_content(rs.getString("review_content"));;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return bean;
	}
}
