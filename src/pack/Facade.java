package pack;
import java.util.Collection;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import javax.persistence.TypedQuery;

import enumerations.*;

@Singleton
@LocalBean
public class Facade {

	@PersistenceContext
	private EntityManager em;

	public Facade(){
		
	}
	
	public ProfilUtilisateur checkAuthentification(String mail, String mdp) {
		if (mail.equals(Admin.IDENT_ADMIN) && mdp.equals(Admin.MDP_ADMIN)) {
			return new Admin();
		} else {
			Utilisateur u = null;
			try {
				TypedQuery<Utilisateur> req = em.createQuery("SELECT u FROM Utilisateur u WHERE u.mail = :mailValue AND u.mdp = :mdpValue", Utilisateur.class);
				req.setParameter("mailValue", mail);
				req.setParameter("mdpValue", mdp);
				u = req.getSingleResult();
			} catch (PersistenceException e) {
				// Cet utilisateur n'existe pas
				return null;
			}
			
			
			int idProfil = u.getIdProfilAssocie();
			
			try {
				// On regarde si c'est un Donneur
				TypedQuery<Donneur> reqD = em.createQuery("SELECT d FROM Donneur d WHERE d.id = "+idProfil, Donneur.class);
				Donneur d = reqD.getSingleResult();
				return d;
			} catch (PersistenceException notDonneur) {
				try {
					// Cet utilisateur n'est pas un donneur, c'est peut etre un receveur
					TypedQuery<Receveur> reqR = em.createQuery("SELECT r FROM Receveur r WHERE r.id = "+idProfil, Receveur.class);
					Receveur r = reqR.getSingleResult();
					
					return r;
				} catch (PersistenceException notReceveur) {
					return null; // ni donneur, ni receveur
				}
			}
		}
	}
	
	public void ajoutDonneur(String nom, String prenom,  int age, int taille, int poids, String sexe, boolean dispo,Yeux y,Cheveux c,Peau peau, Loisirs l, AntecedentsMedicaux am, String mail, String mdp){
		Donneur d = new Donneur(nom, prenom, age,taille, poids, sexe.equals("Femme"), dispo, y, c, peau, l, am);
		em.persist(d);
		
		int idProfil = d.getId();
		Utilisateur u = new Utilisateur(idProfil, mail, mdp);
		em.persist(u);
	}

	public void ajoutReceveur(String n, String p, int a, String s, String mail, String mdp){
		Receveur r = new Receveur(n, p, a, s.equals("Femme"));
		em.persist(r);
		
		int idProfil = r.getId();
		Utilisateur u = new Utilisateur(idProfil, mail, mdp);
		em.persist(u);
	}
	
	public void ajoutCentre(String nom, String adresse, String ville) {
		em.persist(new Centre(nom, adresse, ville));
	}
	
	public void ajoutMedecin(String nom, Specialite spe, int idcentre, String sexe) {
		
		Centre c = em.find(Centre.class, idcentre);
		Medecin m = new Medecin(nom,spe,sexe.equals("Femme"));
		em.persist(m);
		m.setOwner(c);
	}

	
	
	
	public String sqlYeux(String y){
		if (y == null){
			return"";
		}else {
			int num = Yeux.toInteger(y);
			return "YEUX = " + Integer.toString(num) + " AND ";
		}
	}
		
	public String sqlCheveux(String c){
		if (c == null){
			return"";
		}else {
			int num = Cheveux.toInteger(c);
			return "CHEVEUX = " + Integer.toString(num) + " AND ";
		}
	}
	
	public String sqlPeau(String p){
		if (p == null){
			return"";
		}else {
			int num = Cheveux.toInteger(p);
			return "PEAU = " + Integer.toString(num) + " AND ";
		}
	}
	

	
	public Collection<Donneur> rechercher(String sexe,String yeux, String cheveux,String peau){
		String Y = sqlYeux(yeux);
		String C = sqlCheveux(cheveux);
		String P = sqlPeau(peau);
		if (sexe.equals("Femme")){
			TypedQuery<Donneur> req = em.createQuery("SELECT d FROM Donneur d WHERE SEXE = TRUE AND " + Y + C + P  + " SIGNALE = FALSE", Donneur.class);
			//TypedQuery<Donneur> req = em.createQuery("SELECT d FROM Donneur d WHERE SEXE = TRUE AND" + Y + C + P  + " SIGNALE = FALSE AND ATTENTE = FALSE", Donneur.class);
			return req.getResultList();
		}else{
			TypedQuery<Donneur> req = em.createQuery("SELECT d FROM Donneur d WHERE SEXE = FALSE AND " + Y + C + P  + " SIGNALE = FALSE", Donneur.class);
			//TypedQuery<Donneur> req = em.createQuery("SELECT d FROM Donneur d WHERE SEXE = FALSE AND" + Y + C + P  + " SIGNALE = FALSE AND ATTENTE = FALSE", Donneur.class);
			return req.getResultList();
		}
		
	}
	
	
	/**public Collection<Donneur> rechercher(String yeux, String cheveux,String peau,String am,String loisir){
		TypedQuery<Donneur> req = em.createQuery("SELECT d FROM Donneur d WHERE YEUX = " + Yeux.toInteger(yeux) + "AND CHEVEUX = " + Cheveux.toInteger(cheveux) + "AND PEAU = " + Peau.toInteger(peau)  + "AND ANTECEDENTS = " + AntecedentsMedicaux.toInteger(am)  + "AND LOISIRS = " + Loisirs.toInteger(loisir) + " AND SIGNALE = FALSE", Donneur.class);
		return req.getResultList();
	}*/

