<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />
<jsp:useBean id="filtroWebGrupos" scope="session" class="cidc.adminGrupos.obj.FiltroPagWebGrupo"/>
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

</script>
<c:if test='${requestScope.msg!=null && requestScope.msg!=""}'>
	<input type="hidden" id='msg' name="msg" value='<c:out value="${requestScope.msg}"/>'>
</c:if>

</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="buscar" method="post" action='<c:url value="/PagWeb/llenarFiltroPaginaWebGrupos.jsp"/>'>
	<input type="hidden" name="accion" value="1">
	<table align="center" width="650px">
	<caption>FILTRO DE BUSQUEDA DE GRUPOS DE INVESTIGACIÓN</caption>
		<tr class="sectiontableentry1">
			<td  style="width: 20%" class="sectiontableheader"><b>Nombre del Grupo:</b></td>
			<td colspan="3"><input style="width: 100%" type="text" name="nombreGrupo"></td>
		</tr>
		<tr class="sectiontableentry1">
			<td class="sectiontableheader" align="left"><b>Facultad:</b></td>
				<td style="width: 30%"><select class="texto" name="facultad">
					<option value="">-------------------</option>
					<option <%if(filtroWebGrupos.getFacultad().equals("4")) {%> selected <%} %> value="4">Ciencias y Educación</option>
					<option <%if(filtroWebGrupos.getFacultad().equals("2")) {%> selected <%} %> value="2">Ingeniería</option>
					<option <%if(filtroWebGrupos.getFacultad().equals("3")) {%> selected <%} %> value="3">Medio Ambiente y Recursos Naturales</option>
					<option <%if(filtroWebGrupos.getFacultad().equals("1")) {%> selected <%} %> value="1">Tecnológica</option>
					<option <%if(filtroWebGrupos.getFacultad().equals("5")) {%> selected <%} %> value="5">Artes (ASAB)</option>
				</select>
			</td>
			<td style="width: 5%" class="sectiontableheader" align="left"><b>Categoría:</b></td>
				<td><select class="texto" name="categoria">
					<option value="">-------------------</option>
					<option <%if(filtroWebGrupos.getCategoria().equals("8")) {%> selected <%} %> value="8">A1</option>
					<option <%if(filtroWebGrupos.getCategoria().equals("5")) {%> selected <%} %> value="5">A</option>
					<option <%if(filtroWebGrupos.getCategoria().equals("4")) {%> selected <%} %> value="4">B</option>
					<option <%if(filtroWebGrupos.getCategoria().equals("3")) {%> selected <%} %> value="3">C</option>
					<option <%if(filtroWebGrupos.getCategoria().equals("7")) {%> selected <%} %> value="7">D</option>
					<option <%if(filtroWebGrupos.getCategoria().equals("1")) {%> selected <%} %> value="1">Sin Clasificación</option>
					<option <%if(filtroWebGrupos.getCategoria().equals("6")) {%> selected <%} %> value="6">Registrado</option>
					<option <%if(filtroWebGrupos.getCategoria().equals("2")) {%> selected <%} %> value="2">Institucionalizado</option>
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

	<c:if test="${!empty sessionScope.listaGruposWeb}">

<form name="form1" method="post" action='<c:url value="/gestionIndicadores/AdminFichas.x"/>'>

<table class="tablas" width="600px" align="center">
<input name="accion" type="hidden"/>
<c:set var="facultad" value="0"/>
		<CAPTION>LISTADO DE GRUPOS DE INVESTIGACIÓN ENCONTRADOS</CAPTION>
		<c:forEach items="${sessionScope.listaGruposWeb}" begin="0" var="lista" varStatus="st">
		<c:if test="${facultad!=lista.facultad}">
		<c:set var="facultad" value="${lista.facultad}"/>
		<tr>
			<td colspan="3" class="sectiontableheader"><c:out value="${lista.facultad}"/></td>
		</tr>
		</c:if>
		<tr>
			<td align="center">     -     </td>
			<td align="left" class="sectiontableheader"><c:out value="${st.count}"></c:out>.</td>
			<td style="text-transform: uppercase;"><a href='<c:url value="/web/Consultas.x?accion=2&idGrupo=${lista.codigo}"/>' title="Información detallada del Grupo de Investigación"><c:out value="${lista.nombreGrupo}"/><c:if test="${lista.sigla != '' and lista.sigla != null}"> (<c:out value="${lista.sigla }"/>)</c:if></a></td>
		</tr>
		</c:forEach>
	</table>
	</form>
</c:if>
</body>
</html>