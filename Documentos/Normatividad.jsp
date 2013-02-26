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
	<caption>Documentación Normatividad Centro de Investigaciones</caption>
		<tr>
			<th>&nbsp;</th>
			<th width="125px"><b>Documento</b></th>
			<th><b>Descripción</b></th>
		</tr>
		<tr>
			<td><img border="0" src="<c:url value="/comp/img/xcel.jpg"/>" onclick="ver('/Documentos/Normatividad/ObjetivosCalidad.xls',1)"></td>
			<td width="125px">&nbsp;</td>
			<td>Objetivos de Calidad Centro de Investigaciones y Desarrollo Científico</td>
		</tr>
	</table>
</form>
</body>
</html>