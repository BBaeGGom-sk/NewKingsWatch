package kr.co.domain;

import java.io.Serializable;

public class Q_ReplyVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private int q_rno;
private int q_bno;
private String qr_Text;
private String replyer;
private String qr_regdate;
private String qr_updateDate;



public Q_ReplyVO() {
	// TODO Auto-generated constructor stub
}



public Q_ReplyVO(int q_rno, int q_bno, String qr_Text, String replyer, String qr_regdate, String qr_updateDate) {
	super();
	this.q_rno = q_rno;
	this.q_bno = q_bno;
	this.qr_Text = qr_Text;
	this.replyer = replyer;
	this.qr_regdate = qr_regdate;
	this.qr_updateDate = qr_updateDate;
}



public int getQ_rno() {
	return q_rno;
}



public void setQ_rno(int q_rno) {
	this.q_rno = q_rno;
}



public int getQ_bno() {
	return q_bno;
}



public void setQ_bno(int q_bno) {
	this.q_bno = q_bno;
}



public String getQr_Text() {
	return qr_Text;
}



public void setQr_Text(String qr_Text) {
	this.qr_Text = qr_Text;
}



public String getReplyer() {
	return replyer;
}



public void setReplyer(String replyer) {
	this.replyer = replyer;
}



public String getQr_regdate() {
	return qr_regdate;
}



public void setQr_regdate(String qr_regdate) {
	this.qr_regdate = qr_regdate;
}



public String getQr_updateDate() {
	return qr_updateDate;
}



public void setQr_updateDate(String qr_updateDate) {
	this.qr_updateDate = qr_updateDate;
}



public static long getSerialversionuid() {
	return serialVersionUID;
}



@Override
public String toString() {
	return "Q_ReplyVO [q_rno=" + q_rno + ", q_bno=" + q_bno + ", qr_Text=" + qr_Text + ", replyer=" + replyer
			+ ", qr_regdate=" + qr_regdate + ", qr_updateDate=" + qr_updateDate + "]";
}



@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + q_bno;
	result = prime * result + q_rno;
	result = prime * result + ((qr_Text == null) ? 0 : qr_Text.hashCode());
	result = prime * result + ((qr_regdate == null) ? 0 : qr_regdate.hashCode());
	result = prime * result + ((qr_updateDate == null) ? 0 : qr_updateDate.hashCode());
	result = prime * result + ((replyer == null) ? 0 : replyer.hashCode());
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
	Q_ReplyVO other = (Q_ReplyVO) obj;
	if (q_bno != other.q_bno)
		return false;
	if (q_rno != other.q_rno)
		return false;
	if (qr_Text == null) {
		if (other.qr_Text != null)
			return false;
	} else if (!qr_Text.equals(other.qr_Text))
		return false;
	if (qr_regdate == null) {
		if (other.qr_regdate != null)
			return false;
	} else if (!qr_regdate.equals(other.qr_regdate))
		return false;
	if (qr_updateDate == null) {
		if (other.qr_updateDate != null)
			return false;
	} else if (!qr_updateDate.equals(other.qr_updateDate))
		return false;
	if (replyer == null) {
		if (other.replyer != null)
			return false;
	} else if (!replyer.equals(other.replyer))
		return false;
	return true;
}





	
}
