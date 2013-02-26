<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<c:import url="/general.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="/siciud/comp/css/formatos.css" rel="stylesheet" type="text/css">
</head>
<body >
<br>

<table align="center" width="95%">
	<tr>
		<td align="center"><img src="/siciud/comp/img/TextoBienvenido.gif"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><br><a href='<c:url value="/Documentos/InstructivoDirector.pdf"/>'><img border="0" src='<c:url value="/comp/img/pdf.png"/>'> Instructivo Directores de Grupos y/o Semilleros de Investigación</a></td>
	</tr>
</table>
<p align="center" class="texto4"><b><c:out value="${sessionScope.grupo.nombre}" default="--" /></b></p>
<p align="center" class="texto4"><b>Bienvenido(a) <c:out value="${sessionScope.loginUsuario.nombre}" default="--" /></b></p>

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

