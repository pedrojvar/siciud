<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="loginUsuario" class="cidc.general.login.Usuario" scope="session" />
<html>
<head>
<c:import url="/general.jsp"/>
<script>
	var nav4=window.Event ? true : false;
	function soloNumeros(eve){
		var key=nav4?eve.which :eve.keyCode;
		return(key<=13 || (key>=48 && key<=57));
	}

	function guardar(){
		document.listadoRubros.target="main";
		document.listadoRubros.submit();
	}
	
	 function validarCambio(caja,aprobado,ejecutado,saldo){
		 var mensaje="";
		 var valor=parseInt(caja.value);
		 var varSaldo=eliminaFormatoMoneda(saldo);
		 var varEjecutado=eliminaFormatoMoneda(ejecutado);
		 //alert("valor "+valor+" Varsaldo "+varSaldo+" varejecutado "+varEjecutado)
		 if(valor<varEjecutado){
			 alert("el valor de este rubro no puede ser inferior al valor ejecutado")
			 caja.value=varEjecutado;
		 }
		 sumarRubros();
	 }

	 function validarCheck(check,id,ejecutado){
		 var mensaje="";
		 var varEjecutado=eliminaFormatoMoneda(ejecutado);
		 if(!check.checked){
			 if(varEjecutado>0){
				 alert("Este rubro no puede ser eliminado debido a que tiene gastos registrados")
				 check.checked=true;				 				 
			 }
			 else{
				 document.getElementById("rubro"+id).disabled=true;
			 }
		 }else
			 document.getElementById("rubro"+id).disabled=false;
			 
	 }

	 function sumarRubros(){
			var suma=0;
				if(document.listadoRubros.valorRubro){
					if(document.listadoRubros.valorRubro.length){
						for(var a=0;a<document.listadoRubros.valorRubro.length;a++){
							suma=suma+parseFloat(document.listadoRubros.valorRubro[a].value);
						}
					}
					document.getElementById('totalAprobado').innerHTML=suma;
				}
			}
	
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>

<form action='<c:url value="/GestionGeneralProyectos/AdminGeneralProyectos.x"/>' name="listadoRubros">
	<input type="hidden" name="accion" value="16">
	<table align="center" class="tablas" width="95%">
	<caption>Lista de rubros</caption>
		<c:if test="${!empty requestScope.listaRubros}">
			<tr>
				<th width="5px">&nbsp;</th>
				<th width="10px">&nbsp;</th>
				<th ><b>Rubro</b></th>
				<th width="100px"><b>Aprobado</b></th>
				<th width="100px"><b>Ejecutado</b></th>
				<th width="100px"><b>Saldo</b></th>
			</tr>			
			<c:set var="aprobado" value="0"/>
			<c:set var="ejecutado" value="0"/>
			<c:set var="saldo" value="0"/>
			<c:forEach begin="0" items="${requestScope.listaRubros}" var="todos" varStatus="st">
				
				<c:set var="existe" value="false"/>			
				<c:forEach begin="0" items="${sessionScope.balanceProyecto.listaRubros}" var="aprobados">
				<c:if test="${todos.idRubro==aprobados.idRubro}">
					<c:set var="existe" value="true"/>
					<c:set var="aprobado" value="${aprobados.valorRubro}"/>
					<c:set var="ejecutado" value="${aprobados.valorEjecutado}"/>
					<c:set var="saldo" value="${aprobados.valorSaldo}"/>
				</c:if>			
				</c:forEach>			
			<c:if test="${existe}">
			<tr <c:if test="${(st.count mod 2)==0}">class="trb"</c:if>>
				<th><c:out value="${st.count}"/></th>
				<td width="10px">
					<input type="checkbox" checked="checked" name="idRubro" onchange="validarCheck(this,'<c:out value="${st.count}"/>','<c:out value="${ejecutado}"/>','<c:out value="${saldo}"/>')" value='<c:out value="${todos.idRubro}" />'>
				</td>
				<td>
					<c:out value="${todos.nombreRubro}"/>
				</td>
				<td width="100px" align="right">
					<input id='rubro<c:out value="${st.count}" />' style="width:90%;text-align:right" type="text" onkeypress="return soloNumeros(event)" onchange="validarCambio(this,'<c:out value="${st.count}"/>','<c:out value="${ejecutado}"/>','<c:out value="${saldo}"/>')" name="valorRubro" value='<c:out value="${aprobado}"/>'>
				</td>
				<td width="100px" style="text-align:right">
					<c:out value="${ejecutado}"/>
				</td>
				<td width="100px" style="text-align:right">
					<c:out value="${saldo}"/>
				</td>
			</tr>
			</c:if>
			<c:if test="${!existe}">
			<tr <c:if test="${(st.count mod 2)==0}">class="trb"</c:if>>
				<th><c:out value="${st.count}"/></th>
				<td>
					<input type="checkbox" name="idRubro" value='<c:out value="${todos.idRubro}" />' onchange="validarCheck(this,'<c:out value="${st.count}"/>','<c:out value="${ejecutado}"/>','<c:out value="${saldo}"/>')">
				</td>
				<td>
					<c:out value="${todos.nombreRubro}"/>
				</td>
				<td style="width:50px;" align="right">
					<input id='rubro<c:out value="${st.count}" />' disabled style="width:90%; text-align:right" maxlength="10" size="10" type="text" onkeypress="return soloNumeros(event)" name="valorRubro" value='0'>
				</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			</c:if>
			</c:forEach>
		</c:if>
			<tr>
				<th align="right" colspan="3">Totales</th>
				<th align="center"><span id="totalAprobado"><c:out value="${sessionScope.balanceProyecto.totalAprobado}"/></span></th>
				<th align="center"><span id="totalEjecutado"><c:out value="${sessionScope.balanceProyecto.totalEjecutado}"/></span></th>
				<th align="center"><span id="totalSaldo"><c:out value="${sessionScope.balanceProyecto.totalSaldo}"/></span></th>
			</tr>
			<tr>
				<td colspan="6" align="center"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardar()"></td>
			</tr>
	</table>
</form>
</body>
</html>