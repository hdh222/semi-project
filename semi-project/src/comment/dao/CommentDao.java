package comment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import comment.dto.CommentDto;
import util.DBconn;

public class CommentDao {
	private static CommentDao dao;
	
	private CommentDao() {}
	
	public static CommentDao getInstance() {
		if(dao == null) {
			dao=new CommentDao();
		}
		
		return dao;
	}
	
	public ArrayList<CommentDto> getList(String id) {
		ArrayList<CommentDto> dto=new ArrayList<CommentDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			String sql="select * from "
					+ "(select cnum, rnum, user_id, crecommend,to_char(cdate, 'yy-mm-dd hh24:mi') as c_date,"
					+ " SUBSTR(review_comment.ccontent,1,10) as ccontent from review_comment where user_id=?) "
					+ "order by cnum desc";
			conn = new DBconn().getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				CommentDto tmp=new CommentDto();
				tmp.setCnum(rset.getInt("cnum"));
				tmp.setUser_id(id);
				tmp.setRnum(rset.getInt("rnum"));
				tmp.setCdate(rset.getString("c_date"));
				tmp.setCcontent(rset.getString("ccontent"));
				tmp.setCrecommend(rset.getInt("crecommend"));
				
				dto.add(tmp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rset != null) {
					rset.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	
	public ArrayList<CommentDto> getList(int rnum,int page) {
		ArrayList<CommentDto> dto=new ArrayList<CommentDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			String sql="SELECT * FROM (SELECT result1.*,ROWNUM AS ronum FROM (SELECT cnum,user_id,to_char(cdate,'mm-dd hh:mi')as cdate,ccontent,crecommend FROM review_comment WHERE rnum=? ORDER BY cnum DESC) result1) WHERE ronum BETWEEN ? AND ?";
			conn = new DBconn().getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rnum);
			pstmt.setInt(2, 1+(page-1)*5);
			pstmt.setInt(3, page*5);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				CommentDto tmp=new CommentDto();
				tmp.setCnum(rset.getInt("cnum"));
				tmp.setUser_id(rset.getString("user_id"));
				tmp.setCdate(rset.getString("cdate"));
				tmp.setCcontent(rset.getString("ccontent"));
				tmp.setCrecommend(rset.getInt("crecommend"));
				
				dto.add(tmp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rset != null) {
					rset.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	
	public int getCount(int rnum) {
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			String sql = "SELECT count(*) FROM review_comment WHERE rnum=?";

			conn = new DBconn().getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rnum);

			rset = pstmt.executeQuery();

			if (rset.next()) {	
				count=rset.getInt("count(*)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rset != null) {
					rset.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return count;
	}
	
	public boolean insert(CommentDto dto) {
		int result=-1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			String sql = "INSERT INTO review_comment VALUES (comment_seq.NEXTVAL,?,?,SYSDATE,?,0)";

			conn = new DBconn().getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getRnum());
			pstmt.setString(2, dto.getUser_id());
			pstmt.setString(3, dto.getCcontent());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (result == -1) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean delete(int cnum) {
		int result=-1;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			String sql = "DELETE FROM review_comment Where cnum=?";

			conn = new DBconn().getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cnum);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (result == -1) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean addRecommend(int cnum) {
		int result=-1;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			String sql = "UPDATE member SET crecommen=crecommend+1 WHERE cnum=?";

			conn = new DBconn().getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cnum);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (result == -1) {
			return false;
		} else {
			return true;
		}
	}
}
