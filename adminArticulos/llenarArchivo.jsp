<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="datoArticulo" class="cidc.adminArticulos.obj.ArticRevista" scope="session"/>
<jsp:setProperty name="datoArticulo" property="*"/>
<html>
<head>
	<c:import url="/general.jsp"/>
	<script type="text/javascript">
	function enviar(){
		if(document.formulario.archivo.value!="")
			document.formulario.submit();
		else
			alert("debe cargarse un documento para continuar");
	}
	</script>
</head>
<body>
<br>
<br>
<form action='<c:url value="/adminArticulos/AdminArticulosRevista.x" />' name="formulario"  enctype="multipart/form-data" method="post">
	<table class="tablas" align="center" width="80%">
	<caption>Documento Artículo</caption>
		<tr>
			<td colspan="2" class="renglones"><b>Título del artículo:</b></td>
		</tr>
		<tr>
			<td colspan="2"><c:out value="${sessionScope.datoArticulo.titulo}"/></td>
		</tr>
		<tr>
			<td class="renglones" width="60px"><b>Documento</b></td>
			<td><input style="width:100%" readonly type="file" name="archivo"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><img src='<c:url value="/comp/img/Enviar.gif"/>' onclick="enviar()"></td>
		</tr>
	</table>
</form>
</body>
</html>