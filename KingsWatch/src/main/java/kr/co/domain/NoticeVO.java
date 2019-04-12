package kr.co.domain;

import java.util.Arrays;

public class NoticeVO{

	private int n_bno;
	private String n_title;
	private String n_content;
	private String u_id;
	private String n_regDate;
	private String n_updateDate;
	private int n_topMost;
	private int n_viewCnt;
	
	private String[] files; 
	//db에 컬럼은 없어도 files 배열 추가
	
public NoticeVO() {
	// TODO Auto-generated constructor stub
}

public NoticeVO(int n_bno, String n_title, String n_content, String u_id, String n_regDate, String n_updateDate,
		int n_topMost, int n_viewCnt, String[] files) {
	super();
	this.n_bno = n_bno;
	this.n_title = n_title;
	this.n_content = n_content;
	this.u_id = u_id;
	this.n_regDate = n_regDate;
	this.n_updateDate = n_updateDate;
	this.n_topMost = n_topMost;
	this.n_viewCnt = n_viewCnt;
	this.files = files;
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

public String getN_regDate() {
	return n_regDate;
}

public void setN_regDate(String n_regDate) {
	this.n_regDate = n_regDate;
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

public int getN_viewCnt() {
	return n_viewCnt;
}

public void setN_viewCnt(int n_viewCnt) {
	this.n_viewCnt = n_viewCnt;
}

public String[] getFiles() {
	return files;
}

public void setFiles(String[] files) {
	this.files = files;
}

@Override
public String toString() {
	return "NoticeVO [n_bno=" + n_bno + ", n_title=" + n_title + ", n_content=" + n_content + ", u_id=" + u_id
			+ ", n_regDate=" + n_regDate + ", n_updateDate=" + n_updateDate + ", n_topMost=" + n_topMost
			+ ", n_viewCnt=" + n_viewCnt + ", files=" + Arrays.toString(files) + "]";
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + Arrays.hashCode(files);
	result = prime * result + n_bno;
	result = prime * result + ((n_content == null) ? 0 : n_content.hashCode());
	result = prime * result + ((n_regDate == null) ? 0 : n_regDate.hashCode());
	result = prime * result + ((n_title == null) ? 0 : n_title.hashCode());
	result = prime * result + n_topMost;
	result = prime * result + ((n_updateDate == null) ? 0 : n_updateDate.hashCode());
	result = prime * result + n_viewCnt;
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
	NoticeVO other = (NoticeVO) obj;
	if (!Arrays.equals(files, other.files))
		return false;
	if (n_bno != other.n_bno)
		return false;
	if (n_content == null) {
		if (other.n_content != null)
			return false;
	} else if (!n_content.equals(other.n_content))
		return false;
	if (n_regDate == null) {
		if (other.n_regDate != null)
			return false;
	} else if (!n_regDate.equals(other.n_regDate))
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
	if (n_viewCnt != other.n_viewCnt)
		return false;
	if (u_id == null) {
		if (other.u_id != null)
			return false;
	} else if (!u_id.equals(other.u_id))
		return false;
	return true;
}



	
	
	

}
