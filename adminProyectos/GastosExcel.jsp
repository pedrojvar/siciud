<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>

<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
<script>

	function enviar(){
	//alert(document.gastos.archivo.value.substring(document.gastos.archivo.value.lastIndexOf('.')+1,document.gastos.archivo.value.length));
		var ext=document.gastos.archivo.value.substring(document.gastos.archivo.value.lastIndexOf('.')+1,document.gastos.archivo.value.length);
		if(ext!="xls"){
			alert("El formato del archivo no corresponde al formato soportado\n Solo se deben cargar archivos en formato Excel 97-2003");
		}else{
			document.gastos.submit();
		}
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<form name="gastos" action='<c:url value="/GestionProyectos/CargarExcelGastos.x"/>' method="post" enctype="multipart/form-data" accept="ISO-8859-1" accept-charset="ISO-8859-1">
		<input type="hidden" name="accion" value="19"/>
		<input type="hidden" name="rubro" value='<c:out value="${requestScope.rubro.idRubro}"/>'>
        <table align="center" class="tablas" width="70%">
	        <caption>Inserción de Gastos masivo para el rubro <c:out value="${requestScope.rubro.nombreRubro}"/></caption>
	        <tr>
	        	<th ><b>Seleccionar archivo</b></td>
	        	<th width="75px">&nbsp;</td>
	        </tr>
			<tr>
				<td>
					<input width="100%" class="cajas" type="file" name="archivo"></td>
				<td width="75px">
					<img src='<c:url value="/comp/img/Enviar.gif"/>' onclick="enviar()">
				</td>
			</tr>
		</table>
	</form>
</body>

</html>