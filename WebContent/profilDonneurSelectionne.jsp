<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" media="screen" type="text/css" href="CreationComptestyle.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1 id="header">
    	Bébé à tout prix
    	<p> Voici le profil du donneur que vous avez selectionne </p>
</h1>

<div id="conteneur"> 
	
	<% Donneur donneur = (Donneur) request.getAttribute("donneur");
	String nom = donneur.getNom();
	String prenom = donneur.getPrenom();
	//int taux = 100;//centre.getNb_succes()/centre.getNb_essais();
	%>
	<p> Bienvenue sur le profil du donneur <%=nom + " " + prenom %> </p>
		
	</form>
	</c>
</div>
</body>
</html>