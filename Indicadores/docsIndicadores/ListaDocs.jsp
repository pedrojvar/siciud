<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<c:import url="/general.jsp"/>
<script>
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<c:if test="${! empty requestScope.lista}">
	<form name="lista">
	<input type="hidden" name="accion" value="2">
	<input type="hidden" name="id" >
	<table align="center" class="tablas" border="0">
		<caption>LISTADO DE DOCUMENTOS ENCONTRADOS</caption>
		<tr>
			<td class="renglones" align="center"><b>#</b></td>
			<td class="renglones" align="center"><b>Usuario</b></td>
			<td class="renglones" align="center"><b>Tipo</b></td>
			<td class="renglones" align="center"><b>Categoria</b></td>
			<td class="renglones" align="center"><b>Descripcion y/o Título</b></td>
			<td class="renglones" align="center"><b>Observacion</b></td>
			<td class="renglones" align="center"><b>Archivo</b></td>
			<td class="renglones" align="center"><b>Imagen</b></td>
			<td class="renglones" align="center"><b>RAE</b></td>
		</tr>
		<c:forEach items="${requestScope.lista}" begin="0" var="lista" varStatus="st">
		<tr>
			<td><c:out value="${st.count}" /></td>
			<td><c:out value="${lista.nombreusuario}" /></td>
				<c:if test="${lista.indtipodoc == 1}">
					<td>Pdf
				</c:if>
				<c:if test="${lista.indtipodoc == 2}">
					<td>Excel
				</c:if>
				<c:if test="${lista.indtipodoc == 3}">
					<td>Power Point
				</c:if>
				<c:if test="${lista.indtipodoc == 4}">
					<td>Word
				</c:if>
				<c:if test="${lista.indtipodoc == 5}">
					<td>Xmind
				</c:if>
			</td>

				<c:if test="${lista.indcategoria == 1}">
					<td>Libros
				</c:if>
				<c:if test="${lista.indcategoria == 2}">
					<td>Articulos
				</c:if>
				<c:if test="${lista.indcategoria == 3}">
					<td>Documentos Soporte
				</c:if>
				<c:if test="${lista.indcategoria == 4}">
					<td>Presentaciones
				</c:if>
				<c:if test="${lista.indcategoria == 5}">
					<td>Politicas
				</c:if>
				<c:if test="${lista.indcategoria == 6}">
					<td>Reglamentacion UD
				</c:if>
				<c:if test="${lista.indcategoria == 7}">
					<td>Mapas Mentales
				</c:if>
				<c:if test="${lista.indcategoria == 8}">
					<td>Borradores de Libro
				</c:if>
			</td>
			<td><c:out value="${lista.inddescripcion}" /></td>
			<td><c:out value="${lista.indobservaciones}" /></td>
			<td align="center"><a href='<c:url value="/Documentos/DocsIndicadores/${lista.indnomdocumento}"/>'>
				<c:if test="${lista.indtipodoc == 1}">
					<img border="0" src='<c:url value="/comp/img/pdf.png"/>'>
				</c:if>
				<c:if test="${lista.indtipodoc == 2}">
					<img border="0" src='<c:url value="/comp/img/xcel.jpg"/>'>
				</c:if>
				<c:if test="${lista.indtipodoc == 3}">
					<img border="0" src='<c:url value="/comp/img/power.jpg"/>'>
				</c:if>
				<c:if test="${lista.indtipodoc == 4}">
					<img border="0" src='<c:url value="/comp/img/word.png"/>'>
				</c:if>
				<c:if test="${lista.indtipodoc == 5}">
					<img border="0" src='<c:url value="/comp/img/xmind.png"/>'>
				</c:if>
			</td>
			<td align="center">
			<c:if test="${lista.indcategoria == 3}">
				<a href='<c:url value="/Documentos/DocsIndicadores/${lista.indnomimagen}"/>'><img border="0" src='<c:url value="/comp/img/image.png"/>'>
			</c:if>
			</td>
			<td align="center"><a href='<c:url value="/docsIndicadores/AdminRAE.x?idrae=${lista.iddoc}&accion=2"/>'><img border="0" src='<c:url value="/comp/img/find.png"/>'></td>
		</tr>
		</c:forEach>
		</table>
	</c:if>
	<c:if test="${empty requestScope.lista}">
	<br><br><br>
		<h5 align="center">No se encuentran registros para esta consulta</h5>
	</c:if>
</body>
</html>