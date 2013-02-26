<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<html>
<head>
<c:import url="/general.jsp"/>
</head>

<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>
<c:if test="${! empty sessionScope.resultadoInforme}">
	<c:if test="${! empty requestScope.sql}">
	<form name="parametrosInforme" action='<c:url value="/Informes/llenar.jsp"/>'>
		<input type="hidden" name="accion" value="4">
		<input type="hidden" name="sql" value='<c:out value="${requestScope.sql}"/>'>
		<table class="tablas" width="90%">
			<tr>
				<th>Sentencia SQL ejecutada</th>
			</tr>
			<tr>
				<td><c:out value="${requestScope.sql}"/></td>
			</tr>
			<tr>
				<th>Nombre del Informe</th>
			</tr>
			<tr>
				<td><input type="text" name="nombreInforme"></td>
			</tr>
			<tr>
				<th>Descripción del Informe</th>
			</tr>
			<tr>
				<td><input type="text" name="descripcion"></td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="Guardar Consulta"></td>
			</tr>
		</table>
	</form>
	</c:if>
	<form name="parametrosInforme" action='<c:url value="/Informes/llenar.jsp"/>'>
	<input type="hidden" name="accion" value="1">
		<table class="tablas" align="center">
		<caption>Resultado De Informe</caption>
			<tr>
				<td colspan="4" align="center">
					<table width="100%" class="tablas">
						<tr>
							<th>#</th>
						<c:forEach begin="0" items="${sessionScope.parametrosInf.etiquetasCamposMostrar}" var="lista" varStatus="st">
							<th><c:out value="${lista}"/></th>
						</c:forEach>
						</tr>
						<display:table export="true"  id="row" name="${sessionScope.resultadoInforme}" pagesize="15" class="tablas" style="width: 95%;" requestURI="">
							<display:setProperty name="export.pdf.informe" value="informe.pdf"/>					
							<display:setProperty name="paging.banner.placement" value="top"/>
							<c:forEach begin="0" items="${sessionScope.resultadoInforme.registro}" var="renglon" varStatus="cl">
								----------
							</c:forEach>
						</display:table>					
						
						<c:forEach begin="0" items="${sessionScope.resultadoInforme}" var="lista" varStatus="st">						
						<tr <c:if test="${(st.count mod 2)!=0}">class="trb"</c:if>>
							<th><c:out value="${st.count}"/></th>
							<c:forEach begin="0" items="${lista.registro}" var="registro">
								<td><c:out value="${registro}"/></td>
							</c:forEach>
						</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</form>
</c:if>
<c:if test="${empty sessionScope.resultadoInforme}">
<br></br>
<table align="center" class="tablas">
<caption>Error en la ejecución de la SQL</caption>
	<tr>
		<th>Mensaje enviado por el DBMS </th>
		<td><c:out value="${requestScope.msmExcepcion}"/></td>
	</tr>
</table>

</c:if>
</body>
</html>