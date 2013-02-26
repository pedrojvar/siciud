<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
<script>
	function confirmaEliminar(valor)
	{
		if(confirm('¿Esta seguro de eliminar la ficha?'))
		{
			document.form1.accion.value = 9;
			document.form1.idind.value = valor;
			document.form1.submit();
		}
	}
</script>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
</head>
<c:import url="/general.jsp"/>
<jsp:useBean id="now" class="java.util.Date"/>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="buscar" method="post" action='<c:url value="/FichasIndicadores/llenarFiltro.jsp"/>'>
	<input type="hidden" name="accion" value="2">
	<input type="hidden" name="bandera" value="1">
	<table align="center" class="tablas" style="width: 70%">
	<caption>Filtro de Búsqueda de Fichas de Indicadores</caption>
		<tr>
			<td class="renglones"><b>Nombre</b></td>
			<td style="width: 90%"><input type="text" name="nombre"></td>
			<td class="renglones"><b>Identificador</b></td>
			<td><input type="text" name="identificador"></td>
			<td class="renglones" align="left"><b>Modelo:</b></td>
				<td colspan="1"><select name="modelo"">
					<option value="0">-------------------</option>
					<option value="1">C & I & D & C</option>
					<option value="2">SIGUD</option>
					<option value="3">SUE</option>
					<option value="4">Acreditación</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="renglones" align="left"><b>Responsable:</b></td>
				<td colspan="6"><select name="responsable" style="width: 95% ">
					<option value="0">--------------------------------------------------------</option>
					<option value="15">Centro de Investigaciones y Desarrollo Científico (CIDC)</option>
					<option value="17">Oficina Asesora de Planeación y Control</option>
					<option value="18">Vicerectoria Académica</option>
					<option value="19">Vicerectoria Administrativa y Financiera</option>
					<option value="20">Oficina de Docencia</option>
					<option value="21">Oficina Asesora de Sistemas y RedUDNET</option>
					<option value="22">Decanatura Ciencias y Educación</option>
					<option value="23">Decanatura Ingeniería</option>
					<option value="24">Decanatura Medio Ambiente</option>
					<option value="25">Decanatura Tecnológica</option>
					<option value="26">Decanatura Artes - ASAB</option>
					<option value="27">Centro de Relaciones Interinstitucionales (CERI)</option>
					<option value="28">Instituto de Extensión y de Educación no formal (IDEXUD)</option>
					<option value="29">Autoevaluación y Acreditación de Alta Calidad</option>
					<option value="30">Bienestar Institucional</option>
					<option value="31">Divisón de Recursos Financieros</option>
					<option value="32">Oficina Quejas, reclamos y atención al ciudadano</option>
					<option value="33">Divisón de Recursos Fisicos</option>
					<option value="34">Divisón de Talento Humano</option>
					<option value="35">Oficina Asesora de Control Interno</option>
					<option value="36">Oficina Asesora Jurídica</option>
					<option value="37">Sección Biblioteca</option>
					<option value="38">Secretaría General</option>
					<option value="39">Planeación COLCIENCIAS</option>
					<option value="40">SCIENTI </option>
					<option value="41">CvLAC </option>
				</select>
		</tr>
		<tr>
			<td colspan="6" align="center"><input type="image" src='<c:url value="/comp/img/Buscar.gif" />'></td>
		</tr>
	</table>
</form>

	<c:if test="${!empty sessionScope.listaFiltroFicha}">

<form name="form1" method="post" action='<c:url value="/fichasIndicadores/AdminFichas.x"/>'>
<table class="tablas" width="95%" align="center">
<input name="accion" type="hidden"/>
<input name="idind" type="hidden"/>
		<CAPTION>LISTADO DE FICHAS DE INDICADORES</CAPTION>
		<tr>
			<td class="renglones" align="center" style="width: 3%"><b>#</b></td>
			<td class="renglones" align="center" style="width: 5%"><b>Identificador</b></td>
			<td class="renglones" align="center" style="width: 15%"><b>Nombre</b></td>
			<td class="renglones" align="center" style="width: 5%"><b>Fecha de Corte</b></td>
			<td class="renglones" align="center" style="width: 15%"><b>Creador</b></td>
			<td class="renglones" align="center" style="width: 5%"><b>PDF</b></td>
			<td class="renglones" align="center" style="width: 5%"><b>Modif.</b></td>
			<td class="renglones" align="center" style="width: 5%"><b>Elimi.</b></td>
		</tr>
		<c:forEach items="${sessionScope.listaFiltroFicha}" begin="0" var="lista" varStatus="st">
		<tr <c:if test="${st.count mod 2==0}">class="trb"</c:if>>
			<td align="center"><b><c:out value="${st.count}" /></b></td>
			<td align="center"><c:out value="${lista.identificador}"/></td>
			<td align="left"><c:out value="${lista.nombre}"/></td>
			<td align="center"><c:out value="${lista.fechacorte}"/></td>
			<td align="center"><c:out value="${lista.nombrecreador}"/></td>
			<td align="center"><a href='<c:url value='/fichasIndicadores/GeneraPDF.x?accion=1&idind=${lista.id}'/>'><img border="0" src='<c:url value="/comp/img/pdf.png"/>'></a></td>
			<c:if test="${lista.creador == sessionScope.loginUsuario.idUsuario}">
				<td align="center"><a href='<c:url value='/fichasIndicadores/AdminFichas.x?accion=7&idind=${lista.id}'/>'><img border="0" src='<c:url value="/comp/img/disk.png"/>'></a></td>
				<td align="center" onclick="confirmaEliminar('<c:out value="${lista.id}"/>')"><img border="0" src='<c:url value="/comp/img/equis1.png"/>'></td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
	</form>
</c:if>
</body>
</html>