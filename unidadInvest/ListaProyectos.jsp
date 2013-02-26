<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<script type="text/javascript" language="javascript" src='<c:url value="/comp/js/lytebox.js"/>'></script>
<link rel="stylesheet" href='<c:url value="/comp/css/lytebox.css"/>' type="text/css" media="screen" />
<c:import url="/general.jsp"/>
<script>
	function ver(id){
		document.listado.id.value=id;
		document.listado.action='<c:url value="/unidadInvest/AdminUnidadFacultad.x"/>';
		document.listado.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<form name="filtro" method="post" action='<c:url value="/unidadInvest/llenarFiltro.jsp"/>'>
		<input type="hidden" name="accion" value="2"/>
	<br>
	<table class="tablas" align="center" width="75%">
	<CAPTION>Filtro de consulta</CAPTION>
		<tr>
			<th colspan="4"><b>Proyecto Curricular:</b></th>
		</tr>
		<tr>
			<td colspan="4">
				<select style="width:100%" name="idProyCurr">
					<option value='0'>----------------------------------------</option>
				<c:if test="${!empty sessionScope.listaProyCurr}">
					<c:forEach begin="0" items="${sessionScope.listaProyCurr}" var="proy" varStatus="st">
						<option value='<c:out value="${proy.id}"/>' ><c:out value="${proy.nombre}"/></option>
					</c:forEach>
				</c:if>
				</select>
			</td>
		</tr>
		<tr>
			<th colspan="4"><b>Grupo/Semillero Investigación</span></b></td>
		</tr>
		<tr>
			<td colspan="4">
				<select style="width:100%" name="idGrupo" onchange="ajaxInvestigadores(this)">
					<option value='0'>----------------------------------------</option>
					<c:forEach begin="0" items="${sessionScope.listaGrupos}" var="grupos" varStatus="st">
						<option value='<c:out value="${grupos.idGrupo}"/>'><c:out value="${grupos.nombreGrupo}"/></option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th><b>Estado</b></th>
			<td>
				<select style="width:100%" name="estado">
					<option value="0">---------</option>
					<option value="2" >Vigente</option>
					<option value="3" >Terminado</option>
					<option value="4" >Cancelado</option>
					<option value="5" >En prueba</option>
				</select>
			</td>
			<th>Tipo</th>
			<td>
				<select style="width:100%" name="tipo">
					<option value="0">---------</option>
					<option value="1" >General</option>
					<option value="2" >Convenio</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="image" src='<c:url value="/comp/img/Buscar.gif"/>'></td>
		</tr>
	</table>
	</form>
	<br>
<c:if test="${!empty sessionScope.listaProyectosUnidad}">
	<form name="listado" method="post" action=""><c:url value=""/>
		<input type="hidden" name="accion" value="2"/>
        <table class="tablas" width="98%" align="center" >
        <caption >Listado de Proyectos</caption>
        <tr>
	        <th width="10px" align="center"><b>#</b></th>
	       	<th width="10px" align="center"><b>st</b></th>
	       	<th width="80px" align="center"><b>Codigo</b></th>
        	<th width="150px" align="center"><b>Director</b></th>
        	<th align="center"><b>Nombre Proyecto</b></th>
        	<th align="center"><b>Estado</b></th>
        	<th width="30px" align="center"><b>Ver</b></th>
        </tr>
	<c:forEach begin="0" items="${sessionScope.listaProyectosUnidad}" var="lista" varStatus="st">
		<tr <c:if test="${(st.count mod 2)==0}">class="trb"</c:if>>
			<td width="10px" class="renglones"><b><c:out value="${st.count}"/></b></td>
			<td align="center"><img src='<c:url value="/comp/img/flag${lista.flag}.gif"/>'></td>
			<td width="80px" class="listas"><c:out value="${lista.codigo}"/></td>
			<td width="150px" class="listas"><c:out value="${lista.director}"/></td>
			<td class="listas"><c:out value="${lista.proyecto}"/></td>
			<td class="listas" align="center"><c:out value="${lista.estado}"/></td>
			<td width="30px" align="center"><a href='<c:url value="/unidadInvest/AdminUnidadFacultad.x?accion=3&id=${lista.id}&tipo=${lista.tipo}"/>' target="_parent" rel="lyteframe" title="Información Proyecto Investigación"
   rev="width: 500px; height: 350px; scrolling: auto;"><img border="0" src='<c:url value="/comp/img/find.gif"/>'></a> </td>
		</tr>
	</c:forEach>
		</table>
	</form>
</c:if>
</body>
</html>