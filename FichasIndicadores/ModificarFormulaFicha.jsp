<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<html>
<head>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<script>

	function agregar(x)
	{
	/*alert(x);*/

		if(x=='variable')
		{
		   document.form1.formula.value = document.form1.formula.value + '['+document.form1.variable.value+']';
		   document.getElementById("combo").style.display='none';
		   document.getElementById("cargar").style.display='none';
		   operador('mostrar');
		   numeros('ocultar');
		   document.getElementById(")").style.display='';
		   document.getElementById("(").style.display='none';
		   document.getElementById("0").style.display='none';
		}
		if(x=='cancelar')
		{

		   document.form1.formula.value = '';
		   document.getElementById("combo").style.display='';
   		   document.getElementById("cargar").style.display='';
		   operador('ocultar');
		   numeros('mostrar');
		   document.getElementById(")").style.display='';
		   document.getElementById("(").style.display='';
		   document.getElementById("0").style.display='';

		}
		if(x=='+' || x=='-' || x=='*' || x=='/')
		{  document.form1.formula.value = document.form1.formula.value + x;
		   operador('ocultar');
		   numeros('mostrar');
		   document.getElementById("combo").style.display='';
		   document.getElementById("cargar").style.display='';
		   document.getElementById(")").style.display='';
		   document.getElementById("(").style.display='';
		   document.getElementById("0").style.display='';

		   if(x=='/')
		     {
		       document.getElementById("0").style.display='none';
	      	     }
		}

		if(x=='(')
		{
		  document.form1.formula.value = document.form1.formula.value + x;
		}
		if(x==')')
		{
		  document.form1.formula.value = document.form1.formula.value + x;
		}

		if(x=='1' || x=='2' || x=='3' || x=='4' || x=='5' || x=='6' || x=='7' || x=='8' || x=='9' || x=='0')
		{  document.form1.formula.value = document.form1.formula.value + x;
 		   operador ('mostrar');
		   document.getElementById(")").style.display='';
		   document.getElementById("0").style.display='';
		   document.getElementById("combo").style.display='none';
		   document.getElementById("cargar").style.display='none';
		   document.getElementById("(").style.display='none';
		}
	}

	function operador (opcion)
	{
	   if(opcion=='mostrar')
	   {
	    document.getElementById("+").style.display='';
	    document.getElementById("-").style.display='';
	    document.getElementById("*").style.display='';
	    document.getElementById("/").style.display='';
	   }
	   if(opcion=='ocultar')
	   {
	    document.getElementById("+").style.display='none';
	    document.getElementById("-").style.display='none';
	    document.getElementById("*").style.display='none';
	    document.getElementById("/").style.display='none';
  	   }
	}

	function numeros (opcion)
	{
	   if(opcion=='mostrar')
	   {

  	    document.getElementById("1").style.display='';
	    document.getElementById("2").style.display='';
	    document.getElementById("3").style.display='';
	    document.getElementById("4").style.display='';
	    document.getElementById("5").style.display='';
	    document.getElementById("6").style.display='';
	    document.getElementById("7").style.display='';
	    document.getElementById("8").style.display='';
	    document.getElementById("9").style.display='';
	   }
	   if(opcion=='ocultar')
	   {
	    document.getElementById("1").style.display='none';
	    document.getElementById("2").style.display='none';
	    document.getElementById("3").style.display='none';
	    document.getElementById("4").style.display='none';
	    document.getElementById("5").style.display='none';
	    document.getElementById("6").style.display='none';
	    document.getElementById("7").style.display='none';
	    document.getElementById("8").style.display='none';
	    document.getElementById("9").style.display='none';

    	   }

	}

	function guardar()
	{
		var mensaje="";
    	if(document.form1.formula.value == '')
    	{
    		mensaje = mensaje + "	1) Seleccione fórmula para el Indicador\n";
    	}
    	if(mensaje!="")
		{
			mensaje="Por favor revise los siguientes campos que presentan algún problema: \n"+mensaje;
			alert (mensaje);
		}
		else
		{
			if(confirm('¿Esta seguro de modificar estos datos?'))
			{
				document.form1.submit();
			}
		}
	}
