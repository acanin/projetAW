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
			request.getRequestDispatcher("pageaccueil.jsp").forward(request, response);
			
			
			
		} else if (op.equals("rechercherDonneur")) {
			String button = request.getParameter("choix");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			
			
			if (button.equals("Annuler")) {
				request.setAttribute("nom", nom);
				request.setAttribute("prenom", prenom);
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
				request.setAttribute("yeuxR", yeuxRecherche);
				request.setAttribute("cheveuxR", cheveuxRecherche);
				request.setAttribute("peauR", peauRecherche);
				request.setAttribute("amR", amRecherche);
				request.setAttribute("loisirR", loisirRecherche);
				
				request.setAttribute("nom", nom);
				request.setAttribute("prenom", prenom);
				
				// On envoie la liste des donneurs
				request.setAttribute("listedonneur", facade.listerDonneurs());
	
				request.getRequestDispatcher("afficherDonneurSelectionne.jsp").forward(request, response);
			}
			
			
			
			
			
		} else if (op.equals("afficherDonneurSelectionne")){
			String button = request.getParameter("choix");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			
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
				response.getWriter().append("a coder ");
			}
			
		} else if (op.equals("creationcentre")) {
			String nom = request.getParameter("nom");
			String adresse = request.getParameter("adresse");
			String ville = request.getParameter("ville");
			facade.ajoutCentre(nom, adresse, ville);
			request.getRequestDispatcher("pageadmin.html").forward(request, response);
			
		

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
