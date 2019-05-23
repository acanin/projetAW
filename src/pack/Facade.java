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
			if (!u.isReceveur()) {
				try {
					// On regarde si c'est un Donneur
					TypedQuery<Donneur> reqD = em.createQuery("SELECT d FROM Donneur d WHERE d.id = "+idProfil, Donneur.class);
					Donneur d = reqD.getSingleResult();
					return d;
				} catch (PersistenceException notDonneur) {
					return null;
				}
			} else {
				try {
					// Cet utilisateur n'est pas un donneur, c'est peut etre un receveur
					TypedQuery<Receveur> reqR = em.createQuery("SELECT r FROM Receveur r WHERE r.id = "+idProfil, Receveur.class);
					Receveur r = reqR.getSingleResult();
					
					return r;
				} catch (PersistenceException notReceveur) {
					return null;
				}
			}
		}
	}
	
	public int ajoutDonneur(String nom, String prenom,  int age, int taille, int poids, String sexe, boolean dispo,Yeux y,Cheveux c,Peau peau, Loisirs l, AntecedentsMedicaux am, String mail, String mdp){
		Donneur d = new Donneur(nom, prenom, age,taille, poids, sexe.equals("Femme"), dispo, y, c, peau, l, am);
		em.persist(d);
		
		int idProfil = d.getId();
		Utilisateur u = new Utilisateur(idProfil, mail, mdp, false);
		em.persist(u);
		
		return idProfil;
	}

	public int ajoutReceveur(String n, String p, int a, String s, String mail, String mdp){
		Receveur r = new Receveur(n, p, a, s.equals("Femme"));
		em.persist(r);
		
		int idProfil = r.getId();
		Utilisateur u = new Utilisateur(idProfil, mail, mdp, true);
		em.persist(u);
		
		return idProfil;
	}
	
	public void modifierReceveur(String mailInit, String mdpInit, String nom, String prenom, int age, String sexe, String mail, String mdp, int nbSucces, int nbEchecs) {
		TypedQuery<Receveur> reqR = em.createQuery("SELECT r FROM Receveur r WHERE r.nom = :nom AND r.prenom = :prenom", Receveur.class);
		reqR.setParameter("nom", nom);
		reqR.setParameter("prenom", prenom);
		Receveur r = reqR.getSingleResult();
		
		TypedQuery<Utilisateur> req = em.createQuery("SELECT u FROM Utilisateur u WHERE u.mail = :mailValue AND u.mdp = :mdpValue", Utilisateur.class);
		req.setParameter("mailValue", mailInit);
		req.setParameter("mdpValue", mdpInit);
		Utilisateur u = req.getSingleResult();
		
		if (age>0) {
			r.setAge(age);
		}
		if (sexe != null) {
			r.setSexe(sexe.equals("Femme"));
		}
		
		r.setNbSucces(nbSucces);
		r.setNbEchecs(nbEchecs);
		
		if (mail != null) {
			u.setMail(mail);
		}
		if (mdp != null) {
			u.setMdp(mdp);
		}
	}
	
	public void modifierDonneur(String mailInit, String mdpInit, String nom, String prenom,  int age, int taille, int poids, String sexe, boolean dispo,Cheveux c, Loisirs l, AntecedentsMedicaux am, String mail, String mdp) {
		TypedQuery<Donneur> reqD = em.createQuery("SELECT d FROM Donneur d WHERE d.nom = :nom AND d.prenom = :prenom", Donneur.class);
		reqD.setParameter("nom", nom);
		reqD.setParameter("prenom", prenom);
		Donneur d = reqD.getSingleResult();
		
		TypedQuery<Utilisateur> req = em.createQuery("SELECT u FROM Utilisateur u WHERE u.mail = :mailValue AND u.mdp = :mdpValue", Utilisateur.class);
		req.setParameter("mailValue", mailInit);
		req.setParameter("mdpValue", mdpInit);
		Utilisateur u = req.getSingleResult();
		
		if (age>0) {
			d.setAge(age);
		}
		if (taille>0) {
			d.setTaille(taille);
		}
		if (poids>0) {
			d.setPoids(poids);
		}
		if (sexe.equals("Homme") || sexe.equals("Femme")) {
			d.setSexe(sexe.equals("Femme"));
		}
		d.setDisponibilite(dispo);
		if (c != null) {
			d.setCheveux(c);
		}
		if (l != null) {
			d.setLoisirs(l);
		}
		if (am != null) {
			d.setAntecedents(am);
		}
		if (mail != null) {
			u.setMail(mail);
		}
		if (mdp != null) {
			u.setMdp(mdp);
		}
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
	
	public Collection<Centre> recupererCentre(String ville) {
		TypedQuery<Centre> req = em.createQuery("select c from Centre c where ville = :villeValue", Centre.class);
		req.setParameter("villeValue", ville);
		return req.getResultList();
	}
	
	public Centre recupererCentreMedecin(String nomMedecin){
		TypedQuery<Medecin> req = em.createQuery("select m from Medecin m where nom = :nomValue", Medecin.class);
		req.setParameter("nomValue", nomMedecin);
		Medecin med = null;
		Centre centre = null;
		try {
			med = req.getSingleResult();
			centre = med.getOwner();
		} catch (PersistenceException e) {
			centre = null;
		}
		return centre;
		
		
		
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
	
	public boolean nouveauRDV(int idMed, int heure, int jour, int mois, int idDon) {
		boolean ok = false;
		try {
			TypedQuery<RDV> req = em.createQuery("select r from RDV r where medecin = " + idMed + " and jour = " + jour + "and mois = " + mois + "and heure = " + heure, RDV.class);
			RDV rdv = req.getSingleResult();
		
		} catch (Exception e) {
			Medecin m = em.find(Medecin.class, idMed);
			Donneur d = em.find(Donneur.class, idDon);
			RDV r = new RDV(heure,jour,mois);
			em.persist(r);
			r.setDonneur(d);
			r.setMedecin(m);
			d.setOwner(m.getOwner());
			ok = true;
		}
		
		return ok;
	}

	
}
