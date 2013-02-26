<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
    	if(document.form1.nombre.value == '')
    	{
    		mensaje = mensaje + "	-) Digite Nombre\n";
    	}
    	if(document.form1.responsable.selectedIndex==0)
    	{
    		mensaje = mensaje + "	-) Seleccione Responsable del Reporte de la Variable\n";
    	}
    	if(document.form1.descripcion.value == '')
    	{
    		mensaje = mensaje + "	-) Digite descripción\n";
    	}
    	if(document.form1.periodo.selectedIndex==0)
    	{
    		mensaje = mensaje + "	-) Seleccione Periodo de Actualización\n";
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
<input type="hidden" name="accion" value="4" />
	<table class="tablas" width="80%" align="center">
		<caption>FORMULARIO DE MODIFICACIÓN DE VARIABLES</caption>
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
			<td class="texto" align="left"><c:out value="${sessionScope.variable.identificador}" /></td>
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
			<td class="texto" align="left"><input type="text" style="width:100%" name="nombre" class="texto" value="<c:out value="${sessionScope.variable.nombre}" />"></td>
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
			<option value="15" <c:if test="${sessionScope.variable.responsable == 15}"> selected</c:if>>Centro de Investigaciones y Desarrollo Científico (CIDC)</option>
			<option value="17" <c:if test="${sessionScope.variable.responsable == 17}"> selected</c:if>>Oficina Asesora de Planeación y Control</option>
			<option value="18" <c:if test="${sessionScope.variable.responsable == 18}"> selected</c:if>>Vicerectoria Académica</option>
			<option value="19" <c:if test="${sessionScope.variable.responsable == 19}"> selected</c:if>>Vicerectoria Administrativa y Financiera</option>
			<option value="20" <c:if test="${sessionScope.variable.responsable == 20}"> selected</c:if>>Oficina de Docencia</option>
			<option value="21" <c:if test="${sessionScope.variable.responsable == 21}"> selected</c:if>>Oficina Asesora de Sistemas y RedUDNET</option>
			<option value="22" <c:if test="${sessionScope.variable.responsable == 22}"> selected</c:if>>Decanatura Ciencias y Educación</option>
			<option value="23" <c:if test="${sessionScope.variable.responsable == 23}"> selected</c:if>>Decanatura Ingeniería</option>
			<option value="24" <c:if test="${sessionScope.variable.responsable == 24}"> selected</c:if>>Decanatura Medio Ambiente</option>
			<option value="25" <c:if test="${sessionScope.variable.responsable == 25}"> selected</c:if>>Decanatura Tecnológica</option>
			<option value="26" <c:if test="${sessionScope.variable.responsable == 26}"> selected</c:if>>Decanatura Artes - ASAB</option>
			<option value="27" <c:if test="${sessionScope.variable.responsable == 27}"> selected</c:if>>Centro de Relaciones Interinstitucionales (CERI)</option>
			<option value="28" <c:if test="${sessionScope.variable.responsable == 28}"> selected</c:if>>Instituto de Extensión y de Educación no formal (IDEXUD)</option>
			<option value="29" <c:if test="${sessionScope.variable.responsable == 29}"> selected</c:if>>Autoevaluación y Acreditación de Alta Calidad</option>
			<option value="30" <c:if test="${sessionScope.variable.responsable == 30}"> selected</c:if>>Bienestar Institucional</option>
			<option value="31" <c:if test="${sessionScope.variable.responsable == 31}"> selected</c:if>>Divisón de Recursos Financieros</option>
			<option value="32" <c:if test="${sessionScope.variable.responsable == 32}"> selected</c:if>>Oficina Quejas, reclamos y atención al ciudadano</option>
			<option value="33" <c:if test="${sessionScope.variable.responsable == 33}"> selected</c:if>>Divisón de Recursos Fisicos</option>
			<option value="34" <c:if test="${sessionScope.variable.responsable == 34}"> selected</c:if>>Divisón de Talento Humano </option>
			<option value="35" <c:if test="${sessionScope.variable.responsable == 35}"> selected</c:if>>Oficina Asesora de Control Interno</option>
			<option value="36" <c:if test="${sessionScope.variable.responsable == 36}"> selected</c:if>>Oficina Asesora Jurídica</option>
			<option value="37" <c:if test="${sessionScope.variable.responsable == 37}"> selected</c:if>>Sección Biblioteca</option>
			<option value="38" <c:if test="${sessionScope.variable.responsable == 38}"> selected</c:if>>Secretaría General </option>
			<option value="39" <c:if test="${sessionScope.variable.responsable == 39}"> selected</c:if>>Planeación COLCIENCIAS</option>
			<option value="40" <c:if test="${sessionScope.variable.responsable == 40}"> selected</c:if>>SCIENTI</option>
			<option value="41" <c:if test="${sessionScope.variable.responsable == 41}"> selected</c:if>>CvLAC</option>
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
			<td class="texto" align="left"><textarea style="width:100%" name="descripcion" rows="5" class="texto"><c:out value="${sessionScope.variable.descripcion}" /></textarea></td>
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
				<option value="1" <c:if test="${sessionScope.variable.periodo == 1}"> selected</c:if>>Mensual</option>
				<option value="2" <c:if test="${sessionScope.variable.periodo == 2}"> selected</c:if>>Bimensual</option>
				<option value="3" <c:if test="${sessionScope.variable.periodo == 3}"> selected</c:if>>Trimestral</option>
				<option value="4" <c:if test="${sessionScope.variable.periodo == 4}"> selected</c:if>>Semestral</option>
				<option value="5" <c:if test="${sessionScope.variable.periodo == 5}"> selected</c:if>>Anual</option>
			</select>
		</tr>
		<tr class="trb">
				<td>
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
				<option value="0">-----------------------</option>
				<option value="1" <c:if test="${sessionScope.variable.unidad == 1}"> selected</c:if>>Miles de pesos</option>
				<option value="2" <c:if test="${sessionScope.variable.unidad == 2}"> selected</c:if>>Millones de pesos</option>
				<option value="3" <c:if test="${sessionScope.variable.unidad == 3}"> selected</c:if>>Pesos</option>
				<option value="4" <c:if test="${sessionScope.variable.unidad == 4}"> selected</c:if>>Sin unidad (adimensional)</option>
				<option value="5" <c:if test="${sessionScope.variable.unidad == 5}"> selected</c:if>>Puntos</option>
				<option value="6" <c:if test="${sessionScope.variable.unidad == 6}"> selected</c:if>>Horas/Semana</option>
				<option value="7" <c:if test="${sessionScope.variable.unidad == 7}"> selected</c:if>>Horas/Semestre</option>
				<option value="8" <c:if test="${sessionScope.variable.unidad == 8}"> selected</c:if>>Porcentaje</option>
			</select>
		</tr>
		<tr>
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
		</tr>
		<tr>
			<c:forTokens delims="," begin="0" items="Torta,Donut,Columnas Horizontales,Columnas Verticales" var="lista1">
				<c:set var="bandera" value="0" />
				<c:forTokens delims="," items="${sessionScope.variable.tipograficatexto}" var="lista2">
					<c:if test="${lista1==lista2}">
						<c:set var="bandera" value="1" />
					</c:if>
				</c:forTokens>
				<c:if test="${bandera == 1}">
					<tr><td colspan="2"><input name="tipografica" type="checkbox" value='<c:out value="${lista1}"/>' checked="checked"/><c:out value="${lista1}"/></td><td colspan="2"></tr>
				</c:if>
				<c:if test="${bandera != 1}">
					<tr><td colspan="2"><input name="tipografica" type="checkbox" value='<c:out value="${lista1}"/>'/><c:out value="${lista1}"/></td><td colspan="2"></tr>
				</c:if>
			</c:forTokens>

		</tr>
		<tr class="trb">
			<td class="texto"  >
				<table width="100%">
							<tr>
								<td width="90%" class="texto" align="left"><b>Dato:</b></td>
								<td align="right">
								 <script type="text/javascript">
								 tooltip('Dato');
								 </script>
								</td>
							</tr>
				</table>
			</td>
			<td class="texto" align="left"><c:out value="${sessionScope.variable.dato}" /></td>
		</tr>
		<tr>
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
			<td class="texto" align="left"><c:out value="${sessionScope.variable.fechacreacion}" /></td>
		</tr>
		<tr class="trb">
				<td class="texto"  >
					<table width="100%">
								<tr>
									<td width="90%" class="texto" align="left"><b>Fecha de Ultima Actualización:</b></td>
									<td align="right">
									 <script type="text/javascript">
									 tooltip('Actualizacion');
									 </script>
									</td>
								</tr>
					</table>
				</td>
			<td class="texto" align="left"><c:out value="${sessionScope.variable.fechaactualizacion}" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<table>
					<tr></tr>
					<tr>
						<td align="center"><img src='<c:url value="/comp/img/Modificar.gif"/>' onclick="guardar()"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>