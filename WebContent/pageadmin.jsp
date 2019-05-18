<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="medcare/img/favicon.png" type="image/png">
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
          <h2 class="contact-title">Actions :  </h2>
        </div>
		
		<form action= "Servlet" method="post">
		
			<input type="submit" class="main_btn" name="adminbutton" value="Nouveau medecin">
			<input type="submit" class="main_btn" name="adminbutton" value="Ouverture d'un centre">
			<input type="submit" class="main_btn" name="adminbutton" value="listercentre">
			
			<input type="hidden" name = "op" value="admin">

		</form>
<br>

		<div class="col-12">
          <h2 class="contact-title">Donneurs en attente :  </h2>
        </div>

		<ul>
		
		<%
			Collection<Donneur> ldattente = (Collection<Donneur>) request.getAttribute("donneurattente");
			for (Donneur d : ldattente) { 
				String s = d.getPrenom() + ' ' + d.getNom();
				int id = d.getId(); %>
				
				<li> <a href="Servlet?op=admin&adminbutton=attente&dattente=<%= id%>"> <%= s %>  </a> </li>
			
			<% } %>
		
		
		</ul>

		<div class="col-12">
		          <h2 class="contact-title">Donneurs signalés : </h2>
		        </div>
		<br>
		<ul>
		<%
			Collection<Donneur> lsignale = (Collection<Donneur>) request.getAttribute("donneursignale");
			for (Donneur ds : lsignale) { 
				String ss = ds.getPrenom() + ' ' + ds.getNom();
				int ids = ds.getId(); %>
				
				<li> <a href="Servlet?op=admin&adminbutton=signale&dsignale=<%= ids%>"> <%= ss %>  </a> </li>
			
			<% } %>
		
		
		</ul>
</div></section>

</body>
</html>