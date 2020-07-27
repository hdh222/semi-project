package book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import book.dto.BookDto;
import book.dto.BookMarkDto;
import util.DBconn;

public class BookDao {

	private static BookDao dao;

	private BookDao() {
	}

	public static BookDao getInstance() {
		if (dao == null) {
			dao = new BookDao();
		}
		return dao;
	}
	public List<BookDto> getMarkList(String id){
		List<BookDto> list = new ArrayList<BookDto>();
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null, list_rs = null;
		
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DBconn().getConn();
			//실행할 sql 문 준비하기
			String sql = "select bnum from book_mark where user_id=?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, id);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				int bnum = rs.getInt("bnum");
				String list_sql = "select bname, bimg from book where bnum=?";
				pstmt = conn.prepareStatement(list_sql);
				pstmt.setInt(1, bnum);
				
				list_rs = pstmt.executeQuery();
				while(list_rs.next()) {
					BookDto tmp = new BookDto();
					tmp.setBnum(bnum);
					tmp.setBimg(list_rs.getString("bimg"));
					tmp.setBname(list_rs.getString("bname"));
					
					list.add(tmp);
				}
				
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
	public boolean selectMark(BookMarkDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isSuccess = false;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DBconn().getConn();
			//실행할 sql 문 준비하기
			String sql = "select * from book_mark where user_id=? and bnum=?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, dto.getUser_id());
			pstmt.setInt(2, dto.getBnum());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				isSuccess = true;
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
		return isSuccess;
	}
	
	public boolean delete(BookMarkDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DBconn().getConn();
			//실행할 sql 문 준비하기 
			String sql = "delete from book_mark where user_id=? and bnum=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getUser_id());
			pstmt.setInt(2, dto.getBnum());
			//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	public String insert(BookMarkDto dto) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = 0;
		try {
			conn = new DBconn().getConn();
			//실행할 sql 문 준비하기 
			String sql = "select count(*) as count from book_mark where user_id=?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, dto.getUser_id());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				count = rs.getInt("count");
			}
			if(count < 5) {
				String insert_sql = "insert into book_mark values(?, ?)";
				pstmt = conn.prepareStatement(insert_sql);
				//? 에 바인딩 할 값이 있으면 바인딩한다.
				pstmt.setString(1, dto.getUser_id());
				pstmt.setInt(2, dto.getBnum());
				//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
				flag = pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return "북마크 추가 성공";
		} else {
			return "북마크 카운터 초과로 추가 실패";
		}
	}

	public List<BookDto> getSearchList(BookDto dto) {

		List<BookDto> list = new ArrayList<BookDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DBconn().getConn();

			String sql = "select * from (select result1.*, rownum as rnumber"
					+ " from (select book.* ,to_char(bdate, 'yyyy-mm-dd') as b_date from book where bname like '%' || ? || '%'"
					+ " order by bnum asc) result1)" + " where rnumber between ? and ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBname());
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookDto tmp = new BookDto();
				tmp.setBnum(rs.getInt("bnum"));
				tmp.setBname(rs.getString("bname"));
				tmp.setBstory(rs.getString("bstory"));
				tmp.setBsort(rs.getInt("bsort"));
				tmp.setBcompany(rs.getString("bcompany"));
				tmp.setBimg(rs.getString("bimg"));
				tmp.setBdate(rs.getString("b_date"));
				tmp.setBauthor(rs.getString("author"));

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

	public int getSearchCount(String str) {
		int count = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DBconn().getConn();
			String sql = "SELECT NVL(MAX(ROWNUM), 0) AS rnumber" + " FROM book where bname like '%' || ? || '%'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("rnumber");
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

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DBconn().getConn();
			String sql = "SELECT NVL(MAX(ROWNUM), 0) AS rnumber" + " FROM book where bsort=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sort);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("rnumber");
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

	public List<BookDto> getList(BookDto dto) {

		List<BookDto> list = new ArrayList<BookDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DBconn().getConn();

			String sql = "select * from (select result1.*, rownum as rnumber"
					+ " from (select book.* ,to_char(bdate, 'yyyy-mm-dd') as b_date from book where bsort=?"
					+ " order by bnum asc) result1)" + " where rnumber between ? and ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBsort());
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookDto tmp = new BookDto();
				tmp.setBnum(rs.getInt("bnum"));
				tmp.setBname(rs.getString("bname"));
				tmp.setBstory(rs.getString("bstory"));
				tmp.setBsort(rs.getInt("bsort"));
				tmp.setBcompany(rs.getString("bcompany"));
				tmp.setBimg(rs.getString("bimg"));
				tmp.setBdate(rs.getString("b_date"));
				tmp.setBauthor(rs.getString("author"));

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
		ResultSet rs = null;
		BookDto dto = null;

		try {
			conn = new DBconn().getConn();
			String sql = "SELECT bnum,bname,bstory,to_char(bdate,'yyyy-mm-dd')as bdate,bcompany,bsort,bimg,author from book where bnum=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, number);
			rs = ps.executeQuery();

			while (rs.next()) {
				dto = new BookDto();
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

	public ArrayList<BookDto> getRecommantedList(int sortNum) { // index 멀티 슬라이드 용 (랜덤)
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<BookDto> dto = new ArrayList<BookDto>();

		try {

			int rnd = new Random().nextInt(4) + 1;
			int startNum = 1 + (rnd - 1) * 5;
			int endNum = rnd * 5;
			int count = getCount(sortNum);
			if (endNum > count) {
				endNum = count;
				startNum = count - 5;
			}

			conn = new DBconn().getConn();
			String sql = "SELECT * FROM (SELECT t.*,ROWNUM AS rnum "
					+ "FROM (SELECT bnum,bname,bimg FROM book WHERE bsort=? ORDER BY bnum ASC) t) "
					+ "WHERE rnum BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sortNum);
			ps.setInt(2, startNum);
			ps.setInt(3, endNum);
			rs = ps.executeQuery();

			while (rs.next()) {
				BookDto tmp = new BookDto();
				tmp.setBnum(rs.getInt("bnum"));
				tmp.setBname(rs.getString("bname"));
				tmp.setBimg(rs.getString("bimg"));

				dto.add(tmp);
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

	public ArrayList<BookDto> getNewList() { // 최신 책 5권
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<BookDto> dto = new ArrayList<BookDto>();

		try {
			conn = new DBconn().getConn();
			String sql = "SELECT * FROM (SELECT t.*,ROWNUM as rnum "
					+ "FROM (SELECT bnum,bname,bsort,to_char(bdate,'yyyy\"년 \"mm\"월 \"dd\"일 \"') as bdate,SUBSTR(book.bstory,1,60) as bstory,bimg "
					+ "FROM book ORDER BY bdate DESC) t)" + "WHERE rnum<=5";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				BookDto tmp = new BookDto();
				tmp.setBnum(rs.getInt("bnum"));
				tmp.setBname(rs.getString("bname"));
				tmp.setBstory(rs.getString("bstory"));
				tmp.setBdate(rs.getString("bdate"));
				tmp.setBsort(rs.getInt("bsort"));
				tmp.setBimg(rs.getString("bimg"));

				dto.add(tmp);
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
}
