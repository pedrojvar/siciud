<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<c:import url="/general.jsp"/>
</head>
<script>
	function ajaxServicios(obj){
		var val=obj.value;
		desChequear();
		if(val!=0){
			document.frmAjaxServicios.accion.value="1";
			document.frmAjaxServicios.dato.value=val;
	 		document.frmAjaxServicios.target="frameOculto";
			document.frmAjaxServicios.submit();
		}
	}
	function ajaxPerfiles(obj){
		var val=obj.value;
		desChequear();
		if(val!=0){
			document.frmAjaxServicios.accion.value="2";
			document.frmAjaxServicios.dato.value=val;
	 		document.frmAjaxServicios.target="frameOculto";
			document.frmAjaxServicios.submit();
		}
	}
	function desChequear(){
		for(var i=0;i<13;i++)
			document.servicios.lsPerfiles[i].checked="";
	}
	function guardar(){
		document.servicios.action.value="1";
		document.servicios.submit();
	}
</script>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>
	<form name="servicios" action='<c:url value="/AdminServicios/llenar.jsp"/>'>
	<input type="hidden" name="accion" value="1">
		<table class="tablas" align="center">
		<caption>Servicios del Sistema</caption>
			<tr>
				<td class="renglones"><b>Categoría:</b></td>
				<td>
					<select name="idCat" style="width:140px" onchange="ajaxServicios(this)">
						<option value="0">---</option>
						<c:forEach begin="0" items="${requestScope.listaCategoria}" var="categoria">
						<option value='<c:out value="${categoria.id}"/>'><c:out value="${categoria.nombre}"/></option>
						</c:forEach>
					</select>
				</td>
				<td class="renglones"><b>Servicio:</b></td>
				<td>
					<select name="idServ" style="width:140px" onchange="ajaxPerfiles(this)">
						<option value="0">---</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<table width="100%" class="tablas">
						<tr>
							<th><b>Id</b></th>
							<th><b>Nombre</b></th>
							<th>&nbsp;</th>
						</tr>
						<c:forEach begin="0" items="${requestScope.listaPerfiles}" var="lista" varStatus="st">
						<tr <c:if test="${(st.count mod 2)!=0}">class="trb"</c:if>>
							<td><c:out value="${lista.id}"/></td>
							<td><c:out value="${lista.nombre}"/></td>
							<td><input type="checkbox" name="lsPerfiles" id='per<c:out value="${lista.id}" />' value='<c:out value="${lista.id}" />'></td>
						</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardar()"></td>
			</tr>
		</table>
	</form>
	<table>
		<tr>
			<td style="display:none"><iframe name="frameOculto" id="frameOculto"></iframe></td>
		</tr>
	</table>
	<form method="post" name="frmAjaxServicios" action="<c:url value="/AdminServicios/Ajax.x"/>">
		<input type="hidden" name="accion" value=''>
		<input type="hidden" name="dato" value=''>
	</form>
</body>
</html>