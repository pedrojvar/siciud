<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<c:import url="/general.jsp"/>
<script>

	function ver(id){
		document.lista.action='<c:url value="/unidadInvest/AdminUnidadFacultad.x"/>';
		document.lista.codigo.value=id;
		document.lista.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>
	<c:if test="${!empty requestScope.listaIntegrantes}">
	<form name="lista">
	<input type="hidden" name="accion" value="7">
	<input type="hidden" name="codigo" value="">
	<table align="center">
		<tr>
			<td align="center"><b><c:out value="${sessionScope.grupo.nombre}"/></b></td>
		</tr>
	</table>
	<br>
	<table class="tablas" align="center" width="450px">
	<caption>Listado de Integrantes</caption>
		<tr>
			<td align="center" class="renglones"><b>Nombres</b></td>
			<td align="center" class="renglones"><b>Apellidos</b></td>
			<td width="80px" align="center" class="renglones"><b>Papel</b></td>
			<td width="20px" align="center" class="renglones"><b>Activo</b></td>
			<td width="50px" align="center" class="renglones"><b>Ver</b></td>
		</tr>
	<c:forEach begin="0" items="${requestScope.listaIntegrantes}" var="lista">
		<tr>
			<td><c:out value="${lista.nombres}"/></td>
			<td><c:out value="${lista.apellidos}"/></td>
			<td width="80px">
				<c:if test='${lista.papel=="1"}'>Director</c:if>
				<c:if test='${lista.papel=="2"}'>Prof Planta</c:if>
				<c:if test='${lista.papel=="4"}'>Prof TCO</c:if>
				<c:if test='${lista.papel=="5"}'>Prof MTO</c:if>
				<c:if test='${lista.papel=="6"}'>Prof HC</c:if>
				<c:if test='${lista.papel=="8"}'>Lider Semillero</c:if>
				<c:if test='${lista.papel=="3"}'>Estudiante</c:if>
				<c:if test='${lista.papel=="9"}'>Invitado</c:if>
				<c:if test='${lista.papel=="10"}'>Egresado</c:if>
			</td>
			<c:if test="${lista.fechaSalida!=null}">
				<td width="20px" align="center"><img src='<c:url value="/comp/img/Inactivo.png"/>'></td>
			</c:if>
			<c:if test="${lista.fechaSalida==null}">
				<td width="20px" align="center"><img src='<c:url value="/comp/img/Activo.png"/>'></td>
			</c:if>
			<td width="50px"><img src='<c:url value="/comp/img/VerProy.gif"/>' onclick='ver(<c:out value="${lista.id}"/>)'></td>
		</tr>
	</c:forEach>
	</table>
	</form>
	</c:if>
	<c:if test="${empty requestScope.listaIntegrantes}">
	<h5 align="center">No hay integrantes en este grupo/semillero de investigación</h5>
	</c:if>
</body>
</html>