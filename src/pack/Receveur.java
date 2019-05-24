package pack;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Receveur implements ProfilUtilisateur {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String nom;
	private String prenom;
	private int age;
	private boolean sexe; // 1 pour les femmes et 0 pour les mecs

	
	@OneToMany(mappedBy = "receveur", fetch = FetchType.EAGER)
	Collection<Notification> notifs;

	
	/** Pour avoir une relation bidirectionnelle 
	 * 1 centre avec plsr receveur
	 * */
	//@ManyToOne
	//Centre owner; 
	
	//@OneToMany(mappedBy="receveur", fetch = FetchType.EAGER)
	//RDV rdv;
	
	public Receveur(){		
	}
	
	
	public Receveur(String n, String p, int a, boolean s){
		this.nom = n;
		this.prenom = p;
		this.age = a;
		this.sexe = s;
	
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


	public boolean isSexe() {
		return sexe;
	}


	public void setSexe(boolean sexe) {
		this.sexe = sexe;
	}



	public Collection<Notification> getNotifs() {
		return notifs;
	}


	public void setNotifs(Collection<Notification> notifs) {
		this.notifs = notifs;
	}

	
	
}
