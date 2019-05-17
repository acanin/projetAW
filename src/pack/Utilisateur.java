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
	
	
	
	public Utilisateur() {
	}
	
	public Utilisateur(int idProfilAssocie, String mail, String mdp) {
		this.idProfilAssocie = idProfilAssocie;
		this.mail = mail;
		this.mdp = mdp;
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

}
