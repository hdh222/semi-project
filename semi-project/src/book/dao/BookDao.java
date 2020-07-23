package book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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
	//寃��깋 �럹�씠吏��꽕�씠�뀡 getList
		public List<BookDto> getSearchList(BookDto dto){
				
			List<BookDto> list = new ArrayList<BookDto>();
			//�븘�슂�븳 媛앹껜�쓽 李몄“媛믪쓣 �떞�쓣 吏��뿭蹂��닔 留뚮뱾湲� 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				//Connection 媛앹껜�쓽 李몄“媛� �뼸�뼱�삤湲� 
				conn = new DBconn().getConn();
				
				String sql = "select * from (select result1.*, rownum as rnumber" + 
						" from (select book.* ,to_char(bdate, 'yyyy-mm-dd') as b_date from book where bname like '%' || ? || '%'"
						+ " order by bnum asc) result1)" + 
						" where rnumber between ? and ?";
				pstmt = conn.prepareStatement(sql);
				//sql 臾몄뿉 ? �뿉 諛붿씤�뵫�븷 媛믪씠 �엳�쑝硫� 諛붿씤�뵫�븯怨� 
				pstmt.setString(1, dto.getBname());
				pstmt.setInt(2, dto.getStartRowNum());
				pstmt.setInt(3, dto.getEndRowNum());
				//select 臾� �닔�뻾�븯怨� 寃곌낵 諛쏆븘�삤湲� 
				rs = pstmt.executeQuery();
				//諛섎났臾� �룎硫댁꽌 寃곌낵 媛� 異붿텧�븯湲� 
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
					//ArrayList 媛앹껜�뿉 �늻�쟻 �떆�궓�떎.
				
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
		
		//寃��깋 �럹�씠吏��꽕�씠�뀡
		public int getSearchCount(String str) {
			int count = 0;
			
			//�븘�슂�븳 媛앹껜�쓽 李몄“媛믪쓣 �떞�쓣 吏��뿭蹂��닔 留뚮뱾湲� 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				//Connection 媛앹껜�쓽 李몄“媛� �뼸�뼱�삤湲� 
				conn = new DBconn().getConn();
				//�떎�뻾�븷 sql 臾� 以�鍮꾪븯湲�
				String sql = "SELECT NVL(MAX(ROWNUM), 0) AS rnumber" + 
						" FROM book where bname like '%' || ? || '%'";
				pstmt = conn.prepareStatement(sql);
				//sql 臾몄뿉 ? �뿉 諛붿씤�뵫�븷 媛믪씠 �엳�쑝硫� 諛붿씤�뵫�븯怨� 
				pstmt.setString(1, str);
				//select 臾� �닔�뻾�븯怨� 寃곌낵 諛쏆븘�삤湲� 
				rs = pstmt.executeQuery();
				//諛섎났臾� �룎硫댁꽌 寃곌낵 媛� 異붿텧�븯湲� 
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
		
		//�븘�슂�븳 媛앹껜�쓽 李몄“媛믪쓣 �떞�쓣 吏��뿭蹂��닔 留뚮뱾湲� 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 媛앹껜�쓽 李몄“媛� �뼸�뼱�삤湲� 
			conn = new DBconn().getConn();
			//�떎�뻾�븷 sql 臾� 以�鍮꾪븯湲�
			String sql = "SELECT NVL(MAX(ROWNUM), 0) AS rnumber" + 
					" FROM book where bsort=?";
			pstmt = conn.prepareStatement(sql);
			//sql 臾몄뿉 ? �뿉 諛붿씤�뵫�븷 媛믪씠 �엳�쑝硫� 諛붿씤�뵫�븯怨� 
			pstmt.setInt(1, sort);
			//select 臾� �닔�뻾�븯怨� 寃곌낵 諛쏆븘�삤湲� 
			rs = pstmt.executeQuery();
			//諛섎났臾� �룎硫댁꽌 寃곌낵 媛� 異붿텧�븯湲� 
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
		//�븘�슂�븳 媛앹껜�쓽 李몄“媛믪쓣 �떞�쓣 吏��뿭蹂��닔 留뚮뱾湲� 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 媛앹껜�쓽 李몄“媛� �뼸�뼱�삤湲� 
			conn = new DBconn().getConn();
			
			String sql = "select * from (select result1.*, rownum as rnumber" + 
					" from (select book.* ,to_char(bdate, 'yyyy-mm-dd') as b_date from book where bsort=?"
					+ " order by bnum asc) result1)" + 
					" where rnumber between ? and ?";
			pstmt = conn.prepareStatement(sql);
			//sql 臾몄뿉 ? �뿉 諛붿씤�뵫�븷 媛믪씠 �엳�쑝硫� 諛붿씤�뵫�븯怨� 
			pstmt.setInt(1, dto.getBsort());
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			//select 臾� �닔�뻾�븯怨� 寃곌낵 諛쏆븘�삤湲� 
			rs = pstmt.executeQuery();
			//諛섎났臾� �룎硫댁꽌 寃곌낵 媛� 異붿텧�븯湲� 
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
				//ArrayList 媛앹껜�뿉 �늻�쟻 �떆�궓�떎.
			
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
		ResultSet rs=null;
		ArrayList<BookDto> dto=new ArrayList<BookDto>();
		
		try {
			
			int rnd=new Random().nextInt(4)+1;
			int startNum=1+(rnd-1)*5;
			int endNum=rnd*5;
			int count=getCount(sortNum);
			if(endNum >count) {
				endNum=count;
				startNum=count-5;
			}
			
			conn = new DBconn().getConn();
			String sql = "SELECT * FROM (SELECT t.*,ROWNUM AS rnum "
					+ "FROM (SELECT bnum,bname,bimg FROM book WHERE bsort=? ORDER BY bnum ASC) t) "
					+ "WHERE rnum BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sortNum);
			ps.setInt(2, startNum);
			ps.setInt(3, endNum);
			rs=ps.executeQuery();

			while(rs.next()) {
				BookDto tmp=new BookDto();
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
	
	public ArrayList<BookDto> getNewList() {  // 최신 책 5권 
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		ArrayList<BookDto> dto=new ArrayList<BookDto>();
		
		try {
			conn = new DBconn().getConn();
			String sql = "SELECT * FROM (SELECT t.*,ROWNUM as rnum "
					+ "FROM (SELECT bnum,bname,bsort,to_char(bdate,'yyyy\"년 \"mm\"월 \"dd\"일 \"') as bdate,SUBSTR(book.bstory,1,60) as bstory,bimg "
					+ "FROM book ORDER BY bdate DESC) t)"
					+ "WHERE rnum<=5";
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();

			while(rs.next()) {
				BookDto tmp=new BookDto();
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
