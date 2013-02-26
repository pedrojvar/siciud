<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<c:import url="/general.jsp"/>
<script>
	function guardar(){
		document.nuevo.action='<c:url value="/grupos/llenar.jsp"/>';
		document.nuevo.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>
	<table align="center">
		<tr>
			<td align="center"><b><c:out value="${sessionScope.infoGrupo.nombre}" /></b></td>
		</tr>
	</table>
	<br>
	<form name="nuevo" method="post">
	<input type="hidden" name="accion" value="5">
	<input type="hidden" name="codigo" value='<c:out value="${sessionScope.infoGrupo.codigo}"/>'>
	<table align="center" class="tablas" width="70%">
		<CAPTION>Información Grupo de Investigación</CAPTION>
		<tr>

		</tr>
		<tr>
			<th colspan="3"><b>Nombre Grupo/Semillero Investigación</b></th>
		</tr>
		<tr>
			<td colspan="3"><c:out value="${sessionScope.infoGrupo.nombre}" /></td>
		</tr>
		<tr>
			<th><b>Siglas</b></th>
			<th colspan="2"><b>Director</b></th>
		</tr>
		<tr>
			<td><c:out value="${sessionScope.infoGrupo.siglas}"/></td>
			<td colspan="2"><c:out value="${sessionScope.infoGrupo.dirNombre}"/> <c:out value="${sessionScope.infoGrupo.dirApellido}"/></td>
		</tr>
		<tr>
			<th><b>Fecha de Creación</b></th>
			<th><b>Categoría Colciencias</b></th>
			<th><b>Facultad:</b></td>
		</tr>
		<tr>
			<td align="center"><c:out value="${sessionScope.infoGrupo.fechaCreacion}"/></td>
			<td align="center">
					<c:if test="${sessionScope.infoGrupo.categoria==1}">Sin Clasificación</c:if>
					<c:if test="${sessionScope.infoGrupo.categoria==2}">Institucionalizado en UD </c:if>
					<c:if test="${sessionScope.infoGrupo.categoria==6}">Reconocido - Colciencias </c:if>
					<c:if test="${sessionScope.infoGrupo.categoria==7}">D - Colciencias </c:if>
					<c:if test="${sessionScope.infoGrupo.categoria==3}">C - Colciencias </c:if>
					<c:if test="${sessionScope.infoGrupo.categoria==4}">B - Colciencias </c:if>
					<c:if test="${sessionScope.infoGrupo.categoria==5}">A - Colciencias </c:if>
					<c:if test="${sessionScope.infoGrupo.categoria==8}">A1 - Colciencias </c:if>
			</td>
			<td align="center">
					<c:if test="${sessionScope.infoGrupo.facultad==1}">Tecnológica </c:if>
					<c:if test="${sessionScope.infoGrupo.facultad==2}">Ingeniería </c:if>
					<c:if test="${sessionScope.infoGrupo.facultad==3}">Medio Ambiente y Recursos Naturales </c:if>
					<c:if test="${sessionScope.infoGrupo.facultad==4}">Ciencias y Educación </c:if>
					<c:if test="${sessionScope.infoGrupo.facultad==5}">Artes Asab </c:if>
			</td>
		</tr>
		<tr>
			<th colspan="5"><b>Correo Electrónico</b></th>
		</tr>
		<tr>
			<td colspan="3">
			<c:if test="${sessionScope.infoGrupo.modificable}">
				<input type="text" name="mail" style="width: 100%" value='<c:out value="${sessionScope.infoGrupo.mail}"/>' >
			</c:if>
			<c:if test="${!sessionScope.infoGrupo.modificable}">
				<c:out value="${sessionScope.infoGrupo.mail}" default="Sin actualizar"/>
			</c:if>
			</td>
		</tr>
		<tr>
			<th colspan="3"><b>Página Web</b></th>
		</tr>
		<tr>
			<td colspan="3">
			<c:if test="${sessionScope.infoGrupo.modificable}">
				<td colspan="3"><input type="text" style="width: 100%" name="web" width="100%" value='<c:out value="${sessionScope.infoGrupo.web}"/>'></td>
			</c:if>
			<c:if test="${!sessionScope.infoGrupo.modificable}">
				<c:out value="${sessionScope.infoGrupo.web}" default="-----------"/>
			</c:if>
			</td>
		</tr>
		<tr>
			<td class="renglones">Proyecto Curricular</td>
			<td colspan="4" class="renglones">
				<select name="codproyCurr">
					<option value="0">-----------------------------------------------------------------------</option>
						<c:forEach begin="0" items="${sessionScope.infoGrupo.proyectosCurriculares}" var="lista" varStatus="st">
							<option style="text-transform: lowercase;" value='<c:out value="${lista.codigo}"/>' <c:if test="${sessionScope.infoGrupo.codproyCurr==lista.codigo}">selected</c:if>><c:out value="${lista.nombre}"/></option>
						</c:forEach>
				</select>							
			</td>
		</tr>		
		<tr>
			<td class="renglones">Área de Conocimiento (SNIES)</td>
				<td colspan="4" class="renglones">
					<select name="codAreaSNIES">
						<option value="0">-----------------------------------------------------------------------</option>
							<c:forEach begin="0" items="${sessionScope.infoGrupo.areasSNIES}" var="lista" varStatus="st">
								<option style="text-transform: lowercase;" value='<c:out value="${lista.codigo}"/>' <c:if test="${sessionScope.infoGrupo.codAreaSNIES==lista.codigo}">selected</c:if>><c:out value="${lista.nombre}"/></option>
							</c:forEach>
					</select>							
				</td>
		</tr>
		<tr>
			<td colspan="3" align="center"><img  src="<c:url value="/comp/img/Guardar.gif"/>" onclick="guardar()"></td>
		</tr>				
	</table>
</form>
</body>
</html>