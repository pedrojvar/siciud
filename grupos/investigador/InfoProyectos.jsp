<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
</head>
<body>
	<table width="600px" align="center">
		<tr>
			<td class="renglones"><b>Proyectos en evaluación:</b></td>
		</tr>
		<tr>
		<td>
			<p class="texto1j"><b>Si el proyecto se encuentra en evaluación, le sugerimos que por favor esté pendiente de la publicación de resultados de la convocatoria en la que está inscrita la propuesta de investigación.</b></p></td>
		</tr>
		<tr>
			<td class="renglones"><b>Proyectos Aprobados:</b></td>
		</tr>
		<tr>
			<td>
				<p class="texto1j"><b>Para dar inicio al proyecto de investigación que ha sido aprobado, se hace necesario la firma del contrato de investigación respectivo y la solicitud de todos los requerimientos presupuestales correspondientes al proyecto (compra, contratación de personal, etc). Para ello se requiere que el investigador principal del proyecto de investigación se acerque al CIDC a  más tardar la siguiente semana de ser aprobado el proyecto para la firma del contrato de investigación y la entrega de todos los requerimientos presupuestales por parte del investigador en los formatos establecidos para ello y que puede obtener en el menú izquierdo en la opción documentos. Si la firma del contrato no se lleva a cabo en el tiempo mencionado, podrá ser motivo para la no financiación del mismo.</b></p>
			</td>
		</tr>
		<tr>
			<br>
			<br>
			<td class="renglones"><b>Proyectos NO Aprobados:</b></td>
		</tr>
		<tr>
			<td>
				<p class="texto1j"><b>El proyecto de investigación después de superar los procesos de evaluación establecidos en la convocatoria no fue elegido para ser financiado por el centro de investigaciones y desarrollo científico - CIDC. El proyecto podrá ser ajustado, modificado y presentado en las próximas convocatorias del CIDC.<br></b></p>
			</td>
		</tr>
		<tr>
			<td align="center">
			<form action='<c:url value="/invest/gestionInvestig.x"/>'>
				<input type="hidden" name="accion" value="17">
				<input type="image" src='<c:url value="/comp/img/Siguiente.gif"/>'></a>
			</form>
			</td>
		</tr>
	</table>
</body>
</html>
