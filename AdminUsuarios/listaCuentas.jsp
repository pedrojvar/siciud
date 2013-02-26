<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<c:import url="/general.jsp"/>
</head>
<script>
	function buscar(){
		document.filtro.submit();
	}
	function ver(id){
		document.lista.id.value=id;
		document.lista.action='<c:url value="/AdminUsuarios/AdminCuenta.x"/>';
		document.lista.submit();
	}
</script>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>


	<form name="filtro" action='<c:url value="/AdminUsuarios/llenar.jsp"/>'>
	<input type="hidden" name="accion" value="1">
		<table class="tablas" align="center">
		<caption>Filtro de búsqueda</caption>
			<tr>
				<td class="renglones"><b>Ver:</b></td>
				<td>
					<select name="perfil" style="width:115px">
						<option value="%" <c:if test='${sessionScope.filtroCuenta.perfil=="%"}'>selected</c:if> >Todos</option>
						<option value="1" <c:if test='${sessionScope.filtroCuenta.perfil=="1"}'>selected</c:if>>Funcionarios</option>
						<option value="8" <c:if test='${sessionScope.filtroCuenta.perfil=="8"}'>selected</c:if>>Investigadores</option>
						<option value="9" <c:if test='${sessionScope.filtroCuenta.perfil=="9"}'>selected</c:if>>Evaluadores</option>
						<option value="10" <c:if test='${sessionScope.filtroCuenta.perfil=="10"}'>selected</c:if>>Dir. grupo</option>
						<option value="11" <c:if test='${sessionScope.filtroCuenta.perfil=="11"}'>selected</c:if>>Eval. Comite</option>
						<option value="12" <c:if test='${sessionScope.filtroCuenta.perfil=="12"}'>selected</c:if>>Control Interno</option>
						<option value="13" <c:if test='${sessionScope.filtroCuenta.perfil=="13"}'>selected</c:if>>IEIE</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="renglones"><b>Nombre:</b></td>
				<td class="renglones"><b>Apellido:</b></td>
			</tr>
			<tr>
				<td><input type="text" name="nombre" ></td>
				<td><input type="text" name="apellido" ></td>
			</tr>
			<tr>
				<td class="renglones"><b>Nick:</b></td>
				<td class="renglones"><b>Orden por:</b></td>
			</tr>
			<tr>
				<td><input type="text" name="nick" ></td>
				<td>
					<select name="orden" style="width:115px">
						<option value="1">Nombre</option>
						<option value="2">Apellido</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<img src='<c:url value="/comp/img/Buscar.gif"/>' onclick="buscar()">
				</td>
			</tr>
		</table>
	</form>
	<c:if test="${! empty requestScope.listaCuentas}">
	<form name="lista">
	<input type="hidden" name="accion" value="2">
	<input type="hidden" name="id" >
	<table align="center" class="tablas">
	<caption>Lista de Cuentas de Usuario</caption>
		<tr>
			<td class="renglones" align="center"><b>#</b></td>
			<td class="renglones" align="center"><b>Nombres</b></td>
			<td class="renglones" align="center"><b>Apellidos</b></td>
			<td class="renglones" align="center"><b>Nick</b></td>
			<td class="renglones" align="center" width="90px"><b>Perfiles</b></td>
			<td class="renglones" align="center"><b>Ult. Modificación</b></td>
			<td class="renglones" align="center"><b>Ver</b></td>
		</tr>
		<c:forEach items="${requestScope.listaCuentas}" begin="0" var="lista" varStatus="st">
		<tr>
			<td><c:out value="${st.count}" /></td>
			<td><c:out value="${lista.nombre}" /></td>
			<td><c:out value="${lista.apellido}" /></td>
			<td><c:out value="${lista.nick}" /></td>
			<td width="90px" align="center">
				<c:forTokens items="${lista.perfiles}" delims="," var="perfil">
					<c:url value="${perfil}  " />
				</c:forTokens>
			</td>
			<td><c:out value="${lista.fecha}" /></td>
			<td><img src='<c:url value="/comp/img/find.gif"/>' onclick='ver(<c:out value="${lista.id}" />)'></td>
		</tr>
		</c:forEach>
	</table>
	</form>
	</c:if>
</body>
</html>