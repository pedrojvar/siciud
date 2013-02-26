<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
<script>

</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<form action='<c:url value="/adminAsignacion/AsignaEvaluador.x"/>'>
	<input type="hidden" name="producto" value="2"/>
		<table align="left">
			<tr>
				<td><input type="submit" value="Atrás"></td>
			</tr>
		</table>
	</form>
	<br><br>
	<table class="tablas" align="center" width="400px">
	<caption>Datos de Evaluador</caption>
	<c:if test="${requestScope.datEvaluador.tipo==1}">
		<tr>
			<td class="renglones"><b>Nombres</b></td>
			<td><c:out value="${requestScope.datEvaluador.nombres}"/></td>
		</tr>
		<tr>
			<td class="renglones"><b>Apellidos</b></td>
			<td><c:out value="${requestScope.datEvaluador.apellidos}"/></td>
		</tr>
		<tr>
			<td class="renglones"><b>Mail</b></td>
			<td><c:out value="${requestScope.datEvaluador.mail}"/></td>
		</tr>
		<tr>
			<td class="renglones"><b>Teléfono</b></td>
			<td><c:out value="${requestScope.datEvaluador.telefono}"/></td>
		</tr>
		<tr>
			<td class="renglones"><b>Celular</b></td>
			<td><c:out value="${requestScope.datEvaluador.celular}"/></td>
		</tr>
		<tr>
			<td class="renglones"><b>Facultad</b></td>
			<td><c:out value="${requestScope.datEvaluador.facultad}"/></td>
		</tr>
		<tr>
			<td class="renglones"><b>Proy.Curricular</b></td>
			<td><c:out value="${requestScope.datEvaluador.proyectoCur}"/></td>
		</tr>
		<tr>
			<td colspan="2" class="renglones"><b>Grupo de Investigación</b></td>
		</tr>
		<tr>
			<td colspan="2"><c:out value="${requestScope.datEvaluador.grupoInvest}"/></td>
		</tr>
	</c:if>

	<c:if test="${requestScope.datEvaluador.tipo==2}">
		<tr>
			<td class="renglones"><b>Nombres</b></td>
			<td><c:out value="${requestScope.datEvaluador.nombres}"/></td>
		</tr>
		<tr>
			<td class="renglones"><b>Apellidos</b></td>
			<td><c:out value="${requestScope.datEvaluador.apellidos}"/></td>
		</tr>
		<tr>
			<td class="renglones"><b>Mail</b></td>
			<td><c:out value="${requestScope.datEvaluador.mail}"/></td>
		</tr>
		<tr>
			<td class="renglones"><b>Teléfono</b></td>
			<td><c:out value="${requestScope.datEvaluador.telefono}"/></td>
		</tr>
		<tr>
			<td class="renglones"><b>Celular</b></td>
			<td><c:out value="${requestScope.datEvaluador.celular}"/></td>
		</tr>
	</c:if>
		<tr>
			<td colspan="2">
			<table class="tablas" align="center" width="400px">
				<tr>
					<td class="renglones"><b>Area de Trabajo</b></td>
					<td class="renglones"><b>Campos</b></td>
				</tr>
				<c:forEach	begin="0" items="${requestScope.datEvaluador.areasTrabajo}" var="areas">
				<tr class="color">
					<td><c:out value="${areas.area}"/></td>
					<td><c:out value="${areas.campos}"/></td>
				</tr>
				</c:forEach>
			</table>
			</td>
		</tr>
	</table>

</body>
</html>