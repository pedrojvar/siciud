<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<c:import url="/general.jsp"/>
<script>
	function cambiar_combo(){

	if (document.form1.categoria.value!=0)
	{
		document.getElementById("tipo").style.display='';
		document.getElementById("titulotipo").style.display='';
 	}
 	else {document.getElementById("tipo").style.display='none';	}

	//borrar info del combo2
		for(var i = document.form1.tipo.length - 1; i >= 0; i--)
		{
			if(navigator.appName == "Netscape")
                document.form1.tipo.options[i] = null;
            else
                document.form1.tipo.remove(i);
        }

	//llenar info en combo 2 segun info del combo 1;

        document.form1.tipo.options[0] = new Option("-------------------","0");
        if(document.form1.categoria.value=="1"){
            document.form1.tipo.options[1] = new Option("Nacional","1");
            document.form1.tipo.options[2] = new Option("Internacional","2");
        }

       if(document.form1.categoria.value=="3"){
            document.form1.tipo.options[1] = new Option("Entradas ","1");
            document.form1.tipo.options[2] = new Option("Procesos","2");
            document.form1.tipo.options[3] = new Option("Salidas","3");
        }

        if(document.form1.categoria.value=="4"){
            document.form1.tipo.options[1] = new Option("Plana","1");
            document.form1.tipo.options[2] = new Option("AmCharts","2");
        }
    }

    function guardar()
    {
    	if(document.form1.categoria.selectedIndex==0)
    	{
    		alert("Seleccione Categoria");
    		return false;
    	}
    	if(document.form1.descripcion.value == '')
    	{
    		alert("Por favor digite la descripcion del documento");
    		return false;
    	}

    	if(document.form1.observaciones.value == '')
    	{
    		alert("Por favor digite las Observaciones acerca del documento");
    		return false;
    	}

    	document.form1.submit();
    }
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="form1" method="post" action='<c:url value="/docsIndicadores/AdminDocs.x?accion=4"/>'>
	<table class="tablas" width="80%" align="center">
	<caption>PASO 1: INFORMACION DEL DOCUMENTO</caption>
	<tr>
		<td class="renglones" width="150px"><b>Usuario:</b></td>
		<td><c:out value="${sessionScope.loginUsuario.nombre}" /></td>
		<td class="renglones" width="100px"><b>Categoria:</b></td>
		<td><select name="categoria" onchange="cambiar_combo()">
			<option value="0">-------------------</option>
			<option value="1">Libros</option>
			<option value="2">Articulos</option>
			<option value="3">Documentos Soporte</option>
			<option value="4">Presentaciones</option>
			<option value="5">Politicas</option>
			<option value="6">Reglamentacion UD</option>
			<option value="7">Mapas Mentales</option>
			<option value="8">Borradores de Libro</option>
		</select>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px" id="titulotipo" style="display:none"><b>Subcategoria:</b></td>
		<td id="tipo" style="display:none"><select name="tipo">
			<option value="0">----</option>
		</select>
		</td>
	</tr>
	<tr>
		<td colspan="4" class="renglones" width="150px"><b>Descripcion y/o título del Documento:</b></td>
	</tr>
	<tr>
		<td colspan="4"><textarea style="width:100%" name="descripcion" class="texto"></textarea></td>
	</tr>
	<tr>
		<td colspan="4" class="renglones" width="150px"><b>Observaciones:</b></td>
	</tr>
	<tr>
		<td colspan="4"><textarea style="width:100%" name="observaciones" class="texto"></textarea></td>
	</tr>
	<tr>
		<td colspan="4" align="center"><img src='<c:url value="/comp/img/Siguiente.gif"/>' onclick="guardar()"></td>
	</tr>
	</table>
</form>
</body>
</html>