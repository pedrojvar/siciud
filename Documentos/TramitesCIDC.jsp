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
	<caption>Documentación trámites CIDC</caption>
		<tr>
			<td class="renglones">&nbsp;</td>
			<td width="125px" class="renglones"><b>Documento</b></td>
			<td class="renglones"><b>Descripción</b></td>
		</tr>
		<tr>
			<td><img border="0" src="<c:url value="/comp/img/word.png"/>" onclick="ver('/Documentos/Formatos/frmContratacionCIDCInvitacion.doc',1)"></td>
			<td width="125px" align="center">Fomato de Invitación Directa</td>
			<td>Fomato de contratación CIDC de invitación directa</td>
		</tr>
		<tr class="trb">
			<td><img border="0" src="<c:url value="/comp/img/xcel.jpg"/>" onclick="ver('/Documentos/Formatos/formatoDeSolicitud.xls',1)"></td>
			<td width="125px" align="center">Formato de solicitud</td>
			<td>Formato para la solicitud de contratación de servicios mediante la modalidad de órdenes de prestación de servicios (OPS) o órdenes de prestación de servicios académicos  remunerados (OPSAR)</td>
		</tr>
		<tr>
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/formato Colciencias.pdf',3)"></td>
			<td width="125px" align="center">Formato Colciencias</td>
			<td>Instructivo para la presentación de proyectos de investigación científica y tecnológica</td>
		</tr>
		<tr class="trb">
			<td><img border="0" src="<c:url value="/comp/img/word.png"/>" onclick="ver('/Documentos/Formatos/relacionDocumentos.doc',1)"></td>
			<td width="125px" align="center">Fomato de Relación de documentos</td>
			<td>Formato de relación de entrega de documentos para contratación (este formato sustituye oficio de remisión)</td>
		</tr>
		<tr>
			<td><img border="0" src="<c:url value="/comp/img/pdf.png"/>" onclick="ver('/Documentos/Formatos/formatoAspiranteOPS.pdf',3)"></td>
			<td width="125px" align="center">Fomato Aspirante OPS</td>
			<td>Formato aspirante OPS para contratación de servicios técnicos, debe ser llenado en su totalidad por el aspirante.</td>
		</tr>
		<tr class="trb">
			<td><img border="0" src="<c:url value="/comp/img/word.png"/>" onclick="ver('/Documentos/Formatos/formatoCumplidoOPS.doc',1)"></td>
			<td width="125px" align="center">Fomato de cumplido OPS</td>
			<td>Formato de cumplido OPS para entrega de cumplidos mensuales el cual debe ser diligenciado y entregado por el Contratista.</td>
		</tr>
		<tr>
			<td><img border="0" src="<c:url value="/comp/img/word.png"/>" onclick="ver('/Documentos/Formatos/formatoContrtacionCIDC.doc',1)"></td>
			<td width="125px" align="center">Fomato de Contratación CIDC</td>
			<td>Fomato Convocatoria Pública</td>
		</tr>
	<!--	<tr>
			<td><a href='<c:url value="/Documentos/Formatos/certificadoSyP.doc"/>'><img border="0" src="<c:url value="/comp/img/word.png"/>"></a></td>
			<td width="125px">Formato de Cumplido de servicio técnico</td>
			<td>Formato de cumplido de servicio tecnico, debe ser llenado por el profesor a cargo de la investigación y llevar su visto bueno (firma). El supervisor es el director del Centro de Investigaciones.</td>
		</tr> -->
	</table>
</form>
</body>
</html>