	public Collection<Donneur> listerDonneurs(){
		TypedQuery<Donneur> req = em.createQuery("select p from Donneur p", Donneur.class);
		return req.getResultList();
	}
	
	public Donneur recupererDonneur(int idDonneur) {
		Donneur d = em.find(Donneur.class,idDonneur);
		return d;
	}
	
	public Collection<Receveur> listerReceveurs(){
		TypedQuery<Receveur> req = em.createQuery("select a from Receveur a", Receveur.class);
		return req.getResultList();
	}
	
	public Collection<Centre> listerCentres(){
		TypedQuery<Centre> req = em.createQuery("select c from Centre c", Centre.class);
		return req.getResultList();
	}
	

	public Collection<Medecin> listerMedecins() {
		TypedQuery<Medecin> req = em.createQuery("select m from Medecin m", Medecin.class);
		return req.getResultList();
	}


	public void modifierStatu(String choix, String attente, int id) {
		Donneur d = em.find(Donneur.class, id);
		if (attente.equals("oui")) {
			if (choix.equals("Oui")) {
				d.setAttente(false);
			} else {
				em.remove(d);
			}
		} else {
			if (choix.equals("Non")) {
				d.setSignale(false);
			} else {
				em.remove(d);
			}
		}
	}
	
	public void signalerDonneur(int id){
		Donneur d = em.find(Donneur.class, id);
		if(d.isSignale() == false){
			d.setSignale(true);
		}
	}
	
	
	
	/** Methodes pour les centres 
	 */
	public Centre recupererCentre(int idCentre) {
		Centre c = em.find(Centre.class, idCentre);
		return c;
	}
	
	public Collection<Medecin> listerMedecinsCentre(int idCentre) {
		TypedQuery<Medecin> req = em.createQuery("select m from Medecin m where OWNER_ID = " + idCentre, Medecin.class);
		return req.getResultList();
	}
	
	
	public Collection<Donneur> donneursAttentes() {
		TypedQuery<Donneur> req = em.createQuery("select d from Donneur d where attente = true", Donneur.class);
		return req.getResultList();
	}

	public Collection<Donneur> donneursSignales() {
		TypedQuery<Donneur> req = em.createQuery("select d from Donneur d where signale = true", Donneur.class);
		return req.getResultList();
	}
	
	public Medecin recupererMedecin(int idMed) {
		Medecin m = em.find(Medecin.class,idMed);
		return m;
	}

	/** 	public Collection<Donneur> rechercherYeux(String yeux){
		TypedQuery<Donneur> req = em.createQuery("SELECT d FROM Donneur d WHERE YEUX = " + Yeux.toInteger(yeux) , Donneur.class);
		return req.getResultList();
	}
	
	public Collection<Donneur> rechercherCheveux(String cheveux){
		TypedQuery<Donneur> req = em.createQuery("SELECT d FROM Donneur d WHERE CHEVEUX = " + Cheveux.toInteger(cheveux) , Donneur.class);
		return req.getResultList();
	}
	
	public Collection<Donneur> rechercherPeau(String peau){
		TypedQuery<Donneur> req = em.createQuery("SELECT d FROM Donneur d WHERE PEAU = " + Peau.toInteger(peau) , Donneur.class);
		return req.getResultList();
	}
	
	public Collection<Donneur> rechercherAM(String am){
		TypedQuery<Donneur> req = em.createQuery("SELECT d FROM Donneur d WHERE ANTECEDENTS = " + AntecedentsMedicaux.toInteger(am) , Donneur.class);
		return req.getResultList();
	}
	
	public Collection<Donneur> rechercherLoisir(String loisir){
		TypedQuery<Donneur> req = em.createQuery("SELECT d FROM Donneur d WHERE LOISIRS = " + Loisirs.toInteger(loisir)  , Donneur.class);
		return req.getResultList();
	*/
}
