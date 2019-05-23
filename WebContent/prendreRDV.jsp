<%@ page language="java"  import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bébés à tout prix</title>
</head>
<body>

<p> Prise de Rendez-vous </p>

<form action= "Servlet" method="post">

<% if ((boolean) request.getAttribute("rdvpris")) { %>
<p> Ce creneau est déjà pris avec ce médecin. Sélectionnez-en un autre. </p>
<%} %>

Veuillez choisir un centre et un medecin : 

<% Collection<Centre> lc = (Collection<Centre>) request.getAttribute("lc");
for (Centre	 centre : lc) {
	String s = centre.getNom()+'('+centre.getVille()+')';
	Collection <Medecin> med = centre.getListemedecin();
	%>
	<p> <%= s %> </p>
	
	<%for (Medecin m : med) { 
		String str_med = "Medecin " + m.getNom() + ", " + Specialite.toString(m.getSpecialisation());%>
		<p> <input type = "radio" name="medecin" value = <%= m.getId() %>> <%= str_med %> </p>
	<% }
	%>
	
<% } %>


<p> Veuillez choisir un horaire : </p>
<%for (int i = 9; i<19;i++) { %>
	
	<p> <input type = "radio" name="heure" value = <%= i %>> <%= i %> h </p>
<% } %>

<p> Veuillez choisir un mois : </p>
<%for (int i = 1; i<13;i++) { %>
	
	<p> <input type = "radio" name="mois" value = <%= i %>> <%= i %> </p>
<% } %>

<p> Veuillez choisir un jour : </p>
<%for (int i = 1; i<32;i++) { %>
	
	<p> <input type = "radio" name="jour" value = <%= i %>> <%= i %> </p>
<% } %>


<input type="submit" class="main_btn" name="choix" value="Valider">
<input type="hidden" name = "op" value="ValiderRDV">
<input type="hidden" name = "donneur" value="<%= session.getAttribute("id") %>" >
</form>


</body>
</html>