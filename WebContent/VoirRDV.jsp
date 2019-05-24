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
    <link rel="stylesheet" href="style_batp.css">
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
          <div
            class="banner_content d-md-flex justify-content-between align-items-center"
          >
            <div class="mb-3 mb-md-0">
              <h2>Prochains rendez-vous</h2>
            
            </div>
            <div class="page_link">
              <a href="Servlet?op=profildonneurselectionne&choix=Accueil"> Accueil </a><br>
              <a href="index.html">Me déconnecter</a><br>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

<!-- ================ formulaire section start ================= -->
  <section class="contact-section area-padding">
    <div class="container">
    
        <div class="col-12">
          <h2 class="contact-title">Voici votre liste de rendez-vous : </h2>
       
  
	 <br><br><br>


	<form action= "Servlet" method="post">
	
		
		<%Donneur donneur =  (Donneur) request.getAttribute("donneur"); %>
		
		<ul> 
		<% Collection<RDV> lrdv = donneur.getRdv();
		      for (RDV rdv : lrdv) {
		        Medecin m = rdv.getMedecin();
		        String med = m.getNom() + ", " + Specialite.toString(m.getSpecialisation()) + " (" + m.getOwner().getNom() +")";
		        String rdv_string = rdv.getJour() + "/" + rdv.getMois() + " à " + rdv.getHeure() + "h avec " + med;%>
		       
		       
		       <li><%= rdv_string %></li>
		        	  
		<%} %></ul>
		
		

		<br><br>
		<input type="submit" class="main_btn" name="choix" value="Retour">
		<input type="hidden" name = "op" value = "voirRDV"> 
		

	</form> </div>
</div></section>
</body>
</html>