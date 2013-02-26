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
			document.filtro.tipo.value=2;
		}
		else{
			document.filtro.tipo.value=1;
		}
		ajaxGrupos(document.filtro.facultad);
	}
	function ajaxGrupos(obj){
		var val=obj.value;
		document.filtro.facultad.value=val;
		if(val!=0){
			document.frmAjaxGrupo.dato[0].value=val;
			document.frmAjaxGrupo.dato[1].value=document.filtro.tipog.value;
	 		document.frmAjaxGrupo.target="frameOculto";
			document.frmAjaxGrupo.submit();
		}
	}

	function valor(id,combo){
		if(id==1)
			document.filtro.proyCurr.value=combo.value;
		else
			document.filtro.grupoInvest.value=combo.value;
	}

	function cambio(combo){
		if(combo.value==1){
			document.getElementById("r1").style.display='';
			document.getElementById("r2").style.display='';
			document.getElementById("r3").style.display='';
			document.getElementById("r4").style.display='';
			document.getElementById("r5").style.display='';
			document.getElementById("r6").style.display='none';
		}else{
			document.getElementById("r1").style.display='none';
			document.getElementById("r2").style.display='none';
			document.getElementById("r3").style.display='none';
			document.getElementById("r4").style.display='none';
			document.getElementById("r5").style.display='none';
			document.getElementById("r6").style.display='';
		}
	}

	function enviar(){
		document.filtro.resumen.value=document.filtro._resumen.value;
		if(validar())
			document.filtro.submit();
	}

	function validar(){
		mensaje="";
		if(document.filtro.tituloArticulo.value==""){
			mensaje=mensaje+"\n-) Titulo del Artículo";
		}
		if(document.filtro.presentador.value==""){
			mensaje=mensaje+"\n-) Presentador";
		}
		if(document.filtro.autores.value==""){
			mensaje=mensaje+"\n-) Autores";
		}
		if(document.filtro.palabClaves.value==""){
			mensaje=mensaje+"\n-) Palabras Claves";
		}
		if(document.filtro.temaInteres.value==""){
			mensaje=mensaje+"\n-) Tema de Interés";
		}
		if(document.filtro.resumen.value==""){
			mensaje=mensaje+"\n-) Abstract";
		}
		if(document.filtro.archivoResumen.value==""){
			mensaje=mensaje+"\n-) Archivo Resumen";
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
	<form action='<c:url value="/adminArticulos/AdminArticulos.x" />' method="post">
		<input type="hidden" name="accion" value="2">
		<table>
			<tr>
				<td><input type="image" src="<c:url value="/comp/img/Buscar.gif"/>"></td>
			</tr>
		</table>
	</form>
	<form name="filtro" method="post" enctype="multipart/form-data" action='<c:url value="/adminArticulos/AdminArticulos.x"/>'>
		<input type="hidden" name="accion" value="1">
		<table class="tablas" align="center" width="410px">
		<caption>Creación de nuevos artículos para evaluación</caption>
			<tr>
				<td align="center">
					<select name="tipo" onchange="cambio(this)" >
						<option value="1">Interno</option>
						<option value="2">Externo</option>
					</select>
				</td>
				<td class="renglones"><b>Tipo Presentación</b></td>
				<td colspan="6">
					<select name="tipoPresentacion">
						<option value="1">Oral</option>
						<option value="1">Poster</option>
					</select>
				</td>
			</tr>
			<tr id="r1">
				<td class="renglones"><b>Facultad:</b></td>
				<td>
					<select name="facultad" onchange="ajaxGrupos(this)" >
						<option value="1">Tecnológica</option>
						<option value="2">Ingeniería</option>
						<option value="3">Medio Ambiente</option>
						<option value="4">Educación</option>
						<option value="5">Asab</option>
					</select>
				</td>
				<td colspan="2"><b>Grupo</b><input type="radio" name="boton" checked value="1" onClick="cambioTipo(this)">
					<input type="hidden" name="tipog" value="1">
				</td>
				<td colspan="2"><b>Semillero</b><input type="radio" name="boton" value="2" onClick="cambioTipo(this)"></td>
			</tr>
			<tr id="r2">
				<td colspan="6" class="renglones"><b>Proyecto Curricular:</b></td>
			</tr>
			<tr id="r3">
				<td colspan="5">
					<select style="width:410px" name="proyCur"  onchange="valor(1,this)">
						<option value='0'>----------------------------------------</option>
					</select>
				</td>

			</tr>
			<tr id="r4">
				<td colspan="6" class="renglones"><b><span id="para">Grupo Investigación</span></b></td>
			</tr>
			<tr id="r5">
				<td colspan="6">
					<select style="width:410px" name="grupo" onchange="valor(2,this)">
						<option value='0'>----------------------------------------</option>
					</select>
				</td>
			</tr>
			<tr id="r6" style="display:none">
				<td class="renglones"><b>Universidad</b></td>
				<td colspan="6"><input style="width:100%" type="text" name="universidad" value=""></td>
			</tr>
			<tr>
				<td class="renglones"><b>Título Artículo</b></td>
				<td colspan="6"><input style="width:100%" type="text" name="tituloArticulo" value=""></td>
			</tr>
			<tr>
				<td class="renglones"><b>Presentador</b></td>
				<td colspan="6"><input style="width:100%" type="text" name="presentador" value=""></td>
			</tr>
			<tr>
				<td class="renglones"><b>Autores</b></td>
				<td colspan="6"><input style="width:100%" type="text" name="autores" value=""></td>
			</tr>
			<tr>
				<td class="renglones"><b>Dirección Postal</b></td>
				<td colspan="6"><input style="width:100%" type="text" name="direccionPostal" value=""></td>
			</tr>
			<tr>
				<td class="renglones"><b>Dirección Electrónica</b></td>
				<td colspan="6"><input style="width:100%" type="text" name="direccionElect" value=""></td>
			</tr>
			<tr>
				<td class="renglones"><b>Palabras Claves</b></td>
				<td colspan="6"><input style="width:100%" type="text" name="palabClaves" value=""></td>
			</tr>
			<tr>
				<td class="renglones"><b>Tema de Interés</b></td>
				<td colspan="6"><input style="width:100%" type="text" name="temaInteres" value=""></td>
			</tr>
			<tr>
				<td class="renglones"><b>Abstract</b>
					<input type="hidden" name="resumen" value="">
				</td>
				<td colspan="6"><textarea class="area" rows="8" name="_resumen" style="width:100%"></textarea></td>
			</tr>
			<tr>
				<td class="renglones"><b>Resumen</b></td>
				<td colspan="6"><input style="width:100%" readonly type="file" name="archivoResumen"></td>
			</tr>
			<tr>
				<td colspan="6" align="center"><img src='<c:url value="/comp/img/Enviar.gif"/>' onclick="enviar()"></td>
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
</script>
</body>

</html>