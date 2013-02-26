<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<c:import url="/general.jsp"/>
<script>

	function cambioTipo(boton){
		if(boton.value==2){
			document.buscar.tipo.value=2;
		}
		else{
			document.buscar.tipo.value=1;
		}
		ajaxGrupos(document.buscar.facultad);
	}

	function buscarGrupo(){
		if(validar()){
			document.buscar.action='<c:url value="/adminGrupos/AdminGrupos.x"/>';
			document.buscar.submit();
		}
	}

	function validar(){
		mensaje="";
		if(document.buscar.facultad.selectedIndex==0){
			mensaje=mensaje+"\n-) Facultad";
		}
		if(mensaje!=""){
			mensaje="Los siguientes campos son obligatorios: "+mensaje;
			alert (mensaje);
		}
		else
			return true;
		return false;
	}
	function ver(id){
		document.lista.action='<c:url value="/adminGrupos/AdminGrupos.x"/>';
		document.lista.id.value=id;
		document.lista.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">

	<table width="100%">
		<tr>
			<td align="center">
			<a href='<c:url value="/adminGrupos/AdminGrupos.x?accion=0" />'><img border="0" src="<c:url value="/comp/img/Home.png"/>"></a>
			</td>
		</tr>
	</table>
	<br>
	<form name="buscar" method="post">
	<input type="hidden" name="accion" value="3">
	<input type="hidden" name="desde" value="1">
	<table align="center" class="tablas">
	<caption>Filtro de consulta</caption>
		<tr>
			<td class="renglones"><b>Facultad:</b></td>
			<td>
				<select name="facultad">
					<option value="0">-------------</option>
					<option value="1" <c:if test="${requestScope.facultad==1}">selected</c:if>>Tecnológica</option>
					<option value="2" <c:if test="${requestScope.facultad==2}">selected</c:if>>Ingeniería</option>
					<option value="3" <c:if test="${requestScope.facultad==3}">selected</c:if>>Medio Ambiente</option>
					<option value="4" <c:if test="${requestScope.facultad==4}">selected</c:if>>Ciencias y Educación</option>
					<option value="5" <c:if test="${requestScope.facultad==5}">selected</c:if>> Artes (Asab)</option>
				</select>
			</td>
			<td><b>Grupo</b><input type="radio" name="boton" value="1" onClick="cambioTipo(this)" <c:if test="${requestScope.tipo==1}">checked</c:if>>
				<input type="hidden" name="tipo" value='<c:out value="${requestScope.tipo}" default="1"/>' >
			</td>
			<td><b>Semillero</b><input type="radio" name="boton" value="2" onClick="cambioTipo(this)" <c:if test="${requestScope.tipo==2}">checked</c:if>></td>
			<th>
				<b>Registros por página</b>
			</th>
			<td>
				<select name="regporpag" style="width: 70px">
					<option value="0">Todos</option>
					<option value="10" <c:if test="${requestScope.paginacion.regPorPag==10}">selected</c:if>>10</option>
					<option value="20" <c:if test="${requestScope.paginacion.regPorPag==20}">selected</c:if>>20</option>
					
				</select>
			</td>
			<td><img align="left" src="<c:url value="/comp/img/Buscar.gif"/>" onclick="buscarGrupo()"></td>
		</tr>
	</table>
	</form>
	<c:if test="${!empty requestScope.listaGrupos}">
	<form name="lista" >
	<input type="hidden" name="accion" value="4">
	<input type="hidden" name="id" value="">
	
	<table align="center" width="95%">
		<tr>
			<td align="left" width="350px">
			<p class="texto"><b></>Cantidad de registros encontrados: <c:out value="${requestScope.paginacion.totalRegistros}"/></b></p>
			</td>
			<td align="right">
				<table  align="right">
					<tr>
						<c:forEach begin="${requestScope.paginacion.inicio}" end="${requestScope.paginacion.fin}" var="pag">
						<td><a href='<c:url value="/adminGrupos/AdminGrupos.x?accion=3&facultad=${requestScope.facultad}&tipo=${requestScope.tipo}&desde=${pag}&regporpag=${requestScope.paginacion.regPorPag}"/>' target="main" <c:if test="${requestScope.paginacion.desde==pag}">style="color:#FF0000;font-size: 10;" </c:if> <c:if test="${requestScope.paginacion.desde!=pag}">style="color:#000000;font-size: 10;" </c:if>><b> <c:out value="${pag}"/> </b></a></td>
						</c:forEach>
						<c:if test="${requestScope.paginacion.inicio != 1}">
							<td><a href='<c:url value="/adminGrupos/AdminGrupos.x?accion=3&facultad=${requestScope.facultad}&tipo=${requestScope.tipo}&desde=${requestScope.paginacion.desde + 1}&regporpag=${requestScope.paginacion.regPorPag}"/>' target="main"><b> --> </b></a></td>
							<td><a href='<c:url value="/adminGrupos/AdminGrupos.x?accion=3&facultad=${requestScope.facultad}&tipo=${requestScope.tipo}&desde=${requestScope.paginacion.cantPaginas}&regporpag=${requestScope.paginacion.regPorPag}"/>' target="main"><b> fin </b></a></td>
						</c:if>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<table class="tablas" align="center" width="100%">
				<caption>Listado de Grupos o Semilleros de Investigación</caption>
					<tr>
						<td align="center" class="renglones"><b>#</b></td>
						<td align="center" class="renglones"><b>Código</b></td>
						<td align="center" class="renglones"><b>Nombre Grupo/Semillero</b></td>
						<td align="center" class="renglones"><b>Director</b></td>
						<td align="center" class="renglones"><b>Ver</b></td>
					</tr>
				<c:forEach begin="0" items="${requestScope.listaGrupos}" var="lista" varStatus="st">
					<tr>
						<td class="renglones"><b><c:out value="${st.count}"/></b></td>
						<td><c:out value="${lista.codigo}"/></td>
						<td><c:out value="${lista.nombre}"/></td>
						<td><c:out value="${lista.dirNombre}"/></td>
						<td><img src='<c:url value="/comp/img/VerProy.gif"/>' onclick='ver(<c:out value="${lista.codigo}"/>)'></td>
					</tr>
				</c:forEach>
				</table>
			</td>	
		</tr>
		<tr>
			<td align="right" colspan="2">
				<table  align="right">
					<tr>
						<c:forEach begin="${requestScope.paginacion.inicio}" end="${requestScope.paginacion.fin}" var="pag">
						<td><a href='<c:url value="/adminGrupos/AdminGrupos.x?accion=3&facultad=${requestScope.facultad}&tipo=${requestScope.tipo}&desde=${pag}&regporpag=${requestScope.paginacion.regPorPag}"/>' target="main" <c:if test="${requestScope.paginacion.desde==pag}">style="color:#FF0000;font-size: 10;" </c:if> <c:if test="${requestScope.paginacion.desde!=pag}">style="color:#000000;font-size: 10;" </c:if>><b> <c:out value="${pag}"/> </b></a></td>
						</c:forEach>
						<c:if test="${requestScope.paginacion.cantPaginas > requestScope.paginacion.fin}">
							<td><a href='<c:url value="/adminGrupos/AdminGrupos.x?accion=3&facultad=${requestScope.facultad}&tipo=${requestScope.tipo}&desde=${requestScope.paginacion.cantPaginas}&regporpag=${requestScope.paginacion.regPorPag}"/>' target="main"><b> Inicio </b></a></td>
							<td><a href='<c:url value="/adminGrupos/AdminGrupos.x?accion=3&facultad=${requestScope.facultad}&tipo=${requestScope.tipo}&desde=${requestScope.paginacion.desde - 1}&regporpag=${requestScope.paginacion.regPorPag}"/>' target="main"><b> <-- </b></a></td>
						</c:if>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
	</c:if>
</body>
</html>