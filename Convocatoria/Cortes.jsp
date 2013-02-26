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
<script>

	function guardar(id,acc){
		document.frmCortes.caso.value=acc;
		document.frmCortes.idCorte.value=document.getElementById("idCorte"+id).value;
		document.frmCortes.numCorte.value=document.getElementById("numCorte"+id).value;
		document.frmCortes.fechaApertura.value=document.getElementById("fechaApertura"+id).value;
		document.frmCortes.fechaCierre.value=document.getElementById("fechaCierre"+id).value;
		document.frmCortes.auxApertura.value=document.getElementById("auxApertura"+id).value;
		document.frmCortes.auxCierre.value=document.getElementById("auxCierre"+id).value;
		if(validar(id)){
			document.frmCortes.action='<c:url value="/Convocatoria/llenar1.jsp"/>';
			document.frmCortes.submit();
		}
	}

	function validar(id){
		mensaje="";
		if(document.getElementById("fechaApertura"+id).value==""){
			mensaje=mensaje+"\n-) Fecha de Apertura del corte";
		}else{
			if(document.getElementById("fechaCierre"+id).value==""){
			mensaje=mensaje+"\n-) Fecha de Cierre del corte";
			}
		}
		if(document.getElementById("auxApertura"+id).value!="" && document.getElementById("auxCierre"+id).value==""){
			mensaje=mensaje+"\n-) Fecha Auxiliar de Cierre del corte";
		}
		if(mensaje!=""){
			mensaje="Los siguientes campos son obligatorios: "+mensaje;
			alert (mensaje);
		}else
			return true;
		return false;

	}

</script>
</head>
<body>
<form action="" method="post" name="frmCortes">
	<input type="hidden" name="accion" value='7'>
	<input type="hidden" name="de" value='16'>
	<input type="hidden" name="irA" value="16">
	<input type="hidden" name="caso" value="">
	<input type="hidden" name='convId<c:out value="${st.count}" />' value='<c:out value="${sessionScope.convocatoriaOBJ.convId}"/>'>
	<input type="hidden" name="idCorte" value="">
	<input type="hidden" name="numCorte" value="">
	<input type="hidden" name="fechaApertura" value="">
	<input type="hidden" name="fechaCierre" value="">
	<input type="hidden" name="auxApertura" value="">
	<input type="hidden" name="auxCierre" value="">
</form>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr><td width="100%" valign='top'>
			<div align="center" style="width:100%;height:180px;overflow:auto;vertical-align:top;">
				<c:import url="/convocatoria/Listas.x"/>
			</div>
		</td></tr>
	</table>
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<a href='<c:url value="/convocatoria/Parametrizar.x?irA=8&accion=6"/>'>
					<img border="0" src="<c:url value="/comp/img/General.gif"/>">
				</a>
			</td>
			<td>
				<a href='<c:url value="/convocatoria/Parametrizar.x?irA=9&accion=6"/>'>
					<img border="0" src="<c:url value="/comp/img/Documentos.gif"/>">
				</a>
			</td>
			<td>
				<a href='<c:url value="/convocatoria/Parametrizar.x?irA=4&accion=6"/>'>
					<img border="0" src="<c:url value="/comp/img/Ejes.gif"/>">
				</a>
			</td>
			<td>
				<a href='<c:url value="/convocatoria/Parametrizar.x?irA=2&accion=6"/>'>
					<img border="0" src="<c:url value="/comp/img/Compromisos.gif"/>">
				</a>
			</td>
			<td>
				<a href='<c:url value="/convocatoria/Parametrizar.x?irA=3&accion=6"/>'>
					<img border="0" src="<c:url value="/comp/img/Criterios.gif"/>">
				</a>
			</td>
			<td>
				<a href='<c:url value="/convocatoria/Parametrizar.x?irA=1&accion=6"/>'>
					<img border="0" src="<c:url value="/comp/img/Aspectos.gif"/>">
				</a>
			</td>
			<td>
				<a href='<c:url value="/convocatoria/Parametrizar.x?irA=12&accion=6"/>'>
					<img border="0" src="<c:url value="/comp/img/Porcentajes.gif"/>">
				</a>
			</td>
			<td>
				<a href='<c:url value="/convocatoria/Parametrizar.x?irA=11&accion=6"/>'>
					<img border="0" src="<c:url value="/comp/img/Rubros.gif"/>">
				</a>
			</td>
		</tr>
	</table>
	<br>
