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
    
<% Donneur donneur =  (Donneur) request.getAttribute("donneur");
boolean attente = (boolean) request.getAttribute("attente");
String nom = donneur.getPrenom() + ' ' + donneur.getNom();
String status = null;
String val = null;

if (attente){
	status = "est en attente de confirmation par un administrateur.";
	val = "oui";
} else {
	status = "a été signalé par un de nos receveurs.";
	val = "non";
}

%>
 <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="container">
          <div
            class="banner_content d-md-flex justify-content-between align-items-center"
          >
            <div class="mb-3 mb-md-0">
				 <h2>Profil du donneur <%= nom %></h2>
            </div>
            <div class="page_link">
              <a href="index.html"> Accueil</a>
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
          <h2 class="contact-title">  Ce donneur <%= status%></h2>
			
			<form action= "Servlet" method="post">
			<br>
			<% if (attente) {%>
			
			<h5><label for="confirmation">Confirmer l'ajout au site :
						</label><input type="radio" name= "confirmation" value = "Oui"> Oui
								<input type="radio" name= "confirmation" value = "Non"> Non 
			
			
			<%} else {%>
			
			<label for="confirmation">Supprimer du site :
						</label><input type="radio" name= "confirmation" value = "Oui"> Oui
								<input type="radio" name= "confirmation" value = "Non"> Non 
			
			<%} %>
			</h5><br>
			<input type="submit" class="main_btn" name="adminbutton" value="valider">
			
			<input type="hidden" name = "op" value="Confirmer/Supprimer">
			<input type="hidden" name = "attente" value="<%=val%>">
			<input type="hidden" name = "donneur" value="<%=donneur.getId()%>">
			
			</form></div>
</div></section>
</body>
</html>