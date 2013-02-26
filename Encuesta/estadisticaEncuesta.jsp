<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<c:import url="/general.jsp"/></head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">

<!--
<form name="form1" method="post" action='<c:url value="/Encuesta/llenar.jsp"/>'>
<table class="tablas" width="95%" align="center" border="0">
	<caption>ESTADISTICAS GENERALES - ENCUESTA DE PERCEPCIÓN SOBRE LA INVESTIGACIÓN EN LA UD</caption>
	<tr>
		<td class="renglones" width="150px" align="center"><b>FACULTAD</b></td>
		<td>
			<table>
				<tr>
					<td class="renglones" width="150px" align="center" colspan="2"><b>ESTUDIANTES</b></td>
					<td class="renglones" width="150px" align="center" colspan="2"><b>PROFESORES</b></td>
					<td class="renglones" width="150px" align="center" colspan="2"><b>ADMINISTRATIVOS</b></td>
				</tr>
				<tr>
					<td class="renglones" width="150px" align="center"><b>#</b></td>
					<td class="renglones" width="150px" align="center"><b>Meta</b></td>
					<td class="renglones" width="150px" align="center"><b>#</b></td>
					<td class="renglones" width="150px" align="center"><b>Meta</b></td>
					<td class="renglones" width="150px" align="center"><b>#</b></td>
					<td class="renglones" width="150px" align="center"><b>Meta</b></td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td class="trb" width="150px" align="center"><b>Ciencias y Educación</b></td>
		<td>
			<table border="0">
				<tr>
					<td class="trb" width="150px" align="center"><c:out value="${requestScope.estCiencias}" /></td>
					<td class="trb" width="150px" align="center">501</td>
					<td class="trb" width="150px" align="center"><c:out value="${requestScope.proCiencias}" /></td>
					<td class="trb" width="150px" align="center">46</td>
					<td class="trb" width="150px" align="center"><c:out value="${requestScope.adminCiencias}" /></td>
					<td class="trb" width="150px" align="center">8</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="texto" width="150px" align="center"><b>Ingeniería</b></td>
		<td>
			<table border="0">
				<tr>
					<td class="texto" width="150px" align="center"><c:out value="${requestScope.estIng}" /></td>
					<td class="texto" width="150px" align="center">486</td>
					<td class="texto" width="150px" align="center"><c:out value="${requestScope.proIng}" /></td>
					<td class="texto" width="150px" align="center">40</td>
					<td class="texto" width="150px" align="center"><c:out value="${requestScope.adminIng}" /></td>
					<td class="texto" width="150px" align="center">42</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="trb" width="150px" align="center"><b>Medio Ambiente</b></td>
		<td>
			<table border="0">
				<tr>
					<td class="trb" width="150px" align="center"><c:out value="${requestScope.estMedio}" /></td>
					<td class="trb" width="150px" align="center">413</td>
					<td class="trb" width="150px" align="center"><c:out value="${requestScope.proMedio}" /></td>
					<td class="trb" width="150px" align="center">23</td>
					<td class="trb" width="150px" align="center"><c:out value="${requestScope.adminMedio}" /></td>
					<td class="trb" width="150px" align="center">7</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="texto" width="150px" align="center"><b>Tecnológica</b></td>
		<td>
			<table border="0">
				<tr>
					<td class="texto" width="150px" align="center"><c:out value="${requestScope.estTecno}" /></td>
					<td class="texto" width="150px" align="center">515</td>
					<td class="texto" width="150px" align="center"><c:out value="${requestScope.proTecno}" /></td>
					<td class="texto" width="150px" align="center">33</td>
					<td class="texto" width="150px" align="center"><c:out value="${requestScope.adminTecno}" /></td>
					<td class="texto" width="150px" align="center">7</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="trb" width="150px" align="center"><b>Artes - ASAB</b></td>
		<td>
			<table border="0">
				<tr>
					<td class="trb" width="150px" align="center"><c:out value="${requestScope.estArtes}" /></td>
					<td class="trb" width="150px" align="center">85</td>
					<td class="trb" width="150px" align="center"><c:out value="${requestScope.proArtes}" /></td>
					<td class="trb" width="150px" align="center">8</td>
					<td class="trb" width="150px" align="center"><c:out value="${requestScope.adminArtes}" /></td>
					<td class="trb" width="150px" align="center">6</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
-->
<br>
<table class="tablas" width="95%" align="center" border="0">
	<caption>ESTADISTICAS PERSONALES- ENCUESTA DE PERCEPCIÓN SOBRE LA INVESTIGACIÓN EN LA UD</caption>
	<tr>
		<td class="renglones" width="150px" align="center"><b>TIPO</b></td>
		<td class="renglones" width="150px" align="center"><b>Número</b></td>
		<td class="renglones" width="150px" align="center"><b>Meta</b></td>
	</tr>
	<tr>
		<td class="texto" width="150px" align="center"><b>Encuestas Propias</b></td>
		<td class="texto" width="150px" align="center"><c:out value="${requestScope.numEncuestador}" /></td>
		<td class="texto" width="150px" align="center">222</td>
	</tr>
	<tr>
		<td class="trb" width="150px" align="center"><b>Encuestas Generales</b></td>
		<td class="trb" width="150px" align="center"><c:out value="${requestScope.numGeneral}" /></td>
		<td class="trb" width="150px" align="center">2220</td>
	</tr>
</table>
</body>
</html>