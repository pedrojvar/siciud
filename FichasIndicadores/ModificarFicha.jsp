<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
	    var x='<c:url value="/FichasIndicadores/AyudaTooltip.jsp?tipo=' + tipo + '"/>'
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
    		mensaje = mensaje + "	-) Digite un nombre \n";
    	}
    	if(document.form1.descripcion.value == '')
    	{
    		mensaje = mensaje + "	-) Digite una descripcion \n";
    	}
		if(document.form1.objetivo.value == '')
    	{
    		mensaje = mensaje + "	-) Digite un objetivo \n";
    	}
    	if(document.form1.metodologia.value == '')
    	{
    		mensaje = mensaje + "	-) Digite una metodologia \n";
    	}
    	if(document.form1.responsable.selectedIndex==0)
    	{
    		mensaje = mensaje + "	-) Seleccione Responsable \n";
    	}
    	if(document.form1.fuente.value == '')
    	{
    		mensaje = mensaje + "	-) Digite fuente de Información \n";
    	}
    	if(document.form1.docsoporte.value == '')
    	{
    		mensaje = mensaje + "	-) Digite documentos soporte \n";
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
			mensaje=mensaje+ "	-) Seleccione por lo menos una opcion para el tipo de grafica \n";
		}

		if(mensaje!="")
		{
			mensaje="Por favor revise los siguientes campos que presentan algún problema: \n"+mensaje;
			alert (mensaje);
		}
		else
		{
			if(confirm('¿Esta seguro de modificar estos datos?'))
			{
				document.form1.submit();
			}
		}
    }
