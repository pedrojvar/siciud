<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/general.jsp"/>
<script>
	var nav4=window.Event ? true : false;

	function soloNumeros(eve){
		var key=nav4?eve.which :eve.keyCode;
		return((key>=48 && key<=57) || key==46 || key==13 || key==7 || key==8);
	//	return(key<=46 ||key<=13 || (key>=48 && key<=57));
	}

	function ir(){
		var obs=0, val=0;
		var msg="";
		if(document.evalua.observaciones.length){
			for(var i=0;i<document.evalua.observaciones.length;i++)
				if(document.evalua.observaciones[i].value=="" || document.evalua.observaciones[i].value==" " ){
					obs=1;
					msg="-) Favor incluir observaciones en cada uno de los criterios de evaluación \n";
					break;
				}
		}else{
				if(document.evalua.observaciones.value=="" || document.evalua.observaciones.value==" " ){
					obs=1;
					msg="-) Favor incluir observaciones en cada uno de los criterios de evaluación \n";
				}
		}
		if(document.evalua.valAspecto.length){
			for(var i=0;i<document.evalua.valAspecto.length;i++){
				if(document.evalua.valAspecto[i].value==""){
					val=1;
					msg=msg+"-) Favor dar un valor a cada uno de los aspectos de evaluación";
					break;
				}
			}
		}else
			if(document.evalua.valAspecto.value==""){
					val=1;
					msg=msg+"-) Favor dar un valor a cada uno de los aspectos de evaluación";
				}
		if(obs==1 || val==1)
			alert(msg);
		else
			document.evalua.submit();

	}
	function validar(caja,valor){
		var c=parseFloat(caja.value);
		var v=parseFloat(valor);
		if(isNaN(c)){
			if(caja.value!="")
				alert("Número no válido");
		}else{
			if(c>v){
				alert("El valor no debe ser superior a "+v);
				caja.value="";
			}
		}
	}
</script>
</head>
<body>
<br>
<c:if test="${!empty requestScope.datos.criterios}">
<h3 align="center" class="lroja3">Favor llenar este formulario usando el navegador mozilla y una vez tenga definidos los valores y observaciones que desea ingresar</h3>
<form action='<c:url value="/EvalPropuestas/llenar.jsp"/>' method="post" name="evalua">
	<input type="hidden" name="accion" value="2">
	<input type="hidden" name="prop" value='<c:out value="${requestScope.datos.idPropuesta}"/>'>
	<c:forEach begin="0" items="${requestScope.datos.criterios}" var="criterio">
	<input type="hidden" name="idCriterio" value='<c:out value="${criterio.idCriterio}"/>'>
	<table class="tablas" align="center">
		<caption>Criterio: "<c:out value="${criterio.nombre}"/>"</caption>
		<tr>
			<td class="renglones" width="500px" align="center"><b>Aspecto</b></td>
			<td class="renglones" width="30px" align="center"><b>Max.</b></td>
			<td class="renglones" width="30px" align="center"><b>Val.</b></td>
		</tr>
		<c:forEach begin="0" items="${criterio.aspectos}" var="aspecto">
		<tr>
			<td width="500px"><c:out value="${aspecto.nombre}"/></td>
			<td width="30px"><c:out value="${aspecto.valor}"/></td>
			<td width="30px">
				<input type="hidden" name='idAspecto' value='<c:out value="${aspecto.idAspecto}"/>'>
				<input type="text" size="3" maxlength="4" value="" name='valAspecto' onKeyPress='return soloNumeros(event)' onkeyup='validar(this,<c:out value="${aspecto.valor}"/>)'>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td class="renglones" colspan="3"><b>Observaciones:</b></td>
		</tr>
		<tr>
			<td colspan="3"><textarea name="observaciones" cols="70" rows="1"></textarea></td>
		</tr>

	</table>
	</c:forEach>

	<div align="center"><img src='<c:url value="/comp/img/Enviar.gif"/>' onclick="ir()"></div>
</form>
</c:if>
<c:if test="${empty requestScope.datos.criterios}">
<div align="center">
<h5>La convocatoria a la que esta inscrita esta evaluación no tiene Criterios a evaluar</h5>
</div>
</c:if>
</body>
</html>