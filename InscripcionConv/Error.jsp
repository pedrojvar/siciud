<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<div align="center">
	<fieldset>
	<legend>Error en la carga de la inscripción</legend>
		<h3><c:out value="${requestScope.msg}"/></h3>	
		<h3>Favor Volver a intentarlo. En caso que el fallo persista, por favor notificarlo al Centro de Investigaciones</h3>	
		<a href='<c:url value="/inscripcionConv/ListaConvocatoria.x"/>'>Volver</a>
	</fieldset>
<div>
</body>
</html>