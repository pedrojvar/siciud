<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/general.jsp"/>
<script>
	function comando(id,tipEval){
		document.comandos.action='<c:url value="/invest/gestionInvestig.x"/>';
		document.comandos.accion.value=id;
		document.comandos.tipoEval.value=tipEval;
		document.comandos.submit();
	}
</script>
</head>
<body>
<br>
<form name="comandos">
	<input type="hidden" name="accion" value=''>
	<input type="hidden" name="tipoEval" value=''>
	<input type="hidden" name="prop" value='<c:out value="${requestScope.prop}"/>'>
	<table align="left">
		<tr>
			<td><img src='<c:url value="/comp/img/Atras.gif"/>' onclick="comando(18,0)"></td>
			<td><img src='<c:url value="/comp/img/EvalInter.gif"/>' onclick="comando(19,1)"></td>
			<td><img src='<c:url value="/comp/img/EvalExt.gif"/>' onclick="comando(19,2)"></td>
		</tr>
	</table>
</form>
<br>
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
</body>
</html>