package book.dto;

public class BookDto {
	private int bnum;
	private String bname;
	private String bstory;
	private String bdate;
	private String bcompany;
	private int bsort;
	private String bimg;
	private String bauthor;
	
	//페이징 처리를 하기 위한 필드 
	private int startRowNum;
	private int endRowNum;
	public BookDto () {}
	public BookDto(int bnum, String bname, String bstory, String bdate, String bcompany, int bsort, String bimg,
			String bauthor, int startRowNum, int endRowNum) {
		super();
		this.bnum = bnum;
		this.bname = bname;
		this.bstory = bstory;
		this.bdate = bdate;
		this.bcompany = bcompany;
		this.bsort = bsort;
		this.bimg = bimg;
		this.bauthor = bauthor;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBstory() {
		return bstory;
	}
	public void setBstory(String bstory) {
		this.bstory = bstory;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getBcompany() {
		return bcompany;
	}
	public void setBcompany(String bcompany) {
		this.bcompany = bcompany;
	}
	public int getBsort() {
		return bsort;
	}
	public void setBsort(int bsort) {
		this.bsort = bsort;
	}
	public String getBimg() {
		return bimg;
	}
	public void setBimg(String bimg) {
		this.bimg = bimg;
	}
	public String getBauthor() {
		return bauthor;
	}
	public void setBauthor(String bauthor) {
		this.bauthor = bauthor;
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