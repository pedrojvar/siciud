<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<c:import url="/general.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<br>
	<div align="center">
	<form action="<c:url value="/Resultados/Convocatorias/AdminResConv.x" />">
		<input type="hidden" name="accion" value='1'>
		<input type="hidden" name="corte" value='<c:out value="${requestScope.corte}" />'>
		<input type="hidden" name="ano" value='<c:out value="${requestScope.ano}" />'>
		<input type="hidden" name="conv" value='<c:out value="${requestScope.conv}" />'>
		<input type="image" src='<c:url value="/comp/img/Atras.gif" />'>
	</form>
	</div>
	<br>
	<table width="600px" class="tablas" align="center">
	<caption>Información General</caption>
		<tr>
			<td width="140px" class="renglones"><b>Nombre del Presentador</b></td>
			<td class="texto"><c:out value="${requestScope.Result.nombrePonente}"/></td>
		</tr>
				<tr>
					<td colspan="3">
						<table width="100%">
							<tr>
								<td class="renglones"><b>Nombre de la Ponencia</b></td>								
							</tr>
							<tr>
								<td align="center" class="texto"><c:out value="${requestScope.Result.nombrePonencia}"/></td>
							</tr>
						</table>
					</td>
				</tr>

					<tr>
						<td width="50%" class="renglones"><b>Fecha Evento</b></td>
						<td class="renglones"><b>Grupo de Investigación</b></td>
					</tr>
					<tr>
						<td width="50%" align="center" class="texto"><c:out value="${requestScope.Result.fechaEventoInicio} - ${requestScope.Result.fechaEventoFin}"/></td>
						<td class="texto"><c:out value="${requestScope.Result.grupoInvestigacion}"/></td>
					</tr>
					<tr>
						<td width="50%" class="renglones"><b>Evento al que asiste</b></td>
						<td class="renglones"><b>Organizador del Evento</b></td>
					</tr>
					<tr>
						<td width="50%" align="center" class="texto"><c:out value="${requestScope.Result.evento}"/></td>
						<td class="texto"><c:out value="${requestScope.Result.organizadorEvento}"/></td>
					</tr>
					<tr>

						<td width="50%" class="renglones"><b>Pais</b></td>
						<td class="renglones"><b>Puntaje</b></td>
					</tr>
					<tr>

						<td width="50%" class="texto"><c:out value="${requestScope.Result.pais}"/></td>
						<td align="center" class="texto"><c:out value="${requestScope.Result.puntaje}"/></td>
					</tr>

		<tr>
			<td colspan="6" class="renglones"><b>Observaciones Generales</b></td>
		</tr>
		<c:if test="${requestScope.Result.observaciones!=''}">
			<tr>
				<td class="texto" colspan="6"><c:out value="${requestScope.Result.observaciones}" default="Ninguna"/></td>
			</tr>
		</c:if>
		<c:if test="${requestScope.Result.observaciones==''}">
			<tr>
				<td class="texto" colspan="6">Ninguna</td>
			</tr>
		</c:if>
	</table>
</body>
</html>