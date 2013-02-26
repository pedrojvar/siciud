<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
<script>
	function ajaxProyCurr(obj){
		var val=obj.value;
		if(val!=""){
			document.frmAjaxNumero.dato.value=val;
	 		document.frmAjaxNumero.target="frameOculto";
			document.frmAjaxNumero.submit();
		}
	}
	function cambioFac(boton){
		document.filtro.facultad.value=boton.value;
		ajaxProyCurr(document.filtro.facultad);
	}

	function ver(codEval,tipoEval){
		document.filtro.codEval.value=codEval;
		document.filtro.tipEval.value=tipoEval;
		document.filtro.accion.value=9;
		document.filtro.action='<c:url value="/adminAsignacion/AsignaEvaluador.x"/>';
		document.filtro.submit();
	}
	function asignar(codEval){
		document.filtro.codEval.value=codEval;
		document.filtro.accion.value=6;
		if(document.filtro.idArtic.value!="")
			document.filtro.action='<c:url value="/adminArticulos/AdminArticulos.x"/>';
		else
			document.filtro.action='<c:url value="/adminAsignacion/AsignaEvaluador.x"/>';
		document.filtro.submit();
	}
	function atras(){
		if(document.filtro.idArtic.value!=""){
			document.ir.action='<c:url value="/adminArticulos/AdminArticulos.x"/>';
			document.ir.accion.value=4;
		}
		else
			document.ir.action='<c:url value="/adminAsignacion/AsignaEvaluador.x"/>';
		document.ir.submit();
	}
</script>
</head>
<!-- askldjfh alsdjfah sdjkfh as -->
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<form name="ir">
	<input type="hidden" name="accion" value="0"/>
	<input type="hidden" name="producto" value="1"/>
	<input type="hidden" name="art" value='<c:out value="${sessionScope.datosArticulo.idArticulo}" />'/>
		<table align="left">
			<tr>
				<td><img src='<c:url value="/comp/img/Atras.gif"/>' onclick="atras()"></td>
			</tr>
		</table>
	</form>
	<br><br>
	<form name="filtro" method="post" action='<c:url value="/adminPropuestas/llenar.jsp"/>'>
		<input type="hidden" name="accion" value="5"/>
		<input type="hidden" name="codEval" value=""/>
		<input type="hidden" name="producto" value="1"/>
		<input type="hidden" name="prop" value='<c:out value="${sessionScope.prop}" />'/>
		<input type="hidden" name="idArtic" value='<c:out value="${sessionScope.datosArticulo.idArticulo}" />'/>
		<input type="hidden" name="tipEval" value='0'/>

		<table class="tablas" align="center">
		<caption>Filtro de busqueda</caption>
			<tr>
				<td class="renglones"><b>Nombres</b></td>
				<td class="renglones"><b>Apellidos</b></td>
			</tr>
			<tr>
				<td><input type="text" name="nombres" size="25"></td>
				<td><input type="text" name="apellidos" size="25"></td>
			</tr>
			<tr>
				<td colspan="2" class="renglones"><b>Campos de Trabajo</b></td>
			</tr>
			<tr>
				<td colspan="2"><input size="55" maxlength="50" type="text" name="areasTrabajo"></td>
			</tr>
			<tr>
				<td class="renglones"><b>Facultad</b></td>
				<td>
					<select name="facultad" onchange="ajaxProyCurr(this)" style="width:150px">
						<option value="" selected>-----------</option>
						<option value="1">Tecnológica</option>
						<option value="2">Ingeniería</option>
						<option value="3">M. Ambiente</option>
						<option value="4">Educación</option>
						<option value="5">Asab</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="3" class="renglones"><b>Proyecto Curricular:</b></td>
			</tr>
			<tr>
				<td colspan="3">
					<select style="width:300px" name="proyectoCur">
						<option value=''>----</option>
					</select>
				</td>
			</tr>
			<tr>
			<td class="renglones"><b>Ordenar Por:</b></td>
				<td>
					<select name="orden">
						<option value='0'>Nombres</option>
						<option value='1'>Apellidos</option>
					</select>
					<input type="submit" value="Buscar" >
				</td>
			</tr>
		</table>
	</form>

	<c:if test="${!empty requestScope.listaEvalOpcion}">
	<table align="center" class="tablas">
	<caption>Evaluadores Encontrados</caption>
		<tr>
			<td class="renglones"><b>Nombres</b></td>
			<td class="renglones"><b>Apellidos</b></td>
			<td class="renglones"><b>e-mail</b></td>
			<td class="renglones"><b>ver</b></td>
			<td class="renglones"><b>Asignar </b></td>
		</tr>
		<c:forEach begin="0" items="${requestScope.listaEvalOpcion}" var="lista">
		<c:if test="${lista.codigo!=sessionScope.datosPropuesta.codInvest}">
		<tr>
			<td><c:out value="${lista.nombres}"/></td>
			<td><c:out value="${lista.apellidos}"/></td>
			<td><c:out value="${lista.mail}"/></td>
			<td><input type="submit" value="Ver" onclick='ver(<c:out value="${lista.codigo}"/>,<c:out value="${lista.tipo}"/>)'></td>
			<td><input type="submit" value="Asignar" onclick='asignar(<c:out value="${lista.codigo}"/>,<c:out value="${lista.tipo}"/>)'<c:if test='${lista.mail=="" || lista.mail==null}'>disabled</c:if>></td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	</c:if>
	<table>
		<tr>
			<td style="display:none"><iframe name="frameOculto" id="frameOculto"></iframe></td>
		</tr>
	</table>

	<form method="post" name="frmAjaxNumero" action="<c:url value="/adminPropuestas/Ajax.x"/>">
		<input type="hidden" name="accion" value='8'>
		<input type="hidden" name="dato" value=''>
	</form>
</body>

</html>