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

<%
	HttpSession ses = request.getSession(false);

	String nom = (String) ses.getAttribute("nom");
	String prenom = (String) ses.getAttribute("prenom");
	boolean isDonneur = (boolean) ses.getAttribute("isDonneur");
	
%>


	
 <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="container">
          <div
            class="banner_content d-md-flex justify-content-between align-items-center"
          >
            <div class="mb-3 mb-md-0">
               <form action= "Servlet" method="post">
				<h2> Compte de <%= prenom %> <%= nom %> </h2></form> 
            </div>
            <div class="page_link">
              <a href="index.html"> Me déconnecter</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

 <section class="contact-section area-padding">
    <div class="container"> 
	<form action= "Servlet" method="post">
	
	<div class = "col-12">
	<h3> Modifier mon adresse mail et mes identifiants de connexion </h3><br>
	
	<div class="form-group">
	<input class="form-control" name="mail" type="text" placeholder="Mail"></div><br>
	
	<input class="form-control" name="mdp" type="text" placeholder="Mot de passe">
	<br>
	<h3> Modifier mes informations personnelles </h3>
	<br>
	<input class="form-control" name="age" type="number" min="18" max="120" placeholder="Age" required>

	<br>
	
	<% if (isDonneur) { %>
	<input type="radio" name= "dispo" value = "yes" required> Disponible
	<input type="radio" name= "dispo" value = "no" required > Indisponible
	
	<br><br>

	<h3> Modifier mes loisirs </h3>
	<br>
	<%
		for (Loisirs l : Loisirs.allloisirs) {
		String s = Loisirs.toString(l);
		%>
		<input type = "radio" name="loisirs" value = <%= s %> required> <%= s %>
	<% } %>
	 
    <% } %>  
    <br><br>
		<input type="submit" class="main_btn" name="choix" value="Valider">
		<input type="hidden" name = "op" value="modifierMonCompte">
	
	
</div></form></div></section>
</body>
</html>