package pack;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import enumerations.AntecedentsMedicaux;
import enumerations.Cheveux;
import enumerations.Loisirs;
import enumerations.Peau;
import enumerations.Specialite;
import enumerations.Yeux;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	Facade facade;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
        // TODO Auto-generated constructor stub
        facade = new Facade();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String op = request.getParameter("op");
		
		if (op.equals("index")) {
			String button = request.getParameter("indexbutton");
			if (button.equals("S'inscrire")) {
				request.getRequestDispatcher("creationcompte.html").forward(request, response);
			} else {
				request.setAttribute("checkfailed", false);
				request.getRequestDispatcher("pageconnexion.jsp").forward(request, response);
			}
		
		
		} else if (op.equals("connexioncompte")) {
			// On recupère les données
			String identifiant = request.getParameter("identifiant");
			String mdp = request.getParameter("mdp");
			ProfilUtilisateur p = facade.checkAuthentification(identifiant, mdp);
			
			
			// On crée la session si l'authentification a marché
			if (p!=null) {
				if (p instanceof Admin) {
					// Creation de la session de l'admin
					HttpSession session = request.getSession(true);
					session.setAttribute("isAdmin", true);
					
					// Parametres de la page de l'admin
					request.setAttribute("donneurattente", facade.donneursAttentes());
					request.setAttribute("donneursignale", facade.donneursSignales());
					
					// Goto page admin
					request.getRequestDispatcher("pageadmin.jsp").forward(request, response);
				} else {
					
					boolean isDonneur = (p instanceof Donneur);
					
					HttpSession session = request.getSession(true);
					session.setAttribute("nom", p.getNom());
					session.setAttribute("prenom", p.getPrenom());
					session.setAttribute("isDonneur", isDonneur);
					session.setAttribute("mail", identifiant);
					session.setAttribute("mdp", mdp);
					session.setAttribute("isAdmin", false);
					session.setAttribute("id", p.getId());
						
					// Passage de paramètres
					request.setAttribute("listedonneur", facade.listerDonneurs());
					
					// On va a la page d'accueil
					request.getRequestDispatcher("pageaccueil.jsp").forward(request, response);
				}
				
			// Sinon on affiche un message d'erreur sur la page
			} else {
				request.setAttribute("checkfailed", true);
				request.getRequestDispatcher("pageconnexion.jsp").forward(request, response);
			}
			
			
			
		} else if (op.equals("creationcompte")){
			String button = request.getParameter("operation");
			if (button.equals("S'inscrire")) {
				String nom = request.getParameter("nom");
				String prenom = request.getParameter("prenom");
				String mail = request.getParameter("mail");
				String mdp = request.getParameter("motdepasse");
				String age = request.getParameter("age");
				String sexe = request.getParameter("sexe");
				String type = request.getParameter("type");
				
				if (type.equals("Receveur")) {
					// Ajout du receveur et de l'utilisateur dans la DB
					int id = facade.ajoutReceveur(nom, prenom, Integer.parseInt(age), sexe, mail, mdp);
					
					// Creation de la session
					HttpSession session = request.getSession(true);
					session.setAttribute("nom", nom);
					session.setAttribute("prenom", prenom);
					session.setAttribute("mail", mail);
					session.setAttribute("mdp", mdp);
					session.setAttribute("isDonneur", false);
					session.setAttribute("isAdmin", false);
					session.setAttribute("id", id);
					
					// Passage de paramètre à la page suivante
					request.setAttribute("listedonneur", facade.listerDonneurs());
					
					// Passage à la page suivante
					request.getRequestDispatcher("pageaccueil.jsp").forward(request, response);
					
				} else {
					// Passage de paramètres à la page suivante
					request.setAttribute("nom", nom);
					request.setAttribute("prenom", prenom);
					request.setAttribute("age", age);
					request.setAttribute("sexe", sexe);
					request.setAttribute("mail", mail);
					request.setAttribute("mdp", mdp);
					
					// Passage à la page suivante
					request.getRequestDispatcher("creationprofildonneur.jsp").forward(request, response);
				
				}
			}else { response.getWriter().append("Served at: ").append(request.getContextPath()); }
			
			
		} else if (op.equals("pageaccueil")) {	
			String button = request.getParameter("choix");
			
			// Obtention de donnees depuis la session
			HttpSession session = request.getSession(false); // on ne crée pas de nouvelle session !
			if (session != null) {
				// Affichage du nombre de donneur
				if (button.equals("Rechercher Donneur")) {
					request.getRequestDispatcher("recherchedonneur.jsp").forward(request, response);

				}else if (button.equals("Rechercher Centre")) {
					request.getRequestDispatcher("recherchecentre.jsp").forward(request, response);

				} else {
					request.getRequestDispatcher("moncompte.jsp").forward(request, response);
				}
				
			} else {

				response.getWriter().append("Vous n'êtes pas connecté(e).");
			}

		
		
		} else if (op.equals("modifierMonCompte")) {
			HttpSession s = request.getSession(false);

			
			if ((boolean)s.getAttribute("isDonneur")) {
				
				// Obtention des parametres de la session
				String nom = (String) s.getAttribute("nom");
				String prenom = (String) s.getAttribute("prenom");
				String mailInit = (String) s.getAttribute("mail");
				String mdpInit = (String) s.getAttribute("mdp");
				
				// Obtention des parametres de la page
				Loisirs loisir = Loisirs.toCaracteristiques(request.getParameter("loisirs"));
				String mail = request.getParameter("mail");
				if (mail.isEmpty()){
					mail = mailInit;
				}
				String mdp = request.getParameter("mdp");
				if (mdp.isEmpty()){
					mdp = mdpInit;
				}
				int age = Integer.parseInt(request.getParameter("age"));
				if (mdp.isEmpty()){
					mdp = mdpInit;
				}
				boolean dispo = request.getParameter("dispo").equals("yes");
				
				// Modification du donneur dans la DB
				facade.modifierDonneur(mailInit, mdpInit, nom, prenom, age, dispo, loisir, mail, mdp);
				
				// Passage de paramètre à la page suivante
				request.setAttribute("listedonneur", facade.listerDonneurs());
				
				// Mise a jour des donnees de la session
				s.setAttribute("mail", mail);
				s.setAttribute("mdp", mdp);
				
				// Passage a la vue suivante
				request.getRequestDispatcher("pageaccueil.jsp").forward(request, response);
			
			} else {
				// Obtention des parametres de la session
				String nom = (String) s.getAttribute("nom");
				String prenom = (String) s.getAttribute("prenom");
				String mailInit = (String) s.getAttribute("mail");
				String mdpInit = (String) s.getAttribute("mdp");
				
				// Modification d'un compte receveur
				int age = Integer.parseInt(request.getParameter("age"));
				String mail = request.getParameter("mail");
				if (mail.isEmpty()){
					mail = mailInit;
				}
				String mdp = request.getParameter("mdp");
				if (mdp.isEmpty()){
					mdp = mdpInit;
				}

				if (mdp.isEmpty()){
					mdp = mdpInit;
				}
				// Modification du receveur dans la DB
				facade.modifierReceveur(mailInit, mdpInit, nom, prenom, age, mail, mdp);
				
				// Passage de paramètre à la page suivante
				request.setAttribute("listedonneur", facade.listerDonneurs());
				
				// Mise a jour des donnees de la session
				s.setAttribute("mail", mail);
				s.setAttribute("mdp", mdp);
				
				// Passage a la vue suivante
				request.getRequestDispatcher("pageaccueil.jsp").forward(request, response);
			}
			
			
		} else if (op.equals("validerCreationDonneur")) {
			// Obtention des parametres de la page
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String age = request.getParameter("age");
			String sexe = request.getParameter("sexe");
			String taille = request.getParameter("taille");
			String poids = request.getParameter("poids");
			String yeux = request.getParameter("yeux");
			String cheveux = request.getParameter("cheveux");
			String peau = request.getParameter("peau");
			String am = request.getParameter("antecedents");
			String loisir = request.getParameter("loisirs");
			String mail = request.getParameter("mail");
			String mdp = request.getParameter("mdp");
			
			// Stockage des donnees du profil et de l'utilisateur dans la DB
			int id = facade.ajoutDonneur(nom, prenom, Integer.parseInt(age), Integer.parseInt(taille), Integer.parseInt(poids), sexe, true, Yeux.toCaracteristiques(yeux), Cheveux.toCaracteristiques(cheveux), Peau.toCaracteristiques(peau), Loisirs.toCaracteristiques(loisir), AntecedentsMedicaux.toCaracteristiques(am), mail, mdp);
			
			// Creation d'une session
			HttpSession session = request.getSession(true);
			session.setAttribute("nom", nom);
			session.setAttribute("prenom", prenom);
			session.setAttribute("mail", mail);
			session.setAttribute("mdp", mdp);
			session.setAttribute("isDonneur", true);
			session.setAttribute("isAdmin", false);
			session.setAttribute("id", id);
			
			// Passage de paramètres à la page suivante
			//request.setAttribute("listedonneur", facade.listerDonneurs());
			
			// Passage à la page suivante
			//request.getRequestDispatcher("pageaccueil.jsp").forward(request, response);
			request.setAttribute("rdvpris", false);
			request.setAttribute("lc", facade.listerCentres());
			 request.getRequestDispatcher("prendreRDV.jsp").forward(request, response);
			
			
		} else if (op.equals("rechercherDonneur")) {
			String button = request.getParameter("choix");
			// On recupere les carateristiques recherchees 
			String sexeRecherche = request.getParameter("sexeRecherche");
			String yeuxRecherche = request.getParameter("yeuxRecherche");
			String cheveuxRecherche = request.getParameter("cheveuxRecherche");
			String peauRecherche = request.getParameter("peauRecherche");
	
			// On envoie la liste des donneurs
			request.setAttribute("listedonneurCompatible", facade.rechercher(sexeRecherche,yeuxRecherche,cheveuxRecherche,peauRecherche));
			request.getRequestDispatcher("afficherDonneurSelectionne.jsp").forward(request, response);
			
			
		} else if (op.equals("afficherDonneurSelectionne")){
			String button = request.getParameter("choix");
			if(button.equals("personne")){
				String id = request.getParameter("personneSelect");
				request.setAttribute("donneur", facade.recupererDonneur(Integer.parseInt(id)));
				request.getRequestDispatcher("profilDonneurSelectionne.jsp").forward(request, response);
			}else if(button.equals("refaire")) {
				//response.getWriter().append("Il faut pouvoir revenir sur la recherche");
				request.getRequestDispatcher("recherchedonneur.jsp").forward(request, response);
			}else{
				response.getWriter().append("Probleme dans Servlet op = affDonneurSelect");
			}
			
		} else if (op.equals("profildonneurselectionne")){	
			String button = request.getParameter("choix");
			String idsignale = request.getParameter("idsignale");
			if(button.equals("Signaler")){
				facade.signalerDonneur(Integer.parseInt(idsignale));
				request.setAttribute("donneurS", facade.recupererDonneur(Integer.parseInt(idsignale)));
				request.getRequestDispatcher("personneSignale.jsp").forward(request, response);
			}else if (button.equals("Accueil")){
				request.setAttribute("listedonneur", facade.listerDonneurs());
				request.getRequestDispatcher("pageaccueil.jsp").forward(request, response);
			} else {
				response.getWriter().append("Page rdv à faire ");
			}
			
			
		
			
		} else if (op.equals("rechercherCentre")) {
			String mode = request.getParameter("mode");
			String texte = request.getParameter("texte");
			String button = request.getParameter("choix");
			if(button.equals("Valider")){
				if (mode.equals("ville")){
					// ici texte est le nom d'une ville
					request.setAttribute("listeCentre", facade.recupererCentre(texte));
					request.getRequestDispatcher("listerCentreVille.jsp").forward(request, response);
				}else {
					// ici texte est le nom d'un medecin
					request.setAttribute("centre", facade.recupererCentreMedecin(texte));
					request.getRequestDispatcher("listerCentreMedecin.jsp").forward(request, response);
				}
			}
			
		} else if(op.equals("listerCentreVille")){
			String button = request.getParameter("choix");
			if(button.equals("centre")){
				String id = request.getParameter("centreSelect");
				request.setAttribute("centre", facade.recupererCentre(Integer.parseInt(id)));
				request.setAttribute("lm", facade.listerMedecinsCentre(Integer.parseInt(id)));
				request.getRequestDispatcher("profilcentre.jsp").forward(request, response);
				
			}else if(button.equals("refaire")){
				request.getRequestDispatcher("recherchecentre.jsp").forward(request, response);
			} else{
				response.getWriter().append("Probleme dans Servlet op = listerCentreVille");
			}
			
		} else if(op.equals("listerCentreMedecin")){
			String button = request.getParameter("choix");
			if(button.equals("centre")){
				String id = request.getParameter("centreSelect");
				request.setAttribute("centre", facade.recupererCentre(Integer.parseInt(id)));
				request.setAttribute("lm", facade.listerMedecinsCentre(Integer.parseInt(id)));
				request.getRequestDispatcher("profilcentre.jsp").forward(request, response);
			}else if(button.equals("refaire")){
				request.getRequestDispatcher("recherchecentre.jsp").forward(request, response);
				
			} else{
				response.getWriter().append("Probleme dans Servlet op = listerCentreMedecin");
			}
			
			
			
		} else if (op.equals("admin")) {
			String button = request.getParameter("adminbutton");
			if (button.equals("Ouverture d'un centre")) {
				request.getRequestDispatcher("creationcentre.html").forward(request, response);
			} else if (button.equals("Nouveau medecin")) {
				request.setAttribute("lc", facade.listerCentres());
				request.getRequestDispatcher("creationmedecin.jsp").forward(request, response);
			} else if(button.equals("Liste des centres")) { 
				request.setAttribute("lc", facade.listerCentres());
				request.getRequestDispatcher("listercentre.jsp").forward(request, response);
			} else if (button.equals("attente")) {
				String id = request.getParameter("dattente");
				request.setAttribute("donneur", facade.recupererDonneur(Integer.parseInt(id)));
				request.setAttribute("attente", true);
				request.getRequestDispatcher("adminProfilDonneur.jsp").forward(request, response);
			} else if (button.equals("signale")) {
				String id = request.getParameter("dsignale");
				request.setAttribute("donneur", facade.recupererDonneur(Integer.parseInt(id)));
				request.setAttribute("attente", false);
				request.getRequestDispatcher("adminProfilDonneur.jsp").forward(request, response);
			}
			
		} else if (op.equals("creationcentre")) {
			String nom = request.getParameter("nom");
			String adresse = request.getParameter("adresse");
			String ville = request.getParameter("ville");
			facade.ajoutCentre(nom, adresse, ville);
			request.setAttribute("donneurattente", facade.donneursAttentes());
			request.setAttribute("donneursignale", facade.donneursSignales());
			request.getRequestDispatcher("pageadmin.jsp").forward(request, response);
			
			
		} else if (op.equals("creationmedecin")){
			String nom = request.getParameter("nom");
			String spe = request.getParameter("specialite");
			String idc = request.getParameter("idcentre");
			String sexe = request.getParameter("sexe");
			
			facade.ajoutMedecin(nom, Specialite.toCaracteristiques(spe),Integer.parseInt(idc),sexe);
			request.setAttribute("donneurattente", facade.donneursAttentes());
			request.setAttribute("donneursignale", facade.donneursSignales());
			request.getRequestDispatcher("pageadmin.jsp").forward(request, response);
			
		} else if(op.equals("listeC")) {
			String id = request.getParameter("centre");
			request.setAttribute("centre", facade.recupererCentre(Integer.parseInt(id)));
			//request.setAttribute("lm", facade.listerMedecinsCentre(Integer.parseInt(id)));
			request.getRequestDispatcher("profilcentre.jsp").forward(request, response);
		
		} else if (op.equals("profilcentre")) {
			String button = request.getParameter("button");
			if (button.equals("PrendreRDV")) {
				String idc = request.getParameter("idc");
				response.getWriter().append("RDV " + idc);
			} else {
				String id = request.getParameter("medecin");
				request.setAttribute("med", facade.recupererMedecin(Integer.parseInt(id)));
				request.getRequestDispatcher("profilmedecin.jsp").forward(request, response);
			}
			
		} else if (op.equals("Confirmer/Supprimer")) {
			String choix = request.getParameter("confirmation");
			String attente = request.getParameter("attente");
			String id = request.getParameter("donneur");
			
			facade.modifierStatu(choix, attente,Integer.parseInt(id));
			request.setAttribute("donneurattente", facade.donneursAttentes());
			request.setAttribute("donneursignale", facade.donneursSignales());
			request.getRequestDispatcher("pageadmin.jsp").forward(request, response);
			
		} else if(op.equals("ValiderRDV")) {
			String med = request.getParameter("medecin");
			int heure = Integer.parseInt(request.getParameter("heure"));
			int jour = Integer.parseInt(request.getParameter("jour"));
			int mois = Integer.parseInt(request.getParameter("mois"));
			String idDonneur = request.getParameter("donneur");
			/**response.getWriter().append(med);
			response.getWriter().append(heure);
			response.getWriter().append(jour);
			response.getWriter().append(mois);
			response.getWriter().append(idDonneur);*/
			Centre c = facade.recupererMedecin(Integer.parseInt(med)).getOwner();
			
			Donneur d = facade.recupererDonneur(Integer.parseInt(idDonneur));
			d.setOwner(c);
			
			boolean ok = facade.nouveauRDV(Integer.parseInt(med), heure, jour, mois, Integer.parseInt(idDonneur));
			if (ok) {
				request.setAttribute("listedonneur", facade.listerDonneurs());
				request.getRequestDispatcher("pageaccueil.jsp").forward(request, response);
			} else {
				request.setAttribute("rdvpris", true);
				request.setAttribute("lc", facade.listerCentres());
				request.getRequestDispatcher("prendreRDV.jsp").forward(request, response);
			}
			
		} else if(op.equals("RetourAccueilAdmin")) {
			// Parametres de la page de l'admin
			request.setAttribute("donneurattente", facade.donneursAttentes());
			request.setAttribute("donneursignale", facade.donneursSignales());
			
			// Goto page admin
			request.getRequestDispatcher("pageadmin.jsp").forward(request, response);
			
			

		} else {
			response.getWriter().append("Served at: ").append(request.getContextPath());
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
