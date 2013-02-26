<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<link href='<c:url value="/comp/css/tablas.css"/>' rel="stylesheet" type="text/css">
<link href='<c:url value="/comp/css/formatos.css"/>' rel="stylesheet" type="text/css">
<html>
<head>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
</head>
<c:import url="/general.jsp"/>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="form1" method="post" action='<c:url value="/GestionIndicadores/llenar.jsp"/>'>
<table class="tablas" width="95%" align="center">
	<caption>REPORTE DEL INDICADOR</caption>
	<tr>
	    <td class="lroja3" align="center"><a class="menu" href ='<c:url value="/ReportesIndicadores/ReporteColumnasH.jsp?nombre=${sessionScope.nombreGrafica}"/>'>Ver en Columnas Horizontales</a></td>
	    <td class="lroja3" align="center"><a class="menu" href='<c:url value="/ReportesIndicadores/ReporteColumnasV.jsp?nombre=${sessionScope.nombreGrafica}"/>'>Ver en Columnas Verticales</a></td>
	</tr>
	<tr>
	<td colspan="2" >
		<div id="flashcontent" align="center">
			<script type="text/javascript" src="/siciud/ReportesIndicadores/GraficosDonuts/swfobject.js"></script>
			<script type="text/javascript">
				var so = new SWFObject("/siciud/ReportesIndicadores/GraficosDonuts/Tortas.swf", "ampie", "500", "350", "8", "#FFFFFF");
				so.addVariable("path", "/siciud/ReportesIndicadores/GraficosDonuts");
				so.addVariable("settings_file", encodeURIComponent("/siciud/ReportesIndicadores/GraficosDonuts/Configuracion1.xml"));
				so.addVariable("data_file", encodeURIComponent("/siciud/ReportesIndicadores/GraficosDonuts/Datos/<c:out value="${sessionScope.nombreGrafica}"/>"));

				so.write("flashcontent");

			</script>
		</div>
	</td>
  </tr>
</table>
<br>
<br>
		<table class="tablas" width="70%" align="center" id="tabla">
			<caption>REPORTE ALFANUMÉRICO</caption>
			<tr>
				<td class="trb" align="center"><b>Nombre de la Variable</b></td>
				<td class="trb" align="center"><b>Identificador</b></td>
				<td class="trb" align="center"><b>Dato</b></td>
			</tr>
			<tr>
				<c:forEach items="${sessionScope.lista}" begin="0" var="lista" varStatus="st">
				<tr <c:if test="${st.count mod 2==0}">class="trb"</c:if>>
					<td align="left"><c:out value="${lista.nombre}"/></td>
					<td align="center"><c:out value="${lista.identificador}"/></td>
					<td align="center"><c:out value="${lista.dato}" /></td>
				</tr>
			</c:forEach>
			</tr>
			<tr>
				<td class="trb" align="right"><b></b></td>
				<td class="trb" align="center"><b></b></td>
			</tr>
			<tr>
				<td class="lroja" align="right"><b>Resultado de la Fórmula <c:out value="${sessionScope.info.formula}"></c:out></b></td>
				<td class="lroja" align="center"><c:out value="${sessionScope.respuesta}"></c:out> </td>
			</tr>
		</table>
</form>
</body>
</html>