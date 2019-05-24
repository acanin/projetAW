package pack;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Centre {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String nom;
	private String adresse;
	private String ville;



	@OneToMany(mappedBy="owner",fetch=FetchType.EAGER)
	private Collection<Donneur> listedonneur;
	
	/**@OneToMany(mappedBy="owner",fetch=FetchType.EAGER)
	private Collection<Receveur> listereceveur;*/
	
	@OneToMany(mappedBy="owner",fetch=FetchType.EAGER)
	private Collection<Medecin> listemedecin;
	

	/**@OneToMany(mappedBy="owner",fetch=FetchType.EAGER)
	private Collection<RDV> listerdv;*/

	
	//@OneToOne(mappedBy="owner",fetch=FetchType.EAGER)
	//private Admin ad;
	
	public Centre(String n,String a, String v){
		this.nom = n;
		this.adresse = a;
		this.ville = v;
	}

	public Centre(){
	}
	
	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Collection<Donneur> getListedonneur() {
		return listedonneur;
	}

	public void setListedonneur(Collection<Donneur> listedonneur) {
		this.listedonneur = listedonneur;
	}


	public Collection<Medecin> getListemedecin() {
		return listemedecin;
	}

	public void setListemedecin(Collection<Medecin> listemedecin) {
		this.listemedecin = listemedecin;
	}

	
}