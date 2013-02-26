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
	<caption>Documentación estructuras de investigación</caption>
		<tr>
			<th>&nbsp;</th>
			<th width="125px"><b>Documento</b></th>
			<th><b>Descripción</b></th>
		</tr>
		<tr>
			<td><img border="0" src="<c:url value="/comp/img/xcel.jpg"/>" onclick="ver('/Documentos/Formatos/MINGE-F04.xls',1)"></td>
			<td width="125px" align="center">MINGE-F04</td>
			<td>Formato para la Institucionalización de Semilleros de Investigación</td>
		</tr>
		<tr class="trb">
			<td><img border="0" src="<c:url value="/comp/img/xcel.jpg"/>" onclick="ver('/Documentos/Formatos/MINGE-F05.xls',1)"></td>
			<td width="125px" align="center">MINGE-F05</td>
			<td>Formato para la Institucionalización de Grupos de investigación</td>
		</tr>
		<tr>
			<td><img border="0" src="<c:url value="/comp/img/xcel.jpg"/>" onclick="ver('/Documentos/Formatos/MINGE-F06.xls',1)"></td>
			<td width="125px" align="center">MINGE-F06</td>
			<td>Formato para la presentación del Plan de Acción de semilleros</td>
		</tr>
		<tr class="trb">
			<td><img border="0" src="<c:url value="/comp/img/xcel.jpg"/>" onclick="ver('/Documentos/Formatos/MINGE-F07.xls',1)"></td>
			<td width="125px" align="center">MINGE-F07</td>
			<td>Formato para la presentación del Plan de acción bianual de Grupos de Investigación</td>
		</tr>
		<tr>
			<td><img border="0" src="<c:url value="/comp/img/xcel.jpg"/>" onclick="ver('/Documentos/Formatos/MINGE-F08.xls',1)"></td>
			<td width="125px" align="center">MINGE-F08</td>
			<td>Formato para la presentación del informe semestral de Semilleros de Investigación</td>
		</tr>
		<tr class="trb">
			<td><img border="0" src="<c:url value="/comp/img/xcel.jpg"/>" onclick="ver('/Documentos/Formatos/MINGE-F09.xls',1)"></td>
			<td width="125px" align="center">MINGE-F09</td>
			<td>Formato para la presentación de informe semestrál de Grupos de Investigación</td>
		</tr>
		<tr>
			<td><img border="0" src="<c:url value="/comp/img/xcel.jpg"/>" onclick="ver('/Documentos/Formatos/MINGE-F10.xls',1)"></td>
			<td width="125px" align="center">MINGE-F10</td>
			<td>Formato para la solicitud de cambio de lider de semillero de investigación</td>
		</tr>
		<tr class="trb">
			<td><img border="0" src="<c:url value="/comp/img/xcel.jpg"/>" onclick="ver('/Documentos/Formatos/MINGE-F11.xls',1)"></td>
			<td width="125px" align="center">MINGE-F11</td>
			<td>Formato para la solicitud de cambio de director de Grupo de Investigación</td>
		</tr>
	</table>
</form>
</body>
</html>