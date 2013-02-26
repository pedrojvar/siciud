<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/general.jsp"/>
<script>
	function comando(id,tipEval){
		document.comandos.action='<c:url value="/invest/gestionInvestig.x"/>';
		document.comandos.accion.value=id;
		document.comandos.tipoEval.value=tipEval;
		document.comandos.submit();
	}
</script>
</head>
<body>
<br>
<c:set var="cont" value="${0}"/>
<form name="comandos">
	<input type="hidden" name="accion" value=''>
	<input type="hidden" name="tipoEval" value=''>
	<input type="hidden" name="prop" value='<c:out value="${requestScope.prop}"/>'>
	<table align="left">
		<tr>
			<td><img src='<c:url value="/comp/img/Atras.gif"/>' onclick="comando(17,0)"></td>
			<td><img src='<c:url value="/comp/img/EvalInter.gif"/>' onclick="comando(19,1)"></td>
			<td><img src='<c:url value="/comp/img/EvalExt.gif"/>' onclick="comando(19,2)"></td>
		</tr>
	</table>
</form>
<br>
<form name="calculo">
<c:if test="${!empty requestScope.evalTodos.criterios}">
	<table class="tablas" width="95%" align="center">
	<caption>Calculo de Evaluación Propuestas de Investigación</caption>
		<tr>
			<td class="renglones" align="center"><b>CRITERIOS Y ASPECTOS DE EVALUACIÓN</b></td>
			<td class="renglones" align="center"colspan="3"><b>Pares Eval.</b></td>
			<td class="renglones" align="center"><b>Comité</b></td>
		</tr>
		<c:forEach begin="0" items="${requestScope.evalTodos.criterios}" var="criterio">
		<tr>
			<td class="renglones" width="500px" align="left"><b>Criterio: "<c:out value="${criterio.nombre}"/>"</b></td>
			<td class="renglones" width="35px" align="center"><b>Max.</b></td>
			<td class="renglones" width="35px" align="center"><b>Int. (<c:out value="${requestScope.datosCalculo.porcentInt}" />)</b></td>
			<td class="renglones" width="35px" align="center"><b>Ext. (<c:out value="${requestScope.datosCalculo.porcentExt}" />)</b></td>
			<td class="renglones" width="35px"></td>
		</tr>
		<c:forEach begin="0" items="${criterio.aspectos}" var="aspecto" varStatus="vs">
		<c:set var="cont" value="${cont+1}"/>
		<input type="hidden" name="cantAsp" value='<c:out value="${cont}"/>'>
		<tr>
			<td width="500px"><c:out value="${aspecto.nombre}"/></td>
			<td width="35px" align="center"><span id='max<c:out value="${cont}"/>'><c:out value="${aspecto.maxValor}"/></span></td>
			<td width="35px" align="center"><span id='A1<c:out value="${cont}"/>'><c:out value="${aspecto.valor}"/></span></td>
			<c:forEach begin="0" items="${criterio.aspectos2}" var="aspecto2">
			<c:if test="${aspecto2.nombre==aspecto.nombre}">
			<td width="35px" align="center"><span id='A2<c:out value="${cont}"/>'><c:out value="${aspecto2.valor}"/></span></td>
			</c:if>
			</c:forEach>
			<td>&nbsp;</td>
		</tr>
		</c:forEach>
		</c:forEach>
		<tr>
			<td class="renglones"><b>Evaluación Comité de Investigaciones</b></td>
			<td class="renglones">&nbsp;</td>
			<td class="renglones">&nbsp;</td>
			<td class="renglones">&nbsp;</td>
			<td class="renglones" width="35px" align="center"><b>(<c:out value="${requestScope.datosCalculo.porcentComite}" />)</b></td>
		</tr>
		<c:forEach begin="0" items="${requestScope.evalTodos.critComite}" var="aspecto" varStatus="vs">
		<tr>
			<td><c:out value="${aspecto.nombre}"/></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td align="right"><c:out value="${aspecto.valor}"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td align="right"><b>Total Puntos:</b></td>
			<td align="right"><span id="totalSum">&nbsp;</span></td>
			<td align="right"><span id="totalInt">&nbsp;</span></td>
			<td align="right"><span id="totalExt">&nbsp;</span></td>
			<td align="right"><span id="totalExt"><c:out value="${requestScope.datosCalculo.sumaComite}"/></span></td>
		</tr>
		<tr>
			<td align="right"><b>Porcentajes:</b></td>
			<td>&nbsp;</td>
			<td class="casEsp" align="right"><span id="porceInt">&nbsp;</span>%</td>
			<td class="casEsp" align="right"><span id="porceExt">&nbsp;</span>%</td>
			<td class="casEsp" align="right"><span id="porceComit"></span>%</td>
		</tr>
	</table>
</c:if>
<c:if test="${empty requestScope.evalTodos.criterios}">
<div align="center">
<h5>No hay Valores cargados para esta Propuesta de Investigación</h5>
</div>
</c:if>
<div align="center">
<br>
<table align="center">
	<tr><td colspan="2"><h4>El porcentaje total de puntos obtenidos es: <span id="totalFinal">&nbsp;</span>%</h4></td></tr>
</table>
</div>
</form>
</body>
<script>
//	function calcular(){
		var sumInt=0,sumExt=0,maxP=0,promParcialInt=0,promParcialExt=0;
		var porcInt=0,porcExt=0,porcFin=0;
		var inte=<c:out value="${requestScope.datosCalculo.porcentInt}" />;
		var ext=<c:out value="${requestScope.datosCalculo.porcentExt}" />;
		var comit=<c:out value="${requestScope.datosCalculo.porcentComite}" />;
		for(var i=1;i<=<c:out value="${cont}"/>;i++){
			maxP=maxP+parseFloat(document.getElementById("max"+i).innerHTML);
			if(inte!="0" && inte!="0.0")
				sumInt=sumInt+parseFloat(document.getElementById("A1"+i).innerHTML);
			if(ext!="0" && ext!="0.0")
				sumExt=sumExt+parseFloat(document.getElementById("A2"+i).innerHTML);
		}
	//	promParcialInt=sumInt*(100/maxP);
	//	promParcialExt=sumExt*(100/maxP);
	//	porcInt=promParcialInt*(100/inte);
	//	porcExt=promParcialExt*(100/ext);
		porcComit=<c:out value="${requestScope.datosCalculo.finalComite}"/>;
		porcInt=sumInt*(inte/100);
		porcExt=sumExt*(ext/100);
		document.getElementById("totalSum").innerHTML=maxP;
		document.getElementById("totalInt").innerHTML=sumInt;
		document.getElementById("totalExt").innerHTML=sumExt;
		document.getElementById("porceInt").innerHTML=num2Decimal(porcInt);
		document.getElementById("porceExt").innerHTML=num2Decimal(porcExt);
		document.getElementById("porceComit").innerHTML=num2Decimal(<c:out value="${requestScope.datosCalculo.finalComite}"/>);
		document.getElementById("totalFinal").innerHTML=num2Decimal(porcInt+porcExt+porcComit);
//	}
	function num2Decimal(numero){
		if(numero.length<5)return numero;
		var x="";
		numero=""+numero;
		pos=numero.indexOf(".");
		if(pos!=-1){
		for(var i=0;i<pos+2;i++)
			x=x+numero.charAt(i);
		}else return numero;
		return x;
	}
</script>
</html>