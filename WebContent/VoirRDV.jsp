<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post"  action="Servlet"> 

Votre liste de RDV :
<p>
<%Donneur donneur =  (Donneur) request.getAttribute("donneur"); %>
<% Collection<RDV> lrdv = donneur.getRdv();
      for (RDV rdv : lrdv) {
        Medecin m = rdv.getMedecin();
        String med = m.getNom() + ", " + Specialite.toString(m.getSpecialisation()) + " (" + m.getOwner().getNom() +")";
        String rdv_string = rdv.getJour() + "/" + rdv.getMois() + " à " + rdv.getHeure() + "h avec " + med;%>
        	  <p> <%= rdv_string %> </p>
<%} %>




<p><input type="submit" name="choix" value="Retour"></p>
<input type="hidden" name = "op" value = "voirRDV"> 


</form> 

</body>
</html>