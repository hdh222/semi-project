

package review.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import review.dto.ReviewDto;
import review.dto.ReviewDto;
import util.DBconn;

public class ReviewDao {
	private static ReviewDao dao;

	private ReviewDao() {
	};

	public static ReviewDao getInstance() {
		if (dao == null) {
			dao = new ReviewDao();
		}
		return dao;
	}

	public Boolean insert(ReviewDto dto) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		try {

			conn = new DBconn().getConn();
			String sql = "INSERT INTO review (rnum,bnum,user_id,rdate,rname,rimg,rcontent,rscore)"
					+ " values(review_seq.nextval,?,?,SYSDATE,?,?,?,?)";
			ps = conn.prepareStatement(sql);

			ps.setInt(1, dto.getBnum());
			ps.setString(2, dto.getUser_id());
			ps.setString(3, dto.getRname());
			ps.setString(4, dto.getRimg());
			ps.setString(5, dto.getRcontent());
			ps.setInt(6, dto.getRscore());
			flag = ps.executeUpdate();
			System.out.println("리뷰추가됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}

	public Boolean delete(int num) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		try {
			conn = new DBconn().getConn();
			String sql = "DELETE FROM review WHERE rnum=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);

			flag = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}

	}

	public Boolean update(ReviewDto dto) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		try {
			conn = new DBconn().getConn();
			String sql = "UPDATE review SET rname=? and rimg=? rcontent=? and rscore=?" + " WHERE rnum=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getRname());
			ps.setString(2, dto.getRimg());
			ps.setString(3, dto.getRcontent());
			ps.setInt(4, dto.getRscore());
			ps.setInt(5, dto.getRnum());
			flag = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}

	public ReviewDto getdata(int num) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ReviewDto dto = null;
		try {
			conn = new DBconn().getConn();
			String sql = "SELECT * FROM review WHERE rnum=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new ReviewDto();
				dto.setRnum(num);
				dto.setBnum(rs.getInt("bnum"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setRdate(rs.getString("rdate"));
				dto.setRname(rs.getString("rname"));
				dto.setRimg(rs.getString("rimg"));
				dto.setRcontent(rs.getString("rcontent"));
				dto.setRscore(rs.getInt("rscore"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
		return dto;
	}
	
	

	public List<ReviewDto> getList(int bnum) {
		List<ReviewDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ReviewDto dto = null;
		try {
			conn = new DBconn().getConn();
			String sql = "SELECT rnum,bnum,user_id,to_char(rdate,'YYYY/MM/DD HH24:MI:SS')as rdate,rimg,rname,rcontent,rscore FROM review where bnum=? order by rnum desc";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bnum);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new ReviewDto();
				dto.setRnum(rs.getInt("rnum"));
				dto.setBnum(rs.getInt("bnum"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setRdate(rs.getString("rdate"));
				dto.setRname(rs.getString("rname"));
				dto.setRimg(rs.getString("rimg"));
				dto.setRcontent(rs.getString("rcontent"));
				dto.setRscore(rs.getInt("rscore"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
		return list;
	}
	
	public List<ReviewDto> getNewList() {
		List<ReviewDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ReviewDto dto = null;
		try {
			conn = new DBconn().getConn();
			String sql = "SELECT * FROM (SELECT T.*,rownum FROM (SELECT rnum,rname,to_char(rdate,'yyyy-mm-dd hh:mi') as rdate FROM review ORDER BY rnum DESC) T) WHERE rownum <=4";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new ReviewDto();
				dto.setRnum(rs.getInt("rnum"));
				dto.setRname(rs.getString("rname"));
				dto.setRdate(rs.getString("rdate"));

				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
		return list;
	}

	public List<ReviewDto> getListb(ReviewDto dto) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReviewDto> list = new ArrayList<>();
		
		try {
			conn = new DBconn().getConn();
			String sql = " SELECT * FROM (SELECT result1.*,ROWNUM AS ronum FROM(SELECT rnum,bnum,user_id,to_char(rdate,'MM/DD HH24:MI:SS')as rdate,rname,rimg,rcontent,rscore FROM review ORDER BY rnum DESC) result1) where bnum=? AND ronum BETWEEN ? AND ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getBnum());
			ps.setInt(2, dto.getStartRowNum());
			ps.setInt(3, dto.getEndRowNum());
			rs = ps.executeQuery();
			System.out.println("가져오기성공");
			while (rs.next()) {
				ReviewDto tmp = new ReviewDto();
				tmp.setRnum(rs.getInt("rnum"));
				tmp.setBnum(rs.getInt("bnum"));
				tmp.setUser_id(rs.getString("user_id"));
				tmp.setRdate(rs.getString("rdate"));
				tmp.setRname(rs.getString("rname"));
				tmp.setRimg(rs.getString("rimg"));
				tmp.setRcontent(rs.getString("rcontent"));
				tmp.setRscore(rs.getInt("rscore"));
				list.add(tmp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
		return list;
	}

	public int getCount(int bnum) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		try {

			conn = new DBconn().getConn();
			String sql = "SELECT NVL(MAX(ROWNUM),0)AS count FROM review where bnum=? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1,bnum);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
		return count;
	}

	public List<ReviewDto> getReviewList(String id) {
		List<ReviewDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ReviewDto dto = null;
		try {
			conn = new DBconn().getConn();
			String sql = "SELECT review.*,to_char(rdate, 'yy-mm-dd hh24:mi') as r_date FROM review where user_id=? order by rdate desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new ReviewDto();
				dto.setRnum(rs.getInt("rnum"));
				dto.setBnum(rs.getInt("bnum"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setRdate(rs.getString("r_date"));
				dto.setRname(rs.getString("rname"));
				dto.setRimg(rs.getString("rimg"));
				dto.setRcontent(rs.getString("rcontent"));
				dto.setRscore(rs.getInt("rscore"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
		return list;
	}

}