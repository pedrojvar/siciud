<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>


</head>
<body>
<%
String tipo=request.getParameter("tipo");
	if(tipo.equals("Modelo"))
	{
	%>
		<p><b>MODELO DE MEDICIÓN:</b></p>
		<p>Proceso de selección del modelo conceptual al cual pertenece el indicador.</p>
	<%
	}
	if(tipo.equals("Proceso"))
	{
	%>
		<p><b>PROCESO:</b></p>
		<p>Es el macroproceso sobre el cual van a estar almacenados los indicadores.</p>
	<%
	}
	if(tipo.equals("Subproceso"))
	{
	%>
		<p><b>SUBPROCESO:</b></p>
		<p>Es el subproceso sobre el cual van a estar almacenados los indicadores.</p>
	<%
	}
	if(tipo.equals("Identificador"))
	{
	%>
		<p><b>IDENTIFICADOR:</b></p>
		<p>Codificación generada automáticamente por el sistema de información que identifica el indicador creado en relación con el modelo de medición, procesos y subprocesos que sean seleccionados.</p>
	<%
	}
	if(tipo.equals("Nombre"))
	{
	%>
		<p><b>NOMBRE:</b></p>
		<p>Nombre corto con el cual se identifica un indicador.</p>
	<%
	}
	if(tipo.equals("Descripcion"))
	{
	%>
		<p><b>DESCRIPCION:</b></p>
		<p>¿Qué significa el indicador? Se debe realizar una descripción clara y breve del significado del indicador conteniendo todas aquellas reflexiones que sean necesarias para comprender correctamente su justificación y su interpretación</p>
	<%
	}
	if(tipo.equals("Objetivo"))
	{
	%>
		<p><b>OBJETIVO:</b></p>
		<p>¿Para Qué? Se debe realizar una descripción del propósito por el cual se esta creando el indicador.</p>
	<%
	}
	if(tipo.equals("Metodologia"))
	{
	%>
		<p><b>METODOLOGÍA:</b></p>
		<p>¿Como se calcula? Se debe realizar una descripción de la forma de medición del indicador, procesos de toma de la información o cualquier otro método de cálculo del indicador descrito</p>
	<%
	}
	if(tipo.equals("FechaCorte"))
	{
	%>
		<p><b>FECHA DE CORTE:</b></p>
		<p>Fecha de medición del indicador. Corresponde a la fecha donde los datos del Indicador van a hacer cierre. Esta fecha es calculada automaticamente por el Sistema dependiendo el año en curso.</p>
		<p>Ejemplo: Año en curso 2000</p>
		<p>Fecha de Corte: 31/12/1999</p>
	<%
	}
	if(tipo.equals("RespInd"))
	{
	%>
		<p><b>RESPONSABLE AL SEGUIMIENTO DEL INDICADOR:</b></p>
		<p>Dependencia responsable en el seguimiento al indicador que periódicamente estará analizando la información reportada</p>
	<%
	}
	if(tipo.equals("FuenteInfo"))
	{
	%>
		<p><b>FUENTE DE INFORMACIÓN:</b></p>
		<p>Origen de la fuente de información (primaria y secundaria) requerida para lograr la identificación del indicador</p>
	<%
	}
	if(tipo.equals("DocSop"))
	{
	%>
		<p><b>DOCUMENTOS SOPORTE:</b></p>
		<p>Listado de los documentos que soportan el indicador descrito</p>
	<%
	}
	if(tipo.equals("Observacion"))
	{
	%>
		<p><b>OBSERVACIONES:</b></p>
		<p>Información adicional de algún nivel de relevancia para el indicador.</p>
	<%
	}
	%>
</body>
</html>