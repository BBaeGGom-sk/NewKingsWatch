package kr.co.domain;

import java.io.Serializable;
import java.util.Arrays;

public class QnaVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int q_bno;
	private String g_id;
	private String q_title;
	private String q_content;
	private String u_id;
	private String q_regDate;
	private String q_updateDate;
	private int q_lock;
	private int q_topMost;
	private int q_viewCnt;
	private int q_replyCnt;
	private String[] files; 
	
	
	public QnaVO() {
		// TODO Auto-generated constructor stub
	}


	public QnaVO(int q_bno, String g_id, String q_title, String q_content, String u_id, String q_regDate,
			String q_updateDate, int q_lock, int q_topMost, int q_viewCnt, int q_replyCnt, String[] files) {
		super();
		this.q_bno = q_bno;
		this.g_id = g_id;
		this.q_title = q_title;
		this.q_content = q_content;
		this.u_id = u_id;
		this.q_regDate = q_regDate;
		this.q_updateDate = q_updateDate;
		this.q_lock = q_lock;
		this.q_topMost = q_topMost;
		this.q_viewCnt = q_viewCnt;
		this.q_replyCnt = q_replyCnt;
		this.files = files;
	}




	public int getQ_bno() {
		return q_bno;
	}


	public void setQ_bno(int q_bno) {
		this.q_bno = q_bno;
	}


	public String getG_id() {
		return g_id;
	}


	public void setG_id(String g_id) {
		this.g_id = g_id;
	}


	public String getQ_title() {
		return q_title;
	}


	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}


	public String getQ_content() {
		return q_content;
	}


	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}


	public String getU_id() {
		return u_id;
	}


	public void setU_id(String u_id) {
		this.u_id = u_id;
	}


	public String getQ_regDate() {
		return q_regDate;
	}


	public void setQ_regDate(String q_regDate) {
		this.q_regDate = q_regDate;
	}


	public String getQ_updateDate() {
		return q_updateDate;
	}


	public void setQ_updateDate(String q_updateDate) {
		this.q_updateDate = q_updateDate;
	}


	public int getQ_lock() {
		return q_lock;
	}


	public void setQ_lock(int q_lock) {
		this.q_lock = q_lock;
	}


	public int getQ_topMost() {
		return q_topMost;
	}


	public void setQ_topMost(int q_topMost) {
		this.q_topMost = q_topMost;
	}


	public int getQ_viewCnt() {
		return q_viewCnt;
	}


	public void setQ_viewCnt(int q_viewCnt) {
		this.q_viewCnt = q_viewCnt;
	}


	public int getQ_replyCnt() {
		return q_replyCnt;
	}


	public void setQ_replyCnt(int q_replyCnt) {
		this.q_replyCnt = q_replyCnt;
	}


	public String[] getFiles() {
		return files;
	}


	public void setFiles(String[] files) {
		this.files = files;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "QnaVO [q_bno=" + q_bno + ", g_id=" + g_id + ", q_title=" + q_title + ", q_content=" + q_content
				+ ", u_id=" + u_id + ", q_regDate=" + q_regDate + ", q_updateDate=" + q_updateDate + ", q_lock="
				+ q_lock + ", q_topMost=" + q_topMost + ", q_viewCnt=" + q_viewCnt + ", q_replyCnt=" + q_replyCnt
				+ ", files=" + Arrays.toString(files) + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Arrays.hashCode(files);
		result = prime * result + ((g_id == null) ? 0 : g_id.hashCode());
		result = prime * result + q_bno;
		result = prime * result + ((q_content == null) ? 0 : q_content.hashCode());
		result = prime * result + q_lock;
		result = prime * result + ((q_regDate == null) ? 0 : q_regDate.hashCode());
		result = prime * result + q_replyCnt;
		result = prime * result + ((q_title == null) ? 0 : q_title.hashCode());
		result = prime * result + q_topMost;
		result = prime * result + ((q_updateDate == null) ? 0 : q_updateDate.hashCode());
		result = prime * result + q_viewCnt;
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
		QnaVO other = (QnaVO) obj;
		if (!Arrays.equals(files, other.files))
			return false;
		if (g_id == null) {
			if (other.g_id != null)
				return false;
		} else if (!g_id.equals(other.g_id))
			return false;
		if (q_bno != other.q_bno)
			return false;
		if (q_content == null) {
			if (other.q_content != null)
				return false;
		} else if (!q_content.equals(other.q_content))
			return false;
		if (q_lock != other.q_lock)
			return false;
		if (q_regDate == null) {
			if (other.q_regDate != null)
				return false;
		} else if (!q_regDate.equals(other.q_regDate))
			return false;
		if (q_replyCnt != other.q_replyCnt)
			return false;
		if (q_title == null) {
			if (other.q_title != null)
				return false;
		} else if (!q_title.equals(other.q_title))
			return false;
		if (q_topMost != other.q_topMost)
			return false;
		if (q_updateDate == null) {
			if (other.q_updateDate != null)
				return false;
		} else if (!q_updateDate.equals(other.q_updateDate))
			return false;
		if (q_viewCnt != other.q_viewCnt)
			return false;
		if (u_id == null) {
			if (other.u_id != null)
				return false;
		} else if (!u_id.equals(other.u_id))
			return false;
		return true;
	}


	
	
	

}
