<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<br><br>
<h4 align="center">Bienvenido <c:out value="${sessionScope.loginUsuario.nombre}" default="--" /></h4>

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