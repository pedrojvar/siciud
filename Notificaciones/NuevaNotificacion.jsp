<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<c:import url="/general.jsp" />
<script type="text/javascript">
	function ver(id){
		if(id=='1'){
			document.getElementById("perfil").style.display="";
			document.getElementById("persona").style.display="none";
			if(document.getElementById("listaPersonas"))
				document.getElementById("listaPersonas").style.display="none";
		}else{
			if(id=='2'){
				document.getElementById("persona").style.display="";
				document.getElementById("perfil").style.display="none";
			}
			if(id=='3'){
				document.getElementById("persona").style.display="";
				document.getElementById("perfil").style.display="";
			}
		}
		document.frmAsignacion.descripcion.readOnly=false;
	}
	function boton(caja){
		if(caja.value.length>5){
			document.getElementById("caja").style.display="";
			if(caja.value.length>200){
				alert("Debe digitar un Máximo 200 caracteres");
				caja.value=caja.value.substring(0,200);
			}
		}
		else
			document.getElementById("caja").style.display="none";
	}

	function validar(){
		var flagA=0,flagB=0;
		var mensaje="";
		if(document.frmAsignacion.para[0].checked || document.frmAsignacion.para[2].checked){
			if(document.frmAsignacion.perfil.selectedIndex!=0)
				flagA=1;
		}else{
			flagA=1;
		}
		if(document.frmAsignacion.para[1].checked || document.frmAsignacion.para[2].checked){
			if(document.frmAsignacion.persona.length){
				for(var i=0;i<document.frmAsignacion.persona.length;i++){
					if(document.frmAsignacion.persona[i].checked)
						flagB=1;
				}
			}else{
				if(document.frmAsignacion.persona.checked)
					flagB=1;
			}
		}else{
			flagB=1;
		}

		if(flagA==0)
			mensaje+="-)Debe seleccionar un perfil\n";
		if(flagB==0)
			mensaje+="-)Debe seleccionar por lo menos a una persona";

		if(flagA==0 || flagB==0){
			alert(mensaje);
			return false;
		}else
			return true;

	}

	function enviar(){
		if(validar()){
			document.frmAsignacion.accion.value="4";
			document.frmAsignacion.submit();
		}
	}

</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form action='<c:url value="/Notificaciones/llenar.jsp" />' name="frmAsignacion" method="post">
<input type="hidden" name="accion" value="3">
<table class="tablas" align="center" width="70%">
	<caption>Insertar Nueva Notificación</caption>
	<tr>
		<td colspan="4" align="center">
			<table width="100%">
				<tr>
					<th><b>Enviar Notificación A:</b></th>
					<td align="right"><b>Perfil</b></td>
					<td><input type="radio" value="1" name="para" onclick="ver(1)"
					<c:if test="${sessionScope.filtroNotifPersona.para==1}" >checked="checked"</c:if>></td>
					<td align="right"><b>Persona</b></td>
					<td><input type="radio" value="2" name="para" onclick="ver(2)"
					<c:if test="${sessionScope.filtroNotifPersona.para==2 and !empty requestScope.listaFiltroPersona}" >checked="checked"</c:if>></td>
					<td align="right"><b>Ambos</b></td>
					<td><input type="radio" value="3" name="para" onclick="ver(3)"
					<c:if test="${sessionScope.filtroNotifPersona.para==3 and !empty requestScope.listaFiltroPersona}" >checked="checked"</c:if>></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<th>Prioridad</th>
		<td>
			<select name="prioridad">
				<option value="1">Baja</option>
				<option value="2">Media</option>
				<option value="3">Alta</option>
			</select>
		</td>
	</tr>
	<tr id="perfil" style="display: none">
		<th>Seleccionar Perfil</th>
		<td>
			<select name="perfil">
			<option value="-1">--------------------</option>
			<c:forEach begin="0" items="${requestScope.listaPerfiles}" var="lista">
			<option value='<c:out value="${lista.id}" />' <c:if test="${sessionScope.filtroNotifPersona.perfil==lista.id}" >selected</c:if>>
			<c:out value="${lista.nombre}" />	</option>
			</c:forEach>
			<option value="0">Todos</option>
			</select>
		</td>
	</tr>
	<tr id="persona" style="display: none">
		<td colspan="4" align="center">
			<table class="tablas" align="center" >
			<caption>Buscar Persona</caption>
				<tr>
					<th><b>Documento</b></th>
					<th><b>Nombres</b></th>
					<th><b>Apellidos</b></th>
				</tr>
				<tr>
					<td><input type="text" name="documento"></td>
					<td><input type="text" name="nombres"></td>
					<td><input type="text" name="apellidos"></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="image" src='<c:url value="/comp/img/Buscar.gif"/> ' ></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<th colspan="4">Notificación a Enviar:</th>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<textarea rows="2" readonly="readonly"  style="width: 100%" name="descripcion" onkeyup="boton(this)" onchange="boton(this)"></textarea>
		</td>
	</tr>
	<tr id="caja" style="display: none">
		<td colspan="4" align="center">
		<img src='<c:url value="/comp/img/Enviar.gif"/>'" onclick="enviar()">
		</td>
	</tr>
	<c:if test="${!empty requestScope.listaFiltroPersona}">
	<tr id="listaPersonas">
		<td colspan="4" align="center">
			<table width="100%" >
				<tr>
					<th><b>Documento</b></th>
					<th><b>Nombres</b></th>
					<th><b>Apellidos</b></th>
					<th><b>Tipo</b></th>
					<th>&nbsp;</th>
				</tr>
				<c:forEach begin="0" items="${requestScope.listaFiltroPersona}" var="lista" varStatus="st">
				<tr>
					<td><c:out value="${lista.documento}" default="----"/></td>
					<td><c:out value="${lista.nombres}" default="----"/></td>
					<td><c:out value="${lista.apellidos}" default="----"/></td>
					<td><c:out value="${lista.tipo}" default="----"/></td>
					<td><input type="checkbox" name="persona" value='<c:out value="${lista.idPersona}"/>'></td>
				</tr>
				</c:forEach>
			</table>
		</td>
	</tr>
	</c:if>
</table>
</form>
</body>
<script type="text/javascript">
<c:if test="${sessionScope.filtroNotifPersona.para==1 or sessionScope.filtroNotifPersona.para==3}" >
	document.getElementById("perfil").style.display="";
</c:if>
<c:if test="${sessionScope.filtroNotifPersona.para==2 or sessionScope.filtroNotifPersona.para==3}" >
	document.frmAsignacion.descripcion.readOnly=false;
</c:if>
</script>
<%session.removeAttribute("filtroNotifPersona"); %>
</html>

