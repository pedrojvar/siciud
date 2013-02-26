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
	function enviar(ac,id,st){
		if(ac==2||ac==4)
			document.evaluar.target="_parent";
		document.evaluar.accion.value=ac;
		document.evaluar.estado.value=st;
		document.evaluar.id.value=id;
		document.evaluar.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<c:if test="${!empty requestScope.listaArticulos}">
	<form name="evaluar" action='<c:url value="/EvalArticulos/EvalArticEvento.x"/>'>
	<input type="hidden" name="accion" value="">
	<input type="hidden" name="id" value=''>
	<input type="hidden" name="estado" value=''>
	<table width="97%" class="tablas" align="center">
	<caption>Estado de Artículos Inscritos</caption>
		<tr>
		<td width="10px" class="renglones" align="center"><b>#</b></td>
		<td class="renglones" align="center" width=""><b>Nombre Presentador</b></td>
		<td class="renglones" align="center" width=""><b>Nombre del Artículo</b></td>
		<td class="renglones" align="center"><b>Evaluación</b></td>
		<td width="80px" class="renglones" colspan="2" align="center"><b>Estado</b></td>
		</tr>
		<c:forEach begin="0" items="${requestScope.listaArticulos}" var="lista" varStatus="st">
			<tr>
				<td width="10px" class="renglones">
					<c:out value="${st.count}"/>
				</td>
				<td>
					<c:out value="${lista.nombPresentador}"/>
				</td>
				<td>
					<c:out value="${lista.nombArtic}"/>
				</td>
				<td width="30px" align="center">
					<c:if test="${lista.calificacion!=0}">
						<c:out value="${lista.calificacion}" />
					</c:if>
					<c:if test="${lista.calificacion==0}">
						<img border="0" src='<c:url value="/comp/img/Evaluar.gif"/>' onclick="enviar(2,<c:out value="${lista.idArtic}" />,0)">
					</c:if>
				</td>
				<td align="center" width="80px">
					<c:if test="${lista.estado!=2 and lista.estado!=3 and lista.calificacion!=0}">
					<img border="0" src='<c:url value="/comp/img/ok.png"/>' onclick="enviar(4,<c:out value="${lista.idArtic}" />,2)">
					<img border="0" src='<c:url value="/comp/img/no.png"/>' onclick="enviar(4,<c:out value="${lista.idArtic}" />,3)">
					</c:if>
					<c:if test="${lista.estado==2}">
						<img border="0" src='<c:url value="/comp/img/est7.gif"/>'">
					</c:if>
					<c:if test="${lista.estado==3}">
						<img border="0" src='<c:url value="/comp/img/est8.gif"/>'">
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</form>
</c:if>
<c:if test="${empty requestScope.listaArticulos}">
<h4 align="center">No hay datos para este filtro</h4>
</c:if>
</body>
</html>