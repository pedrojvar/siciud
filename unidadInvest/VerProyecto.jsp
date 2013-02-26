<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>

</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<table width="95%" class="tablas" align="center">
	<CAPTION>Datos generales del proyecto</CAPTION>
		<tr>
			<th colspan="4"><b>Nombre de Proyecto</b></th>
		</tr>
		<tr>
			<td colspan="4"><c:out value="${sessionScope.proyectoFacultad.proyecto}"/></td>
		</tr>
		<tr>
			<th colspan="4"><b>Director del Proyecto</b></th>
		</tr>
		<tr>
			<td colspan="4"><c:out value="${sessionScope.proyectoFacultad.director}"/></td>
		</tr>
		<tr>
			<th align="center"><b>Código</b></th>
			<th align="center" width="25%"><b>Fecha Aprobación</b></th>
			<th align="center" width="25%"><b>Fecha Inicio</b></th>
			<th align="center" width="25%"><b>Fecha Finalización</b></th>
		</tr>

		<tr>
			<td align="center"><c:out value="${sessionScope.proyectoFacultad.codigo}"/></td>
			<td align="center" width="25%"><c:out value="${sessionScope.proyectoFacultad.fechaAprobado}" default="----"/></td>
			<td align="center" width="25%"><c:out value="${sessionScope.proyectoFacultad.fechaInicio}" default="----"/></td>
			<td align="center" width="25%"><c:out value="${sessionScope.proyectoFacultad.fechaTerminado}" default="----"/></td>
		</tr>
		<tr>
			<td colspan="4">
				<table width="100%">
					<tr>
						<th width="50%"><b>Grupo/Semillero de Investigación</b></th>
						<th width="50%"><b>Proyecto Curricular</b></th>
					</tr>
					<tr>
						<td width="50%"><c:out value="${sessionScope.proyectoFacultad.nombreGrupo}"/></td>
						<td width="50%"><c:out value="${sessionScope.proyectoFacultad.nombreProyCurr}"/></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<table width="100%">
						<tr>
							<th ><b>Convocatoria</b></th>
							<th width="50px"><b>Estado</b></th>
						</tr>
						<tr>
							<td><p class="parjust"><c:out value="${sessionScope.proyectoFacultad.nombreConvocatoria}"/></p></td>
							<td width="50px">
								<c:out value="${sessionScope.proyectoFacultad.estado}"/>
							</td>
						</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>