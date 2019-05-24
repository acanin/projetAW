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
              <h2>Administration</h2>
            
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
          <h4 class="contact-title">Actions :  </h4>
       
		
		<form action= "Servlet" method="post">
			<p>Ici, vous pouvez créer le profil d'un médecin, créer le profil d'un centre ou afficher la liste des centres :</p>
			<br> <div class="row">
			<input type="submit" class="genric-btn default" name="adminbutton" value="Nouveau medecin">
			
			<input type="submit" class="genric-btn default" name="adminbutton" value="Ouverture d'un centre">
			
			<input type="submit" class="genric-btn default" name="adminbutton" value="Liste des centres">
			</div>
			<input type="hidden" name = "op" value="admin">

		</form>
<br><br><br><br>


          <h4 class="contact-title">Donneurs en attente :  </h4>
       
	
		<%
			Collection<Donneur> ldattente = (Collection<Donneur>) request.getAttribute("donneurattente");
		
		if (ldattente.isEmpty()) {%> Il n'y a aucun donneur en attente pour le moment. 
		<% } else { %> Voici la liste des donneurs actuellement en attente : <br>
				<% for (Donneur d : ldattente) { 
					String s = d.getPrenom() + ' ' + d.getNom();
					int id = d.getId();%>
				
					<ul><li> <a href="Servlet?op=admin&adminbutton=attente&dattente=<%= id%>"> <%= s %>  </a> </li>
				
			<% }} %>
		
		
		</ul> 
<br><br><br><br><br>
		
		          <h4 class="contact-title">Donneurs signalés : </h4>
		        
		<ul>
		<%
		Collection<Donneur> lsignale = (Collection<Donneur>) request.getAttribute("donneursignale");

		if (lsignale.isEmpty()) { %> Il n'y a aucun donneur signalé pour le moment. 
		<% } else { %> Voici la liste des donneurs actuellement signalés : <br>
			<% for (Donneur ds : lsignale) { 
				String ss = ds.getPrenom() + ' ' + ds.getNom();
				int ids = ds.getId(); %>
				
				<li> <a href="Servlet?op=admin&adminbutton=signale&dsignale=<%= ids%>"> <%= ss %>  </a> </li>
			
			<% }} %>
		
		
		</ul>
		<br><br><br><br><br>
		
		          <h4 class="contact-title">Donneurs : </h4>
		        
		<ul>
		<%
		Collection<Donneur> ldonneur = (Collection<Donneur>) request.getAttribute("donneurs");

		if (ldonneur.isEmpty()) { %> Il n'y a aucun donneur pour le moment. 
		<% } else { %> Voici la liste des donneurs actuellement dans notre base : <br>
			<% for (Donneur ds : ldonneur) { 
				String ss = ds.getPrenom() + ' ' + ds.getNom();
				int ids = ds.getId(); %>
				
				<li> <a href="Servlet?op=admin&adminbutton=donneur&idd=<%= ids%>"> <%= ss %>  </a> </li>
			
			<% }} %>
		
		
		</ul>
		<br><br><br><br><br>
		
		          <h4 class="contact-title">Receveurs : </h4>
		        
		<ul>
		<%
		Collection<Receveur> lreceveur = (Collection<Receveur>) request.getAttribute("receveurs");

		if (lreceveur.isEmpty()) { %> Il n'y a aucun receveur pour le moment. 
		<% } else { %> Voici la liste des receveur dans notre base : <br>
			<% for (Receveur ds : lreceveur) { 
				String ss = ds.getPrenom() + ' ' + ds.getNom();
				int ids = ds.getId(); %>
				
				<li> <a href="Servlet?op=admin&adminbutton=receveur&idr=<%= ids%>"> <%= ss %>  </a> </li>
			
			<% }} %>
		
		
		</ul></div>
</div></section>

</body>
</html>