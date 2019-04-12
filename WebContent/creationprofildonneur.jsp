<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bébés à tous prix</title>
</head>
<body>

Veuillez remplir les informations ci-dessus pour la création de votre profil en tant que donneur.<br>
Votre profil sera en ligne lorsque qu'il sera approuvé par un de nos administrateurs. <br>

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
	<input type = "radio" name= <%= s %>  value = <%= s %>> <%= s %> <br>
<% } %>

<p> Loisirs : </p>
<%
	for (Loisirs l : Loisirs.allloisirs) {
	String s = Loisirs.toString(l);
	%>
	<input type = "radio" name=<%= s %> value = <%= s %>> <%= s %> <br>
<% } %>

	<input type="submit" name="choix" value="Valider">
	<input type="hidden" name = "op" value="validerCreationDonneur">
</form>

</body>
</html>