<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
<script type="text/javascript">
	function ver(url,tipo){
		document.docs.ruta.value=url;
		document.docs.tipo.value=tipo;
		document.docs.submit();
	}
</script>
</head>
<body>
<br>

<form name="docs" action='<c:url value="/descarga/documentos"/>' method="post">
	<input type="hidden" name="ruta" value="">
	<input type="hidden" name="tipo" value="">

	<table class="tablas" align="center" width="95%">
	<caption>Documentación actividades de investigación</caption>
		<tr>
			<th>&nbsp;</th>
			<th width="125px"><b>Documento</b></th>
			<th><b>Descripción</b></th>
		</tr>
		<tr>
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/MINGE-P01.pdf',3)"></td>
			<td width="125px" align="center">MINGE-P01</td>
			<td>Definición de planes institucionales para el fomento de estructuras de investigación</td>
		</tr>
		<tr class="trb">
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/MINGE-P02.pdf',3)"></td>
			<td width="125px" align="center">MINGE-P02</td>
			<td>Definición de políticas institucionales para el fomento de las estructuras de investigación</td>
		</tr>
		<tr>
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/MINGE-P03.pdf',3)"></td>
			<td width="125px" align="center">MINGE-P03</td>
			<td>Desarrollo de estructuras de investigación</td>
		</tr>
		<tr class="trb">
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/MINGE-P04.pdf',3)"></td>
			<td width="125px" align="center">MINGE-P04</td>
			<td>Institucionalización de grupos de investigación</td>
		</tr>
		<tr>
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/MINGE-P05.pdf',3)"></td>
			<td width="125px" align="center">MINGE-P05</td>
			<td>Institucionalización de semilleros de investigación</td>
		</tr>
		<tr class="trb">
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/MINGE-P06.pdf',3)"></td>
			<td width="125px" align="center">MINGE-P06</td>
			<td>Creación de institutos de investigación</td>
		</tr>
		<tr>
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/MINGE-P07.pdf',3)"></td>
			<td width="125px" align="center">MINGE-P07</td>
			<td>Cambio director grupo de investigación</td>
		</tr>
		<tr class="trb">
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/MINGE-P08.pdf',3)"></td>
			<td width="125px" align="center">MINGE-P08</td>
			<td>Cambio de tutor o líder  de semillero de investigación</td>
		</tr>
		<tr >
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/MINGE-P09.pdf',3)"></td>
			<td width="125px" align="center">MINGE-P09</td>
			<td>Actualización de información de semilleros de investigación</td>
		</tr>
		<tr class="trb">
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/MINGE-P10.pdf',3)"></td>
			<td width="125px" align="center">MINGE-P10</td>
			<td>Actualización de información de grupo de investigación</td>
		</tr>
		<tr >
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/MINGE-P11.pdf',3)"></td>
			<td width="125px" align="center">MINGE-P11</td>
			<td>Seguimiento y evaluación a semilleros de investigación</td>
		</tr>
		<tr class="trb">
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/MINGE-P12.pdf',3)"></td>
			<td width="125px" align="center">MINGE-P12</td>
			<td>Seguimiento y evaluación a grupos de investigación</td>
		</tr>
	</table>
</form>
</body>
</html>