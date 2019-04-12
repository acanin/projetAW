package pack;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RDV {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int heure;
	private Date date;
	
	public RDV(){
		
	}
	
	public RDV(int h, Date d){
		this.heure = h;
		this.date = d;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getHeure() {
		return heure;
	}

	public void setHeure(int heure) {
		this.heure = heure;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
