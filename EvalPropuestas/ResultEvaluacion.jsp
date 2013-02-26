<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/general.jsp"/>
</head>
<body>
<br>
<table class="tablas" align="center">
	<tr>
		<td class="renglones"><b>Nombre del Evaluador:</b></td>
		<td><b><c:out value="${requestScope.resultEvaluacion.nombEvaluador}"/></b></td>
	</tr>
</table>
<br>
<form action='<c:url value="/EvalPropuestas/llenar.jsp"/>' method="post">
<c:if test="${!empty requestScope.resultEvaluacion.criterios}">
	<c:forEach begin="0" items="${requestScope.resultEvaluacion.criterios}" var="criterio">
	<input type="hidden" name="idCriterio" value='<c:out value="${criterio.idCriterio}"/>'>
	<table class="tablas" align="center">
		<caption>Criterio: "<c:out value="${criterio.nombre}"/>"</caption>
		<tr>
			<td class="renglones" width="500px" align="center"><b>Aspecto</b></td>
			<td class="renglones" width="30px" align="center"><b>Max.</b></td>
			<td class="renglones" width="30px" align="center"><b>Eval.</b></td>
		</tr>
		<c:forEach begin="0" items="${criterio.aspectos}" var="aspecto">
		<tr>
			<td width="500px"><c:out value="${aspecto.nombre}"/></td>
			<td width="30px" align="center"><c:out value="${aspecto.maxValor}"/></td>
			<td width="30px" align="center"><b><c:out value="${aspecto.valor}"/><b></td>
		</tr>
		</c:forEach>
		<tr>
			<td class="renglones" colspan="3"><b>Observaciones:</b></td>
		</tr>
		<tr>
			<td colspan="3"><c:out value="${criterio.observaciones}"/></td>
		</tr>
	</table>
	</c:forEach>
</c:if>
<c:if test="${empty requestScope.resultEvaluacion.criterios}">
<div align="center">
<h5>No hay Valores cargados para esta Propuesta de Investigación</h5>
</div>
</c:if>
</form>
</body>
</html>