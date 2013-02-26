<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<br>
	<br>
	<table align="center">
		<tr>
			<td align="center"><b>ENCUENTRO DE GRUPOS Y SEMILLEROS DE INVESTIGACIÓN DE LA UNIVERSIDAD DISTRITAL</b></td>
		</tr>
	</table>
	<br>
	<c:if test="${!empty requestScope.listaAticulos}">
     <table class="tablas" width="620px" >
     <caption >Listado de Artículos registrados</caption>
     <tr>
     	<td width="21px" class="renglones" align="center"><b>#</b></td>
     	<td width="41px" class="renglones" align="center"><b>Año</b></td>
     	<td width="95px" class="renglones" align="center"><b>Fecha Inscrip.</b></td>
     	<td class="renglones" align="center"><b>Nombre de Artículo</b></td>
     	<td width="75px" class="renglones" align="center"><b>Estado</b></td>
     </tr>

	<c:forEach begin="0" items="${requestScope.listaAticulos}" var="lista" varStatus="st">
	<tr>
		<td width="21px" class="renglones" align="center"><b><c:out value="${st.count}"/><b></td>
		<td width="41px" align="center"><b><c:out value="${lista.ano}"/><b></td>
		<td width="95px" class="listas" align="center"><c:out value="${lista.fechaRecibido}"/></td>
		<td class="listas"><c:out value="${lista.tituloArticulo}"/></td>
		<td width="75px" class="estado" align="center">
			<c:if test="${lista.estado==1}"><img src='<c:url value="/comp/img/est9.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
			<c:if test="${lista.estado==7}"><img src='<c:url value="/comp/img/est7.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
			<c:if test="${lista.estado==8}"><img src='<c:url value="/comp/img/est8.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
		</td>
	</tr>
	</c:forEach>
		</table>
	</c:if>
	<c:if test="${empty requestScope.listaAticulos}">
	<h4 align="center">No hay artículos suyos registrados para este evento</h4>
	</c:if>
</body>

</html>