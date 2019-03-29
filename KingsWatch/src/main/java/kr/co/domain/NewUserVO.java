package kr.co.domain;

import java.io.Serializable;

public class NewUserVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_phone;
	private String u_address;
	private String u_email;
	private int u_point;
	private int u_level;
	
	public NewUserVO() {
		// TODO Auto-generated constructor stub
	}

	public NewUserVO(String u_id, String u_pw, String u_name, String u_phone, String u_address, String u_email,
			int u_point, int u_level) {
		super();
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_phone = u_phone;
		this.u_address = u_address;
		this.u_email = u_email;
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

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
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
		return "NewUserVO [u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_phone=" + u_phone
				+ ", u_address=" + u_address + ", u_email=" + u_email + ", u_point=" + u_point + ", u_level=" + u_level
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
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
		NewUserVO other = (NewUserVO) obj;
		if (u_pw == null) {
			if (other.u_pw != null)
				return false;
		} else if (!u_pw.equals(other.u_pw))
			return false;
		return true;
	}
	
	
	
	

}
