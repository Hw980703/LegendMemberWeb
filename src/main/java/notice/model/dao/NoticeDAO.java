package notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import notice.model.vo.Notice;

public class NoticeDAO {

	public int insertNotice(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO NOTICE_TBL VALUES(SEO_NOTICENO.NEXTVAL,?,?,'admin',DEFAULT,DEFAULT,DEFAULT)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, notice.getNoticeSubject());
			pstmt.setString(2, notice.getNoticeContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return result;
	}

	public List<Notice> selectNoticeList(Connection conn) {
		PreparedStatement pstmt = null;
		List<Notice> nList = new ArrayList<Notice>();
		String query = "SELECT * FROM NOTICE_TBL";

		try {
			pstmt = conn.prepareStatement(query);
			ResultSet rset = pstmt.executeQuery();

			while (rset.next()) {
				Notice notice = new Notice();

				notice.setNoticeNo(rset.getInt(1));
				notice.setNoticeSubject(rset.getString(2));
				notice.setNoticeContent(rset.getString(3));
				notice.setNoticeWriter(rset.getString(4));
				notice.setNoticeDate(rset.getTimestamp(5));
				notice.setNoticeUpdateDate(rset.getTimestamp(6));
				notice.setNoticeCount(rset.getInt(7));

				nList.add(notice);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return nList;
	}

	public Notice selectOneByNo(Connection conn, int noticeNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice notice = null;
		
		String query = "SELECT * FROM NOTICE_TBL WHERE NOTICE_NO = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			 rset = pstmt.executeQuery();

			if (rset.next()) {
				 notice = new Notice();

				notice.setNoticeNo(rset.getInt(1));
				notice.setNoticeSubject(rset.getString(2));
				notice.setNoticeContent(rset.getString(3));
				notice.setNoticeWriter(rset.getString(4));
				notice.setNoticeDate(rset.getTimestamp(5));
				notice.setNoticeUpdateDate(rset.getTimestamp(6));
				notice.setNoticeCount(rset.getInt(7));

				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

		return notice;
	}

}
