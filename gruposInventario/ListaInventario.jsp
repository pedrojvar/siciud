<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<html>
<head>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<c:import url="/general.jsp"/>
<jsp:useBean id="fecha" class="java.util.Date"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" type="time" timeStyle="short" pattern="yyyy" var="ano"/>

</head>
	<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<br><br><br>
	<div align="center">
	<fieldset style="width:1000px;">
	<table align="center" class="tablas" width="95%">		
		<CAPTION>Asignación por medio de Proyectos de Investigación</CAPTION>		
			<display:table export="true"  id="row" name="${sessionScope.listaPorProyecto}" pagesize="15" class="tablas" style="width: 95%;" requestURI="">				
				<display:setProperty name="export.pdf.inventario" value="inventario.pdf"/>					
				<display:setProperty name="paging.banner.placement" value="top"/>
				<display:column property="fecha" sortable="true" title="Fecha" style="width:70px;"></display:column>			
				<display:column property="codProyecto" sortable="true" title="Código Proyecto" style="width:50px;"></display:column>
				<display:column property="nombreProyecto" sortable="true" title="Nombre Proyecto" style="width:170px;"></display:column>
				<display:column property="nombreDirector" sortable="true" title="Nombre Director" style="width:80px;"></display:column>
				<display:column property="nombreElemento" sortable="true" title="Elemento" style="width:190px;"></display:column>
				<display:column property="codigo" sortable="true" title="Placa" style="width:80px;"></display:column>
				<display:column property="valor" sortable="true" title="Valor" style="width:50px;"></display:column>
				<display:column property="observacion" sortable="true" title="Observación" style="width:80px;"></display:column>
			    <display:setProperty name="inventario.pdf" value="true" />	    			
		</display:table>
	</table>
	</fieldset>
	</div>
	<br>	
	<div align="center">
		<fieldset style="width:1000px;">
		<table align="center" class="tablas" width="95%">		
			<CAPTION>Asignación Directa</CAPTION>		
				<display:table export="true"  id="row" name="${sessionScope.listaPorGrupo}" pagesize="15" class="tablas" style="width: 95%;" requestURI="">				
					<display:setProperty name="export.pdf.inventario" value="inventario.pdf"/>					
					<display:setProperty name="paging.banner.placement" value="top"/>
					<display:column property="fecha" sortable="true" title="Fecha" style="width:50px;"></display:column>			
					<display:column property="codigo" sortable="true" title="Placa" style="width:50px;"></display:column>
					<display:column property="nombreElemento" sortable="true" title="Elemento" style="width:170px;"></display:column>
					<display:column property="valor" sortable="true" title="Valor" style="width:50px;"></display:column>
					<display:column property="observacion" sortable="true" title="Observación" style="width:80px;"></display:column>
				    <display:setProperty name="inventario.pdf" value="true" />	    			
			</display:table>
		</table>
		</fieldset>
	</div>
	
	</body>
</html>