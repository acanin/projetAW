<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action= "Servlet" method="post">
Bonjour, vous pouvez rechercher un centre à partir de sa ville ou d'un médecin travaillant de ce centre :
<p>Selectionnez votre mode de recherche:</p>
<p>
<input type = "radio" name="mode" value="medecin"> Medecin
<input type = "radio" name="mode" value="ville"> Ville</p>

<p><input type="text" name="texte"></p>

<p><input type="submit" class="main_btn" name="choix" value="Valider"></p>
<input type="hidden" name = "op" value="rechercherCentre">

</form>
</body>
</html>