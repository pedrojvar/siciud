<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<br>
	<c:if test="${!empty requestScope.listaProp}">
        <table class="tablas" width="620px" >
        <caption >Listado de Propuestas Asignadas</caption>
        <tr>
	       	<td class="renglones" align="center"><b>#</b></td>
	       	<td width="20px" class="renglones" align="center"><b>ID</b></td>
	       	<td width="50px" class="renglones" align="center"><b>Conv.</b></td>
        	<td class="renglones" align="center"><b>Nombre de Propuesta</b></td>
        	<td class="renglones" align="center"><b>Estado</b></td>
        </tr>
	<c:forEach begin="0" items="${requestScope.listaProp}" var="lista" varStatus="st">
		<tr>
			<td class="renglones" align="center"><b><c:out value="${st.count}"/></b></td>

			<c:if test="${lista.estadoPropuesta==3}"><td class="lverde"><c:out value="${lista.codPropuesta}"/></td></c:if>
			<c:if test="${lista.estadoPropuesta==4}"><td class="lroja"><c:out value="${lista.codPropuesta}"/></td></c:if>
			<c:if test="${lista.estadoPropuesta<3}"><td class="listas"><c:out value="${lista.codPropuesta}"/></td></c:if>

			<c:if test="${lista.estadoPropuesta==3}"><td width="50px" class="lverde"><c:out value="${lista.convocatoria}"/></td></c:if>
			<c:if test="${lista.estadoPropuesta==4}"><td width="50px" class="lroja"><c:out value="${lista.convocatoria}"/></td></c:if>
			<c:if test="${lista.estadoPropuesta<3}"><td width="50px" class="listas"><c:out value="${lista.convocatoria}"/></td></c:if>

			<c:if test="${lista.estadoPropuesta==3}"><td class="lverde"><c:out value="${lista.nomPropuesta}"/></td></c:if>
			<c:if test="${lista.estadoPropuesta==4}"><td class="lroja"><c:out value="${lista.nomPropuesta}"/></td></c:if>
			<c:if test="${lista.estadoPropuesta<3}"><td class="listas"><c:out value="${lista.nomPropuesta}"/></td></c:if>
			<td class="estado" align="center">
				<c:if test="${lista.estadoEval==0}"><img src='<c:url value="/comp/img/est0.gif"/>'></c:if>
				<c:if test="${lista.estadoEval==1}"><img src='<c:url value="/comp/img/Acepto.gif"/>'></c:if>
				<c:if test="${lista.estadoEval==2}"><img src='<c:url value="/comp/img/Rechazo.gif"/>'></c:if>
			</td>
		</tr>
	</c:forEach>
	</table>

	</c:if>
	<c:if test="${empty requestScope.listaProp}">
	<h4 align="center">No hay Propuestas de investigación asignadas a este evaluador</h4>
	</c:if>
</body>

</html>