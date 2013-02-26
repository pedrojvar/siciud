<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<c:import url="/general.jsp"/>
<jsp:useBean id="fecha" class="java.util.Date"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" type="time" timeStyle="short" pattern="yyyy" var="ano"/>
<script>
	function ajaxGrupos(obj){
		var val=obj.value;
		if(val!=0){
			document.frmAjaxGrupo.dato[0].value=val;
			document.frmAjaxGrupo.dato[1].value=document.nuevo.tipo.value;
			document.frmAjaxGrupo.para.value='1';
	 		document.frmAjaxGrupo.target="frameOculto";
			document.frmAjaxGrupo.submit();
		}
	}

	function ajaxInvestigadores(obj){
		var val=obj.options[obj.selectedIndex].value;
	//	alert(val);
		if(val!=0){//
			document.frmAjaxDirect.dato.value=val;
			document.frmAjaxDirect.para.value='6';
	 		document.frmAjaxDirect.target="frameOculto";
			document.frmAjaxDirect.submit();
		}
	}

	function cambioTipo(boton){
//	alert("val="+boton.value);
		if(boton.value==2){
			document.nuevo.tipo.value=2;
		}
		else{
			document.nuevo.tipo.value=1;
		}
		ajaxGrupos(document.nuevo.facultad);
	}

	function guardar(){
		if(validar()){
			document.nuevo.action='<c:url value="/InscripSis/llenar.jsp"/>';
			document.nuevo.submit();
		}
	}

	function validar(){
		mensaje="";
		if(document.nuevo.proyCur.selectedIndex==0){
			mensaje=mensaje+"\n-) Proyecto Curricular";
		}
		if(document.nuevo.grupo.selectedIndex==0){
			mensaje=mensaje+"\n-) Grupo de Investigación";
		}
		if(document.nuevo.mail.value==""){
			mensaje=mensaje+"\n-) Correo electrónico";
		}
		if(document.nuevo.nick.value==""){
			mensaje=mensaje+"\n-) Nombre de Usuario";
		}
		if(mensaje!=""){
			mensaje="Los siguientes campos son obligatorios: "+mensaje;
			alert (mensaje);
		}
		else
			return true;
		return false;
	}

</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>
	<form name="nuevo" method="post">
	<input type="hidden" name="accion" value="1">
	<input type="hidden" name="propConvId" value='<c:out value="${sessionScope.datosConv.convId}"/>'>
	<div align="center">
	<fieldset style="width:400px;"  >
    	<legend class="texto1"><b>Inscripción al Sistema de Información</b></legend>
			<table class="tablas" align="center" width="100%">
				<tr>
					<td colspan="6">
						<table>
							<tr>
								<td class="renglones"><b>Facultad:</b></td>
								<td>
									<select name="facultad" onchange="ajaxGrupos(this)" >
										<option value="1">Tecnológica</option>
										<option value="2">Ingeniería</option>
										<option value="3">Medio Ambiente</option>
										<option value="4">Ciencias y Educación</option>
										<option value="5">Asab</option>
									</select>
								</td>
								<td colspan="2"><b>Grupo</b><input type="radio" name="boton" checked value="1" onClick="cambioTipo(this)">
									<input type="hidden" name="tipo" value="1">
								</td>
								<td colspan="2"><b>Semillero</b><input type="radio" name="boton" value="2" onClick="cambioTipo(this)"></td>
							</tr>
							<tr>
								<td colspan="6" class="renglones"><b>Proyecto Curricular:</b></td>
							</tr>
							<tr>
								<td colspan="5">
									<select style="width:410px" name="proyCur">
										<option value='0'>----------------------------------------</option>
									<c:if test="${!empty sessionScope.ajaxProyCur}">
										<c:forEach begin="0" items="${sessionScope.ajaxProyCur}" var="proy" varStatus="st">
											<option value='<c:out value="${proy.codigo}"/>'><c:out value="${proy.nombre}"/></option>
										</c:forEach>
									</c:if>
									</select>
								</td>

							</tr>
							<tr>
								<td colspan="6" class="renglones"><b><span id="para">Grupo Investigación</span></b></td>
							</tr>
							<tr>
								<td colspan="5">
									<select style="width:410px" name="grupo" onchange="ajaxInvestigadores(this)">
										<option value='0'>----------------------------------------</option>
									<c:if test="${!empty sessionScope.ajaxGrupos}">
										<c:forEach begin="0" items="${sessionScope.ajaxGrupos}" var="grupos" varStatus="st">
											<option value='<c:out value="${grupos.codigo}"/>'><c:out value="${grupos.nombre}"/></option>
										</c:forEach>
									</c:if>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="6" class="renglones"><b>Nombre</b></td>
							</tr>
							<tr>
								<td colspan="6">
									<input type="text" name="nombre" size="75" value="" readonly="readonly">
									<input type="hidden" name="idNombre" value="">
								</td>
							</tr>
							<tr>
								<td colspan="6" class="renglones"><b>Correo Electrónico <font class="letraRoja">(director del grupo o semillero)</font></b></td>
							</tr>
							<tr>
								<td colspan="6"><input type="text" name="mail" size="75"></td>
							</tr>
							<tr>
								<td colspan="6" class="renglones"><b>Nombre de Usuario</b></td>
							</tr>
							<tr>
								<td colspan="6"><input type="text" name="nick" size="15" maxlength="15"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br>
			<img align="left" src="<c:url value="/comp/img/Guardar.gif"/>" onclick="guardar()">
		</fieldset>
		</div>
	</form>
	<table align="center" width="400px">
		<tr>
		<c:if test='${requestScope.ms=="1"}'>
			<td style="text-align:justify;"><b>Su inscripción ha sido guardada correctamente, nosotros validaremos la información que usted a ingresado y posteriormente le enviaremos a su correo una clave de acceso para que pueda ingresar a los servicios de nuestro sistema</b></td>
		</c:if>
		<c:if test='${requestScope.ms=="2"}'>
			<td style="text-align:justify;"><b>Ocurrió un fallo en la inserción de su solicitud, favor vuelva a intentarlo.<br>En caso que el fallo persista, favor comunicarlo al Centro de Investigaciones</b></td>
		</c:if>
		</tr>
	</table>

	<table>
		<tr>
			<td style="display:none"><iframe name="frameOculto" id="frameOculto"></iframe></td>
		</tr>
	</table>
	<form method="post" name="frmAjaxGrupo" action="<c:url value="/inscripcionConv/Ajax.x"/>">
		<input type="hidden" name="dato" value=''>
		<input type="hidden" name="dato" value=''>
		<input type="hidden" name="dato" value='2'>
		<input type="hidden" name="para" value=''>
	</form>
	<form method="post" name="frmAjaxDirect" action="<c:url value="/inscripcionConv/Ajax.x"/>">
		<input type="hidden" name="dato" value=''>
		<input type="hidden" name="para" value=''>
	</form>
</body>
<script>
	ajaxGrupos(document.nuevo.facultad);
</script>
</html>