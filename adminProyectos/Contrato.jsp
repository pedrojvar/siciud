<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" type="time" timeStyle="short" pattern="yyyy-mm-dd" var="hoy"/>
<c:import url="/general.jsp"/>
<script>

	function gestorAdmin(flaggestor){		
		if(document.contrato.flaggestor.checked){
			document.contrato.gestorfinanciero.value="true";
			document.contrato.gestor.disabled=false;
			document.contrato.cedulaGestor.disabled=false;
			document.contrato.cedulaGestorDe.disabled=false;
			document.contrato.realizador.disabled=false;
			document.contrato.cedulaRealizador.disabled=false;
			document.contrato.cedulaRealizadorDe.disabled=false;					
		}
		else{
			document.contrato.gestorfinanciero.value="false";
			document.contrato.gestor.disabled=true;
			document.contrato.gestor.value="";
			document.contrato.cedulaGestor.disabled=true;
			document.contrato.cedulaGestor.value="";
			document.contrato.cedulaGestorDe.disabled=true;
			document.contrato.cedulaGestorDe.value="";
			document.contrato.realizador.disabled=true;
			document.contrato.realizador.value="";
			document.contrato.cedulaRealizador.disabled=true;
			document.contrato.cedulaRealizador.value="";
			document.contrato.cedulaRealizadorDe.disabled=true;
			document.contrato.cedulaRealizadorDe.value="";
		}
							
	}
	function direc(nombre){
		document.getElementById('nombre').innerHTML=nombre;
	}
	function ver(accion){
		document.comandos.accion.value=accion;
		document.comandos.submit();
	}
	
	function guardar(){		
		if(validar()){			
			document.estudiantes.action="<c:url value="/adminProyectos/llenarInvestigador.jsp"/>";
			document.estudiantes.submit();
		}		
	}
	function validar(){
		mensaje="";
		if(document.estudiantes.nombre.value==""){
			mensaje=mensaje+"\n-) Ingrese el Nombre del investigador";
		}		
		if(document.estudiantes.apellido.value==""){
			mensaje=mensaje+"\n-) Ingrese el apellido del investigador";
		}	
		if(document.estudiantes.codigo.value==""){
			mensaje=mensaje+"\n-) Ingrese el código del investigador";
		}		
		if(document.estudiantes.documento.value==""){
			mensaje=mensaje+"\n-) Ingrese el documento del investigador";
		}
		if(document.estudiantes.proyectocurricular.selectedIndex==0){
			mensaje=mensaje+"\n-) Seleccione un proyecto de investigación.";
		}
		if(mensaje!=""){
			mensaje="Los siguientes campos son obligatorios: "+mensaje;
			alert (mensaje);
		}				
		else
			return true;
		return false;		
	}
	function enviar(id,accion,cont){
		document.estudiantes.accion.value=accion;
		document.estudiantes.id.value=id;
		document.estudiantes.submit();
	}
	
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<c:if test="${sessionScope.proyecto!=null}">
	<form name="comandos" method="post" action='<c:url value="/GestionGeneralProyectos/AdminGeneralProyectos.x"/>'>
		<input type="hidden" name="accion" value="0"/>
		<input type="hidden" name="id" value='<c:out value="${sessionScope.proyecto.id}"/>'/>
	</form>
	<br>
	<form name="contrato" action='<c:url value="/adminProyectos/llenar1.jsp"/>' method="post">
	<input type="hidden" name="accion" value="2">
	<input type="hidden" name="id" value='<c:out value="${sessionScope.proyecto.id}"/>'/>
	<input type="hidden" name="gestorfinanciero" value="false"/>
	<table class="tablas" align="center" width="60%">	
	<CAPTION>Creación contrato de investigación</CAPTION>
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
			<td colspan="4" class="renglones"><b>Nombre Director Proyecto</b></td>
		</tr>
		<tr>
			<td width="200px" class="renglones"><b>Director del Proyecto de Grado/Investigador Principal</b></td>
			<td colspan="3"><input type="text" name="director" size="15" style="width: 45%" value='<c:out value="${sessionScope.proyecto.director}" />'></td>
		</tr>
		<tr>
			<td width="200px" class="renglones"><b>Cedula Director del Proyecto</b></td>
			<td colspan="4"><input type="text" name="cedulaDir" size="15" style="width: 45%" value='<c:out value="${sessionScope.proyecto.cedulaDir}"/>'> de <input type="text" name="cedulaDirDe" size="15" style="width: 45%" value='<c:out value="${sessionScope.proyecto.cedulaDirDe}"/>'></td>
		</tr>			
			<tr>
				<td colspan="4" class="renglones"><b>Tutor del proyecto (Solo Si es convocatoria #12)</b></td>
			</tr>
			<tr>
				<td width="200px" class="renglones"><b>Tutor del proyecto de investigación</b></td>
				<td colspan="3"><input type="text" name="tutor" size="15" style="width: 45%" value='<c:out value="${sessionScope.proyecto.tutor}" />'></td>
			</tr>
			<tr>
				<td width="200px" class="renglones"><b>Cedula Tutor del Proyecto</b></td>
				<td colspan="4"><input type="text" name="cedulaTutor" size="15" style="width: 45%" value='<c:out value="${sessionScope.proyecto.cedulaTutor}"/>'> de <input type="text" name="cedulaTutorDe" size="15" style="width: 45%" value='<c:out value="${sessionScope.proyecto.cedulaTutorDe}"/>'></td>
			</tr>						
		<tr>
			<td colspan="4" class="renglones"><b>Realizador de Proyecto</b></td>
		</tr>
		<tr>
			<td width="200px" class="renglones"><b>Nombre del Realizador del Proyecto</b></td>
			<td colspan="3"><input type="text" name="realizador" size="15" style="width: 45%" disabled value='<c:out value="${sessionScope.proyecto.realizador}" />' disabled></td>
		</tr>		
		<tr>
			<td width="200px" class="renglones"><b>Cédula del Realizador</b></td>
			<td colspan="4"><input type="text" name="cedulaRealizador" size="15" style="width: 45%" disabled value='<c:out value="${sessionScope.proyecto.cedulaRealizador}" />'> de <input type="text" name="cedulaRealizadorDe" size="15" style="width: 45%" disabled value='<c:out value="${sessionScope.proyecto.cedulaRealizadorDe}" />'></td>
		</tr>
		<tr>
			<td colspan="4" class="renglones"><b>Nombre Gestor Administrativo</b></td>
		</tr>
		<tr>
			<td width="200px" class="renglones"><b>Gestor Financiero del Proyecto</b></td>
			<td colspan="3"><input type="text" name="gestor" size="15" style="width: 45%" disabled value='<c:out value="${sessionScope.proyecto.gestor}" />' disabled></td>
		</tr>		
		<tr>
			<td width="200px" class="renglones"><b>Cédula del Gestor Administrativo</b></td>
			<td colspan="4"><input type="text" name="cedulaGestor" size="15" style="width: 45%" disabled value='<c:out value="${sessionScope.proyecto.cedulaGestor}" />'> de <input type="text" name="cedulaGestorDe" size="15" style="width: 45%" disabled value='<c:out value="${sessionScope.proyecto.cedulaGestorDe}" />'></td>
		</tr>
		
		<tr>
			<td colspan="4" class="renglones"><b>Datos generales del proyecto</b></td>
		</tr>
		<tr>
			<td class="renglones"><b>Duración del Proyecto</b></td>
			<td class="renglones" width="30px">Total: <c:out value="${sessionScope.proyecto.duracion}" /></td>			
			<td><input type="text" style="width: 70%" name="duracionLetras" size="8"> Meses</td>
		</tr>
		<tr>
			<td class="renglones"><b>Valor Proyecto</b></td>
			<td><c:out value="${sessionScope.proyecto.valor}" /></td>
			<td colspan="2"><input type="text" name="valorLetras"></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Fecha Aprobación</b></td>
			<td width="50px"><input type="text" size="15" name="fecActa" value='<c:out value="${sessionScope.proyecto.fecAprobacion}"/>'></td>
			<td class="renglones" width="50px"><b>Acta N°</b></td>
			<td width="150px"><input type="text" name="sesion" size="4"></td>
		</tr>
		<tr>
			<td class="renglones" width="150px"><b>Fecha Impresión</b></td>
			<td width="50px"><input type="text" size="15" name="fecContrato" value='<c:out value="${sessionScope.proyecto.fecContrato}"/>'></td>
		</tr>		
		<tr>
			<td colspan="4" align="center"><input type="image" src="<c:url value="/comp/img/Enviar.gif"/>"></td>
		</tr>
	</table>
	</form>
	<table class="tablas" align="center" width="60%">
		<tr>
			<td colspan="4" align="center" >
			<form method="post" action='<c:url value="/adminProyectos/llenarInvestigador.jsp"/>' name="estudiantes">
			<input type="hidden" name="accion" value="19">
			<input type="hidden" name="id" value="">
			<input type="hidden" name="papel" value="Coinvestigador">
			<input type="hidden" name="desde" value="contrato">
				<table class="tablas" width="100%">				
					<caption>Estudiantes Realizadores/Asociados</caption>			
					<tr>
						<td class="renglones" align="center"><b>Nombre</b></td>
						<td class="renglones" align="center"><b>Apellido</b></td>
						<td class="renglones" align="center"><b>Código</b></td>
						<td class="renglones" align="center"><b>Cedula</b></td>
						<td class="renglones" align="center"><b>Proyecto Curricular</b></td>						
						<td class="renglones" align="center"><b>Acción</b></td>
					</tr>
					<c:if test="${!empty sessionScope.proyecto.listaCoInvestigadores}">
						<c:forEach begin="0" items="${sessionScope.proyecto.listaCoInvestigadores}" var="lista" varStatus="st">
							<tr>					
								<td width="100px" align="center"><c:out value="${lista.nombre}"/></td>
								<td align="center"><c:out value="${lista.apellido}"/></td>
								<td width="100px" align="center"><c:out value="${lista.codigo}"/></td>
								<td width="100px" align="center"><c:out value="${lista.documento}"/></td>
								<td width="100px" align="center"><c:out value="${lista.proyectocnombre}"/></td>
								<td width="5px" align="center"><img src='<c:url value="/comp/img/equis2.png"/>' onclick='enviar(<c:out value="${lista.id}"/>,20)'></td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<td><input type="text" name="nombre"></td>
						<td><input type="text" name="apellido"></td>
						<td><input type="text" name="codigo"></td>
						<td><input type="text" name="documento"></td>
						<td>
						<select name="proyectocurricular">							
							<c:forEach begin="0" items="${sessionScope.proyectocurricular}" var="lista" varStatus="st">
								<option value="<c:out value="${lista.codigo}"/>"><c:out value="${lista.nombre}"/></option>						
							</c:forEach>
						</select>									
						</td>
					</tr>	
					<tr>
						<td colspan="5" align="center">
							<img src='<c:url value="/comp/img/Guardar.gif"/>' onclick='guardar()'>							
						</td>
					</tr>
				</table>
			</form>		
			</td>
		</tr>	
	</table>
</c:if>
<c:if test="${sessionScope.proyecto==null}">
<br><br><br>
<h4 align="center">No se logró encontrar la información del Proyecto de Investigación</h4>
</c:if>
</body>
</html>