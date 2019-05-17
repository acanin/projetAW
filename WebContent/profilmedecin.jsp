<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bébés à tout prix</title>
</head>
<body>

<% Medecin med = (Medecin) request.getAttribute("med");
String nom = med.getNom();
String spe = Specialite.toString(med.getSpecialisation());

String civilite = nom;
if (med.isSexe()) {
	civilite = "Madame " + nom;
} else {
	civilite = "Monsieur " + nom;
}

Centre c = med.getOwner();
String centre = c.getNom() +" à " + c.getVille();

%>


<p> Bienvenue sur le profil de <%= civilite %>. </p>

<p> <%= civilite %> est <%= spe%> dans notre centre <%=centre %>.


</body>
</html>