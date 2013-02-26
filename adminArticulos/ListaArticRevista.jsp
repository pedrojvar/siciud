<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/comp/css/formatos.css"/>">
<c:import url="/general.jsp"/>
<script>
	function cambio(combo){
		if(combo.selectedIndex==0){
			document.getElementById('texto').innerHTML="Tipo Artículo:";
			document.getElementById("even").style.display='none';
			document.getElementById("inte").style.display='';
		}if(combo.selectedIndex==1){
			document.getElementById('texto').innerHTML="Evento:";
			document.getElementById("even").style.display='';
			document.getElementById("inte").style.display='none';
		}
	}

	function ver(artic){
		document.listado.art.value=artic;
		document.listado.accion.value="4";
		document.listado.action='<c:url value="/adminArticulos/AdminArticulosRevista.x"/>';
		document.listado.submit();
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
	<form name="filtro" method="post" action='<c:url value="/adminArticulos/llenar.jsp"/>'>
		<input type="hidden" name="accion" value="2"/>
		<table align="center">
		<caption>Filtro de Búsqueda</caption>
			<tr>
				<td align="center">
				<table>
					<tr>
						<td class="renglones"><b>En: </b></td>
						<td>
							<select name="tipo" onchange="cambio(this)">
								<option value="1" <c:if test="${sessionScope.filArticulo.tipo==1}">selected</c:if>>Revista Científica</option>
								<option value="2" <c:if test="${sessionScope.filArticulo.tipo==2}">selected</c:if>>Eventos</option>
							</select>
						</td>
						<td class="renglones"><b><span id="texto">Tipo Artículo:</span></b></td>
						<td id="inte">
							<select name="interno"><c:if test="${sessionScope.filArticulo.interno==1}">selected</c:if>
								<option value="1" <c:if test="${sessionScope.filArticulo.interno==1}">selected</c:if> >Interno</option>
								<option value="2" <c:if test="${sessionScope.filArticulo.interno==2}">selected</c:if> >Externo</option>
							</select>
						</td>
						<td id="even" style="display:none">
							<select name="evento">
								<option value="1">Iberdiscap</option>
								<option value="2">Encuentro G/S</option>
							</select>
						</td>
						<td colspan="4" align="center"><input type="image" src='<c:url value="/comp/img/Buscar.gif"/>'/></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<c:if test="${!empty requestScope.listaArtic}">
	<form name="listado" method="post">
		<input type="hidden" name="accion" value="2"/>
		<input type="hidden" name="producto" value='2'>
		<input type="hidden" name="art" value="0">
		<input type="hidden" name="tipArtic" value='<c:out value="${requestScope.tipo}" />'>
        <table class="tablas" width="95%px" >
        <caption >Listado de Artículos registrados</caption>
        <tr>
	       	<td width="21px" class="renglones" align="center"><b>#</b></td>
	       	<td width="21px" class="renglones" align="center"><b>Id</b></td>
        	<td width="150px" class="renglones" align="center"><b>Autor</b></td>
        	<td class="renglones" align="center"><b>Nombre de Artículo</b></td>
        	<td width="75px" class="renglones" align="center"><b>Estado</b></td>
        </tr>

	<c:forEach begin="0" items="${requestScope.listaArtic}" var="lista" varStatus="st">
		<tr>
			<td width="21px" class="renglones"><b><c:out value="${st.count}"/></b></td>
			<td width="21px" class="listas"><c:out value="${lista.idArticulo}"/></td>
			<td width="150px" class="listas"><c:out value="${lista.nombreAutor}"/> <c:out value="${lista.apellidoAutor}"/></td>
			<td class="listas"><c:out value="${lista.titulo}"/></td>
			<td width="75px" class="estado" align="center">
				<c:if test="${lista.estado==1}"><img src='<c:url value="/comp/img/est0.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
				<c:if test="${lista.estado==2}"><img src='<c:url value="/comp/img/est1.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
				<c:if test="${lista.estado==3}"><img src='<c:url value="/comp/img/est2.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
				<c:if test="${lista.estado==4}"><img src='<c:url value="/comp/img/est3.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
				<c:if test="${lista.estado==5}"><img src='<c:url value="/comp/img/est4.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
				<c:if test="${lista.estado==6}"><img src='<c:url value="/comp/img/est5.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
				<c:if test="${lista.estado==7}"><img src='<c:url value="/comp/img/est6.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
				<c:if test="${lista.estado==8}"><img src='<c:url value="/comp/img/est7.gif"/>' onclick='ver(<c:out value="${lista.idArticulo}"/>)'></c:if>
			</td>
		</tr>
	</c:forEach>
		</table>
	</form>
	</c:if>
</body>
<script language="javascript">
	cambio(document.filtro.tipo);
</script>
</html>