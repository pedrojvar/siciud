<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/general.jsp"/>
<script>
	function buscar(){
		document.filtro.target="lista";
		document.filtro.submit();
	}
	function cambio(id,valor){
		document.getElementById("ar"+id).value=valor;
	}

</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br><br>
	<form name="filtro" method="post" action='<c:url value="/evalArticulos/llenar.jsp"/>'>
	<input type="hidden" name="accion" value="1"/>
	<table align="center">
		<caption>Filtro de Búsqueda</caption>
			<tr>
				<td align="center">
				<table>
					<tr>
						<td class="renglones"><b>En: </b></td>
						<td>
							<select name="categoria">
								<option value="1" <c:if test="${sessionScope.filEvalArtic.categoria==1}">selected</c:if>>Eventos</option>
							</select>
						</td>
						<td>
							<select name="tipo">
								<option value="1" <c:if test="${sessionScope.filEvalArtic.tipo==1}">selected</c:if>>Encuentro G/S</option>
							</select>
						</td>
						<td class="renglones"><b>Año: </b></td>
						<td>
							<select name="ano">
								<option value="2008">2008</option>
								<option value="2009" <c:if test="${sessionScope.filEvalArtic.ano==2009}">selected</c:if>>2009</option>
							</select>
						</td>
						<td colspan="5" align="center"><img src='<c:url value="/comp/img/Buscar.gif"/>' onclick="buscar()"></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
	</form>

	<iframe name="lista" style="border:0;" width="100%" height="75%" >
		<div align="center" style="width:100%;height:580px;overflow:auto;vertical-align:top;">
			<c:import url="/EvalArticulos/EvalArticEvento.x?accion=0"/>
		</div>
	</iframe>
</body>
</html>