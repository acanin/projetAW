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
          <div
            class="banner_content d-md-flex justify-content-between align-items-center"
          >
            <div class="mb-3 mb-md-0">
              <h2>Résultats de la recherche</h2>
            
            </div>
            <div class="page_link">
              <a href="Servlet?op=profildonneurselectionne&choix=Accueil"> Accueil </a>
              <a href="index.html">Me déconnecter</a><br>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

<!-- ================Affichage résultats section start ================= -->
  <section class="contact-section area-padding">
    <div class="container">
    
        <div class="col-12">
          <h2 class="contact-title">Voici les donneurs qui répondent à vos critères :  </h2>
        </div>
  
	 <br><br><br>
	
	<form action= "Servlet" method="post">
	

	 <br>
	
	
	<ul>
		
	<% Collection<Donneur> ld = (Collection<Donneur>)request.getAttribute("listedonneurCompatible");
	if (ld.isEmpty()){
		int id = 0;%>
		Il n'y a aucun donneur correspondant à vos attentes. Essayez encore pour trouver le donneur parfait.
		
		<li> <a href="Servlet?op=afficherDonneurSelectionne&choix=refaire"> Refaire une recherche</a> </li>
		
	<%}else {
		int cpte = 0;
		for (Donneur d : ld){ 
			String s = d.getPrenom() + " " + d.getNom();
			int id = d.getId();%>
		
			<li> <a href="Servlet?op=afficherDonneurSelectionne&choix=personne&personneSelect=<%= id  %>">Donneur n°<%= id %></a> </li>
		
	<% }
	}%>
	
	</ul>

		
	</form>
	
</div>
</section>
</body>
</html>