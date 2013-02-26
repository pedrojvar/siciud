<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<jsp:useBean id="anoHoy" class="java.util.Date" />
<fmt:formatDate value="${anoHoy}" type="time" timeStyle="short"
	pattern="yyyy" var="ano" />
<html>
<head>
<link type="text/css" rel="stylesheet"
	href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp" />
<script>

var nav4=window.Event ? true : false;

	function soloNumeros(eve){
		var key=nav4?eve.which :eve.keyCode;
		return(key<=8 ||key<=7 ||key<=13 || (key>=48 && key<=57));
	}
	function enviar(){
		document.frmConvenio.action='<c:url value="/adminConvenio/llenar.jsp"/>';
		if(validarFormulario(document.frmConvenio))
			document.frmConvenio.submit();
	}

	function validarFormulario(forma){
		if(forma.nombreConvenio.value==""){
			alert("El nombre del convenio no puede estar vacio");
			return false;
		}
		return true;
	}

</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form action='<c:url value="/adminConvenio/AdminConvenio.x"/>'>
<input type="hidden" name="accion" value="2">
<input type="image" src='<c:url value="/comp/img/Buscar.gif" />'>
</form>
<form name="frmConvenio">
<input type="hidden" name="accion"	value='<c:out value="${requestScope.accion}" default="1"/>'>
<input type="hidden" name="idConvenio" value='<c:out value="${requestScope.datoConvenio.idConvenio}"/>'>
<table class="tablas" align="center">
	<caption>Datos generales de convenio</caption>
	<tr>
		<td class="renglones"><b>Número Convenio</b></td>
		<td><input type="text" name="numero" style="text-align: right;" onKeyPress='return soloNumeros(event)' value='<c:out value="${requestScope.datoConvenio.numero}" />'></td>
		<td class="renglones"><b>Estado</b></td>
		<td><select name="estado">
			<option value="1" <c:if test="${requestScope.datoConvenio.estado==1}">selected</c:if>>Vigente</option>
			<option value="2" <c:if test="${requestScope.datoConvenio.estado==2}">selected</c:if>>Indefinido</option>
			<option value="3" <c:if test="${requestScope.datoConvenio.estado==3}">selected</c:if>>Terminado</option>
			<option value="4" <c:if test="${requestScope.datoConvenio.estado==4}">selected</c:if>>Cancelado</option>
		</select></td>
		<td class="renglones"><b>Ano</b></td>
		<td><select name="ano">
			<option value="0">----</option>
			<c:forEach begin="1985" end="2012" var="ano" >
				<option value='<c:out value="${ano}" />' <c:if test="${requestScope.datoConvenio.ano==ano}">selected</c:if>><c:out value="${ano}" /></option>
			</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td class="renglones" colspan="6"><b>Nombre convenio</b></td>
	</tr>
	<tr>
		<td class="renglones" colspan="6"><input type="text" name="nombreConvenio" style="width:100%" value='<c:out value="${requestScope.datoConvenio.nombreConvenio}"/>'></td>
	</tr>
	<tr>
		<td class="renglones" colspan="6"><b>Entidades que
		intervienen</b></td>
	</tr>
	<tr>
		<td class="renglones" colspan="6"><input type="text"
			name="entidades" style="width:100%" value='<c:out value="${requestScope.datoConvenio.entidades}" />'></td>
	</tr>
	<tr>
		<td colspan="6">
		<table>
			<tr>
				<td class="renglones"><b>Fecha de Inicio</b></td>
				<td><input type='text' name='fecha' class='caj' readonly='true'
					id='f_date_a' size='13' value='<c:out value="${requestScope.datoConvenio.fecha}" />'>
				<button type='button' id='f_trigger_a'>...</button>
				<script type='text/javascript'>
				    			Calendar.setup({
					    			inputField     :    'f_date_a',
					    			ifFormat       :    '%d/%m/%Y',
					    			showsTime      :    false,
					    			button         :    'f_trigger_a',
					    			singleClick    :    false,
					    			step           :    1
				    			})
			    			</script></td>
				<td class="renglones"><b>Valor Convenio</b></td>
				<td><input type="text" name="valor" style="text-align: right;" onKeyPress='return soloNumeros(event)' value='<c:out value="${requestScope.datoConvenio.valor}" />'></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td colspan="6" class="renglones"><b>Observaciones</b></td>
	</tr>
	<tr>
		<td colspan="6"><textarea name="observaciones" style="width: 100%">--<c:out value="${requestScope.datoConvenio.observaciones}"/></textarea></td>
	</tr>
	<tr>
		<td colspan="6" align="center"><img src=<c:url value="/comp/img/Guardar.gif" /> onclick="enviar()"></td>
	</tr>
</table>
</form>
</body>
</html>
