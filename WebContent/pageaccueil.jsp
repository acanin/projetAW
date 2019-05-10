<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" media="screen" type="text/css" href="CreationComptestyle.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bébés à tout prix</title>
</head>
<body>

<h1 id="header">
    	Bébé à tout prix
    	<p> Pade d'Accueil </p>
</h1>

<div id="conteneur"> 

	<c>
	
	<form action= "Servlet" method="post">
	<b> Bonjour  
	<%
	String n = (String) request.getAttribute("nom");
	String p = (String) request.getAttribute("prenom");
	%>
	<%= n  %> 
	<%= p  %> <br> 
	
	</b>

	
	
		<input type="submit" name="choix" value="Rechercher Donneur">
		<input type="submit" name="choix" value="Bouton2">
		<input type="hidden" name = "op" value="pageaccueil">
		<input type="hidden" name = "nom" value = <%= (String) request.getAttribute("nom") %>> 
		<input type="hidden" name = "prenom" value = <%= (String) request.getAttribute("prenom") %>> 
		
		
	</form>
	</c>
</div>
</body>
</html>