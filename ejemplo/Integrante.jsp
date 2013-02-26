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
<script>

	function com(id){
		document.comandos.accion.value=id;
		if(id==15)
			document.getElementById("carga").style.display='';
		document.comandos.papel.value=document.nuevo.papel.value;
		if(id==11 && document.nuevo.papel.selectedIndex==3){
			alert("No se puede Eliminar el Director del Grupo");
		}else{
			if(id==11){
				if(confirm("Desea eliminar esta persona del Grupo?")){
					if(confirm("Desea eliminar complemtamente el registro de esta persona?"))
							document.comandos.bandera.value="1";
				document.comandos.submit();
				}
			}else{
				document.comandos.submit();
			}
		}
	}
	function ajaxProyecto(obj){
		document.frmAjaxProyecto.dato.value=obj.options[obj.selectedIndex].value;
		document.frmAjaxProyecto.para.value='1';
	 	document.frmAjaxProyecto.target="frameOculto";
		document.frmAjaxProyecto.submit();
	}

	function guardar(acc){
		if(acc==1){
			if(validar()){
				document.nuevo.action='<c:url value="/adminGrupos/adminIntegrantes/llenar.jsp"/>';
				document.nuevo.submit();
			}
		}else{
			document.nuevo.action='<c:url value="/adminGrupos/AdminGrupos.x"/>';
			document.nuevo.accion.value="12";
			document.nuevo.submit();
		}
	}

	function validar(){
		ms="";
		if(document.nuevo.facultad.selectedIndex==0){
			ms=ms+"\n-) Facultad";
		}
		if(document.nuevo.cvLac.value!=""){
			if(document.nuevo.cvLac.value.length>=64){
				var dir=document.nuevo.cvLac.value.substring(0,67);
				if(dir!="http://201.234.78.173:8081/cvlac/visualizador/generarCurriculoCv.do")
					mensaje=mensaje+"\n-) Dirección no válida para CvLac";
			}else{
				mensaje=mensaje+"\n-) Dirección no válida para CvLac";
			}
		}
		if(document.nuevo.nombres.value==""){
			ms=ms+"\n-) Nombres";
		}
		if(document.nuevo.apellidos.value==""){
			ms=ms+"\n-) Apellidos";
		}
		if(ms!=""){
			ms="Los siguientes campos son obligatorios: "+ms;
			alert (ms);
		}
		else
			return true;
		return false;
	}
	function deshabilitar(){
		for(var i=2;i<18;i++){
			document.nuevo.elements[i].disabled=true;
		}
		alert("Este integrante está desvinculado del grupo actualmente");
	}

	function acci(acc){
	document.nuevo.accion.value=acc;
	document.nuevo.submit();
	}
</script>


