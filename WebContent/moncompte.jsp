<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	HttpSession ses = request.getSession(false);

	String nom = (String) ses.getAttribute("nom");
	String prenom = (String) ses.getAttribute("prenom");
	boolean isDonneur = (boolean) ses.getAttribute("isDonneur");
	
%>

	Compte de <%= prenom %> <%= nom %>
	
	
	<form action= "Servlet" method="post">
	
	<input class="form-control" name="mail" type"text" placeholder="Mail">
	
	<input class="form-control" name="mdp" type"text" placeholder="Mot de passe">
	
	<input class="form-control" name="age" type"text" placeholder="Age">
    
    <% if (isDonneur) { %>    
    <input class="form-control" name="taille" type="text" placeholder="Taille (cm)">
    
    <input class="form-control" name="poids" type="text" placeholder="Poids (kg)">
    <% } %>
    
    <br>
    <input type="radio" name= "sexe" value = "Femme"> Femme
    <br>
	<input type="radio" name= "sexe" value = "Homme"> Homme
	
	<br><br>
	<% if (!isDonneur) { %>
	<input class="form-control" name="nbSucces" type="text" placeholder="Nombre de grossesses réussies">
	<input class="form-control" name="nbEchecs" type="text" placeholder="Nombre de fausses couches">
	<% } %>
	
	<% if (isDonneur) { %>
	<input type="radio" name= "dispo" value = "yes"> Disponible
	<input type="radio" name= "dispo" value = "no"> Indisponible
	
	
	<p> Cheveux : </p>
	<%
		for (Cheveux y : Cheveux.allcheveux) {
		String s = Cheveux.toString(y);
		%>
		<input type = "radio" name="cheveux" value = <%= s %>> <%= s %> 
	<% } %>
	
	
	<p> Antécédents Médicaux : </p>
	<%
		for (AntecedentsMedicaux am : AntecedentsMedicaux.allantmed) {
		String s = AntecedentsMedicaux.toString(am);
		%>
		<input type = "radio" name= "antecedents"  value = <%= s %>> <%= s %>
	<% } %>
	
	
	<p> Loisirs : </p>
	<%
		for (Loisirs l : Loisirs.allloisirs) {
		String s = Loisirs.toString(l);
		%>
		<input type = "radio" name="loisirs" value = <%= s %>> <%= s %>
	<% } %>
	 
    <% } %>   
		<input type="submit" class="main_btn" name="choix" value="Valider">
		<input type="hidden" name = "op" value="modifierMonCompte">
	
	</form>

</body>
</html>