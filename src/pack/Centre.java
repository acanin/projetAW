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
	private int nb_succes;
	private int nb_essais;
	
	
	@OneToMany(mappedBy="owner",fetch=FetchType.EAGER)
	private Collection<Donneur> listedonneur;
	
	@OneToMany(mappedBy="owner",fetch=FetchType.EAGER)
	private Collection<Receveur> listereceveur;
	
	@OneToMany(mappedBy="owner",fetch=FetchType.EAGER)
	private Collection<Medecin> listemedecin;
	
	@OneToMany(mappedBy="owner",fetch=FetchType.EAGER)
	private Collection<RDV> listerdv;
	
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

	public int getNb_succes() {
		return nb_succes;
	}

	public void setNb_succes(int nb_succes) {
		this.nb_succes = nb_succes;
	}

	public int getNb_essais() {
		return nb_essais;
	}

	public void setNb_essais(int nb_essais) {
		this.nb_essais = nb_essais;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
}