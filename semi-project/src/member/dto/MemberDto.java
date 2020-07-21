package member.dto;

public class MemberDto {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private int user_sex;
	private String user_phone;
	private String user_addr;
	
	public MemberDto(String user_id, String user_pwd, String user_name, int user_sex, String user_phone,
			String user_addr) {
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_sex = user_sex;
		this.user_phone = user_phone;
		this.user_addr = user_addr;
	}
	
	public MemberDto() {
		this(null,null,null,0,null,null);
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(int user_sex) {
		this.user_sex = user_sex;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
}
