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
	function ajaxProyecto(obj){
		document.frmAjaxProyecto.dato.value=obj.options[obj.selectedIndex].value;
		document.frmAjaxProyecto.para.value='1';
	 	document.frmAjaxProyecto.target="frameOculto";
		document.frmAjaxProyecto.submit();
	}
	function guardar(){
		if(validar()){
			document.nuevo.action='<c:url value="/grupos/investigador/llenar.jsp"/>';
			document.nuevo.submit();
		}
	}

	function validar(){
		mensaje="";

		if(document.nuevo.papel.selectedIndex==0){
			mensaje=mensaje+"\n-) Papel";
		}
		if(document.nuevo.nombres.value==""){
			mensaje=mensaje+"\n-) Nombres";
		}
		if(document.nuevo.apellidos.value==""){
			mensaje=mensaje+"\n-) Apellidos";
		}
		if(document.nuevo.mail.value==""){
			mensaje=mensaje+"\n-) e-mail";
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

		//http://200.25.59.34:8081/cvlac/visualizador/generarCurriculoCv.do

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
	<br>
	<table align="center">
		<tr>
			<td align="center"><b><c:out value="${sessionScope.grupo.nombre}"/></b></td>
		</tr>
	</table>
	<br>
	<form name="nuevo" method="post">
		<input type="hidden" name="idGrupo" value="<c:out value="${sessionScope.grupo.codigo}" />">
		<input type="hidden" name="accion" value="<c:out value="${requestScope.st}" />">
		<table class="tablas" align="center">
		<caption>Información Integrante</caption>
			<tr>
				<td>
					<table>
						<tr>
							<td colspan="2" class="renglones"><b>Facultad:</b></td>
							<td colspan="2">
								<select id="control1" style="width:135px" name="facultad" onchange="ajaxProyecto(this)" >
									<option value="0">-----</option>
									<option value="1" <c:if test="${sessionScope.integrante.facultad==1}">selected</c:if>>Tecnológica</option>
									<option value="2" <c:if test="${sessionScope.integrante.facultad==2}">selected</c:if>>Ingeniería</option>
									<option value="3" <c:if test="${sessionScope.integrante.facultad==3}">selected</c:if>>Medio Ambiente</option>
									<option value="4" <c:if test="${sessionScope.integrante.facultad==4}">selected</c:if>>Ciencias y Educación</option>
									<option value="5" <c:if test="${sessionScope.integrante.facultad==5}">selected</c:if>>Asab</option>
								</select>
							</td>
							<td class="renglones" width="60px"><b>Papel:</b></td>
							<td>
								<select name="papel">
									<option value="0">----------</option>
									<option value="3" <c:if test="${sessionScope.integrante.papel==3}">selected</c:if> >Estudiante</option>
									<option value="2" <c:if test="${sessionScope.integrante.papel==2}">selected</c:if> >Prof Planta</option>
									<option value="4" <c:if test="${sessionScope.integrante.papel==4}">selected</c:if> >Prof TCO</option>
									<option value="5" <c:if test="${sessionScope.integrante.papel==5}">selected</c:if> >Prof MTO</option>
									<option value="6" <c:if test="${sessionScope.integrante.papel==6}">selected</c:if> >Prof HC</option>
									<option value="8" <c:if test="${sessionScope.integrante.papel==8}">selected</c:if> >Lider Semillero</option>
									<option value="1" <c:if test="${sessionScope.integrante.papel==1}">selected</c:if> >Director</option>
									<option value="9" <c:if test="${sessionScope.integrante.papel==9}">selected</c:if> >Invitado</option>
									<option value="10" <c:if test="${sessionScope.integrante.papel==10}">selected</c:if> >Egresado</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="renglones"><b>Proyecto Curricular:</b></td>
							<td colspan="5">
								<select name="idProyectoCurr" style="width:293px" >
								<option value="0">-----------------</option>
								<c:forEach begin="0" items="${sessionScope.ajaxProyCur}" var="proy">
								<option value=<c:out value="${proy.codigo}"/> <c:if test="${sessionScope.integrante.idProyectoCurr==proy.codigo}">selected</c:if>><c:out value="${proy.nombre}"/></option>
								</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<table width="100%">
									<tr>
										<td class="renglones"><b>Nombres:</b></td>
										<td class="renglones"><b>Apellidos:</b></td>
										<td class="renglones"><b>Codigo UD:</b></td>
									</tr>
									<tr>
										<td><input type="text" name="nombres" value='<c:out value="${sessionScope.integrante.nombres}"/>'></td>
										<td><input type="text" name="apellidos" value='<c:out value="${sessionScope.integrante.apellidos}"/>'></td>
										<td><input type="text" name="codigoUd" value='<c:out value="${sessionScope.integrante.codigoUd}"/>'></td>
									</tr>
									<tr>
										<td class="renglones"><b>Teléfono:</b></td>
										<td class="renglones"><b>Celular:</b></td>
										<td class="renglones"><b>e-mail:</b></td>
									</tr>
									<tr>
										<td><input type="text" name="telefono" value='<c:out value="${sessionScope.integrante.telefono}"/>'></td>
										<td><input type="text" name="celular" value='<c:out value="${sessionScope.integrante.celular}"/>'></td>
										<td><input type="text" name="mail" value='<c:out value="${sessionScope.integrante.mail}"/>'></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<table>
									<tr>
										<td class="renglones"><b>Fecha de Vinculación</b></td>
										<td>
											<input type='text' name='fechaVinculacion' class='caj' readonly='true' id='f_date_a' size='13' value='<c:out value="${sessionScope.integrante.fechaVinculacion}"/>'>
											<button type='button' id='f_trigger_a'>...</button>
											<script type='text/javascript'>
								    			Calendar.setup({
									    			inputField     :    'f_date_a',
									    			ifFormat       :    '%d/%m/%Y',
									    			showsTime      :    true,
									    			button         :    'f_trigger_a',
									    			singleClick    :    false,
									    			step           :    1
								    			})
							    			</script>
										</td>
										<c:if test='${sessionScope.integrante.nombres!=null and sessionScope.integrante.nombres!=""}'>
										<td class="renglones"><b>Fecha de Salida</b></td>
										<td>
											<input type='text' name='fechaSalida' class='caj' readonly='true' id='f_date_b' size='13' value='<c:out value="${sessionScope.integrante.fechaSalida}"/>'>
											<button type='button' id='f_trigger_b' >...</button>
											<script type='text/javascript'>
								    			Calendar.setup({
									    			inputField     :    'f_date_b',
									    			ifFormat       :    '%d/%m/%Y',
									    			showsTime      :    true,
									    			button         :    'f_trigger_b',
									    			singleClick    :    false,
									    			step           :    1
								    			})
							    			</script>

										</td>
										</c:if>
									</tr>
								</table>
							</td>

							</tr>
						<tr>
							<td class="renglones" colspan="6"><b>Documento:</b></td>
						</tr>
						<tr>

							<td class="renglones"><b>Tipo:</b></td>
							<td width="60px"><select name="tipoCed">
									<option value="0">----</option>
									<option value="1" <c:if test="${sessionScope.integrante.tipoCed==1}">selected</c:if> >T.I.</option>
									<option value="2" <c:if test="${sessionScope.integrante.tipoCed==2}">selected</c:if> >C.C</option>
									<option value="3" <c:if test="${sessionScope.integrante.tipoCed==3}">selected</c:if> >C.E</option>
								</select></td>
							<td width="10px" class="renglones"><b>#</b></td>
							<td><input type="text" name="cedula" value='<c:out value="${sessionScope.integrante.cedula}"/>' <c:if test="${sessionScope.integrante.cedula!=null && sessionScope.integrante.cedula!=''}">readonly="readonly"</c:if>></td>
							<td class="renglones"><b>de:</b></td>
							<td><input type="text" size="13" name="deCed" value='<c:out value="${sessionScope.integrante.deCed}"/>'></td>
						</tr>

						<tr>
							<td colspan="6" class="renglones"><b>Link a CvLac</b></td>
						</tr>

						<tr id="cvl1" <c:if test="${sessionScope.integrante.cvLac!=null}">style="display:none;"</c:if>>
							<td colspan="6"><input style="width:100%" type="text" name="cvLac" value='<c:out value="${sessionScope.integrante.cvLac}"/>'></td>
						</tr>

						<c:if test="${sessionScope.integrante.cvLac!=null}">
						<tr id="cvl2">
							<td colspan="5"><A href='<c:out value="${sessionScope.integrante.cvLac}"/>' target="_new">Click aqui para validar Link de CvLac almacenado</A></td>
							<td><img src='<c:url value="/comp/img/Modificar.gif" />' onclick="document.getElementById('cvl1').style.display='';document.getElementById('cvl2').style.display='none';"></td>
						</tr>
						</c:if>
					</table>
					<br>
					<table align="center">
						<tr>
							<c:if test="${sessionScope.integrante.fechaSalida!=null}">
							<td colspan="6" align="center"><img src="<c:url value="/comp/img/Enviar.gif"/>" onclick="guardar(2)"></td>
							</c:if>
							<c:if test="${sessionScope.integrante.fechaSalida==null}">
							<td colspan="6" align="center"><img src="<c:url value="/comp/img/Guardar.gif"/>" onclick="guardar(1)"></td>
							</c:if>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table align="center">
			<tr>
				<td><b>Ultima actualización:</b></td><td><c:out value="${sessionScope.integrante.ultimaActua}"/></td>
			</tr>
		</table>
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
</script>
</html>