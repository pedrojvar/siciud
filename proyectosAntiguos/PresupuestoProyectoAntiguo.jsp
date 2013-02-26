<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="loginUsuario" class="cidc.general.login.Usuario" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/general.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Presupuesto Proyecto de Investigación Antiguo</title>
</head>
<script>

         var nav4=window.Event ? true : false;
	    function numeros(eve){
		var key=nav4?eve.which :eve.keyCode;
		return(key<=13 || (key>=48 && key<=57));
	    }

	    function cancelar(){
		    document.form3.fecha.value="";
		    document.form3.valor.value="";
		    document.form3.descripcion.value="";
		    document.form3.rubro.selectedIndex=0;
		    document.getElementById("nuevo").style.display='none';
		 }

	    function nuevo(){
            document.getElementById("nuevo").style.display='';
		 }

         function verTablaRubros(form){
          document.getElementById("rubros").style.display='';
         }

         function rubros(id){
            document.form2.idRubro.value=id;
            document.form2.validar.value=9;
			document.form2.submit();
		}

		function tabs(num){
		    document.formTab.validar.value = num;
			document.formTab.submit();
		 }

		function crear(){
		     if(document.form3.valor.value=="")
		     {
		      alert("Por favor digite el valor del gasto");
		      return false;
		     }
		     if(document.form3.descripcion.value=="")
		     {
		       alert("Por favor digite la descripcion del gasto");
		       return false;
		     }

		     if (document.form3.rubro.selectedIndex==0)
		     {
		       alert("Debe seleccionar el rubro");
		       return false;
		     }
		     if (document.form3.rubro.value!=1000)
             {
               if (document.form3.rubro.selectedIndex==0)
               {
                 alert("Debe seleccionar el rubro del gasto");
                 return false;
               }
               if (document.form3.tipo.selectedIndex==0)
               {
                 alert("Debe seleccionar el tipo de gasto");
                 return false;
               }
             }
		    document.form3.validar.value = 13;
			document.form3.submit();
		 }

		 function eliminar(id){
		    if (confirm("¿Realmente desea eliminar este gasto?"))
		    {
             document.form4.id.value=id;
             document.form4.validar.value = 14;
			 document.form4.submit();
			}
			return false;
	     }

	     function combos()
	   {
         document.form3.tipo.selectedIndex=0;
	     if(document.form3.rubro.selectedIndex==0)
	     {document.getElementById("select1").style.display='none';
	      document.getElementById("ti_tipo").style.display='none';}
	     else
	     {
	       if(document.form3.rubro.value==1000)
	     {document.getElementById("select1").style.display='none';
	      document.getElementById("ti_tipo").style.display='none';}
	     else
	     { document.getElementById("select1").style.display='';
	       document.getElementById("ti_tipo").style.display='';}
	    }
	    comboinventario(document.form3.tipo);
	   }

	   function comboinventario(inv)
	   {
	     if(inv.value==2)
	     {
	       document.getElementById("tab_inventario").style.display='';
	       document.getElementById("idplaca").disabled=false;
	       document.getElementById("idmarca").disabled=false;
	       document.getElementById("idserie").disabled=false;
	       document.getElementById("idobservacion").disabled=false;
	     }
	     else
	     {
	       document.getElementById("tab_inventario").style.display='none';
	       document.getElementById("idplaca").disabled=true;
	       document.getElementById("idmarca").disabled=true;
	       document.getElementById("idserie").disabled=true;
	       document.getElementById("idobservacion").disabled=true;
	     }
	   }


</script>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
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
<form name="form1">
<table class="tablas" align = "center" width="80%">
<CAPTION>Presupuesto Proyecto de Investigación Antiguo</CAPTION>
<tr>  <td class="renglones" width="120px"><b>Codigo Proyecto:</b></td>
      <td width="100px"><c:out value = "${proyectos.codigo}"/></td>
      <td class="renglones" width="100px"><b>Investigador:</b></td>
      <td><c:out value = "${proyectos.nombreInvestigador}"/></td>
