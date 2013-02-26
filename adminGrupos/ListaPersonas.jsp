<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<c:import url="/general.jsp"/>
<script>

	function busqueda(cmd){
		document.frmBusquedas.accion.value=cmd;
		document.frmBusquedas.submit();
	}

	function buscarPersona(){
		if(validar()){
			document.buscar.action='<c:url value="/adminGrupos/AdminGrupos.x"/>';
			document.buscar.submit();
		}
	}

	function validar(){
		mensaje="";
		if(document.buscar.facultad.selectedIndex==0){
			mensaje=mensaje+"\n-) Facultad";
		}
		if(mensaje!=""){
			mensaje="Los siguientes campos son obligatorios: "+mensaje;
			alert (mensaje);
		}
		else
			return true;
		return false;
	}
	function ver(id,grupo){
		document.lista.action='<c:url value="/adminGrupos/AdminGrupos.x"/>';
		document.lista.codigo.value=id;
		document.lista.grupo.value=grupo;
		document.lista.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<table width="100%">
		<tr>
			<td align="center">
			<a href='<c:url value="/adminGrupos/AdminGrupos.x?accion=0" />'><img border="0" src="<c:url value="/comp/img/Home.png"/>"></a>
			</td>
		</tr>
	</table>
<br>
	<form name="buscar" method="post" action='<c:url value="/adminGrupos/llenar1.jsp"/>'>
	<input type="hidden" name="accion" value="13">
	<table align="center" class="tablas">
	<caption>Filtro de Búsqueda</caption>
		<tr>
			<td class="renglones"><b>Nombre</b></td>
			<td><input type="text" name="nombres"></td>
			<td class="renglones"><b>Apellido</b></td>
			<td><input type="text" name="apellidos"></td>
		</tr>
		<tr>
			<td class="renglones"><b>e-mail</b></td>
			<td><input type="text" name="mail"></td>
			<td class="renglones"><b>Cédula</b></td>
			<td><input type="text" name="cedula"></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="image" src='<c:url value="/comp/img/Buscar.gif" />'></td>
		</tr>
	</table>
	</form>
	<c:if test="${!empty requestScope.listaIntegrantes}">
	<form name="lista" >
	<input type="hidden" name="accion" value="14">
	<input type="hidden" name="codigo" value="">
	<input type="hidden" name="grupo" value="">
	<table class="tablas" align="center" width="95%">
	<caption>Listado de Grupos o Semilleros de Investigación</caption>
		<tr>
			<td align="center" class="renglones" width="20px"><b>#</b></td>
			<td align="center" class="renglones" width="120px"><b>Nombres</b></td>
			<td align="center" class="renglones" width="120px"><b>Apellidos</b></td>
			<td align="center" class="renglones" width="200px"><b>Facultad</b></td>
			<td align="center" class="renglones" width="25%"><b>Grupo Investigación</b></td>
			<td align="center" class="renglones" width="47px"><b>Ver</b></td>
		</tr>
	<c:forEach begin="0" items="${requestScope.listaIntegrantes}" var="lista" varStatus="st">
		<tr>
			<td width="20px" class="renglones"><b><c:out value="${st.count}"/></b></td>
			<td width="120px"><c:out value="${lista.nombres}"/></td>
			<td width="120px"><c:out value="${lista.apellidos}"/></td>
			<td width="200px"><c:out value="${lista.nombreFacultad}"/></td>
			<td><c:out value="${lista.nombreGrupo}"/></td>
			<td width="47px"><img src='<c:url value="/comp/img/VerProy.gif"/>' onclick='ver(<c:out value="${lista.id}"/>,<c:out value="${lista.idGrupo}"/>)'></td>
		</tr>
	</c:forEach>
	</table>
	</form>
	</c:if>
</body>
</html>