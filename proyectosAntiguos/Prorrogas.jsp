<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="loginUsuario" class="cidc.general.login.Usuario" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>

function tabs(num){
		    document.formTab.validar.value = num;
			document.formTab.submit();
		 }

</script>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<c:import url="/general.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cambios Proyecto Antiguo</title>
</head>
<body>

<br>
<form name="formTab" method="post" action='<c:url value="/proyectosAntiguos/GestProyectos.x"/>'>
<input type="hidden" name="validar">
<input type="hidden" name="id" value=<c:out value="${sessionScope.proyectos.id}"/>>
<table cellspacing="0" cellpadding="0">
<tr>   <td><img src='<c:url value="/comp/img/DatosGenerales.gif"/>' onclick="tabs(6)"></td>
       <%if(loginUsuario.isPerfil("16")||loginUsuario.isPerfil("4")||loginUsuario.isPerfil("1")){ %>
       		<td><img src='<c:url value="/comp/img/Docsproyectoant.gif"/>' onclick="tabs(7)"></td>
       	<%} %>
       	<%if(loginUsuario.isPerfil("16")||loginUsuario.isPerfil("6")||loginUsuario.isPerfil("7")||loginUsuario.isPerfil("8")||loginUsuario.isPerfil("1")){ %>
	       <td><img src='<c:url value="/comp/img/Presupuesto.gif"/>' onclick="tabs(8)"></td>
	       <td><img src='<c:url value="/comp/img/prAprobado.gif"/>' onclick="tabs(27)"></td>
       <%} %>
       <%if(loginUsuario.isPerfil("16")||loginUsuario.isPerfil("5")||loginUsuario.isPerfil("1")){ %>
       <td><img src='<c:url value="/comp/img/Investigadores.gif"/>' onclick="tabs(10)"></td>
       <%} %>
       <%if(loginUsuario.isPerfil("16")||loginUsuario.isPerfil("7")||loginUsuario.isPerfil("1")){ %>
       <td><img src='<c:url value="/comp/img/Inventario.gif"/>' onclick="tabs(15)"></td>
       <td><img src='<c:url value="/comp/img/Cambios.gif"/>' onclick="tabs(19)"></td>
       <td><img src='<c:url value="/comp/img/Devoluciones.gif"/>' onclick="tabs(22)"></td>
       <%} %>
       <td><img src='<c:url value="/comp/img/Cambios.gif"/>' onclick="tabs(19)"></td>
</tr>
</table>
</form>
<br>

<c:if test="${empty requestScope.lista2}">
	<br>
		<h5 align="center">No se encuentran registros para esta consulta</h5>
</c:if>

<c:if test="${!empty requestScope.lista2}">
                   <table class="tablas" align = "center" width="90%">
    				<CAPTION>Cambios de Tiempo (Prórrogas)</CAPTION>
				       <tr> <td class="renglones" width="70px"><b>Solicitud:</b></td>
					             <td class="renglones" width="70px"><b>Respuesta:</b></td>
					             <td class="renglones"><b>Aprobacion:</b></td>
					             <td class="renglones"><b>Observaciones:</b></td>
				            </tr>
				       <c:forEach begin = "0" items = "${requestScope.lista2}" var = "cam" varStatus="st" >
                            <tr <c:if test="${st.count mod 2==0}"> class="trb" </c:if> > <td><c:out value = "${cam.solicitud}"/></td>
						         <td><c:out value = "${cam.respuesta}"/></td>
						         <td><c:out value = "${cam.aprobacion}"/></td>
						         <td><c:out value = "${cam.observaciones}"/></td>
							</tr>
       					</c:forEach>
			    </table>
</c:if>
</body>
</html>