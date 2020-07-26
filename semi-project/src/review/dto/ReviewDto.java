package review.dto;

public class ReviewDto {
	private int rnum;
	private int bnum;
	private String user_id;
	private String rdate;
	private String rname;
	private String rimg;
	private String rcontent;
	private int rscore;
	private int startRowNum;
	private int endRowNum;

	public ReviewDto() {
	}

	public ReviewDto(int rnum, int bnum, String user_id, String rdate, String rname, String rimg, String rcontent,
			int rscore, int startRowNum, int endRowNum) {
		super();
		this.rnum = rnum;
		this.bnum = bnum;
		this.user_id = user_id;
		this.rdate = rdate;
		this.rname = rname;
		this.rimg = rimg;
		this.rcontent = rcontent;
		this.rscore = rscore;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRimg() {
		return rimg;
	}

	public void setRimg(String rimg) {
		this.rimg = rimg;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public int getRscore() {
		return rscore;
	}

	public void setRscore(int rscore) {
		this.rscore = rscore;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

}
