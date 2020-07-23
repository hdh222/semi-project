package book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	//검색 페이지네이션 getList
		public List<BookDto> getSearchList(BookDto dto){
				
			List<BookDto> list = new ArrayList<BookDto>();
			//필요한 객체의 참조값을 담을 지역변수 만들기 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				//Connection 객체의 참조값 얻어오기 
				conn = new DBconn().getConn();
				
				String sql = "select * from (select result1.*, rownum as rnumber" + 
						" from (select book.* ,to_char(bdate, 'yyyy-mm-dd') as b_date from book where bname like '%' || ? || '%'"
						+ " order by bnum asc) result1)" + 
						" where rnumber between ? and ?";
				pstmt = conn.prepareStatement(sql);
				//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
				pstmt.setString(1, dto.getBname());
				pstmt.setInt(2, dto.getStartRowNum());
				pstmt.setInt(3, dto.getEndRowNum());
				//select 문 수행하고 결과 받아오기 
				rs = pstmt.executeQuery();
				//반복문 돌면서 결과 값 추출하기 
				while (rs.next()) {
					BookDto tmp=new BookDto();
					tmp.setBnum(rs.getInt("bnum"));
					tmp.setBname(rs.getString("bname"));
					tmp.setBstory(rs.getString("bstory"));
					tmp.setBsort(rs.getInt("bsort"));
					tmp.setBcompany(rs.getString("bcompany"));
					tmp.setBimg(rs.getString("bimg"));
					tmp.setBdate(rs.getString("b_date"));
					tmp.setBauthor(rs.getString("author"));
					//ArrayList 객체에 누적 시킨다.
				
					list.add(tmp);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			
			return list;
		}
		
		//검색 페이지네이션
		public int getSearchCount(String str) {
			int count = 0;
			
			//필요한 객체의 참조값을 담을 지역변수 만들기 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				//Connection 객체의 참조값 얻어오기 
				conn = new DBconn().getConn();
				//실행할 sql 문 준비하기
				String sql = "SELECT NVL(MAX(ROWNUM), 0) AS rnumber" + 
						" FROM book where bname like '%' || ? || '%'";
				pstmt = conn.prepareStatement(sql);
				//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
				pstmt.setString(1, str);
				//select 문 수행하고 결과 받아오기 
				rs = pstmt.executeQuery();
				//반복문 돌면서 결과 값 추출하기 
				if (rs.next()) {
					count=rs.getInt("rnumber");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			return count;
		}
	public int getCount(int sort) {
		int count = 0;
		
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DBconn().getConn();
			//실행할 sql 문 준비하기
			String sql = "SELECT NVL(MAX(ROWNUM), 0) AS rnumber" + 
					" FROM book where bsort=?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setInt(1, sort);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				count=rs.getInt("rnumber");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return count;
	}
	public List<BookDto> getList(BookDto dto){
		
		List<BookDto> list = new ArrayList<BookDto>();
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DBconn().getConn();
			
			String sql = "select * from (select result1.*, rownum as rnumber" + 
					" from (select book.* ,to_char(bdate, 'yyyy-mm-dd') as b_date from book where bsort=?"
					+ " order by bnum asc) result1)" + 
					" where rnumber between ? and ?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setInt(1, dto.getBsort());
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				BookDto tmp=new BookDto();
				tmp.setBnum(rs.getInt("bnum"));
				tmp.setBname(rs.getString("bname"));
				tmp.setBstory(rs.getString("bstory"));
				tmp.setBsort(rs.getInt("bsort"));
				tmp.setBcompany(rs.getString("bcompany"));
				tmp.setBimg(rs.getString("bimg"));
				tmp.setBdate(rs.getString("b_date"));
				tmp.setBauthor(rs.getString("author"));
				//ArrayList 객체에 누적 시킨다.
			
				list.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		
		return list;
	}
	public BookDto getData(int number) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		BookDto dto=null;
		
		try {
			conn = new DBconn().getConn();
			String sql = "SELECT bnum,bname,bstory,to_char(bdate,'yyyy-mm-dd')as bdate,bcompany,bsort,bimg,author from book where bnum=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, number);
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
				dto.setBauthor(rs.getString("author"));
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
