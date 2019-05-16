<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" media="screen" type="text/css" href="CreationComptestyle.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1 id="header">
    	Bébé à tout prix
    	<p> Voici les résultats </p>
</h1>

<div id="conteneur"> 

	<c>
	
	<form action= "Servlet" method="post">
	<b> 
	<%
	//String y = (String) request.getAttribute("yeuxR");
	//String c = (String) request.getAttribute("cheveuxR");
	//String p = (String) request.getAttribute("peauR");
	//String am = (String) request.getAttribute("amR");
    String l = (String) request.getAttribute("loisirR");
	%>
	<%= l %>
	 <br>

	</b>
	
	Voici les donneurs qui vous sont compatibles :
	<ul>
		
	<% Collection<Donneur> ld = (Collection<Donneur>)request.getAttribute("listedonneurCompatible");
	
	for (Donneur d : ld){ %>
		
		<li> <a href="Servlet?op=afficherDonneurSelectionne&personne<%= d.getId() %>"><%= d.getNom() + " - " + d.getPrenom() %></a> </li>
		
	<%  }%>
	
	</ul>
		<input type="submit" name="choix" value="Retour Accueil">
		<input type="submit" name="choix" value="Bouton2">
		<input type="hidden" name = "op" value="afficherDonneurSelectionne">
		<input type="hidden" name = "nom" value = <%= (String) request.getAttribute("nom") %>> 
		<input type="hidden" name = "prenom" value = <%= (String) request.getAttribute("prenom") %>> 
		
		
	</form>
	</c>
</div>
</body>
</html>