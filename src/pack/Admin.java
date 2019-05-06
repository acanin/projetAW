package pack;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Admin {

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	/**private Collection<Donneur> donneur_en_attente;
	private Collection<Donneur> donneurs_signales;
	private Collection<Receveur> receveurs_signales;*/
	
	
	
	/** Pour avoir une relation bidirectionnelle 
	 * 1 centre avec 1 admin
	 * */
	@OneToOne
	Centre owner;
	
	public Admin(){ 

		
	}
	
	
	
}
