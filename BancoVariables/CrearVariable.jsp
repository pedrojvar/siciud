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
<script type="text/javascript" src='<c:url value="/comp/js/Tooltip/libtooltip/prototype/prototype.js"/>'></script>
<script type="text/javascript" src=<c:url value="/comp/js/Tooltip/libtooltip/libtooltip/scriptaculous/scriptaculous.js"/>'></script>
<script type="text/javascript" src='<c:url value="/comp/js/Tooltip/srctooltip/HelpBalloon.js"/>'></script>

<script>
	   HelpBalloon.Options.prototype = Object.extend(HelpBalloon.Options.prototype,
		{
			icon: '<c:url value="/comp/img/tooltip.png"/>',
			button: '<c:url value="/comp/img/button.png"/>',
			balloonPrefix: '<c:url value="/comp/img/balloon-"/>'
		});


	function tooltip(tipo)
	{
	    var x='<c:url value="/BancoVariables/AyudaTooltip.jsp?tipo=' + tipo + '"/>'
	    /*alert(x);*/
	    /**/
        var hb4 = new HelpBalloon
			  ({
	  		  dataURL: x
			  });
	}
	function guardar()
	{
		var mensaje="";
    	if(document.form1.identificador.value == '')
    	{
    		mensaje = mensaje + "	-) Digite Identificador\n";
    	}
		if(document.form1.nombre.value == '')
    	{
    		mensaje = mensaje + "	-) Digite Nombre\n";
    	}
    	if(document.form1.responsable.selectedIndex==0)
    	{
    		mensaje = mensaje + "	-) Seleccione Responsable\n";
    	}
    	if(document.form1.descripcion.value == '')
    	{
    		mensaje = mensaje + "	-) Digite Descripción\n";
    	}
    	if(document.form1.periodo.selectedIndex==0)
    	{
    		mensaje = mensaje + "	-) Seleccione Periodo de Actualización\n";
    	}
    	if(document.form1.unidad.selectedIndex==0)
    	{
    		mensaje = mensaje + "	-) Seleccione Unidad de Medida\n";
    	}
    	var x=0;
		for( var i=0;i<document.form1.tipografica.length;i++)
		{
			if(document.form1.tipografica[i].checked){
				x=x+1;
			}
		}
		if(x==0)
		{
			mensaje=mensaje+ "	-) Seleccione por lo menos una opcion para las opciones de reporte gráfico\n";
		}
    	if(mensaje!="")
		{
			mensaje="Por favor revise los siguientes campos que presentan algún problema: \n"+mensaje;
			alert (mensaje);
		}
		else
		{
			document.form1.submit();
		}
	}
