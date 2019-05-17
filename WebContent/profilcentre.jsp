<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bébés à tout prix</title>
</head>
<body>

<% Centre centre = (Centre) request.getAttribute("centre");
String nom = centre.getNom();
//int taux = 100;//centre.getNb_succes()/centre.getNb_essais();
%>

<p> Bienvenue sur le profil du centre <%=nom %> </p>

<p> Nous sommes basés à <%= centre.getAdresse() %> à <%= centre.getVille() %>. </p>

<% if (centre.getNb_essais() != 0) {
	int taux = centre.getNb_succes()/centre.getNb_essais();%>

<p> A l'heure actuelle, nous avons un taux de réussite de <%= taux %> sur <%= centre.getNb_essais() %> essais. </p>

<% } %>

<p> N'hésitez pas à prendre rendez-vous avec nos medecins. </p>

<form action= "Servlet" method="post">
	<input type="submit" name="button" value="PrendreRDV">
	<input type="hidden" name = "op" value="profilcentre">
	<input type="hidden" name = "idc" value="<%= centre.getId() %>">
	
</form>


Les médecins travaillant chez nous : 
<ul>

<%
	Collection<Medecin> lm = (Collection<Medecin>) request.getAttribute("lm");
	for (Medecin m : lm) { 
		String s = "Medecin " + m.getNom() + ", " + Specialite.toString(m.getSpecialisation());
		int id = m.getId(); %>
		
		<li> <a href="Servlet?op=profilcentre&button=rien&medecin=<%= id%>"> <%= s %>  </a> </li>
	
	<% } %>


</ul>



</body>
</html>