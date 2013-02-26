<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<c:import url="/general.jsp"/>
<script type="text/javascript">

function acci(acc){
document.filtroConsulta.accion.value=acc;
if(document.filtroConsulta.cedula.value=="" && document.filtroConsulta.codigoUd.value==""){
alert("Debe insertar un valor a consultar")
}else{
document.filtroConsulta.submit();
}
}

function enviar(cc,cod){
    document.lista.cedula.value=cc;
     document.lista.codUD.value=cod;
    document.lista.submit();
}
var nav4=window.Event ? true : false;

	function numeros(eve){
		var key=nav4?eve.which :eve.keyCode;
		return(key<=13 || (key>=48 && key<=57));
	}
</script>
</head>
<body>
	<br>
	<form name="filtroConsulta" action="url1.x" method="post">
	<input type="hidden" name="accion" value="">
		<table class="tablas" align="center" >
		<caption>Filtro de Consulta</caption>
			<tr>
				<td>
					<table>
						<tr>
							<td><b>Documento:</b></td>
							<td><input type="text" name="cedula" maxlength="10" onkeypress="return numeros(event)"></td>
							<td><b>Codigo UD:</b></td>
							<td><input type="text" name="codigoUd" maxlength="11" onkeypress="return numeros(event)"></td>
						</tr>
						<tr>
							<td colspan="4" align="center"><img src="<c:url value="/comp/img/Buscar.gif"/>" onclick="acci(20)" title="Buscar"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
</form>
<form name="lista" action="url1.x" method="post">
	<input type="hidden" name="accion" value="8">
	<input type="hidden" name="cedula" value="">
	<input type="hidden" name="codUD" value="">
		<br>
		<br>

		<table class="tablas" align="center" border="1">
		<caption>Resultados de Busqueda</caption>
			<tr>
				<th>Codigo UD</th>
				<th>Nombres</th>
				<th>Apellidos</th>
				<th>Facultad</th>
				<th>Proyecto curricular</th>
				<th>Tipo</th>
				<th>Ver</th>
			</tr>
				<c:forEach begin="0" items="${sessionScope.Integrantes}" var="lista">
				 <tr>
					<td><c:out value="${lista.codigoUd}"/></td>
					<td><c:out value="${lista.nombres}"/></td>
					<td><c:out value="${lista.apellidos}"/></td>
					<td><c:out value="${lista.nombreFacultad}"/></td>
					<td><c:out value="${lista.nombreProyCurr}"/></td>
					<td><c:out value="${lista.nombreTipoPer}"/></td>
					<td><img src='<c:url value="/comp/img/Ver.gif"/>' title="Ver Datos" onclick='enviar(<c:out value="${lista.cedula}"/>,<c:out value="${lista.codigoUd}"/>)' >

					</td>
				 </tr>
				</c:forEach>
		</table>
	</form>
</body>
</html>