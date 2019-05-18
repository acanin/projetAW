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
    <link rel="stylesheet" href="medcare/css/themify-icons.css">
    <link rel="stylesheet" href="medcare/css/flaticon.css">
    <link rel="stylesheet" href="medcare/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="medcare/vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="medcare/vendors/animate-css/animate.css">
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
                    
                    <a class="navbar-brand logo_h" href="index2.html"><img src="medcare/img/logo.png" alt="" height = 150></a>
                    
                    
               
                </div>
            </nav>
        </div>
    </header>
    <!--================Header Menu Area =================-->


 
 <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="container">
          <div
            class="banner_content d-md-flex justify-content-between align-items-center"
          >
            <div class="mb-3 mb-md-0">
           
            
            
            </div>
            <div class="page_link">
              <a href="index.html">Accueil</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

<section class="contact-section area-padding">
    <div class="container">
    <form action= "Servlet" method="post">
	
        <div class="col-12">
           <% Donneur donneur = (Donneur) request.getAttribute("donneur");
			String nom = donneur.getNom();
			String prenom = donneur.getPrenom();
			int age = donneur.getAge();
			Boolean sexe = donneur.isSexe();
			String yeux = donneur.getYeux().toString();
			String cheveux = donneur.getCheveux().toString();
			String peau = donneur.getPeau().toString();
			String am = donneur.getAntecedents().toString();
			String loisir = donneur.getLoisirs().toString();
			int id = donneur.getId();
			
			Boolean dispo = donneur.isDisponibilite();
			Boolean enAttente = donneur.isAttente();
			Boolean signale = donneur.isSignale();
			//int taux = 100;//centre.getNb_succes()/centre.getNb_essais();
			%>
              <h2>Bienvenue sur le profil de  <%= prenom + " " + nom %> </h2>
            <%if (enAttente){ %>
            	Cette personne est en attente de confirmation d'ajout dans notre liste
            <% }%>
            <%if (signale){ %>
            	Cette personne a été signalée 
            <% }%>
            <%if (dispo){%> 
            	Cette personne est actuellement disponible
            	<%if(sexe == true){ %>
            		Sexe = Femme
            	<% } else {%>
            		Sexe = Homme
            	<% }%>
            	Couleur des yeux : <%= yeux %>
            	Couleur des cheuveux : <%= cheveux %>
            	Couleur de la peau : <%= peau %>
            	Antécédents médicaux : <%= am %>
            	Loisirs : <%= loisir %>
            	Ville : 
            	
            <% }%>
            
        
		<input type="submit" class="main_btn" name="choix" value="Signaler">
		<input type="hidden" name = "op" value="profildonneurselectionne">
		<input type="hidden" name = "idsignale" value = <%= Integer.toString(id)  %>> 
		      </div>
			</form>
            
            
  
  
	 <br><br><br>
	
	<p> </p>
	</div>
	</section>
</body>
</html>