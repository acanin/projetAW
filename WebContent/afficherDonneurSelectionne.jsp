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
	String y = (String) request.getAttribute("yeuxR");
	String c = (String) request.getAttribute("cheveuxR");
	String p = (String) request.getAttribute("peauR");
	String am = (String) request.getAttribute("amR");
	String l = (String) request.getAttribute("loisirR");
	
	%>
	<%= y  %> 
	<%= c  %>
	<%= p  %> 
	<%= am %>
	<%= l  %> <br> 
	
	</b>
	
	<% Collection<Donneur> ld = (Collection<Donneur>)request.getAttribute("listedonneur");
	Yeux yeux = Yeux.toCaracteristiques(y);
	for(Donneur d : ld){
		if (d.getYeux() == yeux){ %>
			<li> <%= "ok cette personne est compatible" %></li>
		<% } else {%>
		  		Il n'y a malheureusement aucun donneur qui correspond à vos caractéristiques.
			
		<% }%>

	<% }%>


	
	
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