</script>
</head>
<c:import url="/general.jsp"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" type="time" timeStyle="short" pattern="yyyy" var="ano"/>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="form1" method="post" action='<c:url value="/FichasIndicadores/llenar.jsp"/>'>
	<table class="tablas" width="95%" align="center">
	<input type="hidden" name="accion" value="8" />
	<input type="hidden" name="banderaFormula" value="1"/>
	<td colspan="8">
		<table class="tablas" width="70%" align="center">
			<tr>
				<td><a class="menu" href='<c:url value="/FichasIndicadores/ModificarFicha.jsp"/>'>Modificar Información</a></td>
				<td><a class="menu" href='<c:url value="/FichasIndicadores/ModificarVariablesFicha.jsp"/>'>Modificar Variables</a></td>
				<td><a class="menu" href='<c:url value="/FichasIndicadores/ModificarFormulaFicha.jsp"/>'>Modificar Fórmula</a></td>
			</tr>
		</table>
	</td>
	<tr></tr>
	<tr></tr>
	<caption>MODIFICACIÓN DE INDICADORES</caption>
	<tr>
		<td class="renglones" width="160px">
				<table width="100%" border="0">
					<tr>
						<td width="90%" class="renglones"><b>Modelo de Medición:</b></td>
						<td align="right">
						 <script type="text/javascript">
						 tooltip('Modelo');
						 </script>
						</td>
					</tr>
				</table>
		</td>
		<c:if test="${sessionScope.ficha.modelo == 1}">
			<td class="texto">C & I & D & C</td>
		</c:if>
		<c:if test="${sessionScope.ficha.modelo == 2}">
			<td class="texto">SIGUD</td>
		</c:if>
		<c:if test="${sessionScope.ficha.modelo == 3}">
			<td class="texto">SUE</td>
		</c:if>
		<c:if test="${sessionScope.ficha.modelo == 4}">
			<td class="texto">Acreditación</td>
		</c:if>
	</tr>

	<tr>
		<td class="renglones">
			<table width="100%">
						<tr>
							<td class="renglones" align="left"><b>Identificador:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('Identificador');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td class="texto"><c:out value="${sessionScope.ficha.identificador}" /></td>
	</tr>

	<tr>
		<td class="renglones">
			<table width="100%">
						<tr>
							<td class="renglones" align="left"><b>Nombre:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('Nombre');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td><input type="text" style="width:100%" name="nombre" class="texto" value='<c:out value="${sessionScope.ficha.nombre}" />'></td>
	</tr>
	<tr>
		<td class="renglones">
			<table width="100%" border="0">
						<tr>
							<td class="renglones" align="left"><b>Descripción:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('Descripción');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td class="renglones"></td>
	</tr>
	<tr>
		<td colspan="2"><textarea style="width:100%;height:50px" name="descripcion" class="texto"><c:out value="${sessionScope.ficha.descripcion}" /></textarea></td>
	</tr>
		<tr>
		<td class="renglones">
			<table width="100%" border="0">
						<tr>
							<td class="renglones" align="left"><b>Objetivo:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('Objetivo');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td class="renglones"></td>
		</tr>
	<tr>
		<td colspan="2"><textarea style="width:100%;height:50px" name="objetivo" class="texto"><c:out value="${sessionScope.ficha.objetivo}" /></textarea></td>
	</tr>
	<tr>
		<td class="renglones">
			<table width="100%" border="0">
						<tr>
							<td class="renglones" align="left"><b>Metodologia:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('Metodologia');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td class="renglones"></td>
	</tr>
	<tr>
		<td colspan="2"><textarea style="width:100%;height:50px" name="metodologia" class="texto"><c:out value="${sessionScope.ficha.metodologia}" /></textarea></td>
	</tr>

	<tr>
		<td class="renglones">
			<table width="100%">
						<tr>
							<td class="renglones" align="left"><b>Fecha de Corte:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('FechaCorte');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td><input type="text" name="fechacorte" class="texto" value="31/12/<c:out value='${ano-1} '/>" readonly="readonly"></td>
	</tr>
	<tr>
		<td class="renglones">
			<table width="100%">
						<tr>
							<td class="renglones" align="left"><b>Responsable al seguimiento del Indicador:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('RespInd');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td>
		<select  class="texto" name="responsable"">
			<option value="0">--------------------------------------------------------</option>
			<option value="15" <c:if test="${sessionScope.ficha.responsable == 15}"> selected</c:if>>Centro de Investigaciones y Desarrollo Científico (CIDC)</option>
			<option value="17" <c:if test="${sessionScope.ficha.responsable == 17}"> selected</c:if>>Oficina Asesora de Planeación y Control</option>
			<option value="18" <c:if test="${sessionScope.ficha.responsable == 18}"> selected</c:if>>Vicerectoria Académica</option>
			<option value="19" <c:if test="${sessionScope.ficha.responsable == 19}"> selected</c:if>>Vicerectoria Administrativa y Financiera</option>
			<option value="20" <c:if test="${sessionScope.ficha.responsable == 20}"> selected</c:if>>Oficina de Docencia</option>
			<option value="21" <c:if test="${sessionScope.ficha.responsable == 21}"> selected</c:if>>Oficina Asesora de Sistemas y RedUDNET</option>
			<option value="22" <c:if test="${sessionScope.ficha.responsable == 22}"> selected</c:if>>Decanatura Ciencias y Educación</option>
			<option value="23" <c:if test="${sessionScope.ficha.responsable == 23}"> selected</c:if>>Decanatura Ingeniería</option>
			<option value="24" <c:if test="${sessionScope.ficha.responsable == 24}"> selected</c:if>>Decanatura Medio Ambiente</option>
			<option value="25" <c:if test="${sessionScope.ficha.responsable == 25}"> selected</c:if>>Decanatura Tecnológica</option>
			<option value="26" <c:if test="${sessionScope.ficha.responsable == 26}"> selected</c:if>>Decanatura Artes - ASAB</option>
			<option value="27" <c:if test="${sessionScope.ficha.responsable == 27}"> selected</c:if>>Centro de Relaciones Interinstitucionales (CERI)</option>
			<option value="28" <c:if test="${sessionScope.ficha.responsable == 28}"> selected</c:if>>Instituto de Extensión y de Educación no formal (IDEXUD)</option>
			<option value="29" <c:if test="${sessionScope.ficha.responsable == 29}"> selected</c:if>>Autoevaluación y Acreditación de Alta Calidad</option>
			<option value="30" <c:if test="${sessionScope.ficha.responsable == 30}"> selected</c:if>>Bienestar Institucional</option>
			<option value="31" <c:if test="${sessionScope.ficha.responsable == 31}"> selected</c:if>>Divisón de Recursos Financieros</option>
			<option value="32" <c:if test="${sessionScope.ficha.responsable == 32}"> selected</c:if>>Oficina Quejas, reclamos y atención al ciudadano</option>
			<option value="33" <c:if test="${sessionScope.ficha.responsable == 33}"> selected</c:if>>Divisón de Recursos Fisicos</option>
			<option value="34" <c:if test="${sessionScope.ficha.responsable == 34}"> selected</c:if>>Divisón de Talento Humano </option>
			<option value="35" <c:if test="${sessionScope.ficha.responsable == 35}"> selected</c:if>>Oficina Asesora de Control Interno</option>
			<option value="36" <c:if test="${sessionScope.ficha.responsable == 36}"> selected</c:if>>Oficina Asesora Jurídica</option>
			<option value="37" <c:if test="${sessionScope.ficha.responsable == 37}"> selected</c:if>>Sección Biblioteca</option>
			<option value="38" <c:if test="${sessionScope.ficha.responsable == 38}"> selected</c:if>>Secretaría General </option>
			<option value="39" <c:if test="${sessionScope.ficha.responsable == 39}"> selected</c:if>>Planeación COLCIENCIAS</option>
			<option value="40" <c:if test="${sessionScope.ficha.responsable == 40}"> selected</c:if>>SCIENTI</option>
			<option value="41" <c:if test="${sessionScope.ficha.responsable == 41}"> selected</c:if>>CvLAC</option>
		</select>
	</tr>
	<tr>
		<td class="renglones">
			<table width="100%" border="0">
						<tr>
							<td class="renglones" align="left"><b>Fuente de Información:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('FuenteInfo');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td><input type="text" style="width:95%" name="fuente" class="texto" value='<c:out value="${sessionScope.ficha.fuente}" />'></td>
	</tr>
	<tr>
		<td class="renglones">
			<table width="100%" border="0">
						<tr>
							<td class="renglones" align="left"><b>Documentos Soporte:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('DocSop');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td><input type="text" style="width:90%" name="docsoporte" class="texto" value='<c:out value="${sessionScope.ficha.docsoporte}" />'></td>
	</tr>

	<tr>
		<td class="renglones" style="width:100px" colspan="4" ><b>Tipo de Grafica:</b></td>
		<td>
		<c:forTokens delims="," begin="0" items="Torta,Donut,Columnas Horizontales,Columnas Verticales" var="lista1">
			<c:set var="bandera" value="0" />
			<c:forTokens delims="," items="${sessionScope.ficha.tipograficatexto}" var="lista2">
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
		</td>
	</tr>
	<tr>
		<td colspan="4" class="renglones" style="width:150px"><b>Observaciones:</b></td>
		<tr><td colspan="4"><textarea style="width:100%;height:50px" name="observaciones" class="texto"><c:out value="${sessionScope.ficha.observaciones}" /></textarea></td>
	</tr>
	<tr>
		<td colspan="4" align="center"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardar()"></td>
	</tr>
	</table>
</form>
</body>
</html>