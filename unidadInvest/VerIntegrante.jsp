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

	function deshabilitar(){
		for(var i=2;i<18;i++){
			document.nuevo.elements[i].disabled=true;
		}
		alert("Este integrante está desvinculado del grupo actualmente");
	}

</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
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
		<table class="tablas" align="center" >
		<caption>Información Integrante</caption>
			<tr>
				<td>
					<table>
						<tr>
							<td colspan="2" class="renglones"><b>Facultad:</b></td>
							<td colspan="2">
								<select disabled="disabled" id="control1" style="width:135px" name="facultad" onchange="ajaxProyecto(this)" >
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
								<select disabled="disabled"  name="papel">
									<option value="0">----------</option>
									<option value="3" <c:if test="${sessionScope.integrante.papel==10}">selected</c:if> >Egresado</option>
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
								<c:forEach begin="0" items="${requestScope.ajaxProyCur}" var="proy">
								<c:if test="${sessionScope.integrante.idProyectoCurr==proy.codigo}">
									<c:out value="${proy.nombre}"/>
								</c:if>
								</c:forEach>
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
										<td><c:out value="${sessionScope.integrante.nombres}"/></td>
										<td><c:out value="${sessionScope.integrante.apellidos}"/></td>
										<td><c:out value="${sessionScope.integrante.codigoUd}"/></td>
									</tr>
									<tr>
										<td class="renglones"><b>Teléfono:</b></td>
										<td class="renglones"><b>Celular:</b></td>
										<td class="renglones"><b>e-mail:</b></td>
									</tr>
									<tr>
										<td><c:out value="${sessionScope.integrante.telefono}"/></td>
										<td><c:out value="${sessionScope.integrante.celular}"/></td>
										<td><c:out value="${sessionScope.integrante.mail}"/></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<table width="100%">
									<tr>
										<td class="renglones"><b>Fecha de Vinculación</b></td>
										<td>
											<c:out value="${sessionScope.integrante.fechaVinculacion}"/>
										</td>
										<td class="renglones"><b>Fecha de Salida</b></td>
										<td>
											<c:out value="${sessionScope.integrante.fechaSalida}"/>
										</td>
									</tr>
								</table>
							</td>

							</tr>
						<tr>
							<td class="renglones" colspan="6"><b>Documento:</b></td>
						</tr>
						<tr>
							<td class="renglones"><b>Tipo:</b></td>
							<td width="60px"><select name="tipoCed" disabled="disabled" >
									<option value="0">----</option>
									<option value="1" <c:if test="${sessionScope.integrante.tipoCed==1}">selected</c:if> >T.I.</option>
									<option value="2" <c:if test="${sessionScope.integrante.tipoCed==2}">selected</c:if> >C.C</option>
									<option value="3" <c:if test="${sessionScope.integrante.tipoCed==3}">selected</c:if> >C.E</option>
								</select></td>
							<td width="10px" class="renglones"><b>#</b></td>
							<td><c:out value="${sessionScope.integrante.cedula}"/></td>
							<td class="renglones"><b>de:</b></td>
							<td><c:out value="${sessionScope.integrante.deCed}"/></td>
						</tr>
						<tr>
							<td colspan="6" class="renglones"><b>Link a CvLac</b></td>
						</tr>

						<c:if test="${sessionScope.integrante.cvLac!=null}">
						<tr id="cvl2">
							<td colspan="5"><A href='<c:out value="${sessionScope.integrante.cvLac}"/>' target="_new">Click aqui para validar Link de CvLac almacenado</A></td>
						</tr>
						</c:if>
				</table>
				<br>

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
</html>