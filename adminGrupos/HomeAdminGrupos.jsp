<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<c:import url="/general.jsp"/>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br><br><br><br>
	<form name="frmBusquedas" action='<c:url value="/adminGrupos/AdminGrupos.x" />' method="post">
		<input type="hidden" name="accion" value="">
		<table align="center">
			<tr>
				<td align="center" colspan="2">
				<a href='<c:url value="/adminGrupos/NuevoGrupo.jsp"/>'><img border="0" src="<c:url value="/comp/img/CrearGrupo.gif"/>"></a>
				</td>
			</tr>
			<tr>
				<td><br><br></td>
			</tr>
			<tr>
				<td><a href='<c:url value="/adminGrupos/AdminGrupos.x?accion=2" />'><img border="0" src="<c:url value="/comp/img/BuscarGrupo.gif"/>" ></a></td>
				<td><a href='<c:url value="/adminGrupos/ListaPersonas.jsp"/>'><img border="0" src="<c:url value="/comp/img/BuscarPersona.gif"/>" ></a></td>
			</tr>
		</table>
	</form>
</body>
</html>