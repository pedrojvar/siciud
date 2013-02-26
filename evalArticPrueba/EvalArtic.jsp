<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<jsp:useBean id="ParametrosOBJ" scope="page" class="cidc.convocatorias.obj.ParametrosOBJ"/>
<c:import url="/general.jsp"/>
</head>
<script>

	function guardar(){
		var formulario=document.evaluacion;
		formulario.action='<c:url value="/evalArticPrueba/llenar.jsp"/>';
		formulario.submit();
	}

	function cambia(id, val){
		document.getElementById("p"+id).value=val;
	}

</script>
<body>
<br>
	<form method="POST" name="evaluacion"  method="post">
		<input type="hidden" name="idArtic" value='<c:out value="${requestScope.datos.idArtic}"/>'>
		<input type="hidden" name="accion" value="2">
		<input type="hidden" name="pr1" value="" id="p1">
		<input type="hidden" name="pr2" value="" id="p2">
		<input type="hidden" name="pr3" value="" id="p3">
		<input type="hidden" name="pr4" value="" id="p4">
		<input type="hidden" name="pr5" value="" id="p5">
		<input type="hidden" name="pr6" value="" id="p6">
		<input type="hidden" name="pr7" value="" id="p7">


		<table class="tablas" width="70%" align="center">
			<tr>
				<td width="70px" class="renglones"><b>Artículo:</b></td>
				<td><c:out value="${requestScope.datos.nombArtic}"/></td>
			<tr>
			<tr>
				<td width="70px" class="renglones"><b>Evaluador:</b></td>
				<td><c:out value="${requestScope.datos.nombEval}"/></td>
			<tr>

		</table>
		<table class="tablas" width="70%" align="center">
			<caption>Forumario de Evaluación</caption>
			<tr>
				<td colspan="3" class="renglones"><b>1. Pertinencia del trabajo con los propósitos del V Congreso:</b></td>
			</tr>
			<tr>
				<td><input type="radio" name="a" value="1" onclick="cambia(1,1)">Buena</td>
				<td><input type="radio" name="a" value="2" onclick="cambia(1,2)">Aceptable</td>
				<td><input type="radio" name="a" value="3" onclick="cambia(1,3)">Escasa</td>
			</tr>
			<tr>
				<td colspan="3" class="renglones"><b>2. Interés del tema:</b></td>
			</tr>
			<tr>
				<td><input type="radio" name="b" value="1" onclick="cambia(2,1)">Buena</td>
				<td><input type="radio" name="b" value="2" onclick="cambia(2,2)">Aceptable</td>
				<td><input type="radio" name="b" value="3" onclick="cambia(2,3)">Escasa</td>
			</tr>
			<tr>
				<td colspan="3" class="renglones"><b>3. Calidad académica del trabajo:</b></td>
			</tr>
			<tr>
				<td><input type="radio" name="c" value="1" onclick="cambia(3,1)">Buena</td>
				<td><input type="radio" name="c" value="2" onclick="cambia(3,2)">Aceptable</td>
				<td><input type="radio" name="c" value="3" onclick="cambia(3,3)">Escasa</td>
			</tr>
			<tr>
				<td colspan="3" class="renglones"><b>4. Resultados y contribuciones al  desarrollo de conocimiento científico-tecnológico:</b></td>
			</tr>
			<tr>
				<td><input type="radio" name="d" value="1" onclick="cambia(4,1)">Buena</td>
				<td><input type="radio" name="d" value="2" onclick="cambia(4,2)">Aceptable</td>
				<td><input type="radio" name="d" value="3" onclick="cambia(4,3)">Escasa</td>
			</tr>
			<tr>
				<td colspan="3" class="renglones"><b>5. Impresión global:</b></td>
			</tr>
			<tr>
				<td><input type="radio" name="e" value="1" onclick="cambia(5,1)">Buena</td>
				<td><input type="radio" name="e" value="2" onclick="cambia(5,2)">Aceptable</td>
				<td><input type="radio" name="e" value="3" onclick="cambia(5,3)">Escasa</td>
			</tr>
			<tr>
				<td colspan="3" class="renglones"><b>6. Tipo de presentación recomendada:</b></td>
			</tr>
			<tr>
				<td><input type="radio" name="f" value="1" onclick="cambia(6,1)">Buena</td>
				<td><input type="radio" name="f" value="2" onclick="cambia(6,2)">Aceptable</td>
				<td><input type="radio" name="f" value="3" onclick="cambia(6,3)">Escasa</td>
			</tr>
			<tr>
				<td colspan="3" class="renglones"><b>7. Seleccione la opción más pertinente para este trabajo:</b></td>
			</tr>
			<tr>
				<td><input type="radio" name="g" value="1" onclick="cambia(7,1)">Buena</td>
				<td><input type="radio" name="g" value="2" onclick="cambia(7,2)">Aceptable</td>
				<td><input type="radio" name="g" value="3" onclick="cambia(7,3)">Escasa</td>
			</tr>
			<tr>
				<td colspan="3" class="renglones"><b>Recomendaciones y comentarios adicionales</b></td>
			</tr>
			<tr>
				<td colspan="3"><textarea name="observ" style="width:100%" class="area"></textarea></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="button" value="enviar" onclick="guardar()"></td>
			</tr>
		</table>
	</form>
</body>
</html>