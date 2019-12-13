package demo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Contact {
	@Id
	@GeneratedValue
	private int cid;
	
	private String cname;
	
	@Column(name="contactNo")
	private String  cno;
	
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	@Override
	public String toString() {
		return "Contact [cid=" + cid + ", cname=" + cname + ", cno=" + cno + "]";
	}
	
	

}
