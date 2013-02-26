<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />
<jsp:useBean id="filtroWebProyectos" scope="session" class="cidc.publico.obj.FiltroPagWebProyectos"/>
<link type='text/css' rel='stylesheet' href='<c:url value="/comp/css/templateCIDC.css"/>'>

<script>

	function mensajeAlert(msg){
		if(msg){
			if(msg.value.length>0)
				alert(msg.value);
			msg.value="";
		}
	}
	if(top==self) top.location="/siciud/index.html";

	function ajaxGrupos(obj){
		var val=obj.value;
		if(val!=0){
			document.frmAjaxGrupo.dato.value=val;
			document.frmAjaxGrupo.para.value='1';
	 		document.frmAjaxGrupo.target="frameOculto";
			document.frmAjaxGrupo.submit();
		}
	}

</script>
<c:if test='${requestScope.msg!=null && requestScope.msg!=""}'>
	<input type="hidden" id='msg' name="msg" value='<c:out value="${requestScope.msg}"/>'>
</c:if>

</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="buscar" method="post" action='<c:url value="/PagWeb/llenarFiltroPaginaWebProyectos.jsp"/>'>
	<input type="hidden" name="accion" value="7">
	<table align="center" width="700px">
	<caption>FILTRO DE BUSQUEDA DE PROYECTOS DE INVESTIGACIÓN</caption>
		<tr class="sectiontableentry1">
			<td  style="width: 20%" class="sectiontableheader"><b>Nombre del Proyecto de Investigación:</b></td>
			<td colspan="3"><input style="width: 100%" type="text" name="nombreProyecto"></td>
		</tr>
		<tr class="sectiontableentry1">
			<td class="sectiontableheader" align="left"><b>Facultad:</b></td>
				<td style="width: 30%"><select class="texto" name="facultad" onchange="ajaxGrupos(this)">
					<option value="">-------------------</option>
					<option <%if(filtroWebProyectos.getFacultad().equals("4")) {%> selected <%} %> value="4">Ciencias y Educación</option>
					<option <%if(filtroWebProyectos.getFacultad().equals("2")) {%> selected <%} %> value="2">Ingeniería</option>
					<option <%if(filtroWebProyectos.getFacultad().equals("3")) {%> selected <%} %> value="3">Medio Ambiente y Recursos Naturales</option>
					<option <%if(filtroWebProyectos.getFacultad().equals("1")) {%> selected <%} %> value="1">Tecnológica</option>
					<option <%if(filtroWebProyectos.getFacultad().equals("5")) {%> selected <%} %> value="5">Artes (ASAB)</option>
				</select>
			</td>
		</tr>
		<tr class="sectiontableentry1">
			<td class="sectiontableheader" align="left"><b>Grupo/Semillero de Investigación:</b></td>
				<td style="width: 30%" colspan="4">
						<select class="texto" name="idGrupo" style="width: 100%">
							<option value='0'>------------------------ </option>
						</select>
			</td>
		</tr>
		<tr class="sectiontableentry1">
			<td class="sectiontableheader"><b>Nombre del Director:</b></td>
			<td><input type="text" name="nombreDirector"></td>
			<td style="width: 20%" class="sectiontableheader"><b>Apellidos del Director:</b></td>
			<td><input type="text" name="apellidoDirector"></input></td>
		</tr>
		<tr class="sectiontableentry1">
			<td colspan="6" align="center"><input type="submit" value="Buscar" /></td>
		</tr>
	</table>
</form>

	<c:if test="${!empty sessionScope.listaProyectosWeb}">

<table class="tablas" width="650px" align="center">
<c:set var="facultad" value="0"/>
		<CAPTION>LISTADO DE PROYECTOS DE INVESTIGACIÓN ENCONTRADOS</CAPTION>
		<c:forEach items="${sessionScope.listaProyectosWeb}" begin="0" var="lista" varStatus="st">
		<c:if test="${facultad!=lista.facultad}">
		<c:set var="facultad" value="${lista.facultad}"/>
		<tr>
			<td colspan="3" class="sectiontableheader"><c:out value="${lista.facultad}"/></td>
		</tr>
		</c:if>
		<tr>
			<td align="center">     -     </td>
			<td style="text-transform: capitalize;" align="left" class="sectiontableheader"><c:out value="${st.count}"></c:out>.</td>
			<c:if test="${lista.tabla == 1}">
				<td><a href='<c:url value="/web/Consultas.x?accion=8&tipoProyecto=1&idProyecto=${lista.idCodigoProyecto}"/>' title="Información detallada del Proyecto de Investigación"><c:out value="${lista.nombreProyecto}"/></a></td>
			</c:if>
			<c:if test="${lista.tabla == 2}">
				<td><a href='<c:url value="/web/Consultas.x?accion=8&tipoProyecto=2&idProyecto=${lista.idCodigoProyecto}"/>' title="Información detallada del Proyecto de Investigación"><c:out value="${lista.nombreProyecto}"/></a></td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
</c:if>


	<table width="100%">
		<tr>
			<td style="display:none"><iframe name="frameOculto" id="frameOculto"></iframe></td>
		</tr>
	</table>
	<form method="post" name="frmAjaxGrupo" action="<c:url value="/web/Ajax.x"/>">
		<input type="hidden" name="dato" value=''>
		<input type="hidden" name="para" value='1'>
	</form>


</body>
</html>