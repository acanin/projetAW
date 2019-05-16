<%@ page language="java" import = "java.util.*, pack.*, enumerations.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bébés à tout prix</title>
</head>
<body>



<ul>

<%
	Collection<Centre> lc = (Collection<Centre>) request.getAttribute("lc");
	for (Centre c : lc) { 
		String s = "Centre " + c.getNom() + " à " + c.getVille();
		int id = c.getId(); %>
		
		<li> <a href="Servlet?op=listeC&centre=<%= id%>"> <%= s %>  </a> </li>
	
	<% } %>


</ul>



</body>
</html>