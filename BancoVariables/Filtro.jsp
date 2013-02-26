<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<html>
<head>
<c:import url="/general.jsp"/>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">

	<form name="buscar" method="post" action='<c:url value="/BancoVariables/llenarFiltro.jsp"/>'>
	<input type="hidden" name="accion" value="8">
	<table align="center" class="tablas" style="width: 70%">
	<caption>Filtro de Búsqueda de Variables</caption>
		<tr>
			<td class="renglones"><b>Nombre</b></td>
			<td style="width: 90%"><input type="text" name="nombre" style="width: 95%"></td>
			<td class="renglones"><b>Identificador</b></td>
			<td><input type="text" name="identificador"></td>
		</tr>
		<tr>
			<td class="renglones" align="left"><b>Responsable:</b></td>
				<td colspan="4"><select name="responsable"">
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
			<td colspan="4" align="center"><input type="image" src='<c:url value="/comp/img/Buscar.gif" />'></td>
		</tr>
	</table>
	</form>

	<c:if test="${!empty requestScope.listaFiltro}">
	<form name="lista" >
	<input type="hidden" name="accion">
	<input type="hidden" name="idVariable">
	<table class="tablas" align="center" style="width: 10%">
	<caption>Listado de Variables</caption>
		<tr>
			<td class="renglones" align="center"><b>#</b></td>
			<td class="renglones" align="center"><b>Identificador</b></td>
			<td class="renglones" align="center"><b>Nombre</b></td>
			<td class="renglones" align="center"><b>Responsable</b></td>
			<td class="renglones" align="center"><b>Descripcion</b></td>
			<td class="renglones" align="center"><b>Fecha de Creacion</b></td>
			<td class="renglones" align="center"><b>Fecha de Ultima Actualización</b></td>
			<td class="renglones" align="center"><b>Dato</b></td>
			<td class="renglones" align="center"><b>Modif.</b></td>
			<td class="renglones" align="center"><b>Elimi.</b></td>
		</tr>

		<c:forEach items="${requestScope.listaFiltro}" begin="0" var="lista" varStatus="st">
		<tr <c:if test="${st.count mod 2==0}">class="trb"</c:if>>
			<td><b><c:out value="${st.count}" /></b></td>
			<td align="center"><c:out value="${lista.identificador}"/></td>
			<td><c:out value="${lista.nombre}" /></td>
			<c:if test="${lista.responsable == 15}">
					<td>Centro de Investigaciones y Desarrollo Científico (CIDC)</td>
				</c:if>
				<c:if test="${lista.responsable == 17}">
					<td>Oficina Asesora de Planeación y Control</td>
				</c:if>
				<c:if test="${lista.responsable == 18}">
					<td>Vicerectoria Académica</td>
				</c:if>
				<c:if test="${lista.responsable == 19}">
					<td>Vicerectoria Administrativa y Financiera</td>
				</c:if>
				<c:if test="${lista.responsable == 20}">
					<td>Oficina de Docencia</td>
				</c:if>
				<c:if test="${lista.responsable == 21}">
					<td>Oficina Asesora de Sistemas y RedUDNET</td>
				</c:if>
				<c:if test="${lista.responsable == 22}">
					<td>Decanatura Ciencias y Educación</td>
				</c:if>
				<c:if test="${lista.responsable == 23}">
					<td>Decanatura Ingeniería</td>
				</c:if>
				<c:if test="${lista.responsable == 24}">
					<td>Decanatura Medio Ambiente</td>
				</c:if>
				<c:if test="${lista.responsable == 25}">
					<td>Decanatura Tecnológica</td>
				</c:if>
				<c:if test="${lista.responsable == 26}">
					<td>Decanatura Artes - ASAB</td>
				</c:if>
				<c:if test="${lista.responsable == 27}">
					<td>Centro de Relaciones Interinstitucionales (CERI)</td>
				</c:if>
				<c:if test="${lista.responsable == 28}">
					<td>Instituto de Extensión y de Educación no formal (IDEXUD)</td>
				</c:if>
				<c:if test="${lista.responsable == 29}">
					<td>Autoevaluación y Acreditación de Alta Calidad</td>
				</c:if>
				<c:if test="${lista.responsable == 30}">
					<td>Bienestar Institucional</td>
				</c:if>
				<c:if test="${lista.responsable == 31}">
					<td>Divisón de Recursos Financieros</td>
				</c:if>
				<c:if test="${lista.responsable == 32}">
					<td>Oficina Quejas, reclamos y atención al ciudadano</td>
				</c:if>
				<c:if test="${lista.responsable == 33}">
					<td>Divisón de Recursos Fisicos</td>
				</c:if>
				<c:if test="${lista.responsable == 34}">
					<td>Divisón de Talento Humano</td>
				</c:if>
				<c:if test="${lista.responsable == 35}">
					<td>Oficina Asesora de Control Interno</td>
				</c:if>
				<c:if test="${lista.responsable == 36}">
					<td>Oficina Asesora Jurídica</td>
				</c:if>
				<c:if test="${lista.responsable == 37}">
					<td>Sección Biblioteca</td>
				</c:if>
				<c:if test="${lista.responsable == 38}">
					<td>Secretaría General</td>
				</c:if>
				<c:if test="${lista.responsable == 39}">
					<td>Planeación COLCIENCIAS</td>
				</c:if>
				<c:if test="${lista.responsable == 40}">
					<td>SCIENTI</td>
				</c:if>
				<c:if test="${lista.responsable == 41}">
					<td>CvLAC</td>
				</c:if>
			<td><c:out value="${lista.descripcion}" /></td>
			<td align="center"><c:out value="${lista.fechacreacion}" /></td>
			<td align="center"><c:out value="${lista.fechaactualizacion}" /></td>
			<td align="center"><c:out value="${lista.dato}" /></td>
			<c:if test="${lista.creador == sessionScope.loginUsuario.idUsuario}">
				<td align="center"><a href='<c:url value='/bancoVariables/AdminVariables.x?accion=3&idind=${lista.identificador}'/>'><img border="0" src='<c:url value="/comp/img/disk.png"/>'></a></td>
				<td align="center" onclick="confirmaEliminar('<c:out value="${lista.identificador}"/>')"><img border="0" src='<c:url value="/comp/img/equis1.png"/>'></td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
	</form>
	</c:if>
</body>
</html>