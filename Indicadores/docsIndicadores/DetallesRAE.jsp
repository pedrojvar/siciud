<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<c:import url="/general.jsp"/>
<script>

function atras()
    {
    	javascript:void(0);
    }
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<c:if test="${! empty sessionScope.obj}">
	<form name="lista">
	<input type="hidden" name="accion" value="5">
	<input type="hidden" name="id" >
	<table align="center" class="tablas" border="0" style="width:100%">
		<caption>DETALLES DE RAE</caption>
		<tr>
			<td class="renglones" width="150px"><b>Apellidos del Autor(es):</b></td>
			<td><c:out value="${sessionScope.obj.apellidos}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Nombres del Autor(es):</b></td>
			<td><c:out value="${sessionScope.obj.nombres}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Título:</b></td>
			<td><c:out value="${sessionScope.obj.titulo}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Fecha de Publicación:</b></td>
			<td><c:out value="${sessionScope.obj.fechapublicacion}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Ciudad de Publicación:</b></td>
			<td><c:out value="${sessionScope.obj.ciudad}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Casa editorial:</b></td>
			<td><c:out value="${sessionScope.obj.editorial}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Número de Páginas:</b></td>
			<td><c:out value="${sessionScope.obj.numeropaginas}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Dirección web del Documento:</b></td>
			<td><c:out value="${sessionScope.obj.dirweb}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Fecha exacta de acceso al documento:</b></td>
			<td><c:out value="${sessionScope.obj.fechaacceso}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Sintesis global del contenido:</b></td>
			<td><c:out value="${sessionScope.obj.sintesisglobal}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Idea Central del Texto:</b></td>
			<td><c:out value="${sessionScope.obj.ideacentral}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Pagina de la Idea Central:</b></td>
			<td><c:out value="${sessionScope.obj.paginaideacentral}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Conceptos y Categorias:</b></td>
			<td><c:out value="${sessionScope.obj.conceptoscategorias}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Referencia Externa N. 1:</b></td>
			<td><c:out value="${sessionScope.obj.ref1}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Referencia Externa N. 2:</b></td>
			<td><c:out value="${sessionScope.obj.ref2}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Referencia Externa N. 3:</b></td>
			<td><c:out value="${sessionScope.obj.ref3}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Referencia Externa N. 4:</b></td>
			<td><c:out value="${sessionScope.obj.ref4}" /></td>
		<tr>
			<td class="renglones" width="150px"><b>Valoración Crítica:</b></td>
			<td><c:out value="${sessionScope.obj.valoracioncritica}" /></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Volúmen:</b></td>
			<td><c:out value="${sessionScope.obj.volumen}" /></td>
		<tr>
		<tr>
			<td class="renglones" width="150px"><b>Número de Capítulo o Seccion:</b></td>
			<td><c:out value="${sessionScope.obj.numcapitulo}" /></td>
		<tr>
			<td colspan="3" align="center"><a href='<c:url value="/Indicadores/docsIndicadores/EditarRAE.jsp"/>'><img border="0" src='<c:url value="/comp/img/Modificar.gif"/>'></a></td>
			<td colspan="3" align="center"><img src='<c:url value="/comp/img/Atras.gif"/>' onclick="history.go(-1)"></td>
		</tr>
	</table>
	</c:if>
	<c:if test="${empty sessionScope.obj}">
	<br><br><br>
		<h5 align="center">No se encuentran registros para esta consulta</h5>
	</c:if>
</body>
</html>