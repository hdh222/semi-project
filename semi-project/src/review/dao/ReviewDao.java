package review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import review.dto.ReviewDto;
import util.DBconn;

public class ReviewDao {
	private static ReviewDao dao;
	
	private ReviewDao() {};
	
	public static ReviewDao getInstance() {
		if(dao==null) {
			dao=new ReviewDao();
		}
		return dao;
	}
	public Boolean insert(ReviewDto dto) {
		Connection conn=null;
		PreparedStatement ps=null;
		int flag=0;
		try {
			conn=new DBconn().getConn();
			String sql="INSERT INTO review (rnum,bnum,user_id,rdate,rname,rimg,rcontent,rscore)"
					+ "	values(review_seq.nextval,?,?,SYSDATE,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1,dto.getBnum());
			ps.setString(2, dto.getUser_id());
			ps.setString(3, dto.getRname());
			ps.setString(4, dto.getRimg());
			ps.setString(5, dto.getRcontent());
			ps.setInt(6, dto.getRscore());
			flag=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	public Boolean delete(int num){
		Connection conn=null;
		PreparedStatement ps=null;
		int flag=0;
		try {
			conn=new DBconn().getConn();
			String sql="DELETE FROM review WHERE rnum=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,num);
	
			flag=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
		
	}
	public Boolean update(ReviewDto dto){
		Connection conn=null;
		PreparedStatement ps=null;
		int flag=0;
		try {
			conn=new DBconn().getConn();
			String sql="UPDATE review SET rname=? and rimg=? rcontent=? and rscore=?"
					+ "	WHERE rnum=? ";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getRname());
			ps.setString(2, dto.getRimg());
			ps.setString(3, dto.getRcontent());
			ps.setInt(4, dto.getRscore());
			ps.setInt(5, dto.getRnum());
			flag=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	public ReviewDto getdata(int num) {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ReviewDto dto=null;
		try {
			conn=new DBconn().getConn();
			String sql="SELECT * FROM review WHERE rnum=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			if(rs.next()) {
				dto=new ReviewDto();
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
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
		return dto;
	}
	/*
	 * 페이지네이션 리스트 
	public List<ReviewDto> getList(){
		List<ReviewDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ReviewDto dto=null;
		try {
			conn=new DBconn().getConn();
			String sql="SELECT * FROM review WHERE rnum=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			if(rs.next()) {
				dto=new ReviewDto();
				dto.setRnum(rs.getInt(""));
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
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
		return list;
	}
	*/
}
