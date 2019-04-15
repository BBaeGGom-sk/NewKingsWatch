package kr.co.domain;

import java.io.Serializable;

public class ReviewVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int r_bno;
	private String g_id;
	private String r_title;
	private String r_content;
	private String u_id;
	private String r_regDate;
	private String r_updateDate;
	private int r_rating;
	


	public ReviewVO() {
		// TODO Auto-generated constructor stub
	}



	public ReviewVO(int r_bno, String g_id, String r_title, String r_content, String u_id, String r_regDate,
			String r_updateDate, int r_rating) {
		super();
		this.r_bno = r_bno;
		this.g_id = g_id;
		this.r_title = r_title;
		this.r_content = r_content;
		this.u_id = u_id;
		this.r_regDate = r_regDate;
		this.r_updateDate = r_updateDate;
		this.r_rating = r_rating;
	}



	public int getR_bno() {
		return r_bno;
	}



	public void setR_bno(int r_bno) {
		this.r_bno = r_bno;
	}



	public String getG_id() {
		return g_id;
	}



	public void setG_id(String g_id) {
		this.g_id = g_id;
	}



	public String getR_title() {
		return r_title;
	}



	public void setR_title(String r_title) {
		this.r_title = r_title;
	}



	public String getR_content() {
		return r_content;
	}



	public void setR_content(String r_content) {
		this.r_content = r_content;
	}



	public String getU_id() {
		return u_id;
	}



	public void setU_id(String u_id) {
		this.u_id = u_id;
	}



	public String getR_regDate() {
		return r_regDate;
	}



	public void setR_regDate(String r_regDate) {
		this.r_regDate = r_regDate;
	}



	public String getR_updateDate() {
		return r_updateDate;
	}



	public void setR_updateDate(String r_updateDate) {
		this.r_updateDate = r_updateDate;
	}



	public int getR_rating() {
		return r_rating;
	}



	public void setR_rating(int r_rating) {
		this.r_rating = r_rating;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "ReviewVO [r_bno=" + r_bno + ", g_id=" + g_id + ", r_title=" + r_title + ", r_content=" + r_content
				+ ", u_id=" + u_id + ", r_regDate=" + r_regDate + ", r_updateDate=" + r_updateDate + ", r_rating="
				+ r_rating + "]";
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((g_id == null) ? 0 : g_id.hashCode());
		result = prime * result + r_bno;
		result = prime * result + ((r_content == null) ? 0 : r_content.hashCode());
		result = prime * result + r_rating;
		result = prime * result + ((r_regDate == null) ? 0 : r_regDate.hashCode());
		result = prime * result + ((r_title == null) ? 0 : r_title.hashCode());
		result = prime * result + ((r_updateDate == null) ? 0 : r_updateDate.hashCode());
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
		ReviewVO other = (ReviewVO) obj;
		if (g_id == null) {
			if (other.g_id != null)
				return false;
		} else if (!g_id.equals(other.g_id))
			return false;
		if (r_bno != other.r_bno)
			return false;
		if (r_content == null) {
			if (other.r_content != null)
				return false;
		} else if (!r_content.equals(other.r_content))
			return false;
		if (r_rating != other.r_rating)
			return false;
		if (r_regDate == null) {
			if (other.r_regDate != null)
				return false;
		} else if (!r_regDate.equals(other.r_regDate))
			return false;
		if (r_title == null) {
			if (other.r_title != null)
				return false;
		} else if (!r_title.equals(other.r_title))
			return false;
		if (r_updateDate == null) {
			if (other.r_updateDate != null)
				return false;
		} else if (!r_updateDate.equals(other.r_updateDate))
			return false;
		if (u_id == null) {
			if (other.u_id != null)
				return false;
		} else if (!u_id.equals(other.u_id))
			return false;
		return true;
	}
	
	
	
	
	

}
