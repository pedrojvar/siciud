<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<c:import url="/general.jsp"/>
<script>
	var tip=0;
	function cambioTipo(boton){
		document.filtro.tipog.value=boton;
		ajaxGrupos(document.filtro.facultad);
	}
	function ajaxGrupos(obj){
		var val=obj.value;
		//document.filtro.facultad.value=val;
		document.frmAjaxGrupo.accion.value="1";
	//	alert(val);
		if(val!=0){
			document.frmAjaxGrupo.dato[0].value=val;
			document.frmAjaxGrupo.dato[1].value=document.filtro.tipog.value;
	 		document.frmAjaxGrupo.target="frameOculto";
			document.frmAjaxGrupo.submit();
		}
	}
	function ajaxInvestig(obj){
		var val=obj.value;
		document.frmAjaxGrupo.accion.value="2";
		if(val!=0){
			document.frmAjaxGrupo.dato[0].value=val;
	 		document.frmAjaxGrupo.target="frameOculto";
	// 		alert(document.frmAjaxGrupo.accion.value+" - "+val);
			document.frmAjaxGrupo.submit();
		}
	}

	function cambio(valor){
		if(valor==1){
			document.getElementById("r1").style.display='';
			document.getElementById("r2").style.display='none';
			document.filtro.tipo.value=1;
			tip=1;
		}else{
			document.getElementById("r1").style.display='none';
			document.getElementById("r2").style.display='';
			document.filtro.tipo.value=2;
			tip=2;
		}
	}

	function enviar(){
		if(validar())
			document.filtro.submit();
	}

	function validar(){
		mensaje="";
		if(document.filtro.titulo.value==""){
			mensaje=mensaje+"\n-) Titulo del Artículo";
		}
		if(tip==1){
			if(document.filtro.investigador.value=="0"){
				mensaje=mensaje+"\n-) Nombre Investigador";
			}
		}
		if(tip==2){
			if(document.filtro.nombreAutor.value==""){
				mensaje=mensaje+"\n-) Nombre Investigador";
			}
			if(document.filtro.apellidoAutor.value==""){
				mensaje=mensaje+"\n-) Apellido Investigador";
			}
			if(document.filtro.de.value==""){
				mensaje=mensaje+"\n-) Procedencia del artículo";
			}
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
	<form action='<c:url value="/adminArticulos/AdminArticulosRevista.x" />' method="post">
		<table>
			<tr>
				<td><input type="image" src="<c:url value="/comp/img/Buscar.gif"/>"></td>
			</tr>
		</table>
	</form>
	<form name="filtro" method="post" action='<c:url value="/adminArticulos/llenarArchivo.jsp"/>'>
		<input type="hidden" name="accion" value="1">
		<table class="tablas" align="center" width="400px">
		<caption>Nuevo artículo para Revista Científica</caption>
			<tr>
				<td colspan="2" width="100%" class="renglones"><b>Título Artículo</b></td>
			</tr>
			<tr>
				<td colspan="2" width="100%"><input style="width:100%" type="text" name="titulo" value=""></td>
			</tr>
			<tr>
				<td class="renglones" width="80px"><b>Tipo Artículo</b></td>
				<td align="center">
					<input type="hidden" name="tipo">
					<b>Interno</b> <input type="radio" name="a" onclick="cambio(1)">
					<b>Externo</b> <input type="radio" name="a" onclick="cambio(2)" checked="checked">
				</td>
			</tr>
			<tr id="r1">
				<td colspan="2" width="100%">
					<table width="100%">
						<tr>
							<td class="renglones"><b>Facultad:</b></td>
							<td width="115px">
								<select name="facultad" onchange="ajaxGrupos(this)" >
									<option value="1">Tecnológica</option>
									<option value="2">Ingeniería</option>
									<option value="3">Medio Ambiente</option>
									<option value="4">Educación</option>
									<option value="5">Asab</option>
								</select>
							</td>
							<td align="center">
								<b>Grupo</b><input type="radio" name="boton" checked value="1" onClick="cambioTipo(1)">
								<input type="hidden" name="tipog" value="1">
							</td>
							<td>
								<b>Semillero</b><input type="radio" name="boton" value="2" onClick="cambioTipo(2)">
							</td>
						</tr>
						<tr>
							<td colspan="4" class="renglones"><b><span id="para">Grupo Investigación</span></b></td>
						</tr>
						<tr>
							<td colspan="4">
								<select style="width:100%" name="grupo" onchange="ajaxInvestig(this)">
									<option value='0'>----------------------------------------</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="renglones"><b>Nombre Investigador:</b></td>
						</tr>
						<tr>
							<td colspan="4">
								<select style="width:100%" name="investigador" >
									<option value='0'>----------------------------------------</option>
								</select>
							</td>

						</tr>
					</table>
				</td>
			</tr>
			<tr id="r2">
				<td colspan="6">
					<table width="100%">
						<tr>
							<td class="renglones"><b>Nombres</b></td>
							<td><input type="text" name="nombreAutor"></td>
							<td class="renglones"><b>Apellidos</b></td>
							<td><input type="text" name="apellidoAutor"></td>
						</tr>
						<tr>
							<td colspan="4" class="renglones"><b>De</b></td>
						</tr>
						<tr>
							<td colspan="4"><input style="width:100%;" type="text" name="de"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><img src='<c:url value="/comp/img/Enviar.gif"/>' onclick="enviar()"></td>
			</tr>
		</table>
	</form>

	<table>
		<tr>
			<td style="display:none"><iframe name="frameOculto" id="frameOculto"></iframe></td>
		</tr>
	</table>
	<form method="post" name="frmAjaxGrupo" action='<c:url value="/adminArticulos/Ajax.x"/>'>
		<input type="hidden" name="dato" value=''>
		<input type="hidden" name="dato" value=''>
		<input type="hidden" name="accion" value='1'>
	</form>
<script>
	ajaxGrupos(document.filtro.facultad);
	cambio(document.filtro.boton.value);
</script>
</body>

</html>