</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<br>
	<form name="comandos" action='<c:url value="/adminGrupos/AdminGrupos.x" />' method="post">
		<input type="hidden" name="accion" value=''>
		<input type="hidden" name="papel" value='8'>
		<input type="hidden" name="id" value='<c:out value="${sessionScope.integrante.id}"/>'>
		<input type="hidden" name="bandera" value="0">
		<table>
			<tr>
				<td><img src="<c:url value="/comp/img/Integrantes.gif"/>" onclick="com(6)"></td>
				<c:if test='${sessionScope.integrante.mail!=null and sessionScope.integrante.mail!=""}'>
				<td><img src="<c:url value="/comp/img/AsigClave.gif"/>" onclick="com('15')"></td>
				</c:if>
				<c:if test='${requestScope.st=="9"}'>
				<td><img src="<c:url value="/comp/img/EliminaIntegrante.gif"/>" onclick="com(11)"></td>
				</c:if>
				<td><img src="<c:url value="/comp/img/BuscaGrupos.gif"/>" onclick="com(2)"></td>
				<td><a href='<c:url value="/adminGrupos/ListaPersonas.jsp"/>'><img border="0" src="<c:url value="/comp/img/BuscaPersona.gif"/>" ></a></td>
				<td id="carga" style="display:none"><img src="<c:url value="/comp/img/cargando2.gif"/>"> Enviando Clave...</td>
			</tr>
		</table>
	</form>

	<table align="center">
		<tr>
			<td align="center"><b><c:out value="${sessionScope.grupo.nombre}"/></b></td>
		</tr>
	</table>
	<br>

	<form action='<c:url value="/ejemplo/llenarIntegrante.jsp"/>' name="nuevo" method="post">
		<input type="hidden" name="idGrupo" value="<c:out value="${sessionScope.grupo.codigo}" />">
		<input type="hidden" name="accion" value="<c:out value="${requestScope.st}" />">
		<!-- hidden para la bandera datoInt.flag -->

		tipo documento: <c:out value="${sessionScope.datosIntegrante.tipoCed}"/>
		<br>
		cod facultad: <c:out value="${sessionScope.datosIntegrante.codFacultad}"/>
		<br>
		cod proy: <c:out value="${sessionScope.datosIntegrante.codproyCurr}"/>
		<br>
		cod genero: <c:out value="${sessionScope.datosIntegrante.genero}"/>
		<br>
		cod tipoPer: <c:out value="${sessionScope.datosIntegrante.tipoPer}"/>
		<br>


		<table class="tablas" align="center" >
		<caption>Datos Personales</caption>

		<tr>
			<th><b>Documento:</b></th>
			<td><input readonly="readonly" type="text" name="cedula" value='<c:out value="${sessionScope.datosIntegrante.cedula}"/>'></td>
			<th><b>Tipo Documento:</b></th>
			<input type="hidden" name="tipoCed" value='<c:out value="${sessionScope.datosIntegrante.tipoCed}"/>'>
			<td><input readonly="readonly" type="text" value='<c:out value="${sessionScope.datosIntegrante.nombreTipoCed}"/>'></td>
		</tr>
		<tr>
			<th><b>Procedencia:</b></th>
			<td><input  type="text" name="deCed" value='<c:out value="${sessionScope.datosIntegrante.deCed}"/>'></td>
			<th><b>Codigo UD:</b></th>
			<td><input readonly="readonly" type="text" name="codigoUd" value='<c:out value="${sessionScope.datosIntegrante.codigoUd}"/>'></td>
		</tr>
		<tr>
			<th><b>Facultad:</b></th>
			<input type="hidden" name="codfacultad" value='<c:out value="${sessionScope.datosIntegrante.codFacultad}"/>'>
			<td colspan="3"><input style="width: 100%;" readonly="readonly" type="text" value='<c:out value="${sessionScope.datosIntegrante.nombreFacultad}"/>'></td>

		</tr>
		<tr>
			<th><b>Proyecto Curricular:</b></th>
			<input type="hidden" name="codproyCurr" value='<c:out value="${sessionScope.datosIntegrante.codproyCurr}"/>'>
			<td colspan="3"><input style="width: 100%;" readonly="readonly" type="text" value='<c:out value="${sessionScope.datosIntegrante.nombreProyCurr}"/>'></td>
		</tr>
		<tr>
			<td colspan="4">
				<table width="100%">
					<tr>
						<th><b>Fecha de Nacimiento</b></th>
						<th><b>Tipo:</b></th>
						<th><b>Estado:</b></th>
						<th><b>Genero:</b></th>
					</tr>
					<tr>
						<td>
							<input  type='text' name='fechaNaciomiento' class='caj' readonly='true' id='f_date_a' size='13' value='<c:out value="${sessionScope.datosIntegrante.fechaNacimiento}"/>'>
						</td>
						<input type="hidden" name="tipoPer" value='<c:out value="${sessionScope.datosIntegrante.tipoPer}"/>'>
						<td><input readonly="readonly" type="text" value='<c:out value="${sessionScope.datosIntegrante.nombreTipoPer}"/>'></td>
						<input type="hidden" name="estado" value='<c:out value="${sessionScope.datosIntegrante.estado}"/>'>
						<td><input readonly="readonly" type="text" value='<c:out value="${sessionScope.datosIntegrante.nombreEstado}"/>'></td>
						<input type="hidden" name="genero" value='<c:out value="${sessionScope.datosIntegrante.genero}"/>'>
						<td><input style="width:50px" readonly="readonly" type="text" value='<c:out value="${sessionScope.datosIntegrante.nombreGenero}"/>'></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<th><b>Nombres:</b></th>
			<td><input readonly="readonly" type="text" name="nombres" value='<c:out value="${sessionScope.datosIntegrante.nombres}"/>'></td>
			<th><b>Apellidos:</b></th>
			<td><input readonly="readonly" type="text" name="apellidos" value='<c:out value="${sessionScope.datosIntegrante.apellidos}"/>'></td>
		</tr>
		<tr>
			<th><b>Telefono 1:</b></th>
			<td><input type="text" name="tel1" value='<c:out value="${sessionScope.datosIntegrante.tel1}"/>'></td>
			<th><b>Telefono 2:</b></th>
			<td><input type="text" name="tel2" value='<c:out value="${sessionScope.datosIntegrante.tel2}"/>'></td>
		</tr>
		<tr>
			<th><b>Celular 1:</b></th>
			<td><input type="text" name="cel1" value='<c:out value="${sessionScope.datosIntegrante.cel1}"/>'></td>
			<th><b>Celular 2:</b></th>
			<td><input type="text" name="cel2" value='<c:out value="${sessionScope.datosIntegrante.cel2}"/>'></td>
		</tr>
		<tr>
			<th><b>Mail Institucional:</b></th>
			<td><input type="text" name="mailInst" value='<c:out value="${sessionScope.datosIntegrante.mailInst}"/>'></td>
			<th><b>Mail Personal:</b></th>
			<td><input type="text" name="mail" value='<c:out value="${sessionScope.datosIntegrante.mail}"/>'></td>
		</tr>
		<tr>
			<td colspan="4">
				<table width="100%">
					<tr>
						<th><b>Papel:</b></th>
						<th><b>Fecha de Ingreso</b></th>
						<th><b>Fecha de Salida</b></th>
					</tr>
					<tr>
						<td>
							<select name="papel">
								<option value="0">----------</option>
								<option value="3"  >Egresado</option>
								<option value="2" >Prof Planta</option>
								<option value="4" >Prof TCO</option>
								<option value="5" >Prof MTO</option>
								<option value="6"  >Prof HC</option>
								<option value="8" >Lider Semillero</option>
								<option value="1"  >Director</option>
								<option value="9"  >Invitado</option>
							</select>
						</td>
						<td>
							<input type='text' name='fechaVinculacion' class='caj' readonly='true' id='f_date_b' size='13' value='<c:out value="${sessionScope.integrante.fechaVinculacion}"/>'>
							<button type="button" id='f_trigger_b' >...</button>
							<script type='text/javascript'>
				    			Calendar.setup({
					    			inputField     :    'f_date_b',
					    			ifFormat       :    '%Y-%m-%d',
					    			showsTime      :    true,
					    			button         :    'f_trigger_b',
					    			singleClick    :    false,
					    			step           :    1
				    			})
			    			</script>
						</td>
						<td>
							<input type='text' name='fechaSalidaGrupo' class='caj' readonly='true' id='f_date_c' size='13' value='<c:out value="${sessionScope.integrante.fechaSalidaGrupo}"/>'>
							<button type='button' id='f_trigger_c' >...</button>
							<script type='text/javascript'>
				    			Calendar.setup({
					    			inputField     :    'f_date_c',
					    			ifFormat       :    '%Y-%m-%d',
					    			showsTime      :    true,
					    			button         :    'f_trigger_c',
					    			singleClick    :    false,
					    			step           :    1
				    			})
			    			</script>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
				<th colspan="4"><b>Link a CvLac</b></th>
			</tr>
			<tr id="cvl1" <c:if test="${sessionScope.integrante.cvLac!=null}">style="display:none;"</c:if>>
				<td colspan="4"><input style="width:100%" type="text" name="cvLac" value='<c:out value="${sessionScope.integrante.cvLac}"/>'></td>
			</tr>
				<c:if test="${sessionScope.integrante.cvLac!=null}">
			<tr id="cvl2">
				<td colspan="4"><A href='<c:out value="${sessionScope.integrante.cvLac}"/>' target="_new">Click aqui para validar Link de CvLac almacenado</A></td>
				<td><img src='<c:url value="/comp/img/Modificar.gif" />' onclick="document.getElementById('cvl1').style.display='';document.getElementById('cvl2').style.display='none';"></td>
			</tr>
				</c:if>
	</table>
	<br>
	<center>
	<img src="<c:url value="/comp/img/Cancelar.gif"/>" onclick="acci(11)">
	<img src="<c:url value="/comp/img/ActivarIntegrante.gif"/>" onclick="acci(12)">
	</center>
</form>
	<table>
		<tr>
			<td style="display:none"><iframe name="frameOculto" id="frameOculto"></iframe></td>
		</tr>
	</table>
	<form method="post" name="frmAjaxProyecto" action="<c:url value="/adminGrupos/Ajax.x"/>">
		<input type="hidden" name="dato" value=''>
		<input type="hidden" name="para" value=''>
	</form>
</body>
<script type="text/javascript">
	ajaxProyecto(document.nuevo.facultad);
	if(document.nuevo.fechaSalida.value!="")
		deshabilitar();
</script>
</html>