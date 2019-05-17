<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bébés à tout prix</title>
</head>
<body>

<form action= "Servlet" method="post">

Nom  : <input type="text" name="nom"><br/>

<label for="sexe">Sexe :</label><input type="radio" name= "sexe" value = "Femme"> Femme
											<input type="radio" name= "sexe" value = "Homme"> Homme </p>

<p> Spécialisation : </p>
<%
	for (Specialite sp : Specialite.allspe) {
	String spe = Specialite.toString(sp);
	%>
	<input type = "radio" name="specialite" value = <%= spe %>> <%= spe %> <br>
<% } %>

<p> Centre associé </p>
<%Collection<Centre> lc = (Collection<Centre>) request.getAttribute("lc");
	for (Centre c : lc) {
		int id = c.getId();
		String s = c.getNom() + " à " + c.getVille();
		%>
		<input type = "radio" name="idcentre" value = <%= id %>> <%= s %> <br>
	<% } %>
	

<input type="submit" name="choix" value="Valider">
<input type="hidden" name = "op" value="creationmedecin">


</form>

</body>
</html>