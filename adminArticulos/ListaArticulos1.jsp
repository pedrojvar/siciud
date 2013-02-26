<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
<script>

	function ver(artic){
		document.listado.art.value=artic;
		document.listado.accion.value="4";
		document.listado.action='<c:url value="/adminArticulos/AdminArticulos.x"/>';
		document.listado.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<form name="filtro" method="post" action='<c:url value="/adminArticulos/llenar.jsp"/>'>
		<input type="hidden" name="accion" value="3"/>
		<table align="center">
		<caption>Filtro de Búsqueda</caption>
			<tr>
				<td align="center" colspan="5" valign="top">
				<table>
					<tr>
						<td class="renglones"><b>Tipo Artículo</b></td>
						<td>
							<select name="tipo">
								<option value="1">Interno</option>
								<option value="2">Externo</option>
							</select>
						</td>
						<td colspan="4" align="center"><input type="image" src='<c:url value="/comp/img/Buscar.gif"/>'/></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<c:if test="${!empty requestScope.listaAticulos}">
	<form name="listado" method="post">
		<input type="hidden" name="accion" value="0"/>
		<input type="hidden" name="art" value="0">
		<input type="hidden" name="tipEval" value="0">
        <table class="tablas" width="95%px" >
        <caption >Listado de Artículos registrados</caption>
        <tr>
	       	<td width="21px" class="renglones" align="center"><b>#</b></td>
        	<td width="95px" class="renglones" align="center"><b>Fecha Radicado</b></td>
        	<td width="150px" class="renglones" align="center"><b>Presentador</b></td>
        	<td class="renglones" align="center"><b>Nombre de Artículo</b></td>
        	<td width="75px" class="renglones" align="center"><b>Estado</b></td>
        </tr>

	<c:forEach begin="0" items="${requestScope.listaAticulos}" var="lista" varStatus="st">
		<tr>
			<td width="21px" class="listas"><c:out value="${st.count}"/></td>
			<td width="95px" class="listas"><c:out value="${lista.fechaRecibido}"/></td>
			<td width="150px" class="listas"><c:out value="${lista.presentador}"/></td>
			<td class="listas"><c:out value="${lista.tituloArticulo}"/></td>
			<td width="75px" class="estado" align="center">
				<c:if test="${lista.estado==1}"><img src='<c:url value="/comp/img/est0.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
				<c:if test="${lista.estado==2}"><img src='<c:url value="/comp/img/est1.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
				<c:if test="${lista.estado==3}"><img src='<c:url value="/comp/img/est2.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
				<c:if test="${lista.estado==4}"><img src='<c:url value="/comp/img/est3.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
				<c:if test="${lista.estado==5}"><img src='<c:url value="/comp/img/est4.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
				<c:if test="${lista.estado==6}"><img src='<c:url value="/comp/img/est5.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
			</td>
		</tr>
	</c:forEach>
		</table>
	</form>
	</c:if>
</body>

</html>