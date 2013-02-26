<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="loginUsuario" class="cidc.general.login.Usuario" scope="session" />
<html>
<head>
<c:import url="/general.jsp"/>
<script type="text/javascript">
function ver(id){
	document.lstSql.idInforme.value=id;
	document.lstSql.submit();
}
</script>
</head>

<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>
<%if(loginUsuario.isPerfil("1")){ %>
	<form name="consultaSql" action='<c:url value="/Informes/AdminInformes.x"/>'>
	<input type="hidden" name="accion" value="3">
		<table class="tablas" align="center" width="90%">
		<caption>Consulta Personalizada</caption>
			<tr>
				<td align="center">
					<textarea rows="3" name="sql" style="width: 100%"></textarea>
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="Enviar"></td>
			</tr>
		</table>
	</form>
<%} %>
	<form name="lstSql" action='<c:url value="/Informes/AdminInformes.x"/>'>
		<input type="hidden" name="accion" value="6">
		<input type="hidden" name="idInforme" value="">
		<table class="tablas" align="center" width="90%">
		<caption>Listado de Informes Almacenados</caption>
		<tr>
			<th>Fecha Creación</th>
			<th>Nombre de Informe</th>
			<th>Descripción del informe</th>
			<th>Ver</th>
		</tr>		
		<c:forEach begin="0" items="${sessionScope.listaInformes}" var="informe">
			<tr>
				<td><c:out value="${informe.fechaCreacion}"/></td>
				<td><c:out value="${informe.nombreInforme}"/></td>
				<td><c:out value="${informe.descripcion}"/></td>
				<td><img src='<c:url value="/comp/img/Ver.gif"/>' onclick='ver(<c:out value="${informe.id}"/>)'></td>
			</tr>
		</c:forEach>		
		
		</table>
	</form>
</body>
</html>