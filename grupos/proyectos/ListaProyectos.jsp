<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<c:import url="/general.jsp"/>
<script>
	function ver(id,tipo){
		document.lista.action='<c:url value="/GestionProyectos/ProyectosInvestigador.x"/>';
		document.lista.id.value=id;
		document.lista.tipo.value=tipo;
		document.lista.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">

	<c:if test="${!empty requestScope.listaProyectos}">
	<form name="lista">
	<input type="hidden" name="accion" value="1">
	<input type="hidden" name="id" value="">
	<input type="hidden" name="tipo" value="">
	</form>
	<br>
	<table class="tablas" align="center" width="450px">
	<caption>Listado de Proyectos de investigación</caption>
		<tr>
			<th width="50px"><b>Codigo</b></th>
			<th><b>Nombre del Proyecto</b></th>
			<th width="50px"><b>Estado</b></th>
			<th width="50px"><b>Ver</b></th>
		</tr>
	<c:forEach begin="0" items="${requestScope.listaProyectos}" var="lista" varStatus="st">
		<tr <c:if test="${(st.count mod 2)==0}">class="trb"</c:if>>
			<td><c:out value="${lista.codigo}"/></td>
			<td><c:out value="${lista.nombre}"/></td>
			<td><c:out value="${lista.estado}"/></td>
			<td width="50px"><img src='<c:url value="/comp/img/VerProy.gif"/>' onclick='ver(<c:out value="${lista.idProyecto}"/>,<c:out value="${lista.tipo}"/>)'></td>
		</tr>
	</c:forEach>
	</table>

	</c:if>
	<c:if test="${empty requestScope.listaProyectos}">
	<h5 align="center">No hay proyectos de investigación registrados a su nombre</h5>
	</c:if>
</body>
</html>