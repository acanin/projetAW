package pack;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class RDV {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int heure;
	//private Date date;
	
	@ManyToOne
	Centre owner;
	
	@ManyToOne
	Receveur receveur;
	
	@ManyToOne
	Donneur donneur;
	
	
	/** Pour avoir une relation bidirectionnelle 
	 * 1 centre avec plsr rdv
	 * */
	public RDV(){
		
	}
	
	public Centre getOwner() {
		return owner;
	}

	public void setOwner(Centre owner) {
		this.owner = owner;
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

	/**public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
