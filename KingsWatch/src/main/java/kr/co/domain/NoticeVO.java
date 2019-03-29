package kr.co.domain;

import java.io.Serializable;

public class NoticeVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int n_bno;
	private String n_title;
	private String n_content;
	private String u_id;
	private String u_regDate;
	private String n_updateDate;
	private int n_topMost;
	
	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeVO(int n_bno, String n_title, String n_content, String u_id, String u_regDate, String n_updateDate,
			int n_topMost) {
		super();
		this.n_bno = n_bno;
		this.n_title = n_title;
		this.n_content = n_content;
		this.u_id = u_id;
		this.u_regDate = u_regDate;
		this.n_updateDate = n_updateDate;
		this.n_topMost = n_topMost;
	}

	public int getN_bno() {
		return n_bno;
	}

	public void setN_bno(int n_bno) {
		this.n_bno = n_bno;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_regDate() {
		return u_regDate;
	}

	public void setU_regDate(String u_regDate) {
		this.u_regDate = u_regDate;
	}

	public String getN_updateDate() {
		return n_updateDate;
	}

	public void setN_updateDate(String n_updateDate) {
		this.n_updateDate = n_updateDate;
	}

	public int getN_topMost() {
		return n_topMost;
	}

	public void setN_topMost(int n_topMost) {
		this.n_topMost = n_topMost;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "NoticeVO [n_bno=" + n_bno + ", n_title=" + n_title + ", n_content=" + n_content + ", u_id=" + u_id
				+ ", u_regDate=" + u_regDate + ", n_updateDate=" + n_updateDate + ", n_topMost=" + n_topMost + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + n_bno;
		result = prime * result + ((n_content == null) ? 0 : n_content.hashCode());
		result = prime * result + ((n_title == null) ? 0 : n_title.hashCode());
		result = prime * result + n_topMost;
		result = prime * result + ((n_updateDate == null) ? 0 : n_updateDate.hashCode());
		result = prime * result + ((u_id == null) ? 0 : u_id.hashCode());
		result = prime * result + ((u_regDate == null) ? 0 : u_regDate.hashCode());
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
		NoticeVO other = (NoticeVO) obj;
		if (n_bno != other.n_bno)
			return false;
		if (n_content == null) {
			if (other.n_content != null)
				return false;
		} else if (!n_content.equals(other.n_content))
			return false;
		if (n_title == null) {
			if (other.n_title != null)
				return false;
		} else if (!n_title.equals(other.n_title))
			return false;
		if (n_topMost != other.n_topMost)
			return false;
		if (n_updateDate == null) {
			if (other.n_updateDate != null)
				return false;
		} else if (!n_updateDate.equals(other.n_updateDate))
			return false;
		if (u_id == null) {
			if (other.u_id != null)
				return false;
		} else if (!u_id.equals(other.u_id))
			return false;
		if (u_regDate == null) {
			if (other.u_regDate != null)
				return false;
		} else if (!u_regDate.equals(other.u_regDate))
			return false;
		return true;
	}
	
	

}
