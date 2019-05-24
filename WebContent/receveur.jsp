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
<%Receveur receveur = (Receveur) request.getAttribute("receveur");
String prenom = receveur.getPrenom();
int age = receveur.getAge();
boolean femme = receveur.isSexe();
String idnotif = (String) request.getAttribute("idn");
%>

Notification n° <%= idnotif %>

<p> Statut : En Attente d'acceptation </p>

<p> Profil receveur </p>

<p> <%= prenom %></p>

<p> <%= age %> ans </p>

<p> <% if (femme) { %> Sexe : Femme <%} else { %> Sexe : Homme <%} %> </p>

<label for="accpeter">Accepter la notification :
						</label><input type="radio" name= "accepter" value = "Oui"> Oui
								<input type="radio" name= "accepter" value = "Non"> Non 
								

<input type="submit" class = "main_btn" name="button" value="Valider">

<input type="hidden" name = "op" value="profilreceveur">
<input type = "hidden" name = "idnotif" value = "<%= idnotif %>">
<input type = "hidden" name = "idd" value = "<%= session.getAttribute("id") %>">


</form>
</body>
</html>