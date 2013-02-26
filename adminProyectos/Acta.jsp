<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<jsp:useBean id="now" class="java.util.Date"/>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<fmt:formatDate value="${now}" type="time" timeStyle="short" pattern="yyyy-mm-dd" var="hoy"/>

<c:import url="/general.jsp"/>

<script>
	function direc(nombre){
		document.getElementById('nombre').innerHTML=nombre;
	}
	function ver(accion){
		document.comandos.accion.value=accion;
		document.comandos.submit();
	}
	function gestorAdmin(flaggestor){		
		if(document.contrato.flaggestor.checked){
			document.contrato.gestorfinanciero.value="true";
			document.contrato.gestor.disabled=false;
			document.contrato.realizador.disabled=false;
		}				
		else{
			document.contrato.gestorfinanciero.value="false";
			document.contrato.gestor.disabled=true;
			document.contrato.realizador.disabled=true;
		}						
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<c:if test="${sessionScope.proyecto!=null}">
	<form name="comandos" method="post" action='<c:url value="/GestionGeneralProyectos/documentosServlet.x"/>'>
		<input type="hidden" name="accion" value="0"/>
		<input type="hidden" name="id" value='<c:out value="${sessionScope.proyecto.id}"/>'/>
	</form>
	<br>
	<br>
	<form name="contrato" action='<c:url value="/adminProyectos/llenar1.jsp"/>' method="post">
	<input type="hidden" name="accion" value="4">
	<input type="hidden" name="id" value='<c:out value="${sessionScope.proyecto.id}"/>'/>
	<table class="tablas" align="center" width="60%">
	<input type="hidden" name="gestorfinanciero" value="false"/>
	<CAPTION>Creación de Acta de inicio</CAPTION>
		<tr>
			<td colspan="4" class="renglones"><b>Nombre de Proyecto</b></td>
		</tr>
		<tr>
			<td colspan="4"><c:out value="${sessionScope.proyecto.proyecto}"/></td>
		</tr>
		<tr>
			<td colspan="2" class="renglones"><b>Grupo de Investigación</b></td>
			<td colspan="2" class="renglones"><b>Tiene Gestor Financiero</b></td>
		</tr>
		<tr>
			<td colspan="2"><c:out value="${sessionScope.proyecto.grupoInvestigacion}"/></td>
			<td colspan="2"><input type="checkbox" name="flaggestor" onchange="gestorAdmin(this)"></td>
		</tr>		
		<tr>
			<td width="200px" class="renglones"><b>Realizador del Proyecto</b></td>
			<td colspan="4"><input type="text" name="realizador" size="15" style="width: 45%" value='<c:out value="${sessionScope.proyecto.realizador}" />' disabled></td>
		</tr>
		<tr>
			<td width="200px" class="renglones"><b>Gestor del Proyecto</b></td>
			<td colspan="4"><input type="text" name="gestor" size="15" style="width: 45%" value='<c:out value="${sessionScope.proyecto.gestor}" />' disabled></td>
		</tr>		
		<tr>
			<td width="200px" class="renglones"><b>Director del Proyecto</b></td>
			<td colspan="4"><input type="text" name="director" size="15" style="width: 45%" value='<c:out value="${sessionScope.proyecto.director}" />'></td>
		</tr>
		<tr>
			<td width="200px" class="renglones"><b>Tutor del Proyecto</b></td>
			<td colspan="4"><input type="text" name="tutor" size="15" style="width: 45%" value='<c:out value="${sessionScope.proyecto.tutor}" />'></td>
		</tr>
		<tr>
			<td class="renglones"><b>Fecha de Impresión</b></td>
				<td>
					<input type='text' style="width: 90%" name='fecActa' class='caj'  readonly='true' id='f_date_a' size='13' value='<c:out value="${sessionScope.convocatoriaOBJ.convFecInicio}"/>'>
					<button type='button' id='f_trigger_a'>...</button>
					<script type='text/javascript'>
		    			Calendar.setup({
			    			inputField     :    'f_date_a',
			    			ifFormat       :    '%Y-%m-%d',
			    			showsTime      :    true,
			    			button         :    'f_trigger_a',
			    			singleClick    :    false,
			    			step           :    1
		    			})
	    			</script>
				</td>
		</tr>
		<tr>
			<td width="200px" class="renglones"><b>Cédula Director del Proyecto</b></td>
			<td><input type="text" name="cedulaDir" size="15" style="width: 45%"> de <input type="text" name="cedulaDirDe" size="15" style="width: 45%"></td>
		</tr>
		<tr>
			<td class="renglones" width="50px"><b>Acta N°</b></td>
			<td width="150px"><input type="text" name="sesion" size="4" value='<c:out value="${sessionScope.proyecto.sesion}" />'></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><br>
				<table class="tablas" width="80%">
				<tr>
					<td class="renglones" align="center"><b>Nombre</b></td>
					<td class="renglones" align="center"><b>Documento</b></td>
				</tr>
				<tr>
					<c:if test="${!empty sessionScope.proyecto.listaCoInvestigadores}">
						<c:forEach begin="0" items="${sessionScope.proyecto.listaCoInvestigadores}" var="lista" varStatus="st">
							<tr>					
								<td width="100px" align="center"><c:out value="${lista.nombre}"/> <c:out value="${lista.apellido}"/></td>
								<td width="100px" align="center"><c:out value="${lista.documento}"/></td>															
							</tr>
						</c:forEach>
					</c:if>
				</tr>				
				</table>
			</td>			
		</tr>
		<c:if test="${sessionScope.proyecto.consecContrato!=null && sessionScope.proyecto.consecContrato!=''}">
		<tr>
			<td colspan="4" align="center"><input type="image" src="<c:url value="/comp/img/Enviar.gif"/>"></td>
		</tr>
		</c:if>
	</table>
	</form>
</c:if>
<c:if test="${sessionScope.proyecto==null}">
<br><br><br>
<h4 align="center">No se logró encontrar la información del Proyecto de Investigación</h4>
</c:if>
</body>
</html>