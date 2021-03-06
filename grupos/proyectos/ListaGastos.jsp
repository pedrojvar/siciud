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
	<c:if test="${!empty requestScope.listaGastosRubro}">
        <table align="center" class="tablas" width="95%" >
        <caption >Listado de Gastos Rubro</caption>
        <tr>

	       	<th align="right" width="10px"><b>#</b></th>
	       	<th align="right" width="10px"><b>..</b></th>
        	<th align="center" width="75px"><b>Fecha</b></th>
        	<th align="center" width="75px"><b>Valor</b></th>
        	<th align="center"><b>Descripción</b></th>
        	<th align="center" width="100px"><b>Observacion</b></th>
        </tr>
	<c:forEach begin="0" items="${requestScope.listaGastosRubro}" var="lista" varStatus="st">
		<tr>
			<td width="10px" class="listas"><c:out value="${st.count}"/></td>
			<td width="10px">
				<c:if test="${lista.tipoGasto==1}"><img src='<c:url value="/comp/img/flag0.gif"/>'></c:if>
				<c:if test="${lista.tipoGasto==-1}"><img src='<c:url value="/comp/img/flag1.gif"/>'></c:if>
			</td>
			<td width="75px" class="listas"><c:out value="${lista.fecha}"/></td>
			<td width="75px" class="listas" align="right"><c:out value="${lista.valorGasto}"/></td>
			<td class="listas"><c:out value="${lista.descripcion}"/></td>
			<td class="listas" width="100px"><c:out value="${lista.observaciones}"/></td>
		</tr>
	</c:forEach>
		</table>
	</c:if>
	<c:if test="${empty requestScope.listaGastosRubro}">
	<h4 align="center">No hay gastos registrados para este rubro </h4>
	</c:if>
</body>
</html>