package kr.co.domain;

import java.io.Serializable;

public class OrderVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int o_num;
	private String u_id;
	private String o_orderDate;
	private String g_id;
	private int o_quantity;
	
	public OrderVO() {
		// TODO Auto-generated constructor stub
	}

	public OrderVO(int o_num, String u_id, String o_orderDate, String g_id, int o_quantity) {
		super();
		this.o_num = o_num;
		this.u_id = u_id;
		this.o_orderDate = o_orderDate;
		this.g_id = g_id;
		this.o_quantity = o_quantity;
	}

	public int getO_num() {
		return o_num;
	}

	public void setO_num(int o_num) {
		this.o_num = o_num;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getO_orderDate() {
		return o_orderDate;
	}

	public void setO_orderDate(String o_orderDate) {
		this.o_orderDate = o_orderDate;
	}

	public String getG_id() {
		return g_id;
	}

	public void setG_id(String g_id) {
		this.g_id = g_id;
	}

	public int getO_quantity() {
		return o_quantity;
	}

	public void setO_quantity(int o_quantity) {
		this.o_quantity = o_quantity;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "OrderVO [o_num=" + o_num + ", u_id=" + u_id + ", o_orderDate=" + o_orderDate + ", g_id=" + g_id
				+ ", o_quantity=" + o_quantity + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((g_id == null) ? 0 : g_id.hashCode());
		result = prime * result + o_num;
		result = prime * result + ((o_orderDate == null) ? 0 : o_orderDate.hashCode());
		result = prime * result + o_quantity;
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
		OrderVO other = (OrderVO) obj;
		if (g_id == null) {
			if (other.g_id != null)
				return false;
		} else if (!g_id.equals(other.g_id))
			return false;
		if (o_num != other.o_num)
			return false;
		if (o_orderDate == null) {
			if (other.o_orderDate != null)
				return false;
		} else if (!o_orderDate.equals(other.o_orderDate))
			return false;
		if (o_quantity != other.o_quantity)
			return false;
		if (u_id == null) {
			if (other.u_id != null)
				return false;
		} else if (!u_id.equals(other.u_id))
			return false;
		return true;
	}
	
	
}