</script>
</head>
<c:import url="/general.jsp"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" type="time" timeStyle="short" pattern="yyyy-MM-dd" var="ano"/>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<form name="form1" method="post" action='<c:url value="/BancoVariables/llenarVariable.jsp"/>'>
		<input type="hidden" name="accion" value="1" />
		<input type="hidden" name="bandera" value="2" />
		<table class="tablas" width="80%" align="center">
			<caption>FORMULARIO DE CREACIÓN DE VARIABLES</caption>
			<tr>
				<td class="texto"  >
					<table width="100%">
								<tr>
									<td width="90%" class="texto" align="left"><b>Identificador:</b></td>
									<td align="right">
									 <script type="text/javascript">
									 tooltip('Identificador');
									 </script>
									</td>
								</tr>
					</table>
				</td>
				<td class="texto" align="left"><input type="text" style="width:100%" name="identificador" class="texto"></td>
			</tr>
			<tr class="trb">
				<td class="texto"  >
					<table width="100%">
								<tr>
									<td width="90%" class="texto" align="left"><b>Nombre:</b></td>
									<td align="right">
									 <script type="text/javascript">
									 tooltip('Nombre');
									 </script>
									</td>
								</tr>
					</table>
				</td>
				<td class="texto" align="left"><input type="text" style="width:100%" name="nombre" class="texto"></td>
			</tr>
			<tr>
				<td class="texto"  >
					<table width="100%">
								<tr>
									<td width="90%" class="texto" align="left"><b>Responsable del Reporte de la Variable:</b></td>
									<td align="right">
									 <script type="text/javascript">
									 tooltip('Responsable');
									 </script>
									</td>
								</tr>
					</table>
				</td>
				<td><select name="responsable"">
					<option value="0">--------------------------------------------------------</option>
					<option value="15">Centro de Investigaciones y Desarrollo Científico (CIDC)</option>
					<option value="17">Oficina Asesora de Planeación y Control</option>
					<option value="18">Vicerectoria Académica</option>
					<option value="19">Vicerectoria Administrativa y Financiera</option>
					<option value="20">Oficina de Docencia</option>
					<option value="21">Oficina Asesora de Sistemas y RedUDNET</option>
					<option value="22">Decanatura Ciencias y Educación</option>
					<option value="23">Decanatura Ingeniería</option>
					<option value="24">Decanatura Medio Ambiente</option>
					<option value="25">Decanatura Tecnológica</option>
					<option value="26">Decanatura Artes - ASAB</option>
					<option value="27">Centro de Relaciones Interinstitucionales (CERI)</option>
					<option value="28">Instituto de Extensión y de Educación no formal (IDEXUD)</option>
					<option value="29">Autoevaluación y Acreditación de Alta Calidad</option>
					<option value="30">Bienestar Institucional</option>
					<option value="31">Divisón de Recursos Financieros</option>
					<option value="32">Oficina Quejas, reclamos y atención al ciudadano</option>
					<option value="33">Divisón de Recursos Fisicos</option>
					<option value="34">Divisón de Talento Humano</option>
					<option value="35">Oficina Asesora de Control Interno</option>
					<option value="36">Oficina Asesora Jurídica</option>
					<option value="37">Sección Biblioteca</option>
					<option value="38">Secretaría General</option>
					<option value="39">Planeación COLCIENCIAS</option>
					<option value="40">SCIENTI </option>
					<option value="41">CvLAC </option>
				</select>
			</tr>
			<tr class="trb">
				<td class="texto"  >
					<table width="100%">
								<tr>
									<td width="90%" class="texto" align="left"><b>Descripción</b></td>
									<td align="right">
									 <script type="text/javascript">
									 tooltip('Descripcion');
									 </script>
									</td>
								</tr>
					</table>
				</td>
				<td class="texto" align="left"><textarea style="width:100%" name="descripcion" class="texto" rows="5"></textarea></td>
			</tr>
			<tr class="texto">
				<td class="texto"  >
					<table width="100%">
								<tr>
									<td width="90%" class="texto" align="left"><b>Periodo de Actualización:</b></td>
									<td align="right">
									 <script type="text/javascript">
									 tooltip('Periodo');
									 </script>
									</td>
								</tr>
					</table>
				</td>
				<td><select name="periodo"">
					<option value="0">------------</option>
					<option value="1">Mensual</option>
					<option value="2">Bimensual</option>
					<option value="3">Trimestral</option>
					<option value="4">Semestral</option>
					<option value="5">Anual</option>
				</select>
			</tr>
			<tr class="trb">
				<td class="texto"  >
					<table width="100%">
								<tr>
									<td width="90%" class="texto" align="left"><b>Unidad de Medida:</b></td>
									<td align="right">
									 <script type="text/javascript">
									 tooltip('Unidad');
									 </script>
									</td>
								</tr>
					</table>
				</td>
				<td><select name="unidad"">
					<option value="0">-------------------------</option>
					<option value="1">Miles de pesos</option>
					<option value="2">Millones de pesos</option>
					<option value="3">Pesos</option>
					<option value="4">Sin unidad (adimensional)</option>
					<option value="5">Puntos</option>
					<option value="6">Horas/Semana</option>
					<option value="7">Horas/Semestre</option>
					<option value="8">Porcentaje</option>
				</select>
			</tr>
			<tr class="texto">
				<td class="texto"  >
					<table width="100%">
								<tr>
									<td width="90%" class="texto" align="left"><b>Opciones de Reporte Gráfico:</b></td>
									<td align="right">
									 <script type="text/javascript">
									 tooltip('Opciones');
									 </script>
									</td>
								</tr>
					</table>
				</td>
				<td>
					<table align="center" style="width: 100%">
						<tr>
							<td colspan="4"><input name="tipografica" type="checkbox" value="Torta"/>Torta</td>
							<td colspan="4"><input name="tipografica" type="checkbox" value="Donut"/>Donut</td>
						</tr>
						<tr>
							<td colspan="4"><input name="tipografica" type="checkbox" value="Columnas Horizontales"/>Columnas Horizontales</td>
							<td colspan="4"><input name="tipografica" type="checkbox" value="Columnas Verticales"/>Columnas Verticales</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr class="trb">
				<td class="texto"  >
					<table width="100%">
								<tr>
									<td width="90%" class="texto" align="left"><b>Fecha de Creación:</b></td>
									<td align="right">
									 <script type="text/javascript">
									 tooltip('Fecha');
									 </script>
									</td>
								</tr>
					</table>
				</td>
				<td align="left"><input type="text" style="width:30%" readonly="readonly" name="fechacreacion" class="texto" value=<c:out value='${ano} '/>></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<table>
						<tr></tr>
						<tr>
							<td align="center"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardar()"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</form>
</body>
</html>