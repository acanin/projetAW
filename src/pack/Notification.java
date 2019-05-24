package pack;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import enumerations.Statu;

@Entity
public class Notification {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	String text = "Aucun message supplémentaire";
	
	Statu statu = Statu.ATTENTE;
	
	@ManyToOne
	Donneur donneur;
	
	@ManyToOne
	Receveur receveur;
	
	public Notification(){}
	
	public Notification(String t) {
		this.text = t;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Donneur getDonneur() {
		return donneur;
	}

	public void setDonneur(Donneur donneur) {
		this.donneur = donneur;
	}

	public Receveur getReceveur() {
		return receveur;
	}

	public void setReceveur(Receveur receveur) {
		this.receveur = receveur;
	}

	public Statu getStatu() {
		return statu;
	}

	public void setStatu(Statu statu) {
		this.statu = statu;
	}
	
	

}