</tr>
<tr>  <td class="renglones" colspan="5"><b>Nombre Proyecto:</b></td> </tr>
<tr>  <td colspan="5"><c:out value = "${proyectos.nombre}"/></td></tr>
<tr> <td colspan="4"> <table class="tablas" width="100%">
          <tr>  <td class="renglones" width="115px"><b>Total Aprobado: </b></td>
                <td class="renglones" width="130px"><b>Total Ejecutado: </b></td>
                <td class="renglones" width="100px"><b>Total Saldo: </b></td>
         </tr>
         <tr> <td align="right"><c:out value = "${proyectos.presupuesto}"/></td>
              <td align="right" width="130px"><c:out value = "${proyectos.ejecutado}"/></td>
              <td align="right"><c:out value = "${proyectos.saldo}"/></td>
         </tr>
          </table>
     </td>
</tr>
</table>
</form>
<br>

<c:if test="${!empty requestScope.listaRubrosAprobados}">
<table class="tablas" align = "center" width="80%">
<caption>lista de rubros aprobados</caption>
	<tr>
		<th><b>Rubro Aprobado</b></th>
		<th width="80px"><b>Valor</b></th>
	</tr>
	<c:forEach items="${requestScope.listaRubrosAprobados}" var="lista" varStatus="st">
	<tr <c:if test="${(st.count mod 2) ==0}">class="trb"</c:if>>
		<td><c:out value="${lista.nombre}"/></td>
		<td width="80px" align="right" ><span style="text-align: right;" id="rub<c:out value="${lista.codigo}"/>"><c:out value="${lista.valor}"/></span></td>
	</tr>
	</c:forEach>
</table>
<br>
</c:if>

<form name="form2" method="post" action='<c:url value="/proyectosAntiguos/GestProyectos.x" />'>
<table id="rubros" class="tablas" align = "center" width="80%">
<c:if test="${!empty sessionScope.listaRubros}">
<CAPTION>Rubros Ejecutados Proyecto Antiguo</CAPTION>
  <tr> <td colspan="3"> <input type="hidden" name="validar"> </td></tr>
  <tr> <th  width="270px"><b>Rubro: </b></th>
       <th width="80px"><b>Ejecutado: </b></th>
       <th width="80px"><b>Saldo: </b></th>
       <th align="center" width="20px"><b>Ver</b></th>
       <input type="hidden" name="idRubro" value="0">
  </tr>
  <c:forEach begin = "0" items = "${sessionScope.listaRubros}" var = "proyectos" varStatus="st">
  <tr <c:if test="${(st.count mod 2) ==0}">class="trb"</c:if>>
  		<td><c:out value = "${proyectos.nombreRubro}"/></td>
       <td width="80px" align="right"><c:out value = "${proyectos.sumaRubro}"/></td>
       <td width="80px" align="right"><c:out value = "${proyectos.saldoRubro}"/></td>
       <td width="20px" align="center"><img src='<c:url value="/comp/img/find.png"/>' onclick='rubros(<c:out value="${proyectos.idRubro}"/>)'></td>
 </tr>
 </c:forEach>
 </c:if>
</table>
</form>

<c:if test="${sessionScope.loginUsuario.perfil!=4}"><table width="80%" align="center"> <tr><td align="center" colspan="3"><img src='<c:url value="/comp/img/Nuevogasto.gif"/>' onclick='nuevo()'> </td></tr>
</table></c:if>
<br>

