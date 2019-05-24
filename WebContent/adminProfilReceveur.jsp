<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profil Receveur</title>
</head>
<body>

<form method="post"  action="Servlet"> 
<%Receveur r = (Receveur) request.getAttribute("receveur");
  String nom = r.getNom();
  String prenom = r.getPrenom();
  int age = r.getAge();%>
  
  <p>Nom : <%= nom %></p>
  <p>Prenom : <%= prenom %></p>
  <p>Age : <%= age %></p>
  


<p><input type="submit" name="choix" value="Supprimer"></p>
<p><input type="submit" name="choix" value="Retour"></p>
<input type="hidden" name = "op" value = "adminProfilReceveur"> 
<input type="hidden" name = "idReceveur" value="<%=r.getId()%>">


</form> 





</body>
</html>