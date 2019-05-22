package pack;


import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import enumerations.Specialite;


@Entity
public class Medecin {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)  
	int id;
	String nom;
	Specialite specialisation;
	boolean sexe; // 1 pour les femmes et 0 pour les mecs
	
	
	@ManyToOne
	Centre owner;
	
	@OneToMany(mappedBy="medecin", fetch = FetchType.EAGER)
	RDV rdv;
	
	public Medecin(){}
	
	public Medecin(String n, Specialite s, boolean sexe) {
		this.nom = n;
		this.specialisation = s;	
		this.sexe = sexe;
	}

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}
	
	

	public RDV getRdv() {
		return rdv;
	}

	public void setRdv(RDV rdv) {
		this.rdv = rdv;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public boolean isSexe() {
		return sexe;
	}

	public void setSexe(boolean sexe) {
		this.sexe = sexe;
	}

	public Specialite getSpecialisation() {
		return specialisation;
	}

	public void setSpecialisation(Specialite specialisation) {
		this.specialisation = specialisation;
	}

	public Centre getOwner() {
		return owner;
	}

	public void setOwner(Centre owner) {
		this.owner = owner;
	}
	
}
