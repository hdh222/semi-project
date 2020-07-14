package book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import book.dto.BookDto;
import util.DBconn;

public class BookDao {
	
	private static BookDao dao;
	
	private BookDao() {}
	
	public static BookDao getInstance() {
		if(dao==null) {
			dao=new BookDao();
		}
		return dao;
	}
	
	public BookDto getData() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		BookDto dto=null;
		
		try {
			conn = new DBconn().getConn();
			String sql = "SELECT * FROM book";
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();

			while(rs.next()) {
				dto=new BookDto();
				dto.setBnum(rs.getInt("bnum"));
				dto.setBname(rs.getString("bname"));
				dto.setBstory(rs.getString("bstory"));
				dto.setBdate(rs.getString("bdate"));
				dto.setBcompany(rs.getString("bcompany"));
				dto.setBsort(rs.getInt("bsort"));
				dto.setBimg(rs.getString("bimg"));
				System.out.println("불러오기성공");
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
		return dto;
	}
}
