<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<c:import url="/general.jsp"/>
<script type="text/javascript">
	function ver(id){
		document.lista.action='<c:url value="/unidadInvest/AdminUnidadFacultad.x?accion=5"/>';
		document.lista.id.value=id;
		document.lista.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>
	<form name="buscar" method="post" action='<c:url value="/unidadInvest/AdminUnidadFacultad.x?accion=4"/>'>
	<input type="hidden" name="accion" value="3">
	<table class="tablas" align="center">
		<CAPTION>Filtrar grupos por</CAPTION>
		<tr>
			<th><b>Grupo</b></th>
			<td>
				<input type="radio" name="tipo" value="1"  <c:if test="${requestScope.tipo==1}">checked</c:if>>
			</td>
			<th><b>Semillero</b></th>
			<td><input type="radio" name="tipo" value="2"  <c:if test="${requestScope.tipo==2}">checked</c:if>></td>
			<td><input type="image" src="<c:url value="/comp/img/Buscar.gif"/>" ></td>
		</tr>
	</table>
	</form>
	<c:if test="${!empty sessionScope.listaGruposUnidad}">
	<form name="lista" >
	<input type="hidden" name="accion" value="5">
	<input type="hidden" name="id" value="">
	<table class="tablas" align="center" width="95%">
	<caption>Listado de Grupos o Semilleros de Investigación</caption>
		<tr>
			<td align="center" class="renglones"><b>#</b></td>
			<td align="center" class="renglones"><b>Nombre Grupo/Semillero</b></td>
			<td align="center" class="renglones"><b>Director</b></td>
			<td align="center" class="renglones"><b>Ver</b></td>
		</tr>
	<c:forEach begin="0" items="${sessionScope.listaGruposUnidad}" var="lista" varStatus="st">
		<tr <c:if test='${(st.count mod 2)==0}'>class="trb"</c:if>>
			<td class="renglones"><b><c:out value="${st.count}"/></b></td>
			<td><c:out value="${lista.nombreGrupo}"/></td>
			<td><c:out value="${lista.director}"/></td>
			<td><img src='<c:url value="/comp/img/VerProy.gif"/>' onclick='ver(<c:out value="${lista.idGrupo}"/>)'></td>
		</tr>
	</c:forEach>
	</table>
	</form>
	</c:if>
</body>
</html>