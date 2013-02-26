<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="rae"
	class="cidc.docsIndicadores.obj.InfoRAE" scope="session" />
<jsp:setProperty name="rae" property="*" />

<head>
<c:import url="/general.jsp" />
<script>
function validarEnviar()
{
	var archivo = document.form1.archivo.value;
	<c:if test="${sessionScope.informacion.categoria == 3}">
		var imagen = document.form1.imagen.value;
		if(archivo=="")
		{
			alert("Debe seleccionar un Archivo para cargar");
			return false;
		}
		else
		{
			if(imagen=="")
			{
				alert("Debe seleccionar una Imagen para cargar");
				return false;
			}
			else
			{
				var extensionArchivo = archivo.substr(archivo.lastIndexOf('.'),archivo.length);
				var extensionImagen = imagen.substr(imagen.lastIndexOf('.'),imagen.length);
				if(!(extensionArchivo == ".pdf") && !(extensionArchivo==".xls") && !(extensionArchivo==".xlsx") && !(extensionArchivo == ".ppt") && !(extensionArchivo==".pptx") && !(extensionArchivo==".doc")&& !(extensionArchivo == ".docx") && !(extensionArchivo==".xmind"))
				{
					alert("Extension de archivo incorrecta, debe ser Pdf, Word, Excel, Power Point ó Xmind");
					return false;
				}
				if(!(extensionImagen == ".png") && !(extensionImagen==".jpg") && !(extensionImagen==".gif") && !(extensionArchivo == ".tiff") && !(extensionImagen==".JPG"))
				{
					alert("Extension de Imagen incorrecta, debe ser .jpg, .gif, .tiff, .JPG");
					return false;
				}
			}
	  document.form1.submit();
	}
	</c:if>

	<c:if test="${sessionScope.informacion.categoria != 3}">
		if(archivo=="")
		{
			alert("Debe seleccionar un Archivo para cargar");
			return false;
		}
		else
		{
			var extensionArchivo = archivo.substr(archivo.lastIndexOf('.'),archivo.length);
			if(!(extensionArchivo == ".pdf") && !(extensionArchivo==".xls") && !(extensionArchivo==".xlsx") && !(extensionArchivo == ".ppt") && !(extensionArchivo==".pptx") && !(extensionArchivo==".doc")&& !(extensionArchivo == ".docx") && !(extensionArchivo==".xmind"))
			{
				alert("Extension de archivo incorrecta, debe ser Pdf, Word, Excel, Power Point ó Xmind");
				return false;
			}
		}
	  document.form1.submit();
	</c:if>
}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="form1" method="post" enctype="multipart/form-data"
	action='<c:url value="/docsIndicadores/CargarDocs.x"/>'
	<table class="tablas" width="80%" align="center">
	<caption>SELECCION DE DOCUMENTO</caption>
	<tr>
		<td class="renglones" width="150px"><b>Seleccione Documento:</b></td>
		<td><input type="file" name="archivo"/></td>
	</tr>
	<caption>SELECCION DE IMAGEN</caption>
	<c:if test="${sessionScope.informacion.categoria == 3}">
	<tr>
		<td class="renglones" width="150px"><b>Seleccione Imagen:</b></td>
		<td><input type="file" name="imagen"/></td>
	</tr>
	</c:if>
	<tr>
		<td colspan="2" align="center"><img src='<c:url value="/comp/img/CargaDoc.gif"/>' onclick="validarEnviar()"></td>
	</tr>
</form>
</body>