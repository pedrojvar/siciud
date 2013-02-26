<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
<script>
	function ver(prop){
		document.listado.prop.value=prop;
		document.listado.action='<c:url value="/invest/gestionInvestig.x"/>';
		document.listado.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<br>
	<c:if test="${!empty requestScope.listaProp}">
	<form name="listado" method="post">
		<input type="hidden" name="accion" value="18"/>
		<input type="hidden" name="prop" value="0">
        <table class="tablas" width="98%" >
        <caption >Listado de Propuestas Inscritas</caption>
        <tr>
	       	<td class="renglones" align="center"><b>#</b></td>
	       	<td class="renglones" align="center"><b>Cod.</b></td>
	       	<td width="65px" class="renglones" align="center"><b>Conv.</b></td>
        	<td class="renglones" align="center"><b>Nombre de Propuesta</b></td>
        	<td class="renglones" align="center"><b>Estado</b></td>
        	<td class="renglones" align="center"><b>Ver Eval.</b></td>
        </tr>
	<c:forEach begin="0" items="${requestScope.listaProp}" var="lista" varStatus="st">
		<tr>
			<td class="renglones" align="center"><b><c:out value="${st.count}"/></b></td>
			<td align="center"><b><c:out value="${lista.idProp}"/></b></td>
			<td align="center" class="listas"><c:out value="${lista.convocatoria}"/></td>
			<td class="listas"><c:out value="${lista.nombre}"/></td>
			<td class="estado" align="center">
			<c:if test="${lista.activa}">
				<c:if test="${lista.estado<3}"><img src='<c:url value="/comp/img/est9.gif"/>'></c:if>
				<c:if test="${lista.estado==3}"><img src='<c:url value="/comp/img/est7.gif"/>'></c:if>
				<c:if test="${lista.estado==4}"><img src='<c:url value="/comp/img/est8.gif"/>'></c:if>
			</c:if>
			<c:if test="${!lista.activa}">
				<img src='<c:url value="/comp/img/est10.gif"/>'>
			</c:if>
			</td>
			<td class="estado" align="center">
				<c:if test="${lista.estado==3 or lista.estado==4}"><img src='<c:url value="/comp/img/VerProy.gif"/>' onclick='ver(<c:out value="${lista.idProp}"/>)'></c:if>
			</td>
		</tr>
	</c:forEach>
		</table>
	</form>
	</c:if>
	<c:if test="${empty requestScope.listaProp}">
	<h4 align="center">Usted No tiene Propuestas de investigación inscritas en el sistema</h4>
	</c:if>
</body>

</html>