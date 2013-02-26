<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<c:import url="/general.jsp"/>
<head>
<script type="text/javascript">
	function ver(acc,convoc,crt,an){
		document.lista.accion.value=acc;
		document.lista.ano.value=an;
		document.lista.conv.value=convoc;
		document.lista.corte.value=crt;
		document.lista.submit();
	}

</script>
</head>
<body>
<br><br>

<form name="lista" action='<c:url value="/Resultados/Convocatorias/AdminResConv.x" />' method="post">
	<input type="hidden" name="accion" value="0">
	<input type="hidden" name="conv" value="0">
	<input type="hidden" name="ano" value="0">
	<input type="hidden" name="corte" value="0">
	<table align="center" class="tablas" >
		<caption>Resultados</caption>
		<tr >
			<th><b>Número</b></th>
			<th width="300px"><b>Nombre Convocatoria</b></th>
			<th width="155px"><b>Cortes</b></th>
		</tr>
		<tr class="trb">
			<td class="texto">01-2011</td>
			<td class="texto" width="450px"><p class="parjust">Financiación de Proyectos presentados por Grupos de Investigación Institucionalizados en el Sistema de Investigaciones de la Universidad Distrital Francisco José de Caldas, Registrados en SCIENTI y No Clasificados en SNCTI"<p></td>
			<td width="155px">
				<table width="100%">
					<tr><td class="texto">4 Abril 2011</td><td align="center"><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(3,1,1,2011)"></td></tr>
				</table>
			</td>
		</tr>
	  	<tr>
			<td class="texto">02-2011</td>
			<td class="texto" width="450px"><p class="parjust">Financiación de Proyectos de Investigación presentados por Grupos de Investigación Institucionalizados en la Universidad Distrital Francisco José de Caldas y clasificados en COLCIENCIAS<p></td>
			<td width="155px">
				<table width="100%">
					<tr><td class="texto">4 Abril 2011</td><td align="center"><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(3,2,1,2011)"></td></tr>
				</table>
			</td>
		</tr>
		<tr  class="trb">
			<td class="texto">03-2011</td>
			<td class="texto" width="450px"><p class="parjust">Financiación de Proyectos de Investigación presentados por alianzas de Grupos de Investigación Institucionalizados en el Sistema de Investigaciones de la Universidad Distrital Francisco José de Caldas, Registrados en SCIENTI o clasificados en el SNCTI<p></td>
			<td width="155px">
				<table width="100%">
					<tr><td class="texto">15 Abril 2011</td><td align="center"><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(3,3,1,2011)"></td></tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="texto">04-2011</td>
			<td class="texto" width="450px"><p class="parjust">Apoyo permanente para la socialización, divulgación y difusión de resultados de investigación o creación alcanzados por ESTUDIANTES que se encuentren registrados en el sistema de investigaciones de la Universidad Distrital Francisco José de Caldas y a ser presentados en eventos académicos, científicos, artísticos o culturales nacionales o internacionales</p></td>
			<td width="155px">
				<table width="100%">
					<tr class="trb"><td class="texto">20 Marzo 2011</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,4,1,2011)"></td></tr>
					<tr ><td class="texto">01 Mayo 2011</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,4,2,2011)"></td></tr>
					<tr class="trb"><td class="texto">05 Junio 2011</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,4,3,2011)"></td></tr>
			 		<tr ><td class="texto">24 Julio 2011</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,4,4,2011)"></td></tr> 
					<tr class="trb"><td class="texto">21 Agosto 2011</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,4,5,2011)"></td></tr> 
					<tr ><td class="texto">02 Octubre 2011</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,4,6,2011)"></td></tr> 
				</table>
			</td>
		</tr>
		<tr class="trb">
			<td class="texto">05-2011</td>
			<td class="texto" width="450px"><p class="parjust">Apoyo permanente para la socialización, divulgación y difusión de resultados de investigación o creación alcanzados por PROFESORES que se encuentren registrados en el sistema de investigaciones de la Universidad Distrital Francisco José de Caldas a ser presentados en eventos académicos, científicos, artísticos y culturales nacionales o internacionales</p></td>
			<td width="155px" style="background: #FFFFFF;">
				<table width="100%">
					<tr ><td class="texto">20 Marzo 2011</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,5,1,2011)"></td></tr>
					<tr class="trb"><td class="texto">01 Mayo 2011</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,5,2,2011)"></td></tr>
					<tr><td class="texto">05 Junio 2011</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,5,3,2011)"></td></tr>
					<tr class="trb"><td class="texto">24 Julio 2011</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,5,4,2011)"></td></tr>
					<tr><td class="texto">21 Agosto 2011</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,5,5,2011)"></td></tr>
					<tr class="trb"><td class="texto">02 Octubre 2011</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,5,6,2011)"></td></tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="texto">06-2011</td>
			<td class="texto" width="450px"><p class="parjust">Financiación de Proyectos de Investigación presentados por Semilleros de Investigación institucionalizados en la Universidad Distrital y registrados en el Sistema de Información del CIDC - SICIUD<p></td>
			<td width="155px">
				<table width="100%">
					<tr><td class="texto">5 Mayo 2011</td><td align="center"><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(3,6,1,2011)"></td></tr>
				</table>
			</td>
		</tr>
<tr class="trb">
			<td class="texto">07-2011</td>
			<td class="texto" width="450px"><p class="parjust">Apoyo a los programas de Doctorado de la Universidad Distrital Francisco José de Caldas<p></td>
			<td width="155px">
				<table width="100%">
					<tr><td class="texto">8 Agosto 2011</td><td align="center"><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(3,7,1,2011)"></td></tr>
				</table>
			</td>
		</tr>
		
		<tr class="trb">
			<td class="texto">08-2011</td>
			<td class="texto" width="450px"><p class="parjust">Apoyo permanente para la socialización, divulgación y difusión de resultados de investigación o creación alcanzados por PROFESORES que se encuentren registrados en el sistema de investigaciones de la Universidad Distrital Francisco José de Caldas a ser presentados en eventos académicos, científicos, artísticos y culturales nacionales o internacionales<p></td>
			<td width="155px">
				<table width="100%">
					<tr class="trb"><td class="texto">30 Noviembre 2011</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,5,7,2011)"></td></tr>
				</table>
			</td>
		</tr>
		
		<tr class="trb">
			<td class="texto">09-2011</td>
			<td class="texto" width="450px"><p class="parjust">Apoyo a las investigaciones a desarrollarse mediante Tesis Doctorales en la Universidad Distrital Francisco José de Caldas<p></td>
			<td width="155px">
				<table width="100%">
					<tr><td class="texto">5 Diciembre 2011</td><td align="center"><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(3,9,1,2011)"></td></tr>
				</table>
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>
