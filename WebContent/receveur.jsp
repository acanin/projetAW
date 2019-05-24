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

<%Receveur receveur = (Receveur) request.getAttribute("receveur");
String prenom = receveur.getPrenom();
int age = receveur.getAge();
boolean femme = receveur.isSexe();
String idnotif = (String) request.getAttribute("idn");
%>

 <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="container">
          <div
            class="banner_content d-md-flex justify-content-between align-items-center"
          >
            <div class="mb-3 mb-md-0">
				 <h2>Notification n° <%= idnotif %></h2>
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
   <section class="contact-section area-padding">
    <div class="container"> 
	<div class = "col-12">

	<form action= "Servlet" method="post">
	
	
	<h2 class="contact-title"> Statut : En attente d'acceptation </h2>
	<br>
	<h4> Profil receveur </h4>
	
	  Prénom : <%= prenom %> <br>
	
	  Age : <%= age %> ans  <br>
	
	  <% if (femme) { %> Sexe : Femme <%} else { %> Sexe : Homme <%} %>  <br>
	<br>
	Accepter la notification :<br>
	<input type="radio" name= "accepter" value = "Oui" required> Oui
	<input type="radio" name= "accepter" value = "Non" required> Non 
									
	<br><br>
	<input type="submit" class = "main_btn" name="button" value="Valider">
	
	<input type="hidden" name = "op" value="profilreceveur">
	<input type = "hidden" name = "idnotif" value = "<%= idnotif %>">
	<input type = "hidden" name = "idd" value = "<%= session.getAttribute("id") %>">


	</form>
	</div></div></section>
</body>
</html>