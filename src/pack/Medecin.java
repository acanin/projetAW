package pack;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class Medecin {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)  
	int id;
	String nom;
	Specialite specialisation;
	
	@ManyToOne
	Centre owner;
	
	public Medecin(){}
	
	public Medecin(String n, Specialite s) {
		this.nom = n;
		this.specialisation = s;				
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
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
