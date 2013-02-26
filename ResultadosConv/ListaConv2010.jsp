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
		<tr>
			<td class="texto">01-2010</td>
			<td class="texto" width="450px"><p class="parjust">Apoyo permanente a la movilidad nacional o internacional de los investigadores  docentes de la Universidad Distrital Francisco José de Caldas</p></td>
			<td width="155px">
				<table width="100%">
					<tr><td class="texto">21 Marzo 2010</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,1,1,2010)"></td></tr>
					<tr><td class="texto">2 Mayo 2010</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,1,2,2010)"></td></tr>
					<tr><td class="texto">6 Junio 2010</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,1,3,2010)"></td></tr>
					<tr><td class="texto">25 Julio 2010</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,1,4,2010)"></td></tr>
					<tr><td class="texto">22 Agosto 2010</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,1,5,2010)"></td></tr>
					<tr><td class="texto">3 Octubre 2010</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,1,6,2010)"></td></tr>
				</table>
			</td>
		</tr>
		<tr class="trb">
			<td class="texto">02-2010</td>
			<td class="texto" width="450px"><p class="parjust">Apoyo permanente a la movilidad nacional o internacional de los investigadores de la Universidad Distrital Francisco José de Caldas</p></td>
			<td width="155px">
				<table width="100%">
					<tr><td class="texto">21 Marzo 2010</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,2,1,2010)"></td></tr>
					<tr><td class="texto">2 Mayo 2010</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,2,2,2010)"></td></tr>
					<tr><td class="texto">6 Junio 2010</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,2,3,2010)"></td></tr>
					<tr><td class="texto">25 Julio 2010</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,2,4,2010)"></td></tr>
					<tr><td class="texto">22 Agosto 2010</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,2,5,2010)"></td></tr>
					<tr><td class="texto">3 Octubre 2010</td><td><img border="0" src='<c:url value="/comp/img/VerProy.gif" />' onclick="ver(1,2,6,2010)"></td></tr>
				</table>
			</td>
		</tr>

	</table>
</form>
</body>
</html>
