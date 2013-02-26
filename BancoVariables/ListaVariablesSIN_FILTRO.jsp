<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
<script>
	function confirmaEliminar(valor)
	{
		if(confirm('¿Esta seguro de eliminar la variable?'))
		{
			document.form1.accion.value = 5;
			document.form1.idVariable.value = valor;
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
<fmt:formatDate value="${now}" type="time" timeStyle="short" pattern="yyyy/MM/dd" var="ano"/>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="form1" method="post" action='<c:url value="/bancoVariables/AdminVariables.x"/>'>
<table class="tablas" width="95%" align="center">
<input type="hidden" name="accion"/>
<input type="hidden" name="idVariable"/>
	<caption>LISTADO DE VARIABLES CREADAS</caption>
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
		<c:forEach items="${requestScope.lista}" begin="0" var="lista" varStatus="st">
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
		<c:if test="${empty requestScope.lista}">
			<br><br><br>
				<h5 align="center">No se encuentran variables</h5>
		</c:if>
</body>
</html>