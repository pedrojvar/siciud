<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="globales" class="cidc.general.obj.Globales" scope="page" />
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
<script>
	function comando(id){
		document.gastos.accion.value=id;
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<form name="gastos" method="post" action='<c:url value="/GestionProyectos/AdminProyectos.x"/>' target="main">
		<input type="hidden" name="accion" value='20'>

	<c:if test="${!empty sessionScope.listaGastoLeidos}">
        <table align="center" class="tablas" width="95%" >
        <caption >Listado de Gastos Rubro</caption>
        <tr>

	       	<th width="10px"><b>#</b></td>
	       	<th width="30px"><b>codigo</b></td>
        	<th width="60px"><b>Valor</b></td>
        	<th><b>Descripción</b></td>
        	<th width="150px"><b>Observaciones</b></td>
        </tr>
	<c:forEach begin="0" items="${sessionScope.listaGastoLeidos}" var="lista" varStatus="st">
		<tr <c:if test="${st.count mod 2==0}" >class="trb"</c:if>>
			<td width="10px" class="listas"><c:out value="${st.count}"/></td>
			<td width="30px" class="listas"><c:out value="${lista.codigo}"/></td>
			<td width="60px" class="listas" align="right"><c:out value="${lista.valorGasto}"/></td>
			<td class="listas"><c:out value="${lista.descripcion}"/></td>
			<td width="150px" class="listas"><c:out value="${lista.observaciones}"/></td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="5" align="center">
			<input type="image" src='<c:url value="/comp/img/Enviar.gif"/>'>
		</td>
	</tr>
		</table>
	</c:if>
	</form>
	<c:if test="${empty sessionScope.listaGastoLeidos}">
	<h4 align="center">No hay gastos registrados para este archivo </h4>
	</c:if>
</body>
</html>