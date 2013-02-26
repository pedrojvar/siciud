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

	 function guardar(){
		 document.form1.validar.value = 23;
		 document.form1.action='<c:url value="/proyectosAntiguos/Llenar5.jsp"/>';
		 document.form1.submit();
	 }
</script>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<c:import url="/general.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Devoluciones Proyecto Antiguo</title>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">

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

<c:if test="${empty requestScope.lista}">
	<br>
		<h5 align="center">No se encuentran registros para esta consulta</h5>
</c:if>

<c:if test="${!empty requestScope.lista}">
<table width="98%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td align="center"><br><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardar()"></td>

</tr>
<tr></tr>
      <tr><td width="100%" valign='top'>

		  <div align="center" style="width:100%;height:350px;overflow:auto;vertical-align:top;">
		  <form name="form1" method="post">
		    <input type="hidden" name="idElemento">
			<input type="hidden" name="validar" value="23">
				 <c:forEach begin = "0" items = "${requestScope.lista1}" var = "rubId">
                   <table class="tablas" align = "center" width="98%">
    				<CAPTION>Rubro: <c:out value="${rubId.nombreRubro}"/> <c:out value="${st}"/> </CAPTION>
				       <tr> <td class="renglones" width="10px">&nbsp</td>
					       <td class="renglones"><b>Descripcion:</b></td>
					       <td class="renglones" width="50px"><b>Placa:</b></td>
					       <td class="renglones" width="90px"><b>Valor:</b></td>
					       <td class="renglones" width="60px"><b>Devuelto:</b></td>
				       </tr>
				       <c:set var="ban" value="${1}" />
				       <c:forEach begin = "0" items = "${requestScope.lista}" var = "ele" varStatus="st" >
				       		<c:if test="${rubId.rubro == ele.rubro}">
			                      <tr <c:if test="${st.count mod 2==0}">class="trb"</c:if>> <td class="renglones" align="center"><b><c:out value="${ban}"/></b></td>
						           <td> <c:out value = "${ele.descripcion}"/> </td>
						           <td> <c:out value = "${ele.placa}"/> </td>
						           <td align="right"> <c:out value = "${ele.valor}"/> </td>
			           				<td align="center"><input type="checkbox" value ='<c:out value = "${ele.idElemento}"/>' name="devueltos"  <c:if test="${ele.devuelto == true}"> checked="checked" </c:if> > </td>
							      </tr>
							       <c:set var="ban" value="${ban+1}" />
						  </c:if>
       					</c:forEach>
			    </table>
			 </c:forEach>
		</form>
		</div>
	</td>
</table>
</c:if>

</body>
</html>