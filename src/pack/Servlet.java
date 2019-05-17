package pack;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String op = request.getParameter("op");
		
		if (op.equals("index")) {
			String button = request.getParameter("indexbutton");
			if (button.equals("S'inscrire")) {
				request.getRequestDispatcher("creationcompte.html").forward(request, response);
			} else {
				response.getWriter().append("Served at: ").append(request.getContextPath());
			}
			
			
			
			
			
		} else if (op.equals("creationcompte")){
			String button = request.getParameter("operation");
			if (button.equals("Annuler")) {
				request.getRequestDispatcher("index.html").forward(request, response);
			} 
			
			else {
				String nom = request.getParameter("nom");
				String prenom = request.getParameter("prenom");
				String mail = request.getParameter("mail");
				String mdp = request.getParameter("motdepasse");
				String age = request.getParameter("age");
				String sexe = request.getParameter("sexe");
				String type = request.getParameter("type");
				
				if (type.equals("Receveur")) {
					facade.ajoutReceveur(nom, prenom, Integer.parseInt(age), sexe);
					//response.getWriter().append("pageaccueil.jsp");
					request.setAttribute("nom", nom);
					request.setAttribute("prenom", prenom);
					request.setAttribute("listedonneur", facade.listerDonneurs());
					request.getRequestDispatcher("pageaccueil.jsp").forward(request, response);
					
				} else {
					request.setAttribute("nom", nom);
					request.setAttribute("prenom", prenom);
					request.setAttribute("age", age);
					request.setAttribute("sexe", sexe);
					request.getRequestDispatcher("creationprofildonneur.jsp").forward(request, response);
				}
				// a completer pour mdp et mail	
			}
			
			
		} else if (op.equals("pageaccueil")) {	
			String button = request.getParameter("choix");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			
			// Affichage du nombre de donneur 
			
			
			
			if (button.equals("Rechercher Donneur")) {
				request.setAttribute("nom", nom);
				request.setAttribute("prenom", prenom);
				request.getRequestDispatcher("recherchedonneur.jsp").forward(request, response);
			} 
			
			
			
		} else if (op.equals("validerCreationDonneur")) {
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
			
			facade.ajoutDonneur(nom, prenom, Integer.parseInt(age), Integer.parseInt(taille), Integer.parseInt(poids), sexe, true, Yeux.toCaracteristiques(yeux), Cheveux.toCaracteristiques(cheveux), Peau.toCaracteristiques(peau), Loisirs.toCaracteristiques(loisir), AntecedentsMedicaux.toCaracteristiques(am));
			request.setAttribute("nom", nom);
			request.setAttribute("prenom", prenom);
			request.setAttribute("listedonneur", facade.listerDonneurs());
			request.getRequestDispatcher("pageaccueil.jsp").forward(request, response);
			
			
			
		} else if (op.equals("rechercherDonneur")) {
			String button = request.getParameter("choix");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			
			
			if (button.equals("Annuler")) {
				request.setAttribute("nom", nom);
				request.setAttribute("prenom", prenom);
				request.setAttribute("listedonneur", facade.listerDonneurs());
				request.getRequestDispatcher("pageaccueil.jsp").forward(request, response);
			} 
			
			// Bouton "Valider" 
			else {
				// On recupere les carateristiques recherchees 
				String yeuxRecherche = request.getParameter("yeuxRecherche");
				String cheveuxRecherche = request.getParameter("cheveuxRecherche");
				String peauRecherche = request.getParameter("peauRecherche");
				String amRecherche = request.getParameter("antecedentRecherche");
				String loisirRecherche = request.getParameter("loisirRecherche");

				// On les envoie la page d'apres
				/**request.setAttribute("yeuxR", yeuxRecherche);
				request.setAttribute("cheveuxR", cheveuxRecherche);
				request.setAttribute("peauR", peauRecherche);
				request.setAttribute("amR", amRecherche);
				request.setAttribute("loisirR", loisirRecherche);*/
				
				request.setAttribute("nom", nom);
				request.setAttribute("prenom", prenom);
				
				// On envoie la liste des donneurs
				request.setAttribute("listedonneurCompatible", facade.rechercher(yeuxRecherche,cheveuxRecherche,peauRecherche,amRecherche,loisirRecherche));
	
				request.getRequestDispatcher("afficherDonneurSelectionne.jsp").forward(request, response);
			}
			
		} else if (op.equals("afficherDonneurSelectionne")){
			String button = request.getParameter("choix");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			if(button.equals("personne")){
				String id = request.getParameter("personneSelect");
				request.setAttribute("donneur", facade.recupererDonneur(Integer.parseInt(id)));
				request.getRequestDispatcher("profilDonneurSelectionne.jsp").forward(request, response);
			
			}
			if (button.equals("Retour Accueil")) {
				request.setAttribute("nom", nom);
				request.setAttribute("prenom", prenom);
				request.getRequestDispatcher("pageaccueil.jsp").forward(request, response);
			} 
				
		} else if (op.equals("admin")) {
			String button = request.getParameter("adminbutton");
			if (button.equals("Ouverture d'un centre")) {
				request.getRequestDispatcher("creationcentre.html").forward(request, response);
			} else if (button.equals("Nouveau medecin")) {
				request.setAttribute("lc", facade.listerCentres());
				request.getRequestDispatcher("creationmedecin.jsp").forward(request, response);
			} else if(button.equals("listercentre")) { // C'est un test qu'il faudra enlever plus tard, flemme de faire la bonne page
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
			} else { // C'est un test qu'il faudra enlever plus tard et le mettre ailleurs
				request.setAttribute("donneurattente", facade.donneursAttentes());
				request.setAttribute("donneursignale", facade.donneursSignales());
				request.getRequestDispatcher("pageadmin.jsp").forward(request, response);
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
			request.setAttribute("lm", facade.listerMedecinsCentre(Integer.parseInt(id)));
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
