package kr.co.domain;

import java.io.Serializable;

public class BasketVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String u_id;
	private String b_cart;
	private String b_wishList;
	private String b_cartedTime;
	
	//dddddd
	public BasketVO() {
		// TODO Auto-generated constructor stub
	}

	public BasketVO(String u_id, String b_cart, String b_wishList, String b_cartedTime) {
		super();
		this.u_id = u_id;
		this.b_cart = b_cart;
		this.b_wishList = b_wishList;
		this.b_cartedTime = b_cartedTime;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getB_cart() {
		return b_cart;
	}

	public void setB_cart(String b_cart) {
		this.b_cart = b_cart;
	}

	public String getB_wishList() {
		return b_wishList;
	}

	public void setB_wishList(String b_wishList) {
		this.b_wishList = b_wishList;
	}

	public String getB_cartedTime() {
		return b_cartedTime;
	}

	public void setB_cartedTime(String b_cartedTime) {
		this.b_cartedTime = b_cartedTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BasketVO [u_id=" + u_id + ", b_cart=" + b_cart + ", b_wishList=" + b_wishList + ", b_cartedTime="
				+ b_cartedTime + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((b_cart == null) ? 0 : b_cart.hashCode());
		result = prime * result + ((b_cartedTime == null) ? 0 : b_cartedTime.hashCode());
		result = prime * result + ((b_wishList == null) ? 0 : b_wishList.hashCode());
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
		BasketVO other = (BasketVO) obj;
		if (b_cart == null) {
			if (other.b_cart != null)
				return false;
		} else if (!b_cart.equals(other.b_cart))
			return false;
		if (b_cartedTime == null) {
			if (other.b_cartedTime != null)
				return false;
		} else if (!b_cartedTime.equals(other.b_cartedTime))
			return false;
		if (b_wishList == null) {
			if (other.b_wishList != null)
				return false;
		} else if (!b_wishList.equals(other.b_wishList))
			return false;
		if (u_id == null) {
			if (other.u_id != null)
				return false;
		} else if (!u_id.equals(other.u_id))
			return false;
		return true;
	}
	
	
}
