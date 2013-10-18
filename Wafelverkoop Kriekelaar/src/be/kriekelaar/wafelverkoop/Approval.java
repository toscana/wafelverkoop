package be.kriekelaar.wafelverkoop;

import java.util.Date;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Approval {
	@Id
	private Long id;
	private String klas;
	private Date date;
	private String naamOuder;
	
	public Approval(String klas, Date date,String naamOuder) {
		super();
		this.klas = klas;
		this.date = date;
		this.naamOuder = naamOuder;
	}
	public String getNaamOuder() {
		return naamOuder;
	}
	public void setNaamOuder(String naamOuder) {
		this.naamOuder = naamOuder;
	}
	public Approval() {
		super();
	}
	public String getKlas() {
		return klas;
	}
	public void setKlas(String klas) {
		this.klas = klas;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	

}
