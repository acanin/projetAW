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

	<input type="submit" name="adminbutton" value="Nouveau medecin">
	<input type="submit" name="adminbutton" value="Ouverture d'un centre">
	<input type="submit" name="adminbutton" value="listercentre">
	
	<input type="hidden" name = "op" value="admin">

</form>

<ul>
Donneurs en attente d'approbation :
<%
	Collection<Donneur> ldattente = (Collection<Donneur>) request.getAttribute("donneurattente");
	for (Donneur d : ldattente) { 
		String s = d.getPrenom() + ' ' + d.getNom();
		int id = d.getId(); %>
		
		<li> <a href="Servlet?op=admin&adminbutton=attente&dattente=<%= id%>"> <%= s %>  </a> </li>
	
	<% } %>


</ul>


<ul>
Donneurs signalés :
<%
	Collection<Donneur> lsignale = (Collection<Donneur>) request.getAttribute("donneursignale");
	for (Donneur ds : lsignale) { 
		String ss = ds.getPrenom() + ' ' + ds.getNom();
		int ids = ds.getId(); %>
		
		<li> <a href="Servlet?op=admin&adminbutton=signale&dsignale=<%= ids%>"> <%= ss %>  </a> </li>
	
	<% } %>


</ul>


</body>
</html>