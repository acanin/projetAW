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
    <div class="container">   <div class="col-12">
    
    <%Collection<Centre> lc = (Collection<Centre>)request.getAttribute("listeCentre");
	for (Centre c : lc){
		int id = c.getId();%>
		<h2 class="contact-title">Voici le centre trouvé :
		<a href="Servlet?op=listerCentreVille&choix=centre&centreSelect=<%= id  %>">Centre <%= c.getNom() %></a></h2> <br>
	
	<%}
	if(lc.size() == 0){%>
		<h4>Il n'y a pas de centre dans cette ville, vérifiez que vous avez bien écrit le nom de la ville.</h4> <br>
	    <a href="Servlet?op=listerCentreVille&choix=refaire"><%= "Refaire une recherche" %></a>
	<%} %>
	
	
	</div>
	
</div>
</section>
</body>
</html>