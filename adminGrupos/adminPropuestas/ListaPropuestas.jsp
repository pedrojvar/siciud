<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
<script>
	function ajaxNumeros(obj){
		var val=obj.value;
		if(val!=0){
			document.frmAjaxNumero.dato.value=val;
	 		document.frmAjaxNumero.target="frameOculto";
			document.frmAjaxNumero.submit();
		}
	}
	function ver(prop,tipo){
		document.listado.prop.value=prop;
		document.listado.tipEval.value=tipo;
		if(tipo==3){
			document.listado.action='<c:url value="/evalPropuestas/GestEvaluacion.x"/>';
			document.listado.accion.value="6";
		}else{
			document.listado.action='<c:url value="/adminPropuestas/EstadoPropuesta.x"/>';
		}

		document.listado.submit();
	}
	function verResPar(prop,tipo){
		document.listado.prop.value=prop;
		document.listado.accion.value="13";
		document.listado.action='<c:url value="/adminPropuestas/EstadoPropuesta.x"/>';
		document.listado.submit();
	}

</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<form name="filtro" method="post" action='<c:url value="/adminPropuestas/ListaPropuesta.x"/>'>
		<input type="hidden" name="accion" value="1"/>
		<table align="center">
			<tr>
				<td>Año</td>
				<td><select name="ano" onchange="ajaxNumeros(this)">
						<option value="0">----</option>
					<c:forEach begin="0" items="${requestScope.listaConv}" var="anos">
						<option value='<c:out value="${anos}"/>' <c:if test="${sessionScope.ano==anos}">selected</c:if>><c:out value="${anos}"/></option>
					</c:forEach>
					</select>
				</td>
				<td>#</td>
				<td><select name="num">
						<option value="0">----</option>
					<c:forEach begin="0" items="${requestScope.listaNum}" var="num">
						<option value='<c:out value="${num}"/>' <c:if test="${sessionScope.num==num}">selected</c:if>><c:out value="${num}"/></option>
					</c:forEach>
					</select>
				</td>

				<td><input type="image" src='<c:url value="/comp/img/Buscar.gif"/>'/></td>
			</tr>
		</table>
	</form>
	<br>
	<c:if test="${requestScope.convEstado!=null}">
	<table>
		<tr>
			<td>
				<b>La Convocatoria <c:out value="${requestScope.convEstado.codConvocatoria}"/> se encuentra actualmente <c:out value="${requestScope.convEstado.estado}"/></b>
			</td>
		</tr>
	</table>

	<br>
	<form name="listado" method="post">
		<input type="hidden" name="accion" value="0"/>
		<input type="hidden" name="prop" value="0">
		<input type="hidden" name="tipEval" value="0">
        <table class="tablas" width="620px" >
        <caption >Listado de Propuestas Inscritas</caption>
        <tr>
	       	<td class="renglones" align="center"><b>#</b></td>
	       	<td class="renglones" align="center"><b>Cod</b></td>
        	<td class="renglones" align="center"><b>Nombre de Propuesta</b></td>
        	<td class="renglones" align="center" colspan="3"><b>Estado</b></td>
        </tr>
        <tr>
        	<td class="renglones">&nbsp;</td><td class="renglones">&nbsp;</td><td class="renglones">&nbsp;</td>
        	<td class="renglones" align="center"><b>Eval-Int</b></td>
        	<td class="renglones" align="center"><b>Eval-Ext</b></td>
        	<td class="renglones" align="center"><b>Eval-Comit</b></td>
        </tr>
	<c:forEach begin="0" items="${sessionScope.listaPropOBJ}" var="lista" varStatus="st">
		<tr>
			<td class="renglones" align="center"><b><c:out value="${st.count}"/></b></td>
			<td class="listas"><c:out value="${lista.codPropuesta}"/></td>
			<td class="listas"><c:out value="${lista.nomPropuesta}"/></td>
			<td class="estado" align="center">
				<c:if test="${lista.estadoEvalInt==1}"><img src='<c:url value="/comp/img/est0.gif"/>' onclick='ver(<c:out value="${lista.codPropuesta}"/>,1)'></c:if>
				<c:if test="${lista.estadoEvalInt==2}"><img src='<c:url value="/comp/img/est1.gif"/>' onclick='ver(<c:out value="${lista.codPropuesta}"/>,1)'></c:if>
				<c:if test="${lista.estadoEvalInt==3}"><img src='<c:url value="/comp/img/est2.gif"/>' onclick='ver(<c:out value="${lista.codPropuesta}"/>,1)'></c:if>
				<c:if test="${lista.estadoEvalInt==4}"><img src='<c:url value="/comp/img/est3.gif"/>' onclick='ver(<c:out value="${lista.codPropuesta}"/>,1)'></c:if>
				<c:if test="${lista.estadoEvalInt==5}"><img src='<c:url value="/comp/img/est4.gif"/>' onclick='ver(<c:out value="${lista.codPropuesta}"/>,1)'></c:if>
				<c:if test="${lista.estadoEvalInt==6}"><img src='<c:url value="/comp/img/est5.gif"/>' onclick='ver(<c:out value="${lista.codPropuesta}"/>,1)'></c:if>
			</td>
			<td class="estado" align="center">
				<c:if test="${lista.estadoEvalExt==1}"><img src='<c:url value="/comp/img/est0.gif"/>' onclick='ver(<c:out value="${lista.codPropuesta}"/>,2)'></c:if>
				<c:if test="${lista.estadoEvalExt==2}"><img src='<c:url value="/comp/img/est1.gif"/>' onclick='ver(<c:out value="${lista.codPropuesta}"/>,2)'></c:if>
				<c:if test="${lista.estadoEvalExt==3}"><img src='<c:url value="/comp/img/est2.gif"/>' onclick='ver(<c:out value="${lista.codPropuesta}"/>,2)'></c:if>
				<c:if test="${lista.estadoEvalExt==4}"><img src='<c:url value="/comp/img/est3.gif"/>' onclick='ver(<c:out value="${lista.codPropuesta}"/>,2)'></c:if>
				<c:if test="${lista.estadoEvalExt==5}"><img src='<c:url value="/comp/img/est4.gif"/>' onclick='ver(<c:out value="${lista.codPropuesta}"/>,2)'></c:if>
				<c:if test="${lista.estadoEvalInt==6}"><img src='<c:url value="/comp/img/est5.gif"/>' onclick='ver(<c:out value="${lista.codPropuesta}"/>,2)'></c:if>
			</td>
			<td class="estado" align="center">
				<c:if test="${lista.estadoEvalComit==1}"><img src='<c:url value="/comp/img/est0.gif"/>'onclick='verResPar(<c:out value="${lista.codPropuesta}"/>)'></c:if>
				<c:if test="${lista.estadoEvalComit==2}">
					<c:if test="${lista.estadoEvalExt==5 or lista.estadoEvalExt==6 and lista.estadoEvalInt==5 or lista.estadoEvalInt==6}">
					<img src='<c:url value="/comp/img/est6.gif"/>' onclick='ver(<c:out value="${lista.codPropuesta}"/>,3)'>
					</c:if>
					<c:if test="${lista.estadoEvalExt<5 and lista.estadoEvalInt<5}">
					<img src='<c:url value="/comp/img/est6.gif"/>'>
					</c:if>
				</c:if>
				<c:if test="${lista.estadoEvalComit==3}"><img src='<c:url value="/comp/img/est7.gif"/>'></c:if>
				<c:if test="${lista.estadoEvalComit==4}"><img src='<c:url value="/comp/img/est8.gif"/>'></c:if>
			</td>
		</tr>
	</c:forEach>
		</table>
	</form>
	</c:if>
	<c:if test="${requestScope.convEstado==null}">
	<h4 align="center">Seleccione un Año y un Número de Convocatoria</h4>
	<h4 align="center"><c:out value="${requestScope.estado}"/></h4>
	</c:if>
	<table>
		<tr>
			<td style="display:none"><iframe name="frameOculto" id="frameOculto"></iframe></td>
		</tr>
	</table>
	<form method="post" name="frmAjaxNumero" action="<c:url value="/adminPropuestas/Ajax.x"/>">
		<input type="hidden" name="accion" value='7'>
		<input type="hidden" name="dato" value=''>
	</form>

</body>

</html>