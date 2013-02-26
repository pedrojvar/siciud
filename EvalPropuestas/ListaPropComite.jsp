<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/general.jsp"/>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br><br>
<table width="500px" class="tablas" align="center">
<caption>Propuestas de Investigacion a evaluar</caption>
	<tr>
	<td width="10px" class="renglones"><b>#</b></td>
	<td width="60px" class="renglones"><b>Conv.</b></td>
	<td class="renglones"><b>Propuesta de Investigación</b></td>
	<td class="renglones"><b>Doc.</b></td>
	<td class="renglones"><b>Eval.</b></td>
	</tr>
	<c:forEach begin="0" items="${requestScope.propuestas}" var="lista" varStatus="st">
		<tr>
			<td width="10px">
				<c:out value="${st.count}"/>
			</td>
			<td width="60px">
				<c:out value="${lista.convocatoria}"/>
			</td>
			<td>
				<c:out value="${lista.nombre}"/>
			</td>
			<td width="40px">
				<a class="icono" href='<c:url value="/Documentos/Propuestas/"/><c:out value="${lista.urlArchivo}"/>'><img border="0" src='<c:url value="/comp/img/documento.png"/>'></a>
			</td>
			<td width="40px">
				<a class="icono" href='<c:url value="/evalPropuestas/GestEvaluacion.x?accion=1&id=${lista.id}"/>'><img border="0" src='<c:url value="/comp/img/Evaluar.png"/>'></a>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>