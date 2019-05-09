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
</h1>

<div id="conteneur"> 
<b>Veuillez selectionner les caractéristiques que vous recherchées :  </b>



	<form action= "Servlet" method="post">
	
	<b><p> Yeux : </p></b>
	
	<%
		for (Yeux y : Yeux.allyeux) {
		String s = Yeux.toString(y);
		%>
		<input type = "radio" name="yeuxRecherche" value = <%= s %>> <%= s %> <br>
	<% } %>
	
	
	<b><p> Cheveux : </p></b>
	
	<%
		for (Cheveux y : Cheveux.allcheveux) {
		String s = Cheveux.toString(y);
		%>
		<input type = "radio" name="cheveuxRecherche" value = <%= s %>> <%= s %> <br> 	
	<% } %>

	
	
	<b><p> Couleur de peau : </p></b>
	<%
		for (Peau p : Peau.allpeau) {
		String s = Peau.toString(p);
		%>
		<input type = "radio" name="peauRecherche" value = <%= s %>> <%= s %> <br> 
	<% } %>
	
	<b><p> Antécédents Médicaux : </p></b>
	<%
		for (AntecedentsMedicaux am : AntecedentsMedicaux.allantmed) {
		String s = AntecedentsMedicaux.toString(am);
		%>
		<input type = "radio" name="antecedentRecherche" value = <%= s %>> <%= s %> <br> 
	<% } %>
	
	<b><p> Loisirs : </p></b>
	<%
		for (Loisirs l : Loisirs.allloisirs) {
		String s = Loisirs.toString(l);
		%>
		<input type = "radio" name="loisirRecherche" value = <%= s %>> <%= s %> <br> 
	<% } %>
	<br>
		<d>
		<input type="submit" name="choix" value="Valider">
		<input type="submit" name="choix" value="Annuler">
		</d>
		<input type="hidden" name = "op" value="rechercherDonneur">
	</form>
	



</div>
</body>
</html>