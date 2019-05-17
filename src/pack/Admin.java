package pack;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

public class Admin implements ProfilUtilisateur {

	public static final String IDENT_ADMIN = "admin";
	public static final String MDP_ADMIN = "admin";
	

	public Admin(){ 
	}

	@Override
	public String getNom() {
		// TODO Auto-generated method stub
		return "noname";
	}

	@Override
	public String getPrenom() {
		// TODO Auto-generated method stub
		return "noname";
	}
	
	
	
}
