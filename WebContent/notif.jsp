<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bébés à tout prix</title>
</head>
<body>

<h4> Notifications </h4>

<%boolean isDonneur = (boolean) request.getAttribute("isDonneur"); 
if (isDonneur) {
	Donneur donneur = (Donneur) request.getAttribute("personne");
	for (Notification notif : donneur.getNotifs()) {
		String s = "n° " + notif.getId() + ": Statut - " + Statu.toString(notif.getStatu());
		%>
		<p> <%= s %> </p>
		<% if (notif.getStatu() == Statu.ATTENTE) { %>
			<li> <a href="Servlet?op=notifDonneur&idReceveur=<%= notif.getReceveur().getId()%>"> <%= s %>  </a> </li>
		<%} else {%>
			<p> <%= s %> </p>
		<%} %>
		
	 <%} %>
	 
	 
<%} else {
	Receveur receveur = (Receveur) request.getAttribute("personne");
	for (Notification notif : receveur.getNotifs()) {
		String s = "n° " + notif.getId() + ": Statut - " + Statu.toString(notif.getStatu());
		%>
		<p> <%= s %> </p>
	<%} %>
<%} %>





</body>
</html>