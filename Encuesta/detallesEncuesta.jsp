<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<c:import url="/general.jsp"/></head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="lista">
<table align="center" class="tablas" border="0">
		<caption>DETALLES ENCUESTA</caption>
		<tr>
			<td class="renglones" align="center"><b>Id Pregunta</b></td>
			<td class="renglones" align="center"><b>Pregunta</b></td>
			<td class="renglones" align="center"><b>Respuesta 1</b></td>
			<td class="renglones" align="center"><b>Justificación</b></td>
		</tr>

		<c:forEach items="${requestScope.lista}" begin="0" var="lista" varStatus="st">
		<tr <c:if test="${st.count mod 2==0}">class="trb"</c:if>>
			<td><b><c:out value="${lista.idpregunta}" /></b></td>
			<td><c:out value="${lista.pregunta}" /></td>
			<td><c:out value="${lista.valor1}" /></td>
			<td><c:out value="${lista.valor2}" /></td>
		</tr>
		</c:forEach>
</table>
</body>
</html>