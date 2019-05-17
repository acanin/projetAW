<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1 id="header">
    	Bébé à tout prix
    	<p> Connexion </p>
</h1>

<c>
	<form action="Servlet" method="post">
		<p><label for="identifiant">Identifiant : </label><input type="text" name="identifiant" /></p>
		
		<p><label for="mdp">Mot de passe : </label><input type="text" name="mdp" /></p>
		
		<input type="submit" name="operation" value="Se connecter">
		
		<input type="hidden" name = "op" value = "connexioncompte"> 

	</form>
	
	
	<%
	boolean checkFailed = (boolean) request.getAttribute("checkfailed");
	if (checkFailed) {
		%> <b>Utilisateur non reconnu<br> <%
	}
	%>
		
</c>

</body>
</html>