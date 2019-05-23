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
              <h2>Prise de Rendez-vous </h2>
            
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



<!-- ================ formulaire section start ================= -->
  <section class="contact-section area-padding">
    <div class="container">
    
    <%Centre centredonneur = (Centre) request.getAttribute("centre");%>
        <div class="col-12">
          <h3> <%if (centredonneur != null) { %>Pour que votre profil soit visible sur le site, il faut qu'un médecin ait validé votre 
          condition physique. <%} %> <br>Veuillez prendre rendez-vous avec un médecin dans un de nos centres ci-dessous : </h3>
       <br><br>
       
        	<form action= "Servlet" method="post">
		        
		<% if ((boolean) request.getAttribute("rdvpris")) { %>
		<echec> Ce créneau est déjà pris avec ce médecin. Sélectionnez-en un autre. </echec>
		<%} %>
		
		<% 
		if (centredonneur == null) {
			Collection<Centre> lc = (Collection<Centre>) request.getAttribute("lc");
		
			for (Centre	 centre : lc) {
				String s = centre.getNom()+'('+centre.getVille()+')';
				Collection <Medecin> med = centre.getListemedecin();
				%>
				<h4> Centre <%= s %> </h4>
				
				<%for (Medecin m : med) { 
					String str_med = "Medecin " + m.getNom() + ", " + Specialite.toString(m.getSpecialisation());%>
					  <input type = "radio" name="medecin" value = <%= m.getId() %> required> <%= str_med %>  
				<br>
				<% }%>
				<br><br>
			<% } } else {
				String s = centredonneur.getNom()+'('+centredonneur.getVille()+')';
				%>
				<h4> Centre <%= s %> </h4>
				
				<%
				Collection<Medecin> med = centredonneur.getListemedecin();
				for (Medecin md : med) { 
					String str_med = "Medecin " + md.getNom() + ", " + Specialite.toString(md.getSpecialisation());%>
					  <input type = "radio" name="medecin" value = <%= md.getId() %> required> <%= str_med %>  
				<br>
				<% }%>
				<br><br>
				<%} %>
		
		<br>
		 <h4> Veuillez choisir un heure :  </h4>
		<div class="form-group">
            <div class="col-sm-10">
			<input class="form-control" name="heure" type="number" placeholder="Heure" min="9" max = "19" required>
		<br></div></div>
		<h4>  Veuillez choisir une date : </h4> 
		     
        <div class="row">
		<div class="col-sm-10">
    	 	<div class="form-group">
          	 <input class="form-control" name="jour" type="number" placeholder="Jour" min="1" max = "31" required>
        	</div>          
     	</div>
              
     	<div class="col-sm-10">
    		<div class="form-group">
         	  <input class="form-control" name="mois" type="number" placeholder="Mois" min="1" max = "12" required>
        	 </div>
     	</div>
    	</div>
    
    
		<input type="submit" class="main_btn" name="choix" value="Valider">
		
		<% if (centredonneur == null) { %>
		
		<input type="hidden" name = "op" value="ValiderRDV1">
		<%} else { %>
		<input type="hidden" name = "op" value="ValiderRDV">
		<%} %>
		<input type="hidden" name = "donneur" value="<%= session.getAttribute("id") %>" >
		</form>

</div></div></section>
</body>
</html>