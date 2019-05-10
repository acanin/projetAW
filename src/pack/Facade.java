package pack;
import java.util.Collection;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import enumerations.*;

@Singleton
@LocalBean
public class Facade {

	@PersistenceContext
	private EntityManager em;

	public Facade(){
		
	}
	
	public void ajoutDonneur(String nom, String prenom,  int age, int taille, int poids, String sexe, boolean dispo,Yeux y,Cheveux c,Peau peau, Loisirs l, AntecedentsMedicaux am){
		em.persist(new Donneur(nom, prenom, age,taille, poids, sexe.equals("Femme"), dispo, y, c, peau, l, am));
	}

	public void ajoutReceveur(String n, String p, int a, String s){

		em.persist(new Receveur(n, p, a, s.equals("Femme")));
	}
	
	public void ajoutCentre(String nom, String adresse, String ville) {
		em.persist(new Centre(nom, adresse, ville));
	}
	
	public void ajoutMedecin(String nom, Specialite spe, int idcentre) {
		
		Centre c = em.find(Centre.class, idcentre);
		Medecin m = new Medecin(nom,spe);
		em.persist(m);
		m.setOwner(c);
	}
	
	public Collection<Donneur> listerDonneurs(){
		TypedQuery<Donneur> req = em.createQuery("select p from Donneur p", Donneur.class);
		return req.getResultList();
		
	}
	
	public Collection<Receveur> listerReceveurs(){
		TypedQuery<Receveur> req = em.createQuery("select a from Receveur a", Receveur.class);
		return req.getResultList();
		
	}
	
	public Collection<Centre> listerCentres(){
		TypedQuery<Centre> req = em.createQuery("select c from Centre c", Centre.class);
		return req.getResultList();
	}
	
<<<<<<< HEAD
	public Collection<Medecin> listerMedecins() {
		TypedQuery<Medecin> req = em.createQuery("select m from Medecin m", Medecin.class);
		return req.getResultList();
	}
	
	
	
=======
	public Collection<Donneur> rechercher(String yeux, String cheveux,String peau,String am,String loisir){
		TypedQuery<Donneur> req = em.createQuery("SELECT d FROM Donneur d WHERE YEUX = " + Yeux.toInteger(yeux) + "AND CHEVEUX = " + Cheveux.toInteger(cheveux) + "AND PEAU = " + Peau.toInteger(peau)  + "AND ANTECEDENTS = " + AntecedentsMedicaux.toInteger(am)  + "AND LOISIRS = " + Loisirs.toInteger(loisir) , Donneur.class);
		return req.getResultList();
	}
	
>>>>>>> ba0b424db5a8bf70be7644f5b1e7abd3a6d2d013
}
