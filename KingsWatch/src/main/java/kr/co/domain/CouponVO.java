package kr.co.domain;

import java.io.Serializable;

public class CouponVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String cp_id;
	private String cp_name;
	private int cp_value;
	private String u_id;
	private int cp_valid;
	private String co_createDate;
	private String co_exp;
	
	public CouponVO() {
		// TODO Auto-generated constructor stub
	}

	public CouponVO(String cp_id, String cp_name, int cp_value, String u_id, int cp_valid, String co_createDate,
			String co_exp) {
		super();
		this.cp_id = cp_id;
		this.cp_name = cp_name;
		this.cp_value = cp_value;
		this.u_id = u_id;
		this.cp_valid = cp_valid;
		this.co_createDate = co_createDate;
		this.co_exp = co_exp;
	}

	public String getCp_id() {
		return cp_id;
	}

	public void setCp_id(String cp_id) {
		this.cp_id = cp_id;
	}

	public String getCp_name() {
		return cp_name;
	}

	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}

	public int getCp_value() {
		return cp_value;
	}

	public void setCp_value(int cp_value) {
		this.cp_value = cp_value;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getCp_valid() {
		return cp_valid;
	}

	public void setCp_valid(int cp_valid) {
		this.cp_valid = cp_valid;
	}

	public String getCo_createDate() {
		return co_createDate;
	}

	public void setCo_createDate(String co_createDate) {
		this.co_createDate = co_createDate;
	}

	public String getCo_exp() {
		return co_exp;
	}

	public void setCo_exp(String co_exp) {
		this.co_exp = co_exp;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CouponVO [cp_id=" + cp_id + ", cp_name=" + cp_name + ", cp_value=" + cp_value + ", u_id=" + u_id
				+ ", cp_valid=" + cp_valid + ", co_createDate=" + co_createDate + ", co_exp=" + co_exp + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((co_createDate == null) ? 0 : co_createDate.hashCode());
		result = prime * result + ((co_exp == null) ? 0 : co_exp.hashCode());
		result = prime * result + ((cp_id == null) ? 0 : cp_id.hashCode());
		result = prime * result + ((cp_name == null) ? 0 : cp_name.hashCode());
		result = prime * result + cp_valid;
		result = prime * result + cp_value;
		result = prime * result + ((u_id == null) ? 0 : u_id.hashCode());
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
		CouponVO other = (CouponVO) obj;
		if (co_createDate == null) {
			if (other.co_createDate != null)
				return false;
		} else if (!co_createDate.equals(other.co_createDate))
			return false;
		if (co_exp == null) {
			if (other.co_exp != null)
				return false;
		} else if (!co_exp.equals(other.co_exp))
			return false;
		if (cp_id == null) {
			if (other.cp_id != null)
				return false;
		} else if (!cp_id.equals(other.cp_id))
			return false;
		if (cp_name == null) {
			if (other.cp_name != null)
				return false;
		} else if (!cp_name.equals(other.cp_name))
			return false;
		if (cp_valid != other.cp_valid)
			return false;
		if (cp_value != other.cp_value)
			return false;
		if (u_id == null) {
			if (other.u_id != null)
				return false;
		} else if (!u_id.equals(other.u_id))
			return false;
		return true;
	}
	
	

}
