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
              <h2>Créer un profil de donneur</h2>
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
          <h2 class="contact-title"> Veuillez remplir les informations ci-dessous pour la création de votre profil de donneur. <br>
			Votre profil sera en ligne lorsqu'il aura été approuvé par l'un de nos administrateurs.  </h2>
        </div>

<br><br><br>

<form action= "Servlet" method="post">
        
        <div class="row">
		<div class="col-sm-6">
    	 	<div class="form-group">
          	 <input class="form-control" name="taille" type="number" min="50" max="220" placeholder="Taille (cm)" required>
        	</div>          
     	</div>
              
     	<div class="col-sm-6">
    		<div class="form-group">
         	  <input class="form-control" name="poids" type="number" placeholder="Poids (kg)" required>
        	 </div>
     	</div>
    	</div>
    
   <br> <br> 
	
	<p> Couleur des yeux : </p>
	
	<%
		for (Yeux y : Yeux.allyeux) {
		String s = Yeux.toString(y);
		%>
		<input type = "radio" name="yeux" value = <%= s %> required> <%= s %> 
	<% } %>
	
	<br><br>
	
	<p> Cheveux : </p>
	<%
		for (Cheveux y : Cheveux.allcheveux) {
		String s = Cheveux.toString(y);
		%>
		<input type = "radio" name="cheveux" value = <%= s %> required> <%= s %> 
	<% } %>
	
	<br><br>
	
	<p> Couleur de peau : </p>
	<%
		for (Peau p : Peau.allpeau) {
		String s = Peau.toString(p);
		%>
		<input type = "radio" name="peau" value = <%= s %> required> <%= s %>
	<% } %>
	
	<br><br>
	
	<p> Antécédents Médicaux : </p>
	<%
		for (AntecedentsMedicaux am : AntecedentsMedicaux.allantmed) {
		String s = AntecedentsMedicaux.toString(am);
		%>
		<input type = "radio" name= "antecedents"  value = <%= s %> required> <%= s %>
	<% } %>
	
	<br><br>
	
	<p> Loisirs : </p>
	<%
		for (Loisirs l : Loisirs.allloisirs) {
		String s = Loisirs.toString(l);
		%>
		<input type = "radio" name="loisirs" value = <%= s %> required> <%= s %>
	<% } %>
	 
     
	 <br><br><br>
             
		<input type="submit" class="main_btn" name="choix" value="Valider">
		<a href="index.html" class="main_btn_light"> Accueil </a>
		<input type="hidden" name = "op" value="validerCreationDonneur">
		<input type="hidden" name = "nom" value = <%= (String) request.getAttribute("nom") %>> 
		<input type="hidden" name = "prenom" value = <%= (String) request.getAttribute("prenom") %>> 
		<input type="hidden" name = "age" value = <%= (String) request.getAttribute("age") %>> 
		<input type="hidden" name = "sexe" value = <%= (String) request.getAttribute("sexe") %>>
		<input type="hidden" name = "mail" value = <%= (String) request.getAttribute("mail") %>>
		<input type="hidden" name = "mdp" value = <%= (String) request.getAttribute("mdp") %>>
	
	</form>
	</div>
</section>
</body>
</html>