</script>
</head>
<c:import url="/general.jsp"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" type="time" timeStyle="short" pattern="yyyy/MM/dd" var="ano"/>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="form1" method="post" action='<c:url value="/FichasIndicadores/llenarFormula.jsp"/>'>
<table class="tablas" width="95%" align="center">
<input type="hidden" name="accion" value="8"/>
<input type="hidden" name="banderaFormula" value="3"/>
	<caption>MODIFICACIÓN DE FORMULAS PARA LA FICHA DE INDICADORES</caption>
		<td colspan="8">
			<table class="tablas" width="70%" align="center">
				<tr>
					<td><a class="menu" href='<c:url value="/FichasIndicadores/ModificarFicha.jsp"/>'>Modificar Información</a></td>
					<td><a class="menu" href='<c:url value="/FichasIndicadores/ModificarVariablesFicha.jsp"/>'>Modificar Variables</a></td>
					<td><a class="menu" href='<c:url value="/FichasIndicadores/ModificarFormulaFicha.jsp"/>'>Modificar Fórmula</a></td>
				</tr>
			</table>
		</td>
		<tr>
			<td colspan="8" align="center"><textarea style="width:95%;height:50px" name="formula" readonly="readonly"><c:out value="${sessionScope.ficha.formula}" /></textarea></td>
		</tr>
		<tr>
			<td style="width: 50%;" align="center">
			<br>
				<table class="tablas" border="0">
					<tr>
						<td class="texto" align="center"><img id="1" src='<c:url value="/comp/img/1.gif"/>' onclick="agregar(1)"></td>
						<td class="trb" align="center"><img id="2" src='<c:url value="/comp/img/2.gif"/>' onclick="agregar(2)"></td>
						<td class="texto" align="center"><img id="3" src='<c:url value="/comp/img/3.gif"/>' onclick="agregar(3)"></td>
						<td class="trb" align="center"><img id="+" style="display: none"  src='<c:url value="/comp/img/+.gif"/>' onclick="agregar('+')" ></td>
					</tr>
					<tr>
						<td class="trb" align="center"><img id="4" src='<c:url value="/comp/img/4.gif"/>' onclick="agregar(4)"></td>
						<td class="texto" align="center"><img id="5" src='<c:url value="/comp/img/5.gif"/>' onclick="agregar(5)"></td>
						<td class="trb" align="center"><img id="6" src='<c:url value="/comp/img/6.gif"/>' onclick="agregar(6)"></td>
						<td class="texto" align="center"><img id="-" style="display: none"  src='<c:url value="/comp/img/-.gif"/>' onclick="agregar('-')"></td>
					</tr>
					<tr>
						<td class="texto" align="center"><img id="7" src='<c:url value="/comp/img/7.gif"/>' onclick="agregar(7)"></td>
						<td class="trb" align="center"><img id="8" src='<c:url value="/comp/img/8.gif"/>' onclick="agregar(8)"></td>
						<td class="texto" align="center"><img id="9" src='<c:url value="/comp/img/9.gif"/>' onclick="agregar(9)"></td>
						<td class="trb" align="center"><img id="*" style="display: none"  src='<c:url value="/comp/img/x.gif"/>' onclick="agregar('*')"></td>
					</tr>
					<tr>
						<td class="trb" align="center"><img id="(" src='<c:url value="/comp/img/(.gif"/>' onclick="agregar('(')"></td>
						<td class="texto" align="center"><img id="0" src='<c:url value="/comp/img/0.gif"/>' onclick="agregar(0)"></td>
						<td class="trb" align="center"><img id=")" src='<c:url value="/comp/img/).gif"/>' onclick="agregar(')')"></td>
						<td class="texto" align="center"><img id="/" style="display: none"  src='<c:url value="/comp/img/d.gif"/>' onclick="agregar('/')"></td>
					</tr>
				</table>
			</td>
			<td style="width: 50%;" valign="top">
				<table>
					<tr>
						<td class="lroja"><b>Seleccione variable para agregar a la Fórmula:</b></td>
					</tr>
					<tr>
						<td>
						<select id="combo" name="variable" class="texto" >
							<c:forEach items="${sessionScope.ficha.variables}" begin="0" var="lista" varStatus="st">
								<option value='<c:out value="${lista}"/>'><c:out value="${lista}"/> </option>
							</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td class="texto" id="cargar" align="center"><img src='<c:url value="/comp/img/Cargar.gif"/>' onclick="agregar('variable')"></td>
						<td class="texto" align="center"><img src='<c:url value="/comp/img/Cancelar.gif"/>' onclick="agregar('cancelar')"></td>
					</tr>
				</table>
			</td>
		</tr>

		<tr>
			<td class="texto" colspan="8" align="center"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardar()"></td>
		</tr>
</table>
</form>
</body>
</html>