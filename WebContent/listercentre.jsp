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

<ul>

<%
	Collection<Centre> lc = (Collection<Centre>) request.getAttribute("");
	for (Centre c : lc) {
		
		%>
	<% } %>


</ul>

</form>

</body>
</html>