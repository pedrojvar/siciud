<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<jsp:useBean id="ParametrosOBJ" scope="page" class="cidc.convocatorias.obj.ParametrosOBJ"/>
<c:import url="/general.jsp"/>
</head>
<script>
	var nav4=window.Event ? true : false;

	function soloNumeros(eve){
		var key=nav4?eve.which :eve.keyCode;
		return(key<=13 || (key>=48 && key<=57));
	}
	function guardar(){
		var formulario=document.porcentajes;
		formulario.action='<c:url value="/EvalPropuestas/llenar.jsp"/>';
		formulario.submit();
	}

	function calcular(){
		var suma=0;
		var porcent=parseFloat(document.porcentajes.evaluacionComite.value);
		for(var i=0;i<document.porcentajes.idAspecto.length;i++){
			if(parseInt(document.porcentajes.valAspecto[i].value)<=100){
				suma=suma+parseFloat(document.porcentajes.valAspecto[i].value);
			}else{
				alert("No se debe superar el 100%");
				document.porcentajes.valAspecto[i].value="0";
			}
		}
		var calc=""+(suma/document.porcentajes.idAspecto.length);
		var x=new Number(calc.substring(0,calc.indexOf(".")+3))
		document.getElementById('total').innerHTML=x;
	}


</script>
<body>

	<form method="POST" name="porcentajes"  method="post">
		<input type="hidden" name="prop" value='<c:out value="${requestScope.datos.idPropuesta}"/>'>
		<input type="hidden" name="accion" value="4">
		<input type="hidden" name="evaluacionComite" value='<c:out value="${requestScope.datos.valorPorcentaje}"/>'>

		<table class="tablas" width="80%" align="center">
		<caption>Evaluación Comité de Investigaciones</caption>
			<tr>
				<td class="renglones" colspan="2"><b>Nombre de Convocatoria</b></td>
			</tr>
			<tr>
				<td colspan="2"><c:out value="${requestScope.datos.nombConvocatoria}"/></td>
			</tr>
			<tr>
				<td class="renglones" colspan="2"><b>Nombre de Propuesta</b></td>
			</tr>
			<tr>
				<td colspan="2"><c:out value="${requestScope.datos.nombPropuesta}"/></td>
			</tr>
			<tr>
				<td class="renglones"><b>Valor Porcentaje Evaluación</b></td>
				<td><b><c:out value="${requestScope.datos.valorPorcentaje}"/>%</b></td>
			</tr>
			<tr>
				<td class="renglones"><b>Aspecto</b></td>
				<td class="renglones"><b>Valor</b></td>
			<tr>
			<c:forEach items="${requestScope.datos.listaAspectos}" begin="0" var="lista" varStatus="st">
			<tr>
				<td><input type="hidden" name="idAspecto" value='<c:out value="${lista.idAspecto}"/>'><c:out value="${lista.nombre}"/></td>
				<td><input type="text" style="text-align:right" size="4" name="valAspecto" value="0" onkeyup="calcular()"></td>
			</tr>
			</c:forEach>
			<tr>
				<td class="renglones" align="right"><b>Total:</b></td>
				<td class="renglones" align="right"><b><span id="total">&nbsp;</span></b></td>
			</tr>
			<tr>
				<td align="center">
					<img src="<c:url value="/comp/img/Guardar.gif"/>" onclick="guardar()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>