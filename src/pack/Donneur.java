package pack;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Donneur {

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String nom;
	private String prenom;
	private int age;
	private int taille;
	private int poids;
	private boolean sexe; // 1 pour les femmes et 0 pour les mecs
	private boolean disponibilite;
	// ajouter enumeration
	
	
	
	/** Pour avoir une relation bidirectionnelle 
	 * 1 centre avec plsr donneur
	 * */
	@ManyToOne
	Centre owner; 
	
	public Donneur(String n, String p, int a, int t, int po, boolean s, boolean dispo){
		this.nom = n;
		this.prenom = p;
		this.age = a;
		this.taille = t;
		this.poids = po;
		this.sexe = s; 
		this.disponibilite = dispo;
		// ajouter enumeration
		
	}
	
	public Donneur(){
		
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

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getTaille() {
		return taille;
	}

	public void setTaille(int taille) {
		this.taille = taille;
	}

	public int getPoids() {
		return poids;
	}

	public void setPoids(int poids) {
		this.poids = poids;
	}

	public boolean isSexe() {
		return sexe;
	}

	public void setSexe(boolean sexe) {
		this.sexe = sexe;
	}

	public boolean isDisponibilite() {
		return disponibilite;
	}

	public void setDisponibilite(boolean disponibilite) {
		this.disponibilite = disponibilite;
	}

	public Centre getOwner() {
		return owner;
	}

	public void setOwner(Centre owner) {
		this.owner = owner;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
