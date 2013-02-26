<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<c:import url="/general.jsp"/>
<script>
	function enviar(accion,id,caso,re){
		document.getElementById("ok"+re).style.display='none';
		document.getElementById("no"+re).style.display='none';
		document.getElementById("espere"+re).style.display='';
		document.nuevo.action='<c:url value="/inscripcionSis/InscripSistema.x"/>';
		document.nuevo.id.value=id;
		document.nuevo.caso.value=caso;
		document.nuevo.accion.value=accion;
		document.nuevo.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>
<c:if test="${!empty requestScope.listaInscritos}">
	<form name="nuevo" method="post">
	<input type="hidden" name="accion" value="0">
	<input type="hidden" name="id" value="0">
	<input type="hidden" name="caso" value="0">
	<table class="tablas" align="center" width="600px">
	<caption>Lista de Directores Inscritos</caption>
		<tr class="renglones">
			<td align="center"><b>Facultad</b></td>
			<td align="center"><b>Pr. Curricular</b></td>
			<td align="center"><b>G/S de Investigación</b></td>
			<td align="center"><b>Nombre</b></td>
			<td align="center"><b>Mail Inscrito</b></td>
			<td align="center" colspan="2"><b>Acción</b></td>
		</tr>
		<c:forEach begin="0" items="${requestScope.listaInscritos}" var="lista" varStatus="st">
		<tr <c:if test="${lista.idUserSis!=0}">class="casEsp"</c:if><c:if test="${lista.idUserSis==0}">class="small"</c:if>>
			<td><c:out value="${lista.nombFacultad}"/></td>
			<td><c:out value="${lista.nombProyecto}"/></td>
			<td><c:out value="${lista.nombGrupo}"/></td>
			<td><c:out value="${lista.nombre}"/></td>
			<td <c:if test="${lista.mailBase!=lista.mail}">class="letraRoja"</c:if>><c:out value="${lista.mail}"/></td>
			<td id='espere<c:out value="${st.count}"/>' style="display:none;" colspan="2"><img src="<c:url value="/comp/img/cargando2.gif"/>"></td>
			<td id='ok<c:out value="${st.count}"/>'><img src="<c:url value="/comp/img/ok.png"/>" onclick="enviar(2,<c:out value="${lista.idPersona}"/>,<c:if test="${lista.idUserSis!=0}">1</c:if><c:if test="${lista.idUserSis==0}">2</c:if>,<c:out value="${st.count}"/>)"></td>
			<td id='no<c:out value="${st.count}"/>'><img src="<c:url value="/comp/img/no.png"/>" onclick="enviar(3,<c:out value="${lista.idPersona}"/>,0,<c:out value="${st.count}"/>)"></td>
		</tr>
		</c:forEach>
	</table>
	</form>
</c:if>
<c:if test="${empty requestScope.listaInscritos}">
<h4 align="center">No hay nuevas inscripciones en el momento</h4>
</c:if>
</body>
</html>