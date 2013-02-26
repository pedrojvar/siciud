<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<jsp:useBean id="filtroWebSemilleros" scope="session" class="cidc.adminGrupos.obj.FiltroPagWebSemillero"/>
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
<form name="buscar" method="post" action='<c:url value="/PagWeb/llenarFiltroPaginaWebSemilleros.jsp"/>'>
	<input type="hidden" name="accion" value="4">
	<table align="center" width="650px">
	<caption>FILTRO DE BUSQUEDA DE SEMILLEROS DE INVESTIGACIÓN</caption>
		<tr class="sectiontableentry1">
			<td  style="width: 20%" class="sectiontableheader"><b>Nombre del Semillero:</b></td>
			<td colspan="3"><input style="width: 100%" type="text" name="nombreSemillero"></td>
		</tr>
		<tr class="sectiontableentry1">
			<td class="sectiontableheader" align="left"><b>Facultad:</b></td>
				<td style="width: 30%"><select class="texto" name="facultad">
					<option value="">-------------------</option>
					<option <%if(filtroWebSemilleros.getFacultad().equals("4")) {%> selected <%} %> value="4">Ciencias y Educación</option>
					<option <%if(filtroWebSemilleros.getFacultad().equals("2")) {%> selected <%} %> value="2">Ingeniería</option>
					<option <%if(filtroWebSemilleros.getFacultad().equals("3")) {%> selected <%} %> value="3">Medio Ambiente y Recursos Naturales</option>
					<option <%if(filtroWebSemilleros.getFacultad().equals("1")) {%> selected <%} %> value="1">Tecnológica</option>
					<option <%if(filtroWebSemilleros.getFacultad().equals("5")) {%> selected <%} %> value="5">Artes (ASAB)</option>
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

	<c:if test="${!empty sessionScope.listaSemillerosWeb}">

<table class="tablas" width="600px" align="center">
<c:set var="facultad" value="0"/>
		<CAPTION>LISTADO DE SEMILLEROS DE INVESTIGACIÓN ENCONTRADOS</CAPTION>
		<c:forEach items="${sessionScope.listaSemillerosWeb}" begin="0" var="lista" varStatus="st">
		<c:if test="${facultad!=lista.facultad}">
		<c:set var="facultad" value="${lista.facultad}"/>
		<tr>
			<td colspan="3" class="sectiontableheader"><c:out value="${lista.facultad}"/></td>
		</tr>
		</c:if>
		<tr>
			<td align="center">     -     </td>
			<td  align="left" class="sectiontableheader"><c:out value="${st.count}"></c:out>.</td>
			<td style="text-transform: uppercase;"><a href='<c:url value="/web/Consultas.x?accion=5&idSemillero=${lista.codigo}"/>' title="Información detallada del Semillero de Investigación"><c:out value="${lista.nombreSemillero}"/><c:if test="${lista.sigla != '' and lista.sigla != null}"> (<c:out value="${lista.sigla }"/>)</c:if></a></td>
		</tr>
		</c:forEach>
	</table>
</c:if>
</body>
</html>