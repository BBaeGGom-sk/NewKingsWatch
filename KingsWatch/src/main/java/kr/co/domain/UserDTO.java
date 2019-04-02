package kr.co.domain;

import java.io.Serializable;

public class UserDTO implements Serializable {

	/**
	 * vo와 dto차이 잘 모르겠음
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_phone;
	private int u_sex;
	private int u_age;
	private String u_postNum;
	private String u_adMain;
	private String u_adSub;
	private String u_adDetail;
	private String u_email;
	private String regDate;
	private int u_point;
	private int u_level;

	public UserDTO() {
		// TODO Auto-generated constructor stub
	}

	public UserDTO(String u_id, String u_pw, String u_name, String u_phone, int u_sex, int u_age, String u_postNum,
			String u_adMain, String u_adSub, String u_adDetail, String u_email, String regDate, int u_point,
			int u_level) {
		super();
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_phone = u_phone;
		this.u_sex = u_sex;
		this.u_age = u_age;
		this.u_postNum = u_postNum;
		this.u_adMain = u_adMain;
		this.u_adSub = u_adSub;
		this.u_adDetail = u_adDetail;
		this.u_email = u_email;
		this.regDate = regDate;
		this.u_point = u_point;
		this.u_level = u_level;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public int getU_sex() {
		return u_sex;
	}

	public void setU_sex(int u_sex) {
		this.u_sex = u_sex;
	}

	public int getU_age() {
		return u_age;
	}

	public void setU_age(int u_age) {
		this.u_age = u_age;
	}

	public String getU_postNum() {
		return u_postNum;
	}

	public void setU_postNum(String u_postNum) {
		this.u_postNum = u_postNum;
	}

	public String getU_adMain() {
		return u_adMain;
	}

	public void setU_adMain(String u_adMain) {
		this.u_adMain = u_adMain;
	}

	public String getU_adSub() {
		return u_adSub;
	}

	public void setU_adSub(String u_adSub) {
		this.u_adSub = u_adSub;
	}

	public String getU_adDetail() {
		return u_adDetail;
	}

	public void setU_adDetail(String u_adDetail) {
		this.u_adDetail = u_adDetail;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getU_point() {
		return u_point;
	}

	public void setU_point(int u_point) {
		this.u_point = u_point;
	}

	public int getU_level() {
		return u_level;
	}

	public void setU_level(int u_level) {
		this.u_level = u_level;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "UserDTO [u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_phone=" + u_phone + ", u_sex="
				+ u_sex + ", u_age=" + u_age + ", u_postNum=" + u_postNum + ", u_adMain=" + u_adMain + ", u_adSub="
				+ u_adSub + ", u_adDetail=" + u_adDetail + ", u_email=" + u_email + ", regDate=" + regDate
				+ ", u_point=" + u_point + ", u_level=" + u_level + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((u_id == null) ? 0 : u_id.hashCode());
		result = prime * result + ((u_pw == null) ? 0 : u_pw.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserDTO other = (UserDTO) obj;
		if (u_id == null) {
			if (other.u_id != null)
				return false;
		} else if (!u_id.equals(other.u_id))
			return false;
		if (u_pw == null) {
			if (other.u_pw != null)
				return false;
		} else if (!u_pw.equals(other.u_pw))
			return false;
		return true;
	}
	
	
}
