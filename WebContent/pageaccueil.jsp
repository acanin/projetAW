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
               <form action= "Servlet" method="post">
				<h2> Bienvenue,
				<%
					HttpSession s = request.getSession(false);
			
					
					String n = (String) session.getAttribute("nom");
					String p = (String) session.getAttribute("prenom");
				%>
					
					<%= p  %> <%= n  %> !
				</h2></form> 
            
            </div>
            <div class="page_link">
              <a href="index.html"> Accueil</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

 <section class="contact-section area-padding">
    <div class="container"> 
        <div class="col-12">
          <h2 class="contact-title"> Que voulez-vous faire ?</h2>
        </div>

		<form action= "Servlet" method="post">
			<br>
		<p> Nous avons actuellement 
		<% Collection<Donneur> ld = (Collection<Donneur>) request.getAttribute("listedonneur");
			int nb_donneur = ld.size(); %>
			
			<%= nb_donneur  %> donneurs disponibles dans tous nos centres. Cela vous intéresse ?<br>
		
		<br><br>
			<input type="submit" class = "main_btn" name="choix" value="Rechercher Donneur">

			<input type="submit" class = "main_btn" name="choix" value="Rechercher Centre">

			<input type="submit" class = "main_btn" name="choix" value="Mon Compte">

			<input type="hidden" name = "op" value="pageaccueil">
			
			
		</form>
		
	</div>
</section>
</body>
</html>