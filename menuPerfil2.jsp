<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<link href='<c:url value="/comp/css/tablas.css"/>' rel="stylesheet" type="text/css">
<link href='<c:url value="/comp/css/formatos.css"/>' rel="stylesheet" type="text/css">
<html>
<head>
<script>
	function mensajeAlert(msg){
		if(msg){
			alert(msg.value);
		}
	}
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">

<c:if test='${requestScope.msg!=null && requestScope.msg!=""}'>
	<input type="hidden" id='msg' name="msg" value='<c:out value="${requestScope.msg}"/>'>
</c:if>
<c:if test="${sessionScope.loginUsuario.nombre!=null}">

<table>
<tr><td align="center"><c:out value="${sessionScope.loginUsuario.nombre}"/></td></tr>
</table>
</c:if>
<c:set value="${sessionScope.loginUsuario}" var="usuario" scope="page"/>
<c:set value="" var="categoria" scope="page"/>
<table>
<c:forEach begin="0" items="${usuario.recursos}" var="recursos">
	<c:if test="${categoria!=recursos.categoria && recursos.primario==true}">
		<c:set value="${recursos.categoria}" var="categoria"/>
		<tr><td class="menu" background="<c:url value="/comp/img/menu/${categoria}.gif" />"></td>
		<c:if test="${sessionScope.loginUsuario.idUsuario==0 and categoria=='Resultados' and recursos.item=='Convocatorias 2009'}">
		<tr><td><a class="menu" href='/Resultados/main.html' target="main">Convocatorias 2008</a></td></tr>
		</c:if>
	</c:if>

	<c:if test="${recursos.primario==true}">
	<tr><td><a class="menu" href='<c:url value="${recursos.recurso}"/>' target="main"><c:out value="${recursos.item}"/></a></td></tr>
	</c:if>

</c:forEach>

</table>
<c:if test="${sessionScope.loginUsuario.idUsuario==0}">
<!--  <table>
	<tr>
		<td><br><br><a class="menu" href='/Resultados/' target="parent"><b>Convocatorias 2008</b></a></td>
	</tr>
</table>-->
<form action="ingresoUsuario.x" method="post">
<input type="hidden" name="accion" value="1">
	<table width="150px">
		<tr><td colspan="3" class="login">&nbsp;</td></tr>
		<tr><td colspan="3" align="center"><b>Usuario</b></td></tr>
		<tr><td></td><td width="70%" align="center"><input class="cajas" type="text" name="usuario" size="10"></td><td></td></tr>
		<tr><td colspan="3" align="center"><b>Clave</b></td></tr>
		<tr><td></td><td width="70%" align="center"><input class="cajas" type="password" name="clave" size="10"></td><td></td></tr>
		<tr><td colspan="3" align="center"><br><input class="boton" type="submit" value="ingresar" ></td></tr>
	</table>
</form>


</c:if>
<c:if test="${sessionScope.loginUsuario.idUsuario!=0}">
<form action="ingresoUsuario.x" method="post">
<input type="hidden" name="accion" value="0">
<table align="center">
	<tr>
		<td>
			<input align="middle" type="image" src='<c:url value="/comp/img/CerrarSesion.gif"/>' value="Cerrar Session">
		</td>
	</tr>
</table>
</form>

</c:if>

</body>
<script language="javaScript">
<c:if test="${sessionScope.loginUsuario.pagina!=null}">
	parent.main.location.href='<c:url value="${sessionScope.loginUsuario.pagina}"/>';
</c:if>
<c:if test="${sessionScope.loginUsuario.pagina==null}">
	parent.main.location.href='<c:url value="/main.html"/>';
</c:if>
//alert(<c:out value="${sessionScope.pagina}"/>);
</script>

</html>
