<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<html>
<head>
<c:import url="/general.jsp"/>
<script type="text/javascript">
function buscar(){
	document.filtro.submit();
}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>
<form name="filtro" action='<c:url value="/gruposInventario/llenar.jsp" />'>
<input type="hidden" name="accion" value="2"> 
<table class="tablas" align="center">
<CAPTION>Búsqueda de Elemento</CAPTION>
	<tr>
		<th>Placa Elemento</th>
		<td><input type="text" name="codigo" value='<c:out value="${sessionScope.NuevoELementoGrupo.codigo}" />'></td>
		<th>Nombre Elemento</th>
		<td><input type="text" name="nombreElemento" value='<c:out value="${sessionScope.NuevoELementoGrupo.nombreElemento}"/>'></td>
		<td>
            <select name="categoria">
                    <option value="0" >Todo</option>
                    <option value="1" <c:if test="${sessionScope.NuevoELementoGrupo.categoria==1}">selected</c:if>>Bibliográfico</option>
                    <option value="2" <c:if test="${sessionScope.NuevoELementoGrupo.categoria==2}">selected</c:if>>Software</option>
                    <option value="3" <c:if test="${sessionScope.NuevoELementoGrupo.categoria==3}">selected</c:if>>Equipos o Computo</option>                    
            </select>
       </td>
	</tr>
	<tr>
		<td colspan="4" align="center"><img src='<c:url value="/comp/img/Enviar.gif"/>' onclick="buscar()"></td>
	</tr>
</table>	
</form>
	<form name="filtro1" action='<c:url value="/inventario/InventarioGrupos.x" />'>
	<br>
	<c:if test="${!empty sessionScope.listaElementos}">
		<div align="center">
			<fieldset style="width:1000px;">	        
			<table align="center" class="tablas" width="95%">	
				<caption>Lista de elementos Encontrados</caption>		
					<display:table export="true"  id="row" name="${sessionScope.listaElementos}" pagesize="700" class="tablas" style="width: 95%;" requestURI="">				
							<display:setProperty name="export.pdf.inventario" value="inventario.pdf"/>					
							<display:setProperty name="paging.banner.placement" value="top"/>
							<display:column property="codigo" sortable="true" title="Placa" style="width:40px;"></display:column>			
							<display:column property="fecha" sortable="true" title="Fecha" style="width:100px;"></display:column>
							<display:column property="nombreElemento" sortable="true" title="Nombre Elemento" style="width:170px;"></display:column>
							<display:column property="valor" sortable="true" title="Valor" style="width:80px;"></display:column>
							<display:column property="observacion" sortable="true" title="Ubicación/Responsable" style="width:280px;"></display:column>
							<display:column property="tipoElemento" sortable="true" title="Tipo Elemento" style="width:70px;"></display:column>
							<display:column property="grpobserventrega" sortable="true" title="Observación" style="width:70px;"></display:column>
			    			<display:setProperty name="inventario.pdf" value="true" />	    			
					</display:table>	
			</table>	
			</fieldset>	
		</div>
	</c:if>
	</form>
</body>
</html>