<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<c:import url="/general.jsp" />
<%session.removeAttribute("movilidad");
session.removeAttribute("requisitos");
%>
</head>
<script>
	function ver(ac,st,id){
		document.lista.accion.value=ac;
		document.lista.id.value=id;
		document.lista.estado.value=st;
		document.lista.action='<c:url value="/articulos_Conv/ArticuloConv.x"/>';
		document.lista.submit();
	}

</script>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>
<c:if test="${!empty requestScope.listaArticulos}">
<div align="center">
	<fieldset style="width:90%;"><legend>Información General</legend>
	<p align="center" class="texto1">Bienvenido al sistema de inscripción para la solicitud de apoyo económico para la apropiación social del conocimiento a partir de presentación de ponencias en modalidad oral en eventos Nacionales y/o Internacionales.</p>
	<div align="center">
		<a href='<c:url value="/Articulos_Conv/InfoGeneral.jsp"/>'><img border="0" src='<c:url value="/comp/img/AgregarPropuesta.gif"/>'></a>
	</div>
	</fieldset>
</div>
	<br>

	<form name="lista">
	<input type="hidden" name="accion" value="3">
	<input type="hidden" name="id">
	<input type="hidden" name="estado">
	<table align="center" class="tablas" width="90%">
		<caption>Los Artículos inscritos</caption>
		<tr>
			<td class="renglones" align="center"><b>#</b></td>
			<td class="renglones" align="center"><b>Nombre Artículo</b></td>
			<td width="140px" class="renglones" align="center"><b>Revista</b></td>
			<td class="renglones" align="center" width="100px"><b>Documentos</b></td>
			<td class="renglones" align="center" width="18px"><b>Mail</b></td>
		</tr>
		<c:forEach items="${requestScope.listaArticulos}" begin="0" var="lista" varStatus="st">
			<tr <c:if test="${st.count mod 2==0}">class="trb"</c:if>>
				<td><c:out value="${st.count}" /></td>
				<td><c:out value="${lista.nombreart}" /></td>
				<td width="140px"><c:out value="${lista.revista}" /> -<c:out value="${lista.issnrevista}" /></td>
				<td width="100px" valign="middle">
					<img src='<c:url value="/comp/img/Modificar.gif"/>' onclick='ver(9,1,<c:out value="${lista.idPropuesta}" />)'>
				</td>
			</tr>
		</c:forEach>
	</table>
	</form>
</c:if>
<c:if test="${empty requestScope.listaArticulos}">
<br><br><br>
<div align="center">
	<fieldset style="width: 90%"><legend>Información General </legend>
		<p align="center" class="texto1">Bienvenido al sistema de inscripción para la solicitud de Apoyo De Publicación De Artículos De Investigación En Revistas Indexadas En Isi Web Of Knowledge Y/O Scopus Del Elsevier.</p>
		<div align="center">
			<a href='<c:url value="/Articulos_Conv/InfoGeneral.jsp"/>'><img border="0" src='<c:url value="/comp/img/AgregarPropuesta.gif"/>'></a>
		</div>
	</fieldset>
</div>
</c:if>
</body>
</html>
