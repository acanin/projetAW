<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="medcare/img/minilogo.png" type="image/png">
    <title>Bébés à tout prix</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="medcare/css/bootstrap.css">
    <!-- main css -->
    <link rel="stylesheet" href="medcare/css/style.css">
    <link rel="stylesheet" href="medcare/css/responsive.css">
</head>
<body>


    <!--================Header Menu Area =================-->
    <header class="header_area">	
        <div class="main_menu">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container">
                    
                    <a class="navbar-brand logo_h" href="index.html"><img src="medcare/img/logo.png" alt="" height = 150></a>
				
                </div>
            </nav>
        </div>
    </header>
    <!--================Header Menu Area =================-->


 
 <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="container">
          <div class="banner_content d-md-flex justify-content-between align-items-center">
            <div class="mb-3 mb-md-0">
            
			<% Centre centre = (Centre) request.getAttribute("centre");
			String nom = centre.getNom();
			//HttpSession ses = request.getSession(false);
			%>

              <h2>Profil du centre <%= nom %>  </h2>
            
            </div>
         	<div class="page_link">
              <a href="index.html">Me déconnecter</a><br>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

<body>

<section class="contact-section area-padding">
    <div class="container">
    <div class="col-12">
    	<h2 class="contact-title"> Nous sommes ravis de vous accueillir au centre <%= nom %> ! </h2><br><br>

		<p>Nous sommes basés au <%= centre.getAdresse() %> à <%= centre.getVille() %>. </p>
		

	




		<% if (centre.getNb_essais() != 0) {
			int taux = centre.getNb_succes()/centre.getNb_essais();%>
		
		<p> A l'heure actuelle, nous avons un taux de réussite de <%= taux %> sur <%= centre.getNb_essais() %> essais. </p>
		
		<% } %>


		Voici la liste des médecins travaillant chez nous : 
		<ul>
		<%	//Collection<Medecin> lm = (Collection<Medecin>) request.getAttribute("lm");
			Collection<Medecin> lm = centre.getListemedecin();
			for (Medecin m : lm) { 
				String s = "Medecin " + m.getNom() + ", " + Specialite.toString(m.getSpecialisation());
				int id = m.getId(); %>
				
				<li> <a href="Servlet?op=profilcentre&button=rien&medecin=<%= id%>"> <%= s %>  </a> </li>
			
			<% } %>
		</ul>
			

	<% if (!(boolean)session.getAttribute("isAdmin") && !(boolean) session.getAttribute("isDonneur")) { %>
	<p> Liste de tous nos donneurs <p>
		<% Collection<Donneur> donneurs = (Collection<Donneur>) request.getAttribute("listedonneur");
		for (Donneur d : donneurs) {
		String s = d.getPrenom() + " " + d.getNom();
			int id = d.getId();%>
		
			<li> <a href="Servlet?op=afficherDonneurSelectionne&choix=personne&personneSelect=<%= id  %>">Donneur n°<%= id %></a> </li>
			<%}%> 
		

<% } %>


	
	
	<input type="hidden" name = "op" value="profilcentre">
	<input type="hidden" name = "idc" value="<%= centre.getId() %>">
	
</form>

</div></div>
</section>
</body>
</html>