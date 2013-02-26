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

		 function eliminar(id){
		 if (confirm("¿Realmente desea eliminar este cambio?"))
		    {
            document.form1.id.value=id;
            document.form1.validar.value = 20;
			document.form1.submit();
			}
	     }

	     function nuevo(){
            document.getElementById("nuevo").style.display='';
   		    document.getElementById("boton").style.display='none';
		 }

		 function cancelar(){
		    document.getElementById("boton").style.display='';
		    document.form2.solicitud.value="";
		    document.form2.respuesta.value="";
  		    document.form2.observaciones.value="";
  		    document.form2.aprobacion.value="";
  		    document.form2.tipo.selectedIndex=0;
		    document.getElementById("nuevo").style.display='none';
		 }

		  function crear(){
		     if (document.form2.tipo.selectedIndex==0)
               {
                 alert("Debe seleccionar el tipo de cambio");
                 return false;
               }
		    document.form2.validar.value = 21;
			document.form2.submit();
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

<form name="form2" method="post" action='<c:url value="/proyectosAntiguos/Llenar4.jsp" />'>
<input type="hidden" name="validar">
<table id="nuevo" class="tablas" align = "center" width="99%" style="display:none">
<CAPTION>Registro de un Nuevo Cambio</CAPTION>
  <tr> <td class="renglones" colspan="2"><b>Fecha Solicitud: </b></td>
       <td class="renglones" colspan="2"><b>Fecha Respuesta: </b></td>
       <td class="renglones"><b>Aprobación:</b></td>
       <td class="renglones" width="110px"><b>Tipo:</b></td>

  </tr>
  <tr> <td width="80px"><input type="text" name="solicitud" size="11"  class="caj" readonly="true" id="f_date1"></td>
       <td width="35px"><button type='button' id="id_fecha1">...</button></td>
          <script type="text/javascript">
 			   Calendar.setup({
   			   inputField     :    'f_date1',
   			   ifFormat       :    '%d/%m/%Y',
   			   showsTime      :    false,
   			   button         :    'id_fecha1',
   			   singleClick    :    false,
   			   step           :    1
   			   })
	    </script>
	    <td width="80px"><input type="text" name="respuesta" size="11"  class="caj" readonly="true" id="f_date2"></td>
        <td width="35px"><button type='button' id="id_fecha2">...</button></td>
           <script type="text/javascript">
 			   Calendar.setup({
   			   inputField     :    'f_date2',
   			   ifFormat       :    '%d/%m/%Y',
   			   showsTime      :    false,
   			   button         :    'id_fecha2',
   			   singleClick    :    false,
   			   step           :    1
   			   })
	     </script>
       <td> <input type="text" name="aprobacion" style="width: 95%"> </td>
       <td> <select name="tipo">
            <option value="0">-----------------------</option>
            <option value="1">Presupuesto</option>
          	<option value="2">Título</option>
          	<option value="3">Investigador Principal</option>
          	<option value="4">Tiempo (Prórrogas)</option>
            </select>
       </td>
  </tr>
  <tr> <td class="renglones" colspan="6"><b>Observaciones: </b></td> </tr>
  <tr> <td colspan="6"><textarea class="texto" name="observaciones" style="width: 99%"></textarea></td></tr>
  <tr>  <td align="center" colspan="6">
                  <img src='<c:url value="/comp/img/Registrar.gif"/>' onclick='crear()'>
                  <img src='<c:url value="/comp/img/Cancelar.gif"/>' onclick='cancelar()'>
       </td>
  </tr>
</table>
</form>

<br>
<table width="99%"><tr id="boton"><td align="center"><br><img src='<c:url value="/comp/img/NuevoCambio.gif"/>' onclick='nuevo()'> </td></tr></table>

<c:if test="${!empty requestScope.lista}">
		  <form name="form1" method="post" action='<c:url value="/proyectosAntiguos/GestProyectos.x" />'>
			<input type="hidden" name="id">
			<input type="hidden" name="validar" value="20">
				 <c:forEach begin = "0" items = "${requestScope.lista1}" var = "t">
                   <table class="tablas" align = "center" width="99%">
    				<CAPTION>Cambios de <c:if test="${t.tipo==1}">Presupuesto</c:if><c:if test="${t.tipo==2}">Titulo</c:if><c:if test="${t.tipo==3}">Investigador Principal</c:if><c:if test="${t.tipo==4}">Tiempo (Prórrogas)</c:if></CAPTION>
				       <c:set var="ban" value="${1}" />
				       <tr> <td class="renglones" width="70px"><b>Solicitud:</b></td>
					             <td class="renglones" width="70px"><b>Respuesta:</b></td>
					             <td class="renglones"><b>Aprobacion:</b></td>
					             <td class="renglones"><b>Observaciones:</b></td>
					             <td class="renglones">&nbsp;</td>
				            </tr>
				       <c:forEach begin = "0" items = "${requestScope.lista}" var = "cam" varStatus="st" >
				       		<c:if test="${t.tipo == cam.tipo}">
                            <tr <c:if test="${st.count mod 2==0}"> class="trb" </c:if> > <td><c:out value = "${cam.solicitud}"/></td>
						         <td><c:out value = "${cam.respuesta}"/></td>
						         <td><c:out value = "${cam.aprobacion}"/></td>
						         <td><c:out value = "${cam.observaciones}"/></td>
						         <td align="center" width="20px"><img src='<c:url value="/comp/img/equis1.png"/>' onclick='eliminar(<c:out value="${cam.id}" />)'> </td>
							</tr>
						<c:set var="ban" value="${ban+1}" />
						</c:if>
       					</c:forEach>
			    </table>
			 </c:forEach>
		</form>
</c:if>

</body>
</html>