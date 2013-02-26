<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="loginUsuario" class="cidc.general.login.Usuario" scope="session" />
<c:import url="/general.jsp"/>
</head>
<body>
<br>
<%if(loginUsuario.isPerfil("10") || loginUsuario.isPerfil("8")){ %>
<table align="center" height="350px" width="100%">
	<tr>
		<td align="center">
		<iframe width="100%" height="100%" frameborder="0" src='<c:url value="/eventos/GestionEvento.x" />'></iframe>
		
	</tr>
</table>
<%} %>
<table width="100%">
<tr>
<td>
<iframe  width="98%" height="270px" frameborder="0" src='<c:url value="/notificaciones/adminNotificacio.x"/>' name="frameOculto" id="frameOculto">
</iframe>
</td>
</tr>
</table>
</body>
</html>