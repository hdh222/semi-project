package book.dto;

public class BookMarkDto {
	private String user_id;
	private int bnum;
	
	public BookMarkDto() {}

	public BookMarkDto(String user_id, int bnum) {
		super();
		this.user_id = user_id;
		this.bnum = bnum;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	
	
}
