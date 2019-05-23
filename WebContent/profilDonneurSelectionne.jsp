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
    <link rel="stylesheet" href="medcare/css/style_batp.css">
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

           <% Donneur donneur = (Donneur) request.getAttribute("donneur");
			int id = donneur.getId();
			String prenom = donneur.getPrenom();
			int age = donneur.getAge();
			Boolean sexe = donneur.isSexe();
			String yeux = donneur.getYeux().toString();
			String cheveux = donneur.getCheveux().toString();
			String peau = donneur.getPeau().toString();
			String am = donneur.getAntecedents().toString();
			String loisir = donneur.getLoisirs().toString();
			
			Boolean dispo = donneur.isDisponibilite();
			Boolean enAttente = donneur.isAttente();
			Boolean signale = donneur.isSignale();
			//int taux = 100;//centre.getNb_succes()/centre.getNb_essais();
			%>
 
 <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="container">
          <div
            class="banner_content d-md-flex justify-content-between align-items-center"
          >
            <div class="mb-3 mb-md-0">
				<h2>Bienvenue sur le profil n°<%= id %></h2>
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

        

            <%if (dispo){%> 
            	<i> Cette personne est actuellement disponible pour un don.</i><br><br>
            	
            	 <h3> Informations sur le donneur n°<%=id %> :</h3> <br>
            	
            	<%if(sexe == true){ %>
            		Sexe : Femme <br>
            	<% } else {%>
            		Sexe : Homme <br>
            	<% }%>
            	Age : <%= donneur.getAge() %><br>
            	Taille : <%= donneur.getTaille() %> cm<br> 
            	Poids : <%= donneur.getPoids() %> kg<br> 
            	Couleur des yeux : <%= yeux %><br>
            	Couleur des cheveux : <%= cheveux %><br>
            	Peau : <%= peau %><br>
            	Antécédents médicaux : <%= am %><br>
            	Loisirs : <%= loisir %><br>
            	Ville : ???
      
            	
            <% } else {%>
            	Cette personne n'est actuellement pas disponible.
            <%} %>
            
        <br><br>
        <input type="submit" class="genric-btn info radius" name="choix" value="Prendre rdv">
		<input type="submit" class="genric-btn danger radius" name="choix" value="Signaler">
		<input type="submit" class="genric-btn default radius" name="choix" value="Accueil">
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