<c:if test='${sessionScope.convocatoriaOBJ!=null}'>
		<fieldset style="width:99%;">
    	<legend class="texto1"><b>Listado de Cortes de la Convocatoria</b></legend>
			<table width="98%" class="tablas">
				<tr>
					<th>#</th>
					<th>Apertura Inscripcion</th>
					<th>Cierre Inscripcion</th>
					<th>Apertura Auxiliar</th>
					<th>Cierre Auxiliar</th>
					<th>&nbsp;</th>
					<th>&nbsp;</th>
				</tr>
				<c:set var="numCorte" value="1" />
				<c:forEach begin="0" items="${sessionScope.convocatoriaOBJ.listaCortes}" var="lista" varStatus="st">
				<tr id="cort<c:out value="${st.count}" />">
					<th><c:out value="${st.count}"/></th>
					<td>
						<input type="hidden" id='idCorte<c:out value="${st.count}" />' value='<c:out value="${lista.idCorte}"/>'>
						<input type="hidden" id='numCorte<c:out value="${st.count}" />' value='<c:out value="${lista.numCorte}"/>'>
						<input type='text' class='caj' readonly='true' id='fechaApertura<c:out value="${numCorte}" />' size='11' value='<c:out value="${lista.fechaApertura}"/>'>
						<button type='button' id='botonFecApertura<c:out value="${numCorte}" />'>...</button>
						<script type='text/javascript'>
			    			Calendar.setup({
				    			inputField     :    'fechaApertura<c:out value="${numCorte}" />',
				    			ifFormat       :    '%Y-%m-%d',
				    			showsTime      :    false,
				    			button         :    'botonFecApertura<c:out value="${numCorte}" />',
				    			singleClick    :    false,
				    			step           :    1
			    			})
		    			</script>
					</td>
					<td>
						<input type='text' class='caj' readonly='true' id='fechaCierre<c:out value="${numCorte}" />' size='11' value='<c:out value="${lista.fechaCierre}"/>'>
						<button type='button' id='botonFecCierre<c:out value="${numCorte}" />'>...</button>
						<script type='text/javascript'>
			    			Calendar.setup({
				    			inputField     :    'fechaCierre<c:out value="${numCorte}" />',
				    			ifFormat       :    '%Y-%m-%d',
				    			showsTime      :    false,
				    			button         :    'botonFecCierre<c:out value="${numCorte}" />',
				    			singleClick    :    false,
				    			step           :    1
			    			})
		    			</script>
					</td>
					<td>
						<input type='text' class='caj' readonly='true' id='auxApertura<c:out value="${numCorte}" />' size='11' value='<c:out value="${lista.auxApertura}"/>'>
						<button type='button' id='botonAuxApertura<c:out value="${numCorte}" />'>...</button>
						<script type='text/javascript'>
			    			Calendar.setup({
				    			inputField     :    'auxApertura<c:out value="${numCorte}" />',
				    			ifFormat       :    '%Y-%m-%d',
				    			showsTime      :    false,
				    			button         :    'botonAuxApertura<c:out value="${numCorte}" />',
				    			singleClick    :    false,
				    			step           :    1
			    			})
		    			</script>
					</td>
					<td>
						<input type='text' class='caj' readonly='true' id='auxCierre<c:out value="${numCorte}" />' size='11' value='<c:out value="${lista.auxCierre}"/>'>
						<button type='button' id='botonAuxCierre<c:out value="${numCorte}" />'>...</button>
						<script type='text/javascript'>
			    			Calendar.setup({
				    			inputField     :    'auxCierre<c:out value="${numCorte}" />',
				    			ifFormat       :    '%Y-%m-%d',
				    			showsTime      :    false,
				    			button         :    'botonAuxCierre<c:out value="${numCorte}" />',
				    			singleClick    :    false,
				    			step           :    1
			    			})
		    			</script>
					</td>
					<td>
						<img src='<c:url value="/comp/img/Guardar.gif"/>' onclick='guardar(<c:out value="${numCorte}" />,2)'>
					</td>
					<td>
						<img src='<c:url value="/comp/img/no.png"/>' onclick='guardar(<c:out value="${numCorte}" />,3)'>
					</td>
				</tr>
				<c:set var="numCorte" value="${numCorte+1}" />
				</c:forEach>
				<tr class="trb">
					<td>&nbsp;</td>
					<td>
						<input type="hidden" id='idCorte<c:out value="${numCorte}" />' value='<c:out value="${numCorte}"/>'>
						<input type="hidden" id='numCorte<c:out value="${numCorte}" />' value='<c:out value="${numCorte}"/>'>
						<input type='text' class='caj' readonly='true' id='fechaApertura<c:out value="${numCorte}" />' size='11'>
						<button type='button' id='botonFecApertura<c:out value="${numCorte}" />'>...</button>
						<script type='text/javascript'>
			    			Calendar.setup({
				    			inputField     :    'fechaApertura<c:out value="${numCorte}" />',
				    			ifFormat       :    '%Y-%m-%d',
				    			showsTime      :    false,
				    			button         :    'botonFecApertura<c:out value="${numCorte}" />',
				    			singleClick    :    false,
				    			step           :    1
			    			})
		    			</script>
					</td>
					<td>
						<input type='text' class='caj' readonly='true' id='fechaCierre<c:out value="${numCorte}" />' size='11'>
						<button type='button' id='botonFecCierre<c:out value="${numCorte}" />'>...</button>
						<script type='text/javascript'>
			    			Calendar.setup({
				    			inputField     :    'fechaCierre<c:out value="${numCorte}" />',
				    			ifFormat       :    '%Y-%m-%d',
				    			showsTime      :    false,
				    			button         :    'botonFecCierre<c:out value="${numCorte}" />',
				    			singleClick    :    false,
				    			step           :    1
			    			})
		    			</script>
					</td>
					<td>
						<input type='text' class='caj' readonly='true' id='auxApertura<c:out value="${numCorte}" />' size='11'>
						<button type='button' id='botonAuxApertura<c:out value="${numCorte}" />'>...</button>
						<script type='text/javascript'>
			    			Calendar.setup({
				    			inputField     :    'auxApertura<c:out value="${numCorte}" />',
				    			ifFormat       :    '%Y-%m-%d',
				    			showsTime      :    false,
				    			button         :    'botonAuxApertura<c:out value="${numCorte}" />',
				    			singleClick    :    false,
				    			step           :    1
			    			})
		    			</script>
					</td>
					<td>
						<input type='text' class='caj' readonly='true' id='auxCierre<c:out value="${numCorte}" />' size='11'>
						<button type='button' id='botonAuxCierre<c:out value="${numCorte}" />'>...</button>
						<script type='text/javascript'>
			    			Calendar.setup({
				    			inputField     :    'auxCierre<c:out value="${numCorte}" />',
				    			ifFormat       :    '%Y-%m-%d',
				    			showsTime      :    false,
				    			button         :    'botonAuxCierre<c:out value="${numCorte}" />',
				    			singleClick    :    false,
				    			step           :    1
			    			})
		    			</script>
					</td>
					<td>
						<img src='<c:url value="/comp/img/Guardar.gif"/>' onclick='guardar(<c:out value="${numCorte}" />,1)'>
					</td>
				</tr>
			</table>
		</fieldset>
</c:if>
	<c:if test='${sessionScope.convocatoriaOBJ==null}'>
		<fieldset style="width:450px;">
			<legend class="texto1"><b>Error</b></legend>
			<h5>Favor seleccionar una convocatoria</h5>
		</fieldset>
	</c:if>

</body>
</html>