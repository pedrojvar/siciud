<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<c:import url="/general.jsp"/>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<table class="tablas" border="1" align="center" style="width:550px;">
	<caption>Datos Generales</caption>
		<tr>
			<td class="renglones" colspan="2"><b>Nombre de la Convocatoria:</b></td>
		</tr>
		<tr>
			<td colspan="2"><c:out value="${requestScope.resumen.convocatoria}"/></td>
		</tr>
		<tr>
			<td class="renglones"><b>Facultad:</b></td>
			<td class="renglones"><b>Grupo o Semillero de Investigación:</b></td>
		</tr>
		<tr>
			<td><c:out value="${requestScope.resumen.facultad}"/></td>
			<td><c:out value="${requestScope.resumen.grupo}"/></td>
		</tr>
		<tr>
			<td  class="renglones"><b>Investigador Principal:</b></td>
			<td><c:out value="${requestScope.resumen.investigador}"/></td>
		</tr>
		<tr>
			<td  colspan="2" class="renglones"><b>Nombre de la Propuesta Inscrita:</b></td>
		</tr>
		<tr>
			<td  colspan="2"><c:out value="${requestScope.resumen.propuesta}"/></td>
		</tr>
		<tr>
			<td colspan="2" class="renglones"><b>Abstract:</b></td>
		</tr>
		<tr>
			<td colspan="2"><c:out value="${requestScope.resumen.propAbstract}"/></td>
		</tr>
		<tr>
			<td colspan="2" class="renglones"><b>Palabras Claves:</b></td>
		</tr>
		<tr>
			<td colspan="2"><c:out value="${requestScope.resumen.palClaves}"/></td>
		</tr>
	</table>

	<br>
	<c:if test="${!empty requestScope.resumen.coInvestigadores}">
	<table class="tablas" align="center" style="width:550px;">
	<caption>Co-Investigadores inscritos</caption>
		<tr>
			<td class="renglones"><b>Doc. Identidad:<b></td>
			<td class="renglones"><b>Nombres:</b></td>
			<td class="renglones"><b>Apellidos:</b></td>
			<td class="renglones"><b>Institución a la que pertenece:</b></td>
		</tr>
		<c:forEach begin="0" items="${requestScope.resumen.coInvestigadores}" var="investigadores">
		<tr>
			<td><c:out value="${investigadores.documento}"/></td>
			<td><c:out value="${investigadores.nombres}"/></td>
			<td><c:out value="${investigadores.apellidos}"/></td>
			<td><c:out value="${investigadores.institucion}"/></td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
	<br>
	<c:if test="${!empty requestScope.resumen.rubros}">
	<table class="tablas" align="center" style="width:550px;">
		<caption>Valores de los Rubros afectados en la propuesta</caption>
		<tr>
			<td style="width:300px;" class="renglones"><b>Rubro</b></td>
			<td class="renglones" colspan="3" align="center"><b>Financiado por:</b></td>
		</tr>
		<tr>
			<th style="width:300px;" class="renglones">&nbsp;</th>
			<th style="width:30px;" class="renglones">CIDC</th>
			<th style="width:30px;" class="renglones">UD</th>
			<th style="width:30px;" class="renglones">Contrap..</th>
		</tr>
		<c:forEach begin="0" items="${requestScope.resumen.rubros}" var="rubros">
		<tr>
			<td style="width:300px;"><c:out value="${rubros.nombre}"/></td>
			<td style="text-align:right;width:30px;"><c:out value="${rubros.cidc}"/></td>
			<td style="text-align:right;width:30px;"><c:out value="${rubros.ud}"/></td>
			<td style="text-align:right;width:30px;"><c:out value="${rubros.contra}"/></td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
</body>

</html>