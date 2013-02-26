<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<c:import url="/general.jsp"/>
<script>
	var nav4=window.Event ? true : false;

	function soloNumeros(eve){
		var key=nav4?eve.which :eve.keyCode;
		return((key>=48 && key<=57) || key==13 || key==7 || key==8);
	}
	function guardar()
    {
    	document.form1.submit();
    }
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="form1" method="post" action='<c:url value="/Indicadores/docsIndicadores/llenar.jsp?accion=1"/>'>
	<input type="hidden" name="idrae" value='<c:out value="${sessionScope.obj.idrae}" />'/>
	<input type="hidden" name="iddoc" value='<c:out value="${sessionScope.obj.iddoc}" />'/>
	<table class="tablas" width="100%" align="center" border="0">
	<caption>EDITAR RAE</caption>
	<tr>
		<td class="renglones" width="150px"><b>Apellidos del Autor(es):</b></td>
		<td>
			<input style="width:80%" name="apellidos" type="text" class="texto" value='<c:out value="${sessionScope.obj.apellidos}" />'/>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Nombres del Autor(es):</b></td>
		<td>
			<input style="width:80%" name="nombres" type="text" class="texto" value='<c:out value="${sessionScope.obj.nombres}" />'/>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Título:</b></td>
		<td>
			<input style="width:80%" name="titulo" type="text" class="texto" value='<c:out value="${sessionScope.obj.titulo}" />'/>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Fecha de Publicación:</b></td>
		<td>
			<input type='text' name='fechapublicacion' class='caj' readonly='true' id='f_date_a' size='13' value='<c:out value="${sessionScope.obj.fechapublicacion}" />'>
				<button type='button' id='f_trigger_a'>...</button>
				<script type='text/javascript'>
	    			Calendar.setup({
		    			inputField     :    'f_date_a',
		    			ifFormat       :    '%d/%m/%Y',
		    			showsTime      :    false,
		    			button         :    'f_trigger_a',
		    			singleClick    :    false,
		    			step           :    1
	    			})
    			</script>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Casa editorial:</b></td>
		<td>
			<input style="width:80%" name="editorial" type="text" class="texto" value='<c:out value="${sessionScope.obj.editorial}" />'/>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Número de Páginas:</b></td>
		<td>
			<input style="width:10%" name="numeropaginas" type="text" class="texto" value='<c:out value="${sessionScope.obj.numeropaginas}" />' onKeyPress='return soloNumeros(event)'/>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Dirección web del Documento:</b></td>
		<td>
			<input style="width:80%" name="dirweb" type="text" class="texto" value='<c:out value="${sessionScope.obj.dirweb}" />'/>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Fecha exacta de acceso al documento:</b></td>
		<td>
			<input type='text' name='fechaacceso' class='caj' readonly='true' id='f_date_a1' size='13' value='<c:out value="${sessionScope.obj.fechaacceso}" />'>
				<button type='button' id='f_trigger_a1'>...</button>
				<script type='text/javascript'>
	    			Calendar.setup({
		    			inputField     :    'f_date_a1',
		    			ifFormat       :    '%d/%m/%Y',
		    			showsTime      :    false,
		    			button         :    'f_trigger_a1',
		    			singleClick    :    false,
		    			step           :    1
	    			})
    			</script>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Sintesis global del contenido:</b></td>
		<td>
			<textarea style="width:100%" name="sintesisglobal" type="text" class="texto" cols="60" rows="5" value='<c:out value="${sessionScope.obj.sintesisglobal}" />'></textarea>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Idea Central del Texto:</b></td>
		<td>
			<textarea style="width:100%" name="ideacentral" type="text" class="texto" cols="60" rows="5" value='<c:out value="${sessionScope.obj.ideacentral}" />'></textarea>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Pagina de la Idea Central:</b></td>
		<td>
			<input style="width:10%" name="paginaideacentral" type="text" class="texto" value='<c:out value="${sessionScope.obj.paginaideacentral}" />' onKeyPress='return soloNumeros(event)'/>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Conceptos y Categorias:</b></td>
		<td>
			<textarea style="width:100%" name="conceptoscategorias" type="text" class="texto" cols="60" rows="5" value='<c:out value="${sessionScope.obj.conceptoscategorias}" />'></textarea>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Referencia Externa N. 1:</b></td>
		<td>
			<input style="width:80%" name="ref1" type="text" class="texto" value='<c:out value="${sessionScope.obj.ref1}" />'/>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Referencia Externa N. 2:</b></td>
		<td>
			<input style="width:80%" name="ref2" type="text" class="texto" value='<c:out value="${sessionScope.obj.ref2}" />'/>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Referencia Externa N. 3:</b></td>
		<td>
			<input style="width:80%" name="ref3" type="text" class="texto" value='<c:out value="${sessionScope.obj.ref3}" />'/>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Referencia Externa N. 4:</b></td>
		<td>
			<input style="width:80%" name="ref4" type="text" class="texto" value='<c:out value="${sessionScope.obj.ref4}" />'/>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Valoración Crítica:</b></td>
		<td>
			<textarea style="width:100%" name="valoracioncritica" type="text" class="texto" cols="60" rows="5" value='<c:out value="${sessionScope.obj.valoracioncritica}" />'></textarea>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Volúmen:</b></td>
		<td>
			<input style="width:10%" name="volumen" type="text" class="texto" value='<c:out value="${sessionScope.obj.volumen}" />' onKeyPress='return soloNumeros(event)'/>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px"><b>Número de Capítulo o Seccion:</b></td>
		<td>
			<input style="width:10%" name="numcapitulo" type="text" class="texto" value='<c:out value="${sessionScope.obj.numcapitulo}" />' onKeyPress='return soloNumeros(event)'/>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardar()"></td>
		<td colspan="2" align="center"><img src='<c:url value="/comp/img/Atras.gif"/>' onclick="history.go(-1)"></td>
	</tr>
	</table>
</form>
</body>
</html>