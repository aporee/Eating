package eating;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class ReviewMgr {

	// 업로더 저장 위치
	public static final String SAVEFOLDER = "C:/Jsp/myapp/src/main/webapp/ch15/storage/";
	// 업로더 파일명 인코딩
	public final String ENCODING = "UTF-8";
	// 업로도 파일 크기
	public final int MAXSIZE = 1024*1024*10;//10MB
	
	private DBConnectionMgr pool;
	public ReviewMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<ReviewBean> showReviews(int rest_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<ReviewBean> vlist = new Vector<ReviewBean>();
		try {
			con = pool.getConnection();
			sql = "select * from review "
					+ "where rest_id = ?"
					+ " limit 15 "
					+ "order by review_datetime desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rest_id);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				ReviewBean review = new ReviewBean();
				review.setReview_id(rs.getInt("review_id"));//리뷰번호
				review.setUser_id(rs.getString("user_id"));//유저 id
				review.setReview_title(rs.getString("review_title"));//리뷰제목
				review.setReview_content(rs.getString("review_content"));
				review.setReview_image1(rs.getString("review_image1"));//메인사진
				review.setReview_image2(rs.getString("review_image2"));//사진2
				review.setReview_image3(rs.getString("review_image3"));//사진3
				vlist.addElement(review);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public boolean editNotice(ReviewBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update ";
			pstmt = con.prepareStatement(sql);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	
	}
	
	
}
