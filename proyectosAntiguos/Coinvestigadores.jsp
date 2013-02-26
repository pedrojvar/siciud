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

		 function nuevo(){
            document.getElementById("nuevo").style.display='';
           	document.form2.validar.value = 11;
   		    document.getElementById("boton").style.display='none';
		 }

		 function actualizar(id){
		    document.form1.idCoinv.value=id;
            document.form1.validar.value = 17;
			document.form1.submit();
		 }

		 function cancelar(){
		    document.getElementById("boton").style.display='';
		    document.form2.nombres.value="";
		    document.form2.apellidos.value="";
		    document.form2.fechaIngreso.value="";
  		    document.form2.fechaSalida.value="";
  		    document.form2.rol.selectedIndex=0;
		    document.getElementById("nuevo").style.display='none';
		 }

		 function crear(){
		     if(document.form2.nombres.value=="")
		     {
		      alert("Por favor digite el o los nombres del coinvestigador o auxiliar");
		      return false;
		     }
		     if(document.form2.apellidos.value=="")
		     {
		       alert("Por favor digite los apellidos del coinvestigador o auxiliar");
		       return false;
		     }
		      if (document.form2.rol.selectedIndex==0)
               {
                 alert("Debe seleccionar el rol del integrante");
                 return false;
               }
			document.form2.submit();
		 }

		 function eliminar(idCoinv){
		 if (confirm("¿Realmente desea eliminar este integrante?"))
		    {
            document.form1.idCoinv.value=idCoinv;
            document.form1.validar.value = 12;
			document.form1.submit();
			}
	     }

</script>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<c:import url="/general.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Coinvestigadores/Auxiliares</title>
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

<form name="form2" method="post" action='<c:url value="/proyectosAntiguos/Llenar2.jsp" />'>
<input type="hidden" name="validar" value='<c:out value="${requestScope.accion}"/>'>
<input type="hidden" name="idCoinv" value='<c:out value = "${requestScope.coinv.id}"/>'>
<table id="nuevo" class="tablas" align = "center" width="95%" <c:if test="${requestScope.coinv.id == null}">style="display:none"</c:if>>
<CAPTION>Coinvestigador/Auxiliar</CAPTION>
  <tr> <td class="renglones"><b>Nombres: </b></td>
       <td class="renglones"><b>Apellidos: </b></td>
       <td class="renglones" width="110px"><b>Rol:</b></td>
       <td class="renglones"><b>Ingreso: </b></td>
       <td><input type="text" name="fechaIngreso" size="11"  class="caj" readonly="true" id="f_date1" value='<c:out value = "${requestScope.coinv.fechaIngreso}"/>'></td>
       <td><button type='button' id="id_fecha1">...</button></td>
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
  </tr>
  <tr> <td> <input style="width: 90%" type="text" name="nombres" value='<c:out value = "${requestScope.coinv.nombres}"/>'> </td>
       <td> <input style="width: 90%" type="text" name="apellidos" value='<c:out value = "${requestScope.coinv.apellidos}"/>'> </td>
       <td> <select name="rol" style="width: 100%">
            <option value="0">-------------------</option>
            <option value="1" <c:if test="${requestScope.coinv.rol==1}">selected</c:if>>Coinvestigador</option>
          	<option value="2" <c:if test="${requestScope.coinv.rol==2}">selected</c:if>>Auxiliar </option>
            </select>
       </td>
       <td class="renglones"><b>Salida: </b></td>
       <td><input type="text" name="fechaSalida" size="11"  class="caj" readonly="true" id="f_date2" value='<c:out value = "${requestScope.coinv.fechaSalida}"/>'></td>
       <td><button type='button' id="id_fecha2">...</button></td>
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
  </tr>
  <tr>  <td align="center" width="30px" colspan="6">
                  <img src='<c:url value="/comp/img/Registrar.gif"/>' onclick='crear()'>
                  <img src='<c:url value="/comp/img/Cancelar.gif"/>' onclick='cancelar()'>
       </td>
  </tr>
</table>
</form>

<br>
<c:if test="${sessionScope.loginUsuario.perfil!=5}"><table width="95%"><tr id="boton"><td align="center"><br><img src='<c:url value="/comp/img/NuevoIntegrante.gif"/>' onclick='nuevo()'> </td></tr></table></c:if>
<form name="form1" method="post" action='<c:url value="/proyectosAntiguos/GestProyectos.x" />'>
<input type="hidden" name="idCoinv">
<input type="hidden" name="validar">
<c:if test="${empty requestScope.lista}">
	<br>
		<h5 align="center">Este proyecto no tiene Coinvestigadores o Auxiliares</h5>
	</c:if>
<table class="tablas" align = "center" width="95%">
<c:if test="${!empty requestScope.lista}">
<CAPTION>Coinvestigadores/Auxiliares Proyecto Antiguo</CAPTION>
  <tr> <td class="renglones" width="15px" align="center"><b>Nº</b></td>
       <td class="renglones"><b>Nombres: </b></td>
       <td class="renglones"><b>Apellidos: </b></td>
       <td class="renglones" width="100px"><b>Rol:</b></td>
       <td class="renglones" width="85px"><b>Ingreso:</b></td>
       <td class="renglones" width="85px"><b>Salida:</b></td>
       <c:if test="${sessionScope.loginUsuario.perfil!=5}"><td class="renglones">&nbsp;</td></c:if>
       <c:if test="${sessionScope.loginUsuario.perfil!=5}"><td class="renglones">&nbsp;</td></c:if>
  </tr>

 <c:forEach begin = "0" items = "${requestScope.lista}" var = "coi" varStatus="st">
  <tr <c:if test="${st.count mod 2==0}"> class="trb" </c:if> >
       <td class="renglones" align="center"><b><c:out value="${st.count}"/></b></td>
       <td> <c:out value = "${coi.nombres}"/></td>
       <td> <c:out value = "${coi.apellidos}"/> </td>
       <td align="center"> <c:if test="${coi.rol == 1}">Coinvestigador</c:if>
            <c:if test="${coi.rol == 2}">Auxiliar</c:if>
       </td>
       <td align="center"> <c:if test="${coi.fechaIngreso != null}"><c:out value = "${coi.fechaIngreso}"/></c:if> <c:if test="${coi.fechaIngreso == null}"> - </c:if></td>
       <td align="center"> <c:if test="${coi.fechaSalida != null}"><c:out value = "${coi.fechaSalida}"/></c:if> <c:if test="${coi.fechaSalida == null}"> - </c:if></td>
       <c:if test="${sessionScope.loginUsuario.perfil!=5}"><td align="center" width="20px"><img src='<c:url value="/comp/img/insc.gif"/>' onclick='actualizar(<c:out value="${coi.id}" />)'> </td> </c:if>
       <c:if test="${sessionScope.loginUsuario.perfil!=5}"><td align="center" width="20px"><img src='<c:url value="/comp/img/equis1.png"/>' onclick='eliminar(<c:out value="${coi.id}" />)'> </td></c:if>
 </tr>
 </c:forEach>

 </c:if>
</table>
</form>

</body>
</html>