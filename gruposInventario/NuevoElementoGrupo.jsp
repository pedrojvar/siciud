<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<c:import url="/general.jsp"/>
<jsp:useBean id="fecha" class="java.util.Date"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" type="time" timeStyle="short" pattern="yyyy" var="ano"/>
<script type="text/javascript">

	var nav4=window.Event ? true : false;
	function numeros(eve){
		var key=nav4?eve.which :eve.keyCode;
		return(key<=13 || (key>=48 && key<=57));
	}

	function enviar(){
		mensaje="";
		
		if(document.nuevo.idGrupo.selectedIndex==0)
			mensaje="\n-) Grupo de Investigación";
		if(document.nuevo.fecha.value=="")
			mensaje=mensaje+"\n-) Fecha";
		if(document.nuevo.codigo.value=="")
			mensaje=mensaje+"\n-) Placa";
		if(document.nuevo.valor.value=="")
			mensaje=mensaje+"\n-) Valor";
		if(document.nuevo.nombreElemento.value=="")
			mensaje=mensaje+"\n-) Nombre Elemento";
		if(mensaje=="")	
			document.nuevo.submit();
		else{
			mensaje="Favor Completar los siquientes campos:"+mensaje;
			alert(mensaje)
		}
	}

	function ajaxGrupos(obj){
		var val=obj.value;
		if(val!=0){
			document.frmAjaxGrupo.dato.value=val;
			document.frmAjaxGrupo.para.value='1';
	 		document.frmAjaxGrupo.target="frameOculto";
			document.frmAjaxGrupo.submit();
		}
	}
</script>
</head>
	<body onLoad="mensajeAlert(document.getElementById('msg'));">
	
	<table align="left">
		<tr>
			<td align="center"><a href='<c:url value="/gruposInventario/FiltroElemento.jsp"/>'><img border="0" src='<c:url value="/comp/img/Buscar.gif"/>'></a></td>
		</tr>
	</table>
	<br><br><br>
	<form name="nuevo" action='<c:url value="/gruposInventario/llenar.jsp"/>'>
	<input type="hidden" name="accion" value="1">
		<table align="center" class="tablas" >
		<CAPTION>Inserción de nuevo elemento</CAPTION>
			<tr>
				<th width="20%"><b>Facultad:</b></th>
				<th ><b>Grupo/Semillero de Investigación:</b></th>
				</tr>
				<tr>
					<td width="20%" >
						<select name="propFacultad" style="width:100%" onchange="ajaxGrupos(this)">
							<option value="0">---------------</option>
							<option value="1" >Tecnológica</option>
							<option value="2" >Ingeniería</option>
							<option value="3" >Medio Ambiente</option>
							<option value="4" >Ciencias y Educación</option>
							<option value="5" >Asab</option>
						</select>
					</td>
					<td>
						<select style="width:100%" name="idGrupo">
							<option value='0'>------------------------ </option>
						</select>
					</td>
			</tr>
			<tr>
				<td colspan="2">
					<table width="100%">
						<tr>
							<th width="50px"><b>Fecha</b></th>
							<td>
								<input type='text' name='fecha' class='caj' readonly='true' id='f_date_a' style="width: 80%" value='<c:out value="${sessionScope.convocatoriaOBJ.corteActual}"/>'>
								<button type='button' id='f_trigger_a'>...</button>
								<script type='text/javascript'>
					    			Calendar.setup({
						    			inputField     :    'f_date_a',
						    			ifFormat       :    '%Y-%m-%d',
						    			showsTime      :    false,
						    			button         :    'f_trigger_a',
						    			singleClick    :    false,
						    			step           :    1
					    			})
				    			</script>
							</td>
							<th width="50px">Placa</th>
							<td><input name="codigo" type="text" onkeypress="return numeros(event)"></td>
							<th width="50px">Valor</th>
							<td ><input name="valor" type="text" onkeypress="return numeros(event)"></td>
						</tr>
					</table>
				</td>
				
			</tr>
			<tr >
				<th colspan="6" width="150px">Nombre Elemento</th>
			</tr>
			<tr>
				<td colspan="6"><input name="nombreElemento" type="text" style="width:100%"></td>
			</tr>
			<tr>
				<th colspan="6" width="150px">Observación Elemento</th>
			</tr>
			<tr>				
				<td colspan="6"><input name="observacion" type="text" style="width:100%"></td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="enviar()">
				</td>
			</tr>
		</table>
	</form>
	<table width="100%">
		<tr>
			<td style="display:none"><iframe name="frameOculto" id="frameOculto"></iframe></td>
		</tr>
	</table>
	<form method="post" name="frmAjaxGrupo" action="<c:url value="/inventario/Ajax.x"/>">
		<input type="hidden" name="dato" value=''>
		<input type="hidden" name="para" value='1'>
	</form>
	</body>
</html>