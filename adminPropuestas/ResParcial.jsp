<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
<script>
	function guardar(){
		document.respuestaParci.action='<c:url value="/adminPropuestas/EstadoPropuesta.x"/>';
		if(document.respuestaParci.idResultado.value=="0")
			document.respuestaParci.accion.value="14";
		else
			document.respuestaParci.accion.value="15";
		document.respuestaParci.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<form name="respuestaParci">
	<input type="hidden" name="idResultado" value='<c:out value="${requestScope.parcial.idResultado}" default="0"/>'>
	<input type="hidden" name="accion" value='0'>
	<input type="hidden" name="prop" value='<c:out value="${requestScope.parcial.idPropuesta}"/>'>
	<table width="600px" class="tablas" align="center">
	<caption>Información General</caption>
		<tr>
			<td width="50px" class="renglones"><b># Rad</b></td>
			<td width="30px" class="texto"><input name="radicado" type="text" value='<c:out value="${requestScope.parcial.radicado}"/>' size="4"></td>
			<td width="50px" class="renglones"><b>Corte</b></td>
			<td width="30px" class="texto">
				<select name="corte">
					<option value="0">--</option>
					<option value="1" <c:if test="${requestScope.parcial.corte==1}">selected</c:if>>1</option>
					<option value="2" <c:if test="${requestScope.parcial.corte==2}">selected</c:if>>2</option>
					<option value="3" <c:if test="${requestScope.parcial.corte==3}">selected</c:if>>3</option>
					<option value="4" <c:if test="${requestScope.parcial.corte==4}">selected</c:if>>4</option>
					<option value="5" <c:if test="${requestScope.parcial.corte==5}">selected</c:if>>5</option>
				</select>
			</td>
			<td width="60px" class="renglones"><b>Director</b></td>
			<td class="texto"><c:out value="${requestScope.parcial.director}"/></td>
		</tr>
		<tr>
			<td colspan="6" class="renglones"><b>Nombre Proyecto</b></td>
		</tr>
		<tr>
			<td colspan="6" class="texto"><c:out value="${requestScope.parcial.propuesta}"/></td>
		</tr>
		<tr>
			<td colspan="6">
				<table width="100%">
					<tr>
						<td width="220px" colspan="3" class="renglones"><b>Investigador Principal</b></td>
						<td colspan="3" class="renglones"><b>Co-Investigadores</b></td>
					</tr>
					<tr>
						<td width="220px" colspan="3" class="texto" valign="top"><c:out value="${requestScope.parcial.director}"/></td>
						<td colspan="3" class="texto" valign="top">
							<table>
								<c:forEach items="${requestScope.parcial.listaCoInvest}" var="coInvest" varStatus="st">
									<tr><td class="texto"><c:out value="${coInvest.nombres}" /><c:out value="${coInvest.apellidos}" /></td></tr>
								</c:forEach>
							</table>
						</td>
					</tr>
				</table>
			</td>
		<tr>
			<td colspan="2" class="renglones"><b>T. Ejecución</b></td>
			<td colspan="4" class="renglones"><b>Grupo de Investigación</b></td>
		</tr>
		<tr>
			<td align="center" colspan="2" class="texto"><c:out value="${requestScope.parcial.duracion}"/> meses</td>
			<td colspan="4" class="texto"><c:out value="${requestScope.parcial.grupo}"/></td>
		</tr>
		<tr>
			<td colspan="6">
				<table width="100%">
					<tr>
						<td width="100px" class="renglones"><b>Productos</b></td>
						<td width="100px" class="texto"></td>
						<td width="150px" class="renglones"><b>e-mail de Contacto</b></td>
						<td class="texto"><c:out value="${requestScope.parcial.mail}" default="&nbsp;"/></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="6" class="renglones"><b>Observaciones Generales</b></td>
		</tr>
		<tr>
			<td class="texto" colspan="6">
				<textarea name="observaciones" style="width:100%" rows="3"><c:out value="${requestScope.parcial.observaciones}"/></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="6" align="center" class="renglones"><b>Presupuesto (Valores en Pesos)</b></td>
		</tr>
		<tr>
			<td colspan="6">
				<table border="1" align="center" width="50%">
					<tr>
						<td align="center" class="renglones"><b>CIDC</b></td>
						<td align="center" class="renglones"><b>UD</b></td>
						<td align="center" class="renglones"><b>C.Partida</b></td>
						<td align="center" class="renglones"><b>Total</b></td>
					</tr>
					<tr>
						<td class="textor">$ <c:out value="${requestScope.parcial.presCIDC}"/></td>
						<td class="textor">$ <c:out value="${requestScope.parcial.presUD}"/></td>
						<td class="textor">$ <c:out value="${requestScope.parcial.presCONTRA}"/></td>
						<td class="textor">$ <c:out value="${requestScope.parcial.presTotal}"/></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>

			<td colspan="6" align="center"><img src='<c:url value="/comp/img/Guardar.gif" />' onclick="guardar()"></td>
		</tr>
	</table>

	</form>
</body>
</html>