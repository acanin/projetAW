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

			
			<% Medecin med = (Medecin) request.getAttribute("med");
			String nom = med.getNom();
			String spe = Specialite.toString(med.getSpecialisation());
			
			String civilite = nom;
			if (med.isSexe()) {
				civilite = "Madame " + nom;
			} else {
				civilite = "Monsieur " + nom;
			}
			
			Centre c = med.getOwner();
			String centre = c.getNom() +" à " + c.getVille();
			
			%>
			
              <h2>Bienvenue sur le profil de  <%= civilite %> </h2>
            
            </div>
            <div class="page_link">
              <a href="index.html">Accueil</a>
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
          <h2 class="contact-title"> Informations sur <%= civilite %> :</h2>
        
  
	 <br><br>
	
	<p> <%= civilite %> est <%= spe%> dans notre centre <%=centre %>. </p>
	</div></div>
	</section>
</body>
</html>