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
              <h2>Créer un médecin</h2>
            
            </div>
            <div class="page_link">
              <a href="index.html">Accueil</a>
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
          <h2 class="contact-title"> Veuillez remplir les champs ci-dessous :</h2>
        </div>
        
 <br><br>       
<form action= "Servlet" method="post">

            <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                  <input class="form-control" name="nom" type="text" placeholder="Nom">
                </div></div></div>
  <br><br>            
<label for="sexe">Sexe : </label><br><input type="radio" name= "sexe" value = "Femme"> Femme
							    <input type="radio" name= "sexe" value = "Homme"> Homme

<br><br>
<p> Spécialisation : </p>
<%
	for (Specialite sp : Specialite.allspe) {
	String spe = Specialite.toString(sp);
	%>
	<input type = "radio" name="specialite" value = <%= spe %>> <%= spe %>
<% } %>
<br><br>
<p> Centre associé :</p>
<%Collection<Centre> lc = (Collection<Centre>) request.getAttribute("lc");
	for (Centre c : lc) {
		int id = c.getId();
		String s = c.getNom() + " à " + c.getVille();
		%>
		<input type = "radio" name="idcentre" value = <%= id %>> <%= s %>
	<% } %>
	
<br><br>
<input type="submit" class="main_btn" name="choix" value="Valider">
<input type="hidden" name = "op" value="creationmedecin">


</form>
</div></section>
</body>
</html>