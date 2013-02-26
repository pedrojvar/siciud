<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<c:import url="/general.jsp"/>
</head>
<script>
	function ajaxTablas(obj,llenarA){
		var val=obj.value;
		if(val!=0){
			document.frmAjaxTablas.accion.value="1";
			document.frmAjaxTablas.idCombo.value=llenarA;
			document.frmAjaxTablas.dato.value=val;
	 		document.frmAjaxTablas.target="frameOculto";
			document.frmAjaxTablas.submit();
				
		}
	}

	function cambioCombo(combo,id){
		if(combo.value=="3"){
			document.camposInforme.valoresFiltroConsulta[id].readOnly=false;
		}else{
			document.camposInforme.valoresFiltroConsulta[id].readOnly=true;
			document.camposInforme.valoresFiltroConsulta[id].value="";
		}
	}

	function cambioCheck(combo, valor){
		if(combo.checked)
			combo.value=valor;
		else
			combo.value='-';
	}
	
	function verCampos(){
		document.entidades.submit();
	}

	function verInforme(){
		document.camposInforme.submit();
	}
</script>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>
	<form name="entidades" action='<c:url value="/Informes/llenar.jsp"/>'>
		<input type="hidden" name="accion" value="1">
		<table class="tablas" align="center">
		<caption>Seleccion de Entidades</caption>
			<tr>
				<th>Entidad 1:</th>
				<c:if test="${!empty sessionScope.listaCampos}">
				</c:if>
				<td>
					<select id="entidad1" name="entidad1" style="width:140px" onchange="ajaxTablas(this,2)"> 
						<option value="0">---</option>
						<c:forEach begin="0" items="${sessionScope.lstTablas}" var="categoria">
						<option value='<c:out value="${categoria.idTabla}"/>'><c:out value="${categoria.etiquetaTabla}"/></option>
						</c:forEach>
					</select>
				</td>
				<th>Entidad 2:</th>
				<td>
					<select id="entidad2" name="entidad2" style="width:140px" onchange="ajaxTablas(this,3)">
						<option value="0">---</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="8" align="center"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="verCampos()"></td>
			</tr>
		</table>
	</form>
	
	<c:if test="${!empty sessionScope.lstCamposTablas}">
	<form name="camposInforme" action='<c:url value="/Informes/llenar.jsp"/>'>
	<input type="hidden" name="accion" value="2" >
		<table class="tablas" align="center" >
		<caption>Campos de tablas seleccionadas</caption>
			<tr>
				<td colspan="4" align="center">
					<table width="100%" class="tablas">
						<tr>
							<th>#</th>
							<th>Nombre Tabla</th>
							<th>Nombre Campo</th>
							<th>st Campo</th>							
							<th>Valor Campo</th>
							<th>Ver en Informe</th>
						</tr>
						<c:forEach begin="0" items="${sessionScope.lstCamposTablas}" var="lista" varStatus="st">
						<tr <c:if test="${(st.count mod 2)!=0}">class="trb"</c:if>>							
							<td><input type="hidden" name="camposFiltroConsulta" value='<c:out value="${lista.nombreCampo}"/>'><c:out value="${st.count}"/></td>
							<td><c:out value="${lista.etiquetaTabla}"/></td>
							<td><c:out value="${lista.etiquetaCampo}"/></td>
							<td>
								<select name="estadoValorCampoFiltro" onchange="cambioCombo(this,<c:out value="${st.index}"/>)">
									<option value="0">-------</option>
									<option value="1">Vacio</option>
									<option value="2">No Vacio</option>
									<option value="3">Valor Campo</option>
								</select>
							</td>
							<td>
							<c:if test="${!empty lista.campoSelect}">
								<select name="valoresFiltroConsulta">
									<c:forEach begin="0" items="${lista.campoSelect}" var="item">
									<option value='<c:out value="${item.nombre}"/>'><c:out value="${item.valor}"/></option>
									</c:forEach>
								</select>
							</c:if>
							<c:if test="${empty lista.campoSelect}">
							<input type="text" name="valoresFiltroConsulta" readonly></td>
							</c:if>
							<td><input type="checkbox" name="camposParaMostrar" value="-" onchange="cambioCheck(this,'<c:out value="${lista.nombreCampo}"/>')"></td>
						</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="verInforme()"></td>
			</tr>
		</table>
	</form>
	
	</c:if>
	
	<table>
		<tr>
			<td style="display:none"><iframe name="frameOculto" id="frameOculto"></iframe></td>
		</tr>
	</table>
	<form method="post" name="frmAjaxTablas" action="<c:url value="/Informes/AjaxInformes.x"/>">
		<input type="hidden" name="accion" value='1'>
		<input type="hidden" name="idCombo" value='2'>
		<input type="hidden" name="dato" value=''>
	</form>
</body>
</html>