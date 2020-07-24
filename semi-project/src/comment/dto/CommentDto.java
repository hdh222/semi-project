package comment.dto;

public class CommentDto {
	private int cnum;
	private int rnum;
	private String user_id;
	private String cdate;
	private String ccontent;
	private int crecommend;
	
	public CommentDto(int cnum, int rnum, String user_id, String cdate, String ccontent, int crecommend) {
		this.cnum = cnum;
		this.rnum = rnum;
		this.user_id = user_id;
		this.cdate = cdate;
		this.ccontent = ccontent;
		this.crecommend = crecommend;
	}
	
	public CommentDto() {
		this(0, 0, null, null, null, 0);
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public int getCrecommend() {
		return crecommend;
	}

	public void setCrecommend(int crecommend) {
		this.crecommend = crecommend;
	}
}
