<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<script type="text/javascript" language="javascript" src='<c:url value="/comp/js/lytebox.js"/>'></script>
<link rel="stylesheet" href='<c:url value="/comp/css/lytebox.css"/>' type="text/css" media="screen" />
<c:import url="/general.jsp"/>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>
	<table align="center">
		<tr>
			<td>
				<a href='<c:url value="/unidadInvest/AdminUnidadFacultad.x?accion=6&idGrupo=${requestScope.idGrupo}"/>'target="_parent" rel="lyteframe" title="Integrantes Grupo Investigación"
   rev="width: 500px; height: 350px; scrolling: auto;"><img border="0" src="<c:url value="/comp/img/Integrantes.gif"/>"></a>
			</td>
		</tr>
	</table>
	<br>
	<form name="nuevo" method="post">
	<table class="tablas" align="center" width="85%">
	<CAPTION>Información Principal</CAPTION>
	<input type="hidden" name="accion" value="5">
	<input type="hidden" name="codigo" value='<c:out value="${sessionScope.grupo.codigo}"/>'>
		<tr>
			<td align="center">
				<table align="center" width="100%">
					<tr>

					</tr>
					<tr>
						<td colspan="4" class="renglones"><b>Nombre Grupo/Semillero Investigación</b></td>
					</tr>
					<tr>
						<td colspan="4"><c:out value="${sessionScope.grupo.nombre}" /></td>
					</tr>
					<tr>
						<td class="renglones"><b>Siglas</b></td>
						<td><c:out value="${sessionScope.grupo.siglas}"/></td>
						<td class="renglones"><b>Director</b></td>
						<td><c:out value="${sessionScope.grupo.dirNombre}"/> <c:out value="${sessionScope.grupo.dirApellido}"/></td>
					</tr>
					<tr>
						<td colspan="2" class="renglones"><b>Fecha de Creación</b></td>
						<td class="renglones"><b>Categoría Colciencias</b></td>
						<td class="renglones"><b>Facultad:</b></td>
					</tr>
					<tr>
						<td colspan="2"><c:out value="${sessionScope.grupo.fechaCreacion}"/></td>
						<td>
								<c:if test="${sessionScope.grupo.categoria==1}">Sin Clasificación</c:if>
								<c:if test="${sessionScope.grupo.categoria==2}">Institucionalizado en UD </c:if>
								<c:if test="${sessionScope.grupo.categoria==6}">Reconocido - Colciencias </c:if>
								<c:if test="${sessionScope.grupo.categoria==7}">D - Colciencias </c:if>
								<c:if test="${sessionScope.grupo.categoria==3}">C - Colciencias </c:if>
								<c:if test="${sessionScope.grupo.categoria==4}">B - Colciencias </c:if>
								<c:if test="${sessionScope.grupo.categoria==5}">A - Colciencias </c:if>
								<c:if test="${sessionScope.grupo.categoria==8}">A1 - Colciencias </c:if>
						</td>
						<td>
								<c:if test="${sessionScope.grupo.facultad==1}">Tecnológica </c:if>
								<c:if test="${sessionScope.grupo.facultad==2}">Ingeniería </c:if>
								<c:if test="${sessionScope.grupo.facultad==3}">Medio Ambiente y Recursos Naturales </c:if>
								<c:if test="${sessionScope.grupo.facultad==4}">Educación </c:if>
								<c:if test="${sessionScope.grupo.facultad==5}">Asab </c:if>
						</td>
					</tr>
					<tr>
						<td colspan="5" class="renglones"><b>Correo Electrónico</b></td>
					</tr>
					<tr>
						<td colspan="4"><c:out value="${sessionScope.grupo.mail}"/></td>
					</tr>
					<tr>
						<td colspan="4" class="renglones"><b>Página Web</b></td>
					</tr>
					<tr>
						<td colspan="4"><c:out value="${sessionScope.grupo.web}"/></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</body>
</html>