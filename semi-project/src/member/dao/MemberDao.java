package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.dto.MemberDto;
import util.DBconn;

public class MemberDao {
	private static MemberDao dao;
	
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		if(dao == null) {
			dao=new MemberDao();
		}
		
		return dao;
	}
	
	public MemberDto getData(String id) {
		MemberDto dto=new MemberDto();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		try {
			String sql="SELECT * FROM member WHERE user_id=?";
			
			conn=new DBconn().getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				dto.setUser_id(rset.getString("user_id"));
				dto.setUser_pwd(rset.getString("user_pwd"));
				dto.setUser_name(rset.getString("user_name"));
				dto.setUser_sex(rset.getInt("user_sex"));
				dto.setUser_phone(rset.getString("user_phone"));
				dto.setUser_addr(rset.getString("user_addr"));
			}
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(rset != null) {
					rset.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	public boolean insert(MemberDto dto) {
		int result=-1;
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			String sql="INSERT INTO member VALUES (?,?,?,?,?,?)";
			
			conn=new DBconn().getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_pwd());
			pstmt.setString(3, dto.getUser_name());
			pstmt.setInt(4, dto.getUser_sex());
			pstmt.setString(5, dto.getUser_phone());
			pstmt.setString(6, dto.getUser_addr());
			result=pstmt.executeUpdate();
			
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(result == -1) {
			return false;
		} else {
			return true;
		}
		
	}
	
	public boolean update(MemberDto dto) {
		int result=-1;
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			String sql="UPDATE member SET user_name=?,user_phone=?,user_addr=? WHERE user_id=?";
			
			conn=new DBconn().getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_name());
			pstmt.setString(2, dto.getUser_phone());
			pstmt.setString(3, dto.getUser_addr());
			pstmt.setString(4, dto.getUser_id());
			
			result=pstmt.executeUpdate();
			
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(result == -1) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean delete(String id) {
		int result=-1;
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			String sql="DELETE FROM member Where user_id=?";
			
			conn=new DBconn().getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result=pstmt.executeUpdate();
			
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(result == -1) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean isMember(String id) {
		boolean result=false;
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		try {
			String sql="SELECT * FROM member WHERE user_id=?";
			
			conn=new DBconn().getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				result=true;
			}
			
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(rset != null) {
					rset.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public String login(String id,String pwd) {
		String name=null;
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		try {
			String sql="SELECT user_name FROM member WHERE user_id=? AND user_pwd=?";
			
			conn=new DBconn().getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				name=rset.getString("user_name");
			}
			
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(rset != null) {
					rset.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return name;
	}
	
	public boolean changePwd(String id,String pwd) {
		int result=-1;
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			String sql="UPDATE member SET user_pwd=? where user_id=?";
			
			conn=new DBconn().getConn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
			
			result=pstmt.executeUpdate();
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(result == -1) {
			return false;
		} else {
			return true;
		}
	}
}
