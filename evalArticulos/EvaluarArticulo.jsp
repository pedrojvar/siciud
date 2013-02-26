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
	var nav4=window.Event ? true : false;
	var mensaje="";
	function soloNumeros(eve){
		var key=nav4?eve.which :eve.keyCode;
		return((key>=48 && key<=57) || key==46 || key==13 || key==7 || key==8 ||key==0);
	//	return(key<=46 ||key<=13 || (key>=48 && key<=57));
	}
	function validar(caja,valor){
		var c=parseFloat(caja.value);
		if(isNaN(c)){
			if(caja.value!="")
				alert("Número no válido");
				caja.value="";
		}else{
			if(c>valor ||c<0.9){
				alert("El valor no debe estar entre 1 y "+valor);
				caja.value=valor;
			}
		}
		sumar();
	}
	function enviar(){
		document.filtro.target="lista";
		document.filtro.submit();
	}
	function sumar(){
		var suma=0;
		for(var i=0;i<document.evaluar.valores.length;i++){
			if(document.evaluar.valores[i].value!="")
				suma=suma+parseFloat(document.evaluar.valores[i].value);
		}
		document.getElementById("sumaTotal").innerHTML=suma;
	}

</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br><br>

		<table class="tablas" align="center" width="85%">
			<caption>Datos de Artículo a Evaluar</caption>
			<tr>
				<td class="renglones" width="80px"><b>Presentador</b></td>
				<td>
					<c:out value="${datosArticulo.nombPresentador}"/>
				</td>
				<td class="renglones" width="80px"><b>Documento</b></td>
				<td width="10px">
					<a href='/Documentos/Articulos/Evento/<c:url value="${datosArticulo.urlArchivo}"/>'>
					<img border="0" src='<c:url value="/comp/img/${datosArticulo.imgArchivo}"/>'>
					</a>
				</td>
			</tr>
			<tr>
				<td class="renglones" colspan="4"><b>Nombre Artículo</b></td>
			</tr>
			<tr>
				<td colspan="4">
					<c:out value="${datosArticulo.nombArtic}"/>
				</td>
			</tr>
		</table>
<br>
	<form name="evaluar" method="post" action='<c:url value="/evalArticulos/llenar1.jsp"/>'>
	<input type="hidden" name="accion" value="3">
	<input type="hidden" name="id" value='<c:out value="${datosArticulo.idArtic}"/>'>
		<table class="tablas" align="center" width="85%">
			<caption>Aspectos de Evaluación</caption>
			<tr>
				<td class="renglones">&nbsp;</td>
				<td class="renglones" align="center"><b>Nombre Aspecto</b></td>
				<td class="renglones" align="center" width="10px"><b>Max</b></td>
				<td class="renglones" align="center" width="50px"><b>Valor</b></td>
			</tr>
			<c:forEach begin="0" items="${datosArticulo.aspectosEvaluar}" var="lista" varStatus="st">
			<tr>
				<td class="renglones">
					<input type="hidden" name="idAspectos" value='<c:out value="${lista.id}"/>'><b><c:out value="${st.count}"/></b>
				</td>
				<td><c:out value="${lista.nombre}"/></td>
				<td align="center" width="10px"><c:out value="${lista.valor}"/></td>
				<td width="50px" align="center">
					<input style="text-align: right;" type="text" name="valores" size="5" maxlength="5" onchange="validar(this,<c:out value="${lista.valor}"/>)" onKeyPress='return soloNumeros(event)' >
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="2" align="right"><b>Total:</b></td>
				<td align="right">&nbsp;</td>
				<td align="center"><b><span id="sumaTotal"></span></b></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="image" src='<c:url value="/comp/img/Enviar.gif" />'></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
sumar();
</script>
</html>