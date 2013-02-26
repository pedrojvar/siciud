<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<script>

	var nav4=window.Event ? true : false;

	function numeros(eve){
		var key=nav4?eve.which :eve.keyCode;
		return(key<=13 || (key>=48 && key<=58));
	}

	function guardar(id)
	{
		document.form1.idvariable.value = id;
		document.form1.valorvariable.value = document.getElementById("txt"+id).value;
		document.form1.accion.value = 7;
		document.form1.submit();
	}
</script>
</head>
<c:import url="/general.jsp"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" type="time" timeStyle="short" pattern="yyyy/MM/dd" var="ano"/>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="form1" method="post" action='<c:url value="/bancoVariables/AdminVariables.x"/>'>
<input type="hidden" name="idvariable" />
<input type="hidden" name="valorvariable" />
<input type="hidden" name="accion" />
<table class="tablas" width="95%" align="center">
	<caption>LISTADO DE VARIABLES PARA INGRESAR INFORMACION</caption>
		<tr>
			<td class="renglones" align="center"><b>#</b></td>
			<td class="renglones" align="center"><b>Identificador</b></td>
			<td class="renglones" align="center"><b>Nombre</b></td>
			<td class="renglones" align="center"><b>Fecha de Creacion</b></td>
			<td class="renglones" align="center"><b>Dato</b></td>
			<td class="renglones" align="center"><b>Actualizar</b></td>
		</tr>
		<c:forEach items="${requestScope.lista}" begin="0" var="lista" varStatus="st">
		<tr <c:if test="${st.count mod 2==0}">class="trb"</c:if>>
			<td><b><c:out value="${st.count}" /></b></td>
			<td align="center"><c:out value="${lista.identificador}"/></td>
			<td><c:out value="${lista.nombre}" /></td>
			<td align="center"><c:out value="${lista.fechacreacion}" /></td>
			<td align="center"><input type="text" style="width: 60px" onkeypress="return numeros(event)" id='txt<c:out value="${lista.identificador}"/>' value='<c:out value="${lista.dato}" />'></td>
			<td align="center"><img border="0" onclick="guardar('<c:out value="${lista.identificador}"/>')" src='<c:url value="/comp/img/Guardar.gif"/>'></td>
		</tr>
		</c:forEach>
		<c:if test="${empty requestScope.lista}">
			<br><br><br>
				<h5 align="center">No se encuentran variables</h5>
		</c:if>
</body>
</html>