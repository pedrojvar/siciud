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
	<p><b>Modelo de Medición:</b> Es el modelo bajo el cual se va des</p>
	<%
	}
	if(tipo.equals("Proceso"))
	{
	%>
	<td colspan="2" class="renglones" align="center"><span id="titulo"><b>ALEXANDER <%= request.getParameter("tipo")%></b></span></td>
	<%
	}
	if(tipo.equals("Subproceso"))
	{
	%>
	<td colspan="2" class="renglones" align="center"><span id="titulo"><b>ALEXANDER <%= request.getParameter("tipo")%></b></span></td>
	<%
	}
	if(tipo.equals("Identificador"))
	{
	%>
	<p><b>Identificador:</b> Corresponde a la cadena de caracteres (números, letras, etc.) que representa e identifica de forma única al indicador dentro del sistema</p>
	<%
	}
	if(tipo.equals("Nombre"))
	{
	%>
  <p><b>Nombre:</b> Corresponde a el nombre del indicador</p>
	<%
	}
	if(tipo.equals("Descripcion"))
	{
	%>
	<p><b>Descripción:</b> Corresponde a la explicación de la razón del ser del indicador en la cual se expresa detalles y procedimientos para hallar el indicador </p>
	<%
	}
	if(tipo.equals("Objetivo"))
	{
	%>
	<p><b>Objetivo:</b> Se refiere a la meta o el fin con el cual fue planteado el indicador</p>
	<%
	}
	if(tipo.equals("Metodologia"))
	{
	%>
	<p><b>Metodología:</b> Corresponde al conjunto de técnicas y procedimientos empleados para obtener el indicador</p>
	<%
	}
	if(tipo.equals("FechaCorte"))
	{
	%>
	<p><b>Fecha de Corte:</b> Corresponde al plazo máximo en el cual se podran reportar datos sobre el indicador </p>
	<%
	}
	if(tipo.equals("RespInd"))
	{
	%>
	<p><b>Responsable al seguimiento del Indicador:</b> Corresponde a la dependencia designada para que realice seguimiento al indicador</p>
	<%
	}
	if(tipo.equals("FuenteInfo"))
	{
	%>
	<p><b>Fuente de Información:</b> Corresponde a el origen de la información (Dependencia, Sistema de Información), el cual suministra los datos para la creación del indicador</p>
	<%
	}
	if(tipo.equals("DocSop"))
	{
	%>
	<p><b>Documento Soporte:</b> Corresponde a </p>
	<%
	}
	if(tipo.equals("XXXX"))
	{
	%>
	<td colspan="2" class="renglones" align="center"><span id="titulo"><b>ALEXANDER <%= request.getParameter("tipo")%></b></span></td>
	<%
	}
	%>
</body>
</html>