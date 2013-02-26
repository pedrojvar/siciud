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
    	if(document.form1.opcion.value==1)
    	{
    		if(document.form1.tipoarchivo.selectedIndex==0)
    		{
	    		alert("Seleccione Tipo de Archivo");
	    		return false;
	    	}
    	}

    	if(document.form1.opcion.value==2)
    	{
	    	if(document.form1.categoria.selectedIndex==0)
	    	{
	    		alert("Seleccione Categoria");
	    		return false;
	    	}
	    }
		document.form1.submit();
    }

    function mostrar(bandera)
    {
		document.form1.opcion.value=bandera;
    	if(bandera == 1)
    	{
 			document.getElementById("titulotipoarchivo").style.display='';
 			document.getElementById("tipoarchivo").style.display='';
 			document.getElementById("titulocategoria").style.display='none';
 			document.getElementById("categoria").style.display='none';
 			document.getElementById("tipo").style.display='none';
 			document.getElementById("titulotipo").style.display='none';
 			document.getElementById("boton").style.display='';
		}

		if(bandera == 2)
    	{
    		document.getElementById("titulotipoarchivo").style.display='none';
 			document.getElementById("tipoarchivo").style.display='none';
    		document.getElementById("titulocategoria").style.display='';
 			document.getElementById("categoria").style.display='';
 			document.getElementById("tipo").style.display='none';
 			document.getElementById("titulotipo").style.display='none';
 			document.getElementById("boton").style.display='';
		}

		if(bandera == 3)
    	{
	    	document.getElementById("titulotipoarchivo").style.display='none';
 			document.getElementById("tipoarchivo").style.display='none';
    		document.getElementById("titulocategoria").style.display='none';
 			document.getElementById("categoria").style.display='none';
 			document.getElementById("tipo").style.display='none';
 			document.getElementById("titulotipo").style.display='none';
 			document.getElementById("boton").style.display='';
		}
    }
</script>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="form1" method="post" action='<c:url value="/docsIndicadores/AdminDocs.x?accion=3"/>'>
	<input type="hidden" name="opcion" value="0">
	<table class="tablas" width="80%" align="center">
	<caption>BUSQUEDA DE DOCUMENTOS</caption>
	<tr>
		<td><input name="tipobusqueda" type="radio" value="1" onclick="mostrar(1)"/><b>Busqueda por Tipo</b></td>
		<td><input name="tipobusqueda" type="radio" value="2" onclick="mostrar(2)"/><b>Busqueda por Categoria</b></td>
		<td><input name="tipobusqueda" type="radio" value="3" onclick="mostrar(3)"/><b>Busqueda General</b></td>
	</tr>
	<tr>
		<td class="renglones" width="150px" id="titulotipoarchivo" style="display:none"><b>Tipo de Archivo:</b></td>
		<td><select id="tipoarchivo" name="tipoarchivo" style="display:none">
			<option value="0">-----------</option>
			<option value="1">Pdf</option>
			<option value="2">Excel</option>
			<option value="3">Power Point</option>
			<option value="4">Word</option>
			<option value="5">Xmind</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="renglones" width="150px" id="titulocategoria" style="display:none"><b>Categoria:</b></td>
		<td><select id="categoria" name="categoria" onchange="cambiar_combo()" style="display:none">
			<option value="0">--------</option>
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
		<td colspan="3" align="center" style="display:none" id="boton"><img src='<c:url value="/comp/img/Buscar.gif"/>' onclick="guardar()"></td>
	</tr>
</table>
</form>
</body>
</html>