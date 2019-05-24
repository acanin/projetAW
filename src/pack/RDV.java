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
	private int jour;
	private int mois;

	@ManyToOne
	Donneur donneur;
	
	@ManyToOne
	Medecin medecin;
	
	
	/** Pour avoir une relation bidirectionnelle 
	 * 1 centre avec plsr rdv
	 * */
	public RDV(){
		
	}
	
	public RDV(int heure, int jour, int mois) {
		this.heure = heure;
		this.jour = jour;
		this.mois = mois;
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


	public int getJour() {
		return jour;
	}


	public void setJour(int jour) {
		this.jour = jour;
	}


	public int getMois() {
		return mois;
	}


	public void setMois(int mois) {
		this.mois = mois;
	}


	/**public Receveur getReceveur() {
		return receveur;
	}


	public void setReceveur(Receveur receveur) {
		this.receveur = receveur;
	}*/


	public Donneur getDonneur() {
		return donneur;
	}


	public void setDonneur(Donneur donneur) {
		this.donneur = donneur;
	}


	public Medecin getMedecin() {
		return medecin;
	}


	public void setMedecin(Medecin medecin) {
		this.medecin = medecin;
	}
	
	
	
	
	
	
	
}
