package pack;

import javax.persistence.*;

@Entity
public class Utilisateur {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int idProfilAssocie;
	private String mail;
	private String mdp;
	private boolean isReceveur;
	
	
	
	public Utilisateur() {
	}
	
	public Utilisateur(int idProfilAssocie, String mail, String mdp, boolean isReceveur) {
		this.idProfilAssocie = idProfilAssocie;
		this.mail = mail;
		this.mdp = mdp;
		this.isReceveur = isReceveur;
	}

	public int getIdProfilAssocie() {
		return idProfilAssocie;
	}

	public void setIdProfilAssocie(int idProfilAssocie) {
		this.idProfilAssocie = idProfilAssocie;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getMdp() {
		return mdp;
	}

	public void setMdp(String mdp) {
		this.mdp = mdp;
	}

	public boolean isReceveur() {
		return isReceveur;
	}

	public void setReceveur(boolean isReceveur) {
		this.isReceveur = isReceveur;
	}

}
