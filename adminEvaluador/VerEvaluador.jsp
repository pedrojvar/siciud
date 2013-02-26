<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
<script>
	function ajaxArea(obj){
		var val=obj.value;
		if(val!=0){
			document.frmAjaxNumero.dato.value=val;
	 		document.frmAjaxNumero.target="frameOculto";
			document.frmAjaxNumero.submit();
		}
	}

	function enviar(ac){
		if(ac==5)
			document.evaluador.action='<c:url value="/adminEvaluador/llenar2.jsp"/>';
		if(ac==14){
			document.getElementById("termina").style.display='none';
			document.getElementById("carga").style.display='';
		}
		document.evaluador.accion.value=ac;
		document.evaluador.submit();
	}
	function nuevoDato(num){
		document.frmComplemento.accion.value=num;
		document.frmComplemento.submit();
	}
	function borraDato(iditem,num){
		document.frmComplemento.idItem.value=iditem;
		document.frmComplemento.accion.value=num;
		document.frmComplemento.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="evaluador" action='<c:url value="/adminEvaluador/AdminEvaluador.x"/>'>
	<input type="hidden" name="accion" value='0'>
	<input type="hidden" name="tipEval" value='<c:out value="${requestScope.datEvaluador.tipoEval}"/>'>
	<input type="hidden" name="codEval" value=<c:out value="${requestScope.datEvaluador.id}"/>>
	<input type="hidden" name="id" value='<c:out value="${requestScope.datEvaluador.id}"/>'>
	<table align="left">
			<tr>
			<td><img src='<c:url value="/comp/img/Atras.gif"/>' onclick="enviar(1)"></td>
			<td><img src='<c:url value="/comp/img/NuevoEvaluador.gif"/>' onclick="enviar(13)"></td>
			<td><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="enviar(5)"></td>
			<td><img src='<c:url value="/comp/img/Borrar.gif"/>' onclick="enviar(6)"></td>
			<td id="termina"><img src='<c:url value="/comp/img/AsigClave.gif"/>' onclick="enviar(14)"></td>
			<td id="carga" style="display:none;"><img src='<c:url value="/comp/img/cargando2.gif"/>'></td>
			<td><img src='<c:url value="/comp/img/EvalDocs.gif"/>' onclick="enviar(15)"></td>
			<td><img src='<c:url value="/comp/img/Asignaciones.gif"/>' onclick="enviar(16)"></td>
			</tr>
		</table>
	<br><br>

	<table class="tablas" align="center">
	<caption>Datos Personales</caption>
		<tr>
			<td class="renglones"><b>Nombres</b></td>
			<td><input type="text" name="nombres" value='<c:out value="${requestScope.datEvaluador.nombres}"/>'></td>
			<td class="renglones"><b>Apellidos</b></td>
			<td><input type="text" name="apellidos" value='<c:out value="${requestScope.datEvaluador.apellidos}"/>'></td>
		</tr>
		<tr>
			<td class="renglones"><b>Mail</b></td>
			<td><input type="text" name="mail" value='<c:out value="${requestScope.datEvaluador.mail}"/>'></td>
			<td class="renglones"><b>Celular</b></td>
			<td><input type="text" name="celular" value='<c:out value="${requestScope.datEvaluador.celular}"/>'></td>
		</tr>
		<tr>
			<td class="renglones"><b>Teléfono</b></td>
			<td><input type="text" name="telefono" value='<c:out value="${requestScope.datEvaluador.telefono}"/>'></td>
			<td class="renglones"><b>Cédula</b></td>
			<td><input type="text" name="numDoc" value='<c:out value="${requestScope.datEvaluador.numDoc}"/>'></td>
		</tr>
		<tr>
			<td class="renglones"><b>Dirección</b></td>
			<td><input type="text" name="direccion" value='<c:out value="${requestScope.datEvaluador.direccion}"/>'></td>
		</tr>
		<c:if test="${requestScope.datEvaluador.tipoEval==1}">
		<tr>
			<td class="renglones"><b>Facultad</b></td>
			<td colspan="4"><c:out value="${requestScope.datEvaluador.facultad}"/></td>
		</tr>
		</c:if>
		<c:if test="${requestScope.datEvaluador.tipoEval==1}">
		<tr>
			<td class="renglones"><b>Proyecto Curricular</b></td>
			<td colspan="3"><c:out value="${requestScope.datEvaluador.proyCur}"/></td>
		</tr>
		<tr>
			<td class="renglones"><b>Grupo de Investigación</b></td>
			<td colspan="3"><c:out value="${requestScope.datEvaluador.grupo}"/></td>
		</tr>
		</c:if>
	</table>
	</form>

	<form name="frmComplemento" action='<c:url value="/adminEvaluador/AdminEvaluador.x"/>'>
		<input type="hidden" name="accion" value='0'>
		<input type="hidden" name="idItem" value='0'>
		<input type="hidden" name="tipEval" value='<c:out value="${requestScope.datEvaluador.tipoEval}"/>'>
		<input type="hidden" name="codEval" value=<c:out value="${requestScope.datEvaluador.id}"/>>
		<input type="hidden" name="id" value='<c:out value="${requestScope.datEvaluador.id}"/>'>
		<table width="95%" align="center">
			<tr>
				<td>
					<table width="100%" class="tablas">
					<caption>Areas de Trabajo</caption>
						<tr>
							<td class="renglones"><b>Super Área</b></td>
							<td class="renglones"><b>Área</b></td>
							<td class="renglones"><b>Campos</b></td>
							<td class="renglones">&nbsp;</td>
						</tr>
						<c:forEach begin="0" items="${requestScope.datEvaluador.areasTrab}" var="lista">
						<tr>
							<td><c:out value="${lista.superArea}"/></td>
							<td><c:out value="${lista.area}"/></td>
							<td><c:out value="${lista.campos}"/></td>
							<td><input type="button" value="Quitar" onclick='borraDato(<c:out value="${lista.idArea}"/>,12)'></td>
						</tr>
						</c:forEach>
						<tr>
							<td>
								<select name="superArea" style="width:150px" onchange="ajaxArea(this)">
									<option value="0" >----</option>
									<c:forEach begin="0" items="${requestScope.listaSuperAreas}" var="super">
									<option value='<c:out value="${super.idSuperArea}"/>'><c:out value="${super.superArea}"/></option>
									</c:forEach>
								</select>
							</td>
							<td>
								<select name="area" style="width:150px" >
									<option value="0">----</option>
								</select>
							</td>
							<td>
								<textarea name="campos" rows="1" cols="25"></textarea>
							</td>
							<td><input type="button" value="Guardar" onclick="nuevoDato(11)"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" class="tablas">
					<caption>Titulos Obtenidos</caption>
						<tr>
							<td class="renglones" width="100px"><b>Nivel</b></td>
							<td class="renglones"><b>Titulo Obtenido</b></td>
							<td class="renglones">&nbsp;</td>
						</tr>
						<c:forEach begin="0" items="${requestScope.datEvaluador.titulos}" var="lista">
						<tr>
							<td width="100px">
							<c:if test="${lista.tipoTitulo==1}">Pregrado</c:if>
							<c:if test="${lista.tipoTitulo==2}">Especialización</c:if>
							<c:if test="${lista.tipoTitulo==3}">Maestría</c:if>
							<c:if test="${lista.tipoTitulo==4}">Doctorado</c:if>
							<c:if test="${lista.tipoTitulo==5}">Post-Doctorado</c:if>
							</td>
							<td><c:out value="${lista.titulo}"/></td>
							<td><input type="button" value="Quitar" onclick="borraDato(<c:out value="${lista.id}"/>,10)"></td>
						</tr>
						</c:forEach>
						<tr>
							<td width="100px">
								<select name="tipoTitulo">
									<option value="1">Pregrado</option>
									<option value="2">Especialización</option>
									<option value="3">Maestría</option>
									<option value="4">Doctorado</option>
									<option value="5">Post-Doctorado</option>
								</select>
							</td>
							<td><input type="text" name="titulo" size="80"></td>
							<td width="60px"><input type="button" value="guardar" onclick="nuevoDato(9)"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<table>
		<tr>
			<td style="display:none"><iframe name="frameOculto" id="frameOculto"></iframe></td>
		</tr>
	</table>
	<form method="post" name="frmAjaxNumero" action="<c:url value="/adminEvaluador/Ajax.x"/>">
		<input type="hidden" name="accion" value='1'>
		<input type="hidden" name="dato" value=''>
	</form>
</body>
</html>