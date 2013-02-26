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
	<form name="gastos" method="post" action='<c:url value="/GestionProyectos/CargarExcelGastos.x"/>' target="main">
		<input type="hidden" name="accion" value='2'>

	<c:if test="${!empty sessionScope.listaGastoLeidos.listaGastosGeneral}">
        <table align="center" class="tablas" width="95%" >
        <caption >Listado de Gastos en la Hoja Gastos General</caption>
        <tr>

	       	<th width="10px"><b>#</b></td>
	       	<th width="20px"><b>Proy</b></td>
        	<th width="20px"><b>Rubro</b></td>
        	<th><b>Descripción</b></td>
        	<th width="60px"><b>Valor</b></td>
        	<th width="50px"><b>Fecha</b></td>
        	<th width="20px"><b>Tipo</b></td>
        	<th><b>Observación</b></td>
        </tr>
	<c:forEach begin="0" items="${sessionScope.listaGastoLeidos.listaGastosGeneral}" var="lista" varStatus="st">
		<tr <c:if test="${st.count mod 2==0}" >class="trb"</c:if>>
			<td width="10px" class="listas"><c:out value="${st.count}"/></td>
			<td width="20px" class="listas"><c:out value="${lista.idProyecto}"/></td>
			<td width="20px" class="listas"><c:out value="${lista.rubro}"/></td>
			<td class="listas"><c:out value="${lista.descripcion}"/></td>
			<td width="60px" class="listas" align="right"><c:out value="${lista.valor}"/></td>
			<td width="50px" class="listas"><c:out value="${lista.fecha}"/></td>
			<td width="20px" class="listas"><c:out value="${lista.tipo}"/></td>
			<td class="listas"><c:out value="${lista.observacion}"/></td>
		</tr>
	</c:forEach>
		</table>
	</c:if>
	<c:if test="${empty sessionScope.listaGastoLeidos.listaGastosGeneral}">
	<h3 align="center">No hay nada en la hoja 1</h3>
	</c:if>

	<c:if test="${!empty sessionScope.listaGastoLeidos.listaGastosInventario}">
        <table align="center" class="tablas" width="95%" >
        <caption >Listado de Gastos en la Hoja Gastos General</caption>
        <tr>

	       	<th width="10px"><b>#</b></td>
	       	<th width="20px"><b>Proy</b></td>
        	<th width="20px"><b>Rubro</b></td>
        	<th><b>Descripción</b></td>
        	<th width="60px"><b>Valor</b></td>
        	<th width="50px"><b>Fecha</b></td>
        	<th width="20px"><b>Tipo</b></td>
        	<th><b>Observación</b></td>
        	<th width="60px"><b>Placa</b></td>
        	<th width="50px"><b>Marca</b></td>
        	<th width="20px"><b>Serie</b></td>
        	<th width="50px"><b>observ</b></td>
        	<th width="20px"><b>dev</b></td>
        </tr>
	<c:forEach begin="0" items="${sessionScope.listaGastoLeidos.listaGastosInventario}" var="lista" varStatus="st">
		<tr <c:if test="${st.count mod 2==0}" >class="trb"</c:if>>
			<td width="10px" class="listas"><c:out value="${st.count}"/></td>
			<td width="20px" class="listas"><c:out value="${lista.idProyecto}"/></td>
			<td width="20px" class="listas"><c:out value="${lista.rubro}"/></td>
			<td class="listas"><c:out value="${lista.descripcion}"/></td>
			<td width="60px" class="listas" align="right"><c:out value="${lista.valor}"/></td>
			<td width="50px" class="listas"><c:out value="${lista.fecha}"/></td>
			<td width="20px" class="listas"><c:out value="${lista.tipo}"/></td>
			<td class="listas"><c:out value="${lista.observacion}"/></td>
			<td width="50px" class="listas"><c:out value="${lista.placa}"/></td>
			<td width="20px" class="listas"><c:out value="${lista.marca}"/></td>
			<td width="20px" class="listas"><c:out value="${lista.serie}"/></td>
			<td width="20px" class="listas"><c:out value="${lista.observ}"/></td>
			<td width="20px" class="listas"><c:out value="${lista.devuelto}"/></td>
		</tr>
	</c:forEach>

		</table>
	</c:if>
	<table align="center">
	<tr>
		<td>
			<input type="image" src='<c:url value="/comp/img/Enviar.gif"/>'>
		</td>
	</tr>
	</table>

	<c:if test="${empty sessionScope.listaGastoLeidos.listaGastosInventario}">
	<h3 align="center">No hay nada en la hoja 2</h3>
	</c:if>

	</form>
<br>
<table align="center">
	<tr>
		<td>
			<a href="../main.html"><img border="0" src='<c:url value="/comp/img/Atras.gif"/>'></a>
		</td>
	</tr>
</table>
</body>
</html>