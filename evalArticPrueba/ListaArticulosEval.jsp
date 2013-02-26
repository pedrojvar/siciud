<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/general.jsp"/>
<script>
	function ver(id,psw){
		document.evaluar.psw.value=document.getElementById("psw"+psw).value;
		document.evaluar.id.value=id;
		document.evaluar.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br><br>
<c:if test="${!empty requestScope.articulos}">
<form name="evaluar" action='<c:url value="/EvalArticulos/EvalArticPrueba.x"/>'>
	<input type="hidden" name="accion" value="1">
	<input type="hidden" name="idEval" value='<c:out value="${sessionScope.loginUsuario.idUsuario}"/>'>
	<input type="hidden" name="id" value=''>
	<input type="hidden" name="psw" value='0'>

	<table width="550px" class="tablas" align="center">
	<caption>Propuestas de Investigacion a evaluar</caption>
		<tr>
		<td class="renglones" align="center"><b>Propuesta de Investigación</b></td>
		<td class="renglones" align="center"><b>Doc.</b></td>
		<td width="100px" class="renglones" colspan="2" align="center"><b>Evaluar</b></td>
		</tr>
		<c:forEach begin="0" items="${requestScope.articulos}" var="lista" varStatus="vs">
			<tr>
				<td>
					<c:out value="${lista.nombre}"/>
				</td>
				<td width="30px">
					<a class="icono" href='<c:url value="/Documentos/Articulos/"/><c:out value="${lista.urlArchivo}"/>'>
						<img border="0" src='<c:url value="/comp/img/documento.png"/>'>
					</a>
				</td>
				<td>
					<input type="password" id='psw<c:out value="${vs.count}"/>' size="15" maxlength="15">
				</td>
				<td width="30px">
					<img src='<c:url value="/comp/img/Evaluar.png"/>' onclick="ver(<c:out value="${lista.id}" />,<c:out value="${vs.count}"/>)">
				</td>
			</tr>
		</c:forEach>
	</table>
</form>
</c:if>
<c:if test="${empty requestScope.articulos}">
<h4 align="center">No hay Artículos asignados para usted en este momento</h4>
</c:if>
</body>
</html>