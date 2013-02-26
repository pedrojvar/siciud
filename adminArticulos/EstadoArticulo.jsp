<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
<script>
	function respuesta(eval,resp){
		if(confirm("      Confirmar Acción")){
			document.historico.action='<c:url value="/adminArticulos/AdminArticulos.x"/>';
			document.historico.accion.value="7";
			document.historico.codEval.value=eval;
			document.historico.resp.value=resp;
			document.historico.submit();
		}
	}
	function cancela(eval){
		if(confirm("      Confirmar Acción")){
			document.historico.action='<c:url value="/adminArticulos/AdminArticulos.x"/>';
			document.historico.accion.value="8";
			document.historico.codEval.value=eval;
			document.historico.submit();
		}
	}
	function mail(eval){
		if(confirm("      Confirmar Acción")){
			document.historico.action='<c:url value="/adminArticulos/AdminArticulos.x"/>';
			document.historico.accion.value="9";
			document.historico.codEval.value=eval;
			document.historico.submit();
			document.getElementById("espere").style.display='';
		}
	}
	function docs(){
		if(confirm("      Confirmar Acción")){
			document.historico.action='<c:url value="/adminArticulos/AdminArticulos.x"/>';
			document.historico.accion.value="10";
			document.historico.submit();
		}
	}
	function asigna(ac){
		document.comandos.action='<c:url value="/adminArticulos/AdminArticulos.x"/>';
		document.comandos.accion.value=ac;
		document.comandos.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="comandos" action='<c:url value="/adminArticulos/AdminArticulos.x"/>'>
	<input type="hidden" name="idArticulo" value='<c:out value="${sessionScope.datosArticulo.idArticulo}"/>'/>
	<input type="hidden" name="accion" value='2'>
	<table align="left">
		<tr>
			<td><input type="image" src='<c:url value="/comp/img/Atras.gif"/>'></td>
			<c:if test='${sessionScope.datosArticulo.codEval==null || sessionScope.datosArticulo.codEval==""}'>
			<td>
				<input type="image" src='<c:url value="/comp/img/AsignaEvaluador.gif"/>' onclick='asigna(5)'/>
			</td>
			</c:if>
			<c:if test='${sessionScope.datosArticulo.fecEvaluacion!=null && sessionScope.datosArticulo.fecEvaluacion!=""}'>
			<td >
				+++++++++++++<input type="image" src='<c:url value="/comp/img/VerEvaluacion.gif"/>' onclick='asigna(0)'/>
			</td>
			</c:if>
			<c:if test='${sessionScope.datosArticulo.archivo!=null || sessionScope.datosArticulo.archivo!=""}'>
			<td><a href='<c:url value="/Documentos/Articulos/${sessionScope.datosArticulo.archivo}"/>'>
					<img border="0" src='<c:url value="/comp/img/Documento.gif"/>'>
				</a>
			</td>
			</c:if>
			<td valign="top" id="espere" style="display:none;" ><img  src='<c:url value="/comp/img/cargando2.gif"/>'><b>Enviando Mensaje...</b></td>
		</tr>
	</table>
</form>
<br>
<br>
<br>
<br>
	<form name="historico" method="post">
	<table class="tablas" align="center">

		<tr>
			<td>
				<input type="hidden" name="accion" value="0"/>
				<input type="hidden" name="resp" value="0"/>
				<input type="hidden" name="codEval" value="0"/>
				<input type="hidden" name="idArtic" value='<c:out value="${sessionScope.datosArticulo.idArticulo}"/>'/>
				<table class="tablas" width="550px">
				<caption>Estado de Artículo</caption>
				<tr>
					<td colspan="4">
						<table>
							<tr>
								<td class="renglones"><b>Nombre Artículo:</b></td>
								<td colspan="4"><c:out value="${sessionScope.datosArticulo.tituloArticulo}"/><td>
							</td>
							<tr>
								<td class="renglones"><b>Presentador de Artículo:</b></td>
								<td><c:out value="${sessionScope.datosArticulo.presentador}"/><td>
								<td class="renglones"><b>Fecha de Recepción:</b></td>
								<td><c:out value="${sessionScope.datosArticulo.fecRecibido}"/><td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="renglones" align="center"><b>Nombre de Evaluador</b></td>
					<td class="renglones" align="center"><b>Asignación</b></td>
					<td class="renglones" align="center"><b>Respuesta</b></td>
					<td class="renglones" align="center"><b>Cancelación</b></td>
				</tr>
				<c:if test="${!empty sessionScope.datosArticulo.listaEval}">
				<c:forEach begin="0" items="${sessionScope.datosArticulo.listaEval}" var="lista" varStatus="st">
					<tr>
						<td><c:out value="${lista.nombre}"/></td>
						<td align="center"><c:out value="${lista.asignacion}" /></td>
						<td align="center">
							<c:out value="${lista.respuesta}" />
							<c:if test='${lista.respuesta==null}'>
							<input type="button" value="Si" onclick='respuesta(<c:out value="${lista.id}"/>,1)'/>
							<input type="button" value="No" onclick='respuesta(<c:out value="${lista.id}"/>,2)'/>
							</c:if>
						</td>
						<td align="center">
							<c:out value="${lista.cancela}"/>
							<c:if test='${sessionScope.datosArticulo.fecEvaluacion==null or sessionScope.datosArticulo.fecEvaluacion==""}'>
							<c:if test='${lista.cancela==null && sessionScope.datosArticulo.codEval!="" && lista.estado==1}'>
							<input type="image" src='<c:url value="/comp/img/Cancela.gif"/>' onclick='cancela(<c:out value="${lista.id}"/>)'/>
							</c:if>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty sessionScope.datosArticulo.listaEval}">
				<tr>
					<td colspan="4" align="center"><h2>No hay Evaluadores Asignados</h2></td>
				</tr>
				</c:if>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table class="tablas" width="100%">
					<tr>
						<td colspan="2" class="renglones" align="center"><b>Enviar Mail Login</b></td>
						<td class="renglones" align="center"><b>Entrega Documentos</b></td>
						<td class="renglones" align="center"><b>Entrega Evaluación</b></td>
					</tr>
					<c:if test='${sessionScope.datosArticulo.codEval!=null && sessionScope.datosArticulo.codEval!=""}'>
					<tr>
						<td align="center">
							<c:out value="${sessionScope.datosArticulo.fecMail}"/>
						</td>
						<td align="center">
						<c:if test='${sessionScope.datosArticulo.fecEvaluacion==null or sessionScope.datosArticulo.fecEvaluacion==""}'>
							<input type="image" src='<c:url value="/comp/img/EnviaMail.gif"/>' onclick='mail(<c:out value="${sessionScope.datosArticulo.codEval}" />,1)'/>
						</c:if>
						</td>
						<td align="center">
							<c:if test='${sessionScope.datosArticulo.fecDocumentos==null or sessionScope.datosArticulo.fecDocumentos==""}'>
								<img src='<c:url value="/comp/img/Entregado.gif"/>' onclick="docs()">
							</c:if>
							<c:if test='${sessionScope.datosArticulo.fecDocumentos!=null or sessionScope.datosArticulo.fecDocumentos!=""}'>
								<c:out  value="${sessionScope.datosArticulo.fecDocumentos}"/>
							</c:if>
						</td>
						<td align="center"><c:out  value="${sessionScope.datosArticulo.fecEvaluacion}"/></td>
					</tr>
					</c:if>
					<c:if test="${sessionScope.datosArticulo.codEval==null}">
					<tr>
						<td colspan="4" align="center"><h2>El evaluador no se ha asignado</h2></td>
					</tr>
					</c:if>
				</table>

			</td>
		</tr>
	</table>
	</form>
</body>
</html>