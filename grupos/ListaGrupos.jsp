<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<c:import url="/general.jsp"/>
<script>
	function ver(id,accion){
		document.listaGrupos.action='<c:url value="/grupos/GestionGrupo.x"/>';
		document.listaGrupos.idGrupo.value=id;
		document.listaGrupos.accion.value=accion;
		document.listaGrupos.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<br>
	<c:if test="${!empty sessionScope.listaMisGrupos}">
	<form name="listaGrupos" >
	<input type="hidden" name="accion" value="4">
	<input type="hidden" name="idGrupo" value="">
	<br>
	<table class="tablas" align="center" width="90%">
	<caption>listado de grupos a los que está inscrito</caption>
		<tr>
			<th>St</th>
			<th>Nombre Grupo / Semillero</th>
			<th>Tipo Grupo</th>
			<th>Rol</th>
			<th>Estado</th>
			<th>Ver</th>
			<th>Integrantes</th>
		</tr>
	<c:forEach begin="0" items="${sessionScope.listaMisGrupos}" var="lista" varStatus="st">
		<tr <c:if test="${(st.count mod 2)==0}">class="trb"</c:if>>
			<td>
				<c:if test="${lista.estadoGrupo}"><img src='<c:url value="/comp/img/flag1.gif"/>'></c:if>
				<c:if test="${!lista.estadoGrupo}"><img src='<c:url value="/comp/img/flag3.gif"/>'></c:if>
			</td>
			<td><c:out value="${lista.nombreGrupo}"/></td>
			<td align="center"><c:out value="${lista.tipoGrupoTxt}"/></td>
			<td align="center"><c:out value="${lista.rolTxt}"/></td>
			<td align="center">
				<c:if test="${lista.estadoIntegrante}">Activo</c:if>
				<c:if test="${!lista.estadoIntegrante}">Inactivo</c:if>
			</td>
			<td width="50px"> 
				<c:if test="${lista.estadoIntegrante}">
					<img src='<c:url value="/comp/img/VerProy.gif"/>' onclick='ver(<c:out value="${lista.idGrupo}"/>,4)'>
				</c:if>
			</td>
			<td width="50px" align="center">
				<c:if test="${lista.estadoIntegrante}">
					<img src='<c:url value="/comp/img/integrantes.png"/>' onclick='ver(<c:out value="${lista.idGrupo}"/>,6)'>
				</c:if>
			</td>
		</tr>
	</c:forEach>
	</table>
	</form>
	</c:if>
	<c:if test="${empty sessionScope.listaMisGrupos}">
	<h5 align="center">Usted no tiene grupos investigación registrados</h5>
	</c:if>
</body>
</html>