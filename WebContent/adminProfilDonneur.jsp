<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bébés à tout prix</title>
</head>
<body>

<% Donneur donneur =  (Donneur) request.getAttribute("donneur");
boolean attente = (boolean) request.getAttribute("attente");
String nom = donneur.getPrenom() + ' ' + donneur.getNom();
String status = null;
String val = null;

if (attente){
	status = "est en attente de confirmation par un administrateur.";
	val = "oui";
} else {
	status = "a été signalé par un de nos receveurs.";
	val = "non";
}

%>

<p> Profil du donneur <%= nom %> <p>

<p> Ce donneur <%= status%>

<form action= "Servlet" method="post">

<% if (attente) {%>

<label for="confirmation">Confirmer ajout au site :</label><input type="radio" name= "confirmation" value = "Oui"> Oui
											<input type="radio" name= "confirmation" value = "Non"> Non </p>


<%} else {%>

<label for="confirmation">Supprimer du site :</label><input type="radio" name= "confirmation" value = "Oui"> Oui
											<input type="radio" name= "confirmation" value = "Non"> Non </p>

<%} %>

<input type="submit" name="adminbutton" value="valider">

<input type="hidden" name = "op" value="Confirmer/Supprimer">
<input type="hidden" name = "attente" value="<%=val%>">
<input type="hidden" name = "donneur" value="<%=donneur.getId()%>">

</form>

</body>
</html>