<form name="form3" method="post" action='<c:url value="/proyectosAntiguos/Llenar3.jsp" />'>
<table id="nuevo" class="tablas" align = "center" width="80%" style="display: none">
<CAPTION>Nuevo Gasto</CAPTION>
  <tr> <td colspan="3"> <input type="hidden" name="validar"> </td></tr>
  <tr> <td class="renglones" width="115px"><b>Fecha: </b></td>
       <td class="renglones"><b>Valor: </b></td>
       <td class="renglones"><b>Rubro:</b></td>
       <td class="renglones" id="ti_tipo" style="display: none"><b>Tipo:</b></td>
  </tr>
  <tr> <td><input type="text" name="fecha" size="11"  class="caj" readonly="true" id="f_date">
       <button type='button' id="id_fecha">...</button></td>
       <script type="text/javascript">
 			Calendar.setup({
   			inputField     :    'f_date',
   			ifFormat       :    '%d/%m/%Y',
   			showsTime      :    false,
   			button         :    'id_fecha',
   			singleClick    :    false,
   			step           :    1
   			})
	  </script>
	  <td><input type="text" maxlength="9" name="valor" onkeypress="return numeros(event)" size="10"></td>
	  <td>  <select name="rubro" style="width: 205px" onchange="combos()">
               <option value="0">---------------------------</option>
               <c:forEach begin = "0" items="${requestScope.rubros}" var="rub">
                          <option value='<c:out value="${rub.codigo}"/>'><c:out value="${rub.nombre}"/> </option>
               </c:forEach>
            </select>
	  </td>
	  <td  id="select1" style="display: none">  <select name="tipo" style="width: 100%" id="tipoc" onchange="comboinventario(this)">
	           <option value="5">---------------</option>
               <option value="1">Contrataciones</option>
               <option value="2">Inventario</option>
               <option value="3">Fungibles</option>
               <option value="4">Avances</option>
            </select>
	  </td>
  </tr>
  <tr> <td class="renglones" colspan="4"><b>Descripcion: </b></td> </tr>
  <tr> <td colspan="4"><textarea name="descripcion" style="width: 99%" class="texto"></textarea></td></tr>
  <tr> <td class="renglones" colspan="4"><b>Observacion: </b></td> </tr>
  <tr> <td colspan="4"><textarea name="observ" style="width: 99%" class="texto"></textarea></td></tr>

  <tr id="tab_inventario" style="display: none"><td colspan="4">
  <table class="tablas" width="100%">
  <caption>Inventario</caption>
      <tr><td></td></tr>
      <tr>   <td class="renglones" width="65px"><b>Placa:</b></td>
             <td class="renglones"><b>Marca:</b></td>
             <td class="renglones"><b>Serie:</b></td>
      </tr>
      <tr>  <td><input type="text" maxlength="9" name="placa" size="10" id="idplaca"></td>
            <td><input type="text" name="marca" style="width: 95%" id="idmarca"></td>
            <td><input type="text" name="serie" style="width: 95%" id="serie"></td>
      </tr>
      <tr> <td class="renglones" colspan="3"><b>Observación:</b></td> </tr>
     <tr> <td colspan="3"><textarea name="observacion" style="width: 99%" id="idobservacion"></textarea></td></tr>
  </table>
  </td></tr>
  <tr>  <td align="center" colspan="4">
                  <img src='<c:url value="/comp/img/Registrar.gif"/>' onclick='crear()'>
                  <img src='<c:url value="/comp/img/Cancelar.gif"/>' onclick='cancelar()'>
       </td>
  </tr>
</table>
</form>


<form name="form4" method="post" action='<c:url value="/proyectosAntiguos/GestProyectos.x" />'>
<c:if test="${!empty requestScope.lista1}">
<table id="gastos" class="tablas" align = "center" width="95%">
<CAPTION>Rubro: <c:out value = "${requestScope.nombreRubro}"/></CAPTION>
<input type="hidden" name="validar">
<input type="hidden" name="id">
  <tr> <td class="renglones" width="10px" align="center"><b>Nº</b></td>
       <td class="renglones" width="70px"><b>Fecha: </b></td>
       <td class="renglones" width="60px"><b>Valor: </b></td>
       <td class="renglones"><b>Descripcion: </b></td>
       <td class="renglones"><b>Observacion: </b></td>
       <c:if test="${sessionScope.loginUsuario.perfil!=4}"><td class="renglones" width="10px"></td></c:if>
  </tr>
 <c:forEach begin = "0" items = "${requestScope.lista1}" var = "gastos" varStatus="st">
  <tr <c:if test="${st.count mod 2==0}"> class="trb" </c:if> >
       <td class="renglones" align="center"><b><c:out value="${st.count}"/></b></td>
       <td align="center"><c:if test="${gastos.fecha != null}"><c:out value = "${gastos.fecha}"/></c:if><c:if test="${gastos.fecha == null}">-</c:if></td>
       <td align="right"><c:out value = "${gastos.valor}"/></td>
       <td><c:out value = "${gastos.descripcion}"/></td>
       <td><c:out value = "${gastos.observ}"/></td>
       <c:if test="${sessionScope.loginUsuario.perfil!=4}"><td align="center" width="10px"><img src='<c:url value="/comp/img/equis1.png"/>' onclick='eliminar(<c:out value="${gastos.idGastos}" />)'> </td></c:if>
 </tr>
 </c:forEach>
</table>
</c:if>
</form>

<table align="center" width="100%">
  <tr> <td> <iframe frameborder="0" marginheight="1px" width="100%" name="frameRegistro" id="frameRegistro"> </iframe> </td> </tr>
</table>

</body>
</html>