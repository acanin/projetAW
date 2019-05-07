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
    	<p> Creation Profil Donneur </p>
</h1>

<div id="conteneur"> 

<b> Veuillez remplir les informations ci-dessus pour la création de votre profil en tant que donneur.
Votre profil sera en ligne lorsque qu'il sera approuvé par un de nos administrateurs.  </b>

<c>
<form action= "Servlet" method="post">

Taille (en cm) : <input type="text" name="taille"><br/>
Poids (en kg) : <input type="text" name="poids"><br/>
<p> Yeux : </p>

<%
	for (Yeux y : Yeux.allyeux) {
	String s = Yeux.toString(y);
	%>
	<input type = "radio" name="yeux" value = <%= s %>> <%= s %> <br>
<% } %>


<p> Cheveux : </p>
<%
	for (Cheveux y : Cheveux.allcheveux) {
	String s = Cheveux.toString(y);
	%>
	<input type = "radio" name="cheveux" value = <%= s %>> <%= s %> <br>
<% } %>

<p> Couleur de peau : </p>
<%
	for (Peau p : Peau.allpeau) {
	String s = Peau.toString(p);
	%>
	<input type = "radio" name="peau" value = <%= s %>> <%= s %> <br>
<% } %>

<p> Antécédents Médicaux : </p>
<%
	for (AntecedentsMedicaux am : AntecedentsMedicaux.allantmed) {
	String s = AntecedentsMedicaux.toString(am);
	%>
	<input type = "radio" name= "antecedents"  value = <%= s %>> <%= s %> <br>
<% } %>

<p> Loisirs : </p>
<%
	for (Loisirs l : Loisirs.allloisirs) {
	String s = Loisirs.toString(l);
	%>
	<input type = "radio" name="loisirs" value = <%= s %>> <%= s %> <br>
<% } %>

	
	<input type="submit" name="choix" value="Valider">
	<input type="hidden" name = "op" value="validerCreationDonneur">
	<input type="hidden" name = "nom" value = <%= (String) request.getAttribute("nom") %>> 
	<input type="hidden" name = "prenom" value = <%= (String) request.getAttribute("prenom") %>> 
	<input type="hidden" name = "age" value = <%= (String) request.getAttribute("age") %>> 
	<input type="hidden" name = "sexe" value = <%= (String) request.getAttribute("sexe") %>> 
</form>
</c>
</div>
</body>
</html>