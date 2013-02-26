<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<link type='text/css' rel='stylesheet' media='all' href='<c:url value="/comp/js/Calendario/calendar-blue2.css"/>' title='win2k-cold-1' />
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/lang/calendar-es.js"/>'></script>
<script type='text/javascript' src='<c:url value="/comp/js/Calendario/calendar-setup.js"/>'></script>
<script type="text/javascript" src='<c:url value="/comp/js/Tooltip/libtooltip/prototype/prototype.js"/>'></script>
<script type="text/javascript" src=<c:url value="/comp/js/Tooltip/libtooltip/libtooltip/scriptaculous/scriptaculous.js"/>'></script>
<script type="text/javascript" src='<c:url value="/comp/js/Tooltip/srctooltip/HelpBalloon.js"/>'></script>

<script>

	HelpBalloon.Options.prototype = Object.extend(HelpBalloon.Options.prototype,
		{
			icon: '<c:url value="/comp/img/tooltip.png"/>',
			button: '<c:url value="/comp/img/button.png"/>',
			balloonPrefix: '<c:url value="/comp/img/balloon-"/>'
		});


	function tooltip(tipo)
	{
	    var x='<c:url value="/FichasIndicadores/AyudaTooltip.jsp?tipo=' + tipo + '"/>'
	    /*alert(x);*/
	    /**/
        var hb4 = new HelpBalloon
			  ({
	  		  dataURL: x
			  });
	}

	function cambiar_combo1(){

	if (document.form1.modelo.value!=0)
	{
		document.getElementById("proceso").style.display='';
		document.getElementById("tituloproceso").style.display='';
	}
 	else
 	{
 		document.getElementById("proceso").style.display='none';
 		document.getElementById("tituloproceso").style.display='none';
 		document.getElementById("subproceso").style.display='none';
 		document.getElementById("titulosubproceso").style.display='none';
 	}

	//borrar info del combo proceso
		for(var i = document.form1.proceso.length - 1; i >= 0; i--)
		{
			if(navigator.appName == "Netscape")
                document.form1.proceso.options[i] = null;
            else
                document.form1.proceso.remove(i);
        }

      //borrar info del combo subproceso
		for(var j = document.form1.subproceso.length - 1; j >= 0; j--)
		{
			if(navigator.appName == "Netscape")
                document.form1.subproceso.options[j] = null;
            else
                document.form1.subproceso.remove(j);
        }
        document.form1.identificador.value="";


	//llenar info en combo proceso segun info del combo modelo;

        document.form1.proceso.options[0] = new Option("------------------------------------------------","0");
        if(document.form1.modelo.value=="1")
        {
       		document.form1.proceso.options[1] = new Option("Recursos del Sistema de Investigaciones","1");
            document.form1.proceso.options[2] = new Option("Estructuras de Investigación","2");
            document.form1.proceso.options[3] = new Option("Resultados del Sistema de Investigación","3");
            document.form1.identificador.value="Inv";
        }

       if(document.form1.modelo.value=="2")
       {
       		document.form1.proceso.options[1] = new Option("Direccionamiento Estratégico","1");
            document.form1.proceso.options[2] = new Option("Gestión de la Calidad","2");
            document.form1.proceso.options[3] = new Option("Control Institucional","3");
            document.form1.proceso.options[4] = new Option("Docencia","4");
            document.form1.proceso.options[5] = new Option("Extensión y Proyección Social","5");
            document.form1.proceso.options[6] = new Option("Investigación","6");
            document.form1.proceso.options[7] = new Option("Admisiones, registro y Control","7");
            document.form1.proceso.options[8] = new Option("Bienestar Medio y Vida Universitaria","8");
            document.form1.proceso.options[9] = new Option("Gestión de la Información Bibliográfica","9");
            document.form1.proceso.options[10] = new Option("Gestión de Laboratorios","10");
            document.form1.proceso.options[11] = new Option("Servicio al Ciudadano","11");
            document.form1.proceso.options[12] = new Option("Gestión y Desarrollo del Talento Humano","12");
            document.form1.proceso.options[13] = new Option("Gestión de la Información y las Comunicaciones","13");
            document.form1.proceso.options[14] = new Option("Gestión de Infraestructura Física","14");
            document.form1.proceso.options[15] = new Option("Gestión de Recursos Financieros","15");
            document.form1.proceso.options[16] = new Option("Gestión Contractual","16");
            document.form1.proceso.options[17] = new Option("Gestión Jurídica","17");

            document.form1.identificador.value="Sig";
       }

        if(document.form1.modelo.value=="3"){
        	document.form1.proceso.options[1] = new Option("De la misión","1");
            document.form1.proceso.options[2] = new Option("Soporte y Gestión","2");
            document.form1.identificador.value="Sue";
        }

        if(document.form1.modelo.value=="4"){
        	document.form1.proceso.options[1] = new Option("Proceso 1 Acreditación","1");
            document.form1.proceso.options[2] = new Option("Proceso 2 Acreditación","2");
            document.form1.proceso.options[3] = new Option("Proceso 3 Acreditación","3");
            document.form1.identificador.value="Acre";
        }
    }

    function cambiar_combo2()
    {
		if (document.form1.proceso.value!=0)
		{
			document.getElementById("subproceso").style.display='';
			document.getElementById("titulosubproceso").style.display='';
		}

	//borrar info del combo subproceso
		for(var i = document.form1.subproceso.length - 1; i >= 0; i--)
		{
			if(navigator.appName == "Netscape")
                document.form1.subproceso.options[i] = null;
            else
                document.form1.subproceso.remove(i);
        }

   	//llenar info en combo subproceso segun info del combo modelo y proceso;

        document.form1.subproceso.options[0] = new Option("------------------------------------------------","0");
        if(document.form1.modelo.value=="1")
        {
			if(document.form1.proceso.value=="1")
	        {
	       		document.form1.subproceso.options[1] = new Option("Recurso Humano","1");
	            document.form1.subproceso.options[2] = new Option("Recurso Financiero","2");
	            document.form1.subproceso.options[3] = new Option("Recurso de Infraestruectura","3");
	            document.form1.identificador.value="InvEnt";
	        }

	       if(document.form1.proceso.value=="2"){
	       		document.form1.subproceso.options[1] = new Option("Semilleros de Investigación","1");
	            document.form1.subproceso.options[2] = new Option("Grupos de Investigación","2");
	            document.form1.subproceso.options[3] = new Option("Institutos de Investigación","3");
	            document.form1.identificador.value="InvPro";
	        }

	        if(document.form1.proceso.value=="3"){
	        	document.form1.subproceso.options[1] = new Option("Productos","1");
	            document.form1.subproceso.options[2] = new Option("Impactos","2");
	            document.form1.identificador.value="InvSal";
	        }
	    }

	    if(document.form1.modelo.value=="2")
        {
			if(document.form1.proceso.value=="1")
	        {
	       		document.form1.subproceso.options[1] = new Option("Prospectiva y Planeación Estratégica","1");
	            document.form1.subproceso.options[2] = new Option("Planeación Operativa","2");
	            document.form1.subproceso.options[3] = new Option("Internacionalización e Interinstitucionalización","3");
	            document.form1.identificador.value="SigDirEst";
	        }

	       if(document.form1.proceso.value=="2"){
	       		document.form1.subproceso.options[1] = new Option("Autoevaluación","1");
	            document.form1.subproceso.options[2] = new Option("Mejoramiento Continuo","2");
	            document.form1.identificador.value="SigGesCal";
	        }

	        if(document.form1.proceso.value=="3"){
	        	document.form1.subproceso.options[1] = new Option("Control a la Gestión","1");
	            document.form1.subproceso.options[2] = new Option("Gestión de Auditorias","2");
	            document.form1.identificador.value="SigConIns";
	        }
	        if(document.form1.proceso.value=="4")
	        {
	       		document.form1.subproceso.options[1] = new Option("Gestión Docente","1");
	            document.form1.subproceso.options[2] = new Option("Gestión Curricular","2");
	            document.form1.identificador.value="SigDoc";
	        }

	       if(document.form1.proceso.value=="5"){
	       		document.form1.subproceso.options[1] = new Option("Gestión de Actividades de Extensión","1");
	            document.form1.subproceso.options[2] = new Option("Servicios Académicos Tecnológicos y Empresariales","2");
	            document.form1.subproceso.options[3] = new Option("Proyección Social","3");
	            document.form1.identificador.value="SigExtPro";
	        }

	        if(document.form1.proceso.value=="6"){
	        	document.form1.subproceso.options[1] = new Option("Gestión e Actividades de Investigación","1");
	            document.form1.subproceso.options[2] = new Option("Gestión de Estructuras de Investigación","2");
	            document.form1.identificador.value="SigInv";
	        }
	        if(document.form1.proceso.value=="7")
	        {
	       		document.form1.subproceso.options[1] = new Option("Admisiones","1");
	            document.form1.subproceso.options[2] = new Option("Registro y Control","2");
	            document.form1.identificador.value="SigAdmReg";
	        }

	       if(document.form1.proceso.value=="8"){
	       		document.form1.subproceso.options[1] = new Option("Bienestar Medio y Vida Universitaria","1");
	            document.form1.identificador.value="SigBie";
	        }

	        if(document.form1.proceso.value=="9"){
	        	document.form1.subproceso.options[1] = new Option("Gestión de la Información Bibliográfica","1");
	            document.form1.identificador.value="SigGesBib";
	        }
	        if(document.form1.proceso.value=="10")
	        {
	       		document.form1.subproceso.options[1] = new Option("Gestión de Laboratorios","1");
	            document.form1.identificador.value="SigGesLab";
	        }

	       if(document.form1.proceso.value=="11"){
	       		document.form1.subproceso.options[1] = new Option("Atención al Ciudadano","1");
	            document.form1.subproceso.options[2] = new Option("Gestión de las Acciones Ciudadanas","2");
	            document.form1.identificador.value="SigSerCiu";
	        }

	        if(document.form1.proceso.value=="12"){
	        	document.form1.subproceso.options[1] = new Option("Gestión y Desarrollo del Talento Humano","1");
	            document.form1.identificador.value="SigGesTal";
	        }
	        if(document.form1.proceso.value=="13")
	        {
	       		document.form1.subproceso.options[1] = new Option("Gestión de TIC","1");
	            document.form1.subproceso.options[2] = new Option("Comunicación Institucional","2");
	            document.form1.subproceso.options[3] = new Option("Gestión Documental","3");
	            document.form1.identificador.value="SigTIC";
	        }

	       if(document.form1.proceso.value=="14"){
	       		document.form1.subproceso.options[1] = new Option("Gestión De Infraestructura Física","1");
	            document.form1.identificador.value="SigInfFis";
	        }

	        if(document.form1.proceso.value=="15"){
	        	document.form1.subproceso.options[1] = new Option("Gestión de Recursos Financieros","1");
	            document.form1.identificador.value="SigGesFin";
	        }
	        if(document.form1.proceso.value=="16")
	        {
	       		document.form1.subproceso.options[1] = new Option("Gestión Contractual","1");
	            document.form1.identificador.value="SigGesCon";
	        }

	       if(document.form1.proceso.value=="17"){
	       		document.form1.subproceso.options[1] = new Option("Apoyo y Asesoría","1");
	            document.form1.subproceso.options[2] = new Option("Trámite Judicial","2");
	            document.form1.identificador.value="SigGesJur";
	        }
	    }

	    if(document.form1.modelo.value=="3")
        {
			if(document.form1.proceso.value=="1")
	        {
	       		document.form1.subproceso.options[1] = new Option("Investigación","1");
	            document.form1.subproceso.options[2] = new Option("Docencia","2");
	            document.form1.subproceso.options[3] = new Option("Extensión","3");
	            document.form1.identificador.value="SueMis";
	        }

	       if(document.form1.proceso.value=="2"){
	       		document.form1.subproceso.options[1] = new Option("Logística","1");
	            document.form1.subproceso.options[2] = new Option("Administrativa","2");
	            document.form1.subproceso.options[3] = new Option("Financiera","3");
	            document.form1.identificador.value="SueSop";
	        }
	    }

	    if(document.form1.modelo.value=="4")
        {
			if(document.form1.proceso.value=="1")
	        {
	       		document.form1.subproceso.options[1] = new Option("Entrada 1 Acreditacion","1");
	            document.form1.subproceso.options[2] = new Option("Entrada 2 Acreditacion","2");
	            document.form1.subproceso.options[3] = new Option("Entrada 3 Acreditacion","3");
	            document.form1.identificador.value="AcreEnt";
	        }

	       if(document.form1.proceso.value=="2"){
	       		document.form1.subproceso.options[1] = new Option("Proceso 1 Acreditacion","1");
	            document.form1.subproceso.options[2] = new Option("Proceso 2 Acreditacion","2");
	            document.form1.subproceso.options[3] = new Option("Proceso 3 Acreditacion","3");
	            document.form1.identificador.value="AcrePro";
	        }

	        if(document.form1.proceso.value=="3"){
	        	document.form1.subproceso.options[1] = new Option("Salida 1 Acreditacion","1");
	            document.form1.subproceso.options[2] = new Option("Salida 2 Acreditacion","2");
	            document.form1.subproceso.options[3] = new Option("Salida 3 Acreditacion","3");
	            document.form1.identificador.value="AcreSal";
	        }
	    }
	}

	function cambiar_combo3()
    {
    	if(document.form1.modelo.value=="1")
		{
			if(document.form1.proceso.value=="1")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="InvEntA";
		        }

		       if(document.form1.subproceso.value=="2")
		       {
		       		document.form1.identificador.value="InvEntB";
		        }

		        if(document.form1.subproceso.value=="3")
		        {
		        	document.form1.identificador.value="InvEntC";
		        }
			}

			if(document.form1.proceso.value=="2")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="InvProA";
		        }

		       if(document.form1.subproceso.value=="2")
		       {
		       		document.form1.identificador.value="InvProB";
		        }

		        if(document.form1.subproceso.value=="3")
		        {
		        	document.form1.identificador.value="InvProC";
		        }
			}

			if(document.form1.proceso.value=="3")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="InvSalA";
		        }

		       if(document.form1.subproceso.value=="2")
		       {
		       		document.form1.identificador.value="InvSalB";
		        }

		        if(document.form1.subproceso.value=="3")
		        {
		        	document.form1.identificador.value="InvSalC";
		        }
			}
	    }

	    if(document.form1.modelo.value=="2")
		{
			if(document.form1.proceso.value=="1")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigDirEstA";
		        }

		       if(document.form1.subproceso.value=="2")
		        {
		       		document.form1.identificador.value="SigDirEstB";
		        }

		        if(document.form1.subproceso.value=="3")
		        {
		        	document.form1.identificador.value="SigDirEstC";
		        }
			}

			if(document.form1.proceso.value=="2")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigGesCalA";
		        }

		       if(document.form1.subproceso.value=="2")
		       {
		       		document.form1.identificador.value="SigGesCalB";
		        }
			}

			if(document.form1.proceso.value=="3")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigConInsA";
		        }

		       if(document.form1.subproceso.value=="2")
		       {
		       		document.form1.identificador.value="SigConInsB";
		        }

		   	}
		   	if(document.form1.proceso.value=="4")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigDocA";
		        }

		       if(document.form1.subproceso.value=="2")
		        {
		       		document.form1.identificador.value="SigDocB";
		        }
			}

			if(document.form1.proceso.value=="5")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigExtProA";
		        }

		       if(document.form1.subproceso.value=="2")
		        {
		       		document.form1.identificador.value="SigExtProB";
		        }
		        if(document.form1.subproceso.value=="3")
		        {
		       		document.form1.identificador.value="SigExtProC";
		        }
			}

			if(document.form1.proceso.value=="6")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigInvA";
		        }

		       if(document.form1.subproceso.value=="2")
		       {
		       		document.form1.identificador.value="SigInvB";
		        }

		   	}
		   	if(document.form1.proceso.value=="7")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigAdmRegA";
		        }

		       if(document.form1.subproceso.value=="2")
		        {
		       		document.form1.identificador.value="SigAdmRegB";
		        }
       		}

			if(document.form1.proceso.value=="8")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigBieA";
				}
			}

			if(document.form1.proceso.value=="9")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigGesBibA";
		        }
	       	}
		   	if(document.form1.proceso.value=="10")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigGesLabA";
		        }
			}

			if(document.form1.proceso.value=="11")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigSerCiuA";
		        }
		        if(document.form1.subproceso.value=="2")
		        {
		       		document.form1.identificador.value="SigSerCiuB";
		        }
			}

			if(document.form1.proceso.value=="12")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigGesTalA";
		        }

		       if(document.form1.subproceso.value=="2")
		       {
		       		document.form1.identificador.value="SigGesTalB";
		        }

		   	}
		   	if(document.form1.proceso.value=="13")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigTicA";
		        }

		       if(document.form1.subproceso.value=="2")
		       {
		       		document.form1.identificador.value="SigTicB";
		        }
		        if(document.form1.subproceso.value=="3")
		       {
		       		document.form1.identificador.value="SigTicC";
		        }
			}

			if(document.form1.proceso.value=="14")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigInfFisA";
		        }
		   	}
		   	if(document.form1.proceso.value=="15")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigGesFinA";
		        }
			}

			if(document.form1.proceso.value=="16")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigGesConA";
		        }
			}
			if(document.form1.proceso.value=="17")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SigGesJurA";
		        }
		        if(document.form1.subproceso.value=="2")
		        {
		       		document.form1.identificador.value="SigGesJurB";
		        }
			}
	    }

	    if(document.form1.modelo.value=="3")
		{
			if(document.form1.proceso.value=="1")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SueMisA";
		        }

		       if(document.form1.subproceso.value=="2")
		       {
		       		document.form1.identificador.value="SueMisB";
		        }

		        if(document.form1.subproceso.value=="3")
		        {
		        	document.form1.identificador.value="SueMisC";
		        }
			}

			if(document.form1.proceso.value=="2")
			{
				if(document.form1.subproceso.value=="1")
		        {
		       		document.form1.identificador.value="SueSopA";
		        }

		       if(document.form1.subproceso.value=="2")
		       {
		       		document.form1.identificador.value="SueSopB";
		        }
			}
	    }
    }

    function guardar()
    {
    	var mensaje="";
    	if(document.form1.modelo.selectedIndex==0)
    	{
    		mensaje = mensaje + "	-) Seleccione Modelo de Medición\n";
    	}
    	if(document.form1.proceso.selectedIndex==0)
    	{
    		mensaje = mensaje + "	-) Seleccione Proceso\n";
    	}
    	if(document.form1.subproceso.selectedIndex==0)
    	{
    		mensaje = mensaje + "	-) Seleccione Subproceso\n";
       	}
    	if(document.form1.nombre.value == '')
    	{
    		mensaje = mensaje + "	-) Digite un nombre \n";
    	}
    	if(document.form1.descripcion.value == '')
    	{
    		mensaje = mensaje + "	-) Digite una descripcion \n";
    	}
		if(document.form1.objetivo.value == '')
    	{
    		mensaje = mensaje + "	-) Digite un objetivo \n";
    	}
    	if(document.form1.metodologia.value == '')
    	{
    		mensaje = mensaje + "	-) Digite una metodologia \n";
    	}
    	if(document.form1.responsable.selectedIndex==0)
    	{
    		mensaje = mensaje + "	-) Seleccione Responsable al seguimiento del Indicador \n";
    	}
    	if(document.form1.fuente.value == '')
    	{
    		mensaje = mensaje + "	-) Digite fuente de Información \n";
    	}
    	if(document.form1.docsoporte.value == '')
    	{
    		mensaje = mensaje + "	-) Digite documentos soporte \n";
    	}
    	var x=0;
		for( var i=0;i<document.form1.tipografica.length;i++)
		{
			if(document.form1.tipografica[i].checked){
				x=x+1;
			}
		}
		if(x==0)
		{
			mensaje=mensaje+ "	-) Seleccione por lo menos una opcion para el tipo de grafica \n";
		}

		if(mensaje!="")
		{
			mensaje="Por favor revise los siguientes campos que presentan algún problema: \n"+mensaje;
			alert (mensaje);
		}
		else{
			document.form1.submit();
		}
    }
</script>
</head>
<c:import url="/general.jsp"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" type="time" timeStyle="short" pattern="yyyy" var="ano"/>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<form name="form1" method="post" action='<c:url value="/FichasIndicadores/llenar.jsp"/>'>
	<table class="tablas" width="95%" align="center" border="0">
	<input type="hidden" name="accion" value="4" />
	<tr></tr>
	<tr></tr>
	<tr><td colspan="8" class="renglones" align="center"><b>PRIMER PASO: LLENAR LOS SIGUIENTES DATOS</b></td></tr>
	<caption>CREACIÓN DE INDICADORES</caption>
	<tr>
		<td class="renglones" width="160px">
				<table width="100%" border="0">
					<tr>
						<td width="90%" class="renglones"><b>Modelo de Medición:</b></td>
						<td align="right">
						 <script type="text/javascript">
						 tooltip('Modelo');
						 </script>
						</td>
					</tr>
				</table>
		</td>
		<td>
			<select class="texto" name="modelo" onchange="cambiar_combo1()">
				<option value="0">-------------------</option>
				<option value="1">C & I & D & C</option>
				<option value="2">SIGUD</option>
				<option value="3">SUE</option>
				<option value="4">Acreditación</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="renglones"  id="tituloproceso" style="display:none">
			<table width="100%" border="0">
						<tr>
							<td width="90%" class="renglones" align="left"><b>Proceso:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('Proceso');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td id="proceso" style="display:none">
			<select class="texto" name="proceso" onchange="cambiar_combo2()">
				<option value="0">----</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="renglones" id="titulosubproceso" style="display:none">
			<table width="100%" border="0">
						<tr>
							<td width="90%" class="renglones" align="left"><b>Subproceso:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('Subproceso');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td id="subproceso" style="display:none">
			<select class="texto" name="subproceso" onchange="cambiar_combo3()">
				<option value="0">----</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="renglones"  >
			<table width="100%">
						<tr>
							<td width="90%" class="renglones" align="left"><b>Identificador:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('Identificador');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td><input style="width: 100%" type="text" name="identificador" class="texto" readonly="readonly" id="identificador"></td>
	</tr>
	<tr>
		<td class="renglones"  >
				<table width="100%">
						<tr>
							<td width="90%" class="renglones" align="left"><b>Nombre:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('Nombre');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td><input style="width: 100%" type="text" name="nombre" class="texto"></td>
	</tr>
	<tr>
		<td class="renglones"  >
			<table width="100%" border="0">
						<tr>
							<td width="90%" class="renglones" align="left"><b>Descripción:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('Descripcion');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td class="renglones" ></td>
	</tr>
	<tr>
		<td colspan="2"><textarea style="width:100%;height:50px" name="descripcion" class="texto"></textarea></td>
	</tr>
	<tr>
		<td class="renglones"  >
			<table width="100%" border="0">
						<tr>
							<td class="renglones" align="left"><b>Objetivo:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('Objetivo');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td class="renglones"></td>
	<tr>
		<td colspan="2"><textarea style="width:100%;height:50px" name="objetivo" class="texto"></textarea></td>
	</tr>
	<tr>
		<td class="renglones"  >
			<table width="100%" border="0">
						<tr>
							<td class="renglones" align="left"><b>Metodología:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('Metodologia');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td class="renglones"></td>
	<tr>
		<td colspan="2"><textarea style="width:100%;height:50px" name="metodologia" class="texto"></textarea></td>
	</tr>
	<tr>
		<td class="renglones"  >
			<table width="100%">
						<tr>
							<td class="renglones" align="left"><b>Fecha de Corte:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('FechaCorte');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td><input type="text" name="fechacorte" class="texto" value="31/12/<c:out value='${ano-1} '/>" readonly="readonly"></td>
	</tr>

	<tr>
		<td class="renglones"  >
			<table width="100%">
						<tr>
							<td class="renglones" align="left"><b>Responsable al seguimiento del Indicador:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('RespInd');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td>
			<select class="texto" name="responsable"">
				<option value="0">--------------------------------------------------------</option>
				<option value="15">Centro de Investigaciones y Desarrollo Científico (CIDC)</option>
				<option value="17">Oficina Asesora de Planeación y Control</option>
				<option value="18">Vicerectoria Académica</option>
				<option value="19">Vicerectoria Administrativa y Financiera</option>
				<option value="20">Oficina de Docencia</option>
				<option value="21">Oficina Asesora de Sistemas y RedUDNET</option>
				<option value="22">Decanatura Ciencias y Educación</option>
				<option value="23">Decanatura Ingeniería</option>
				<option value="24">Decanatura Medio Ambiente</option>
				<option value="25">Decanatura Tecnológica</option>
				<option value="26">Decanatura Artes - ASAB</option>
				<option value="27">Centro de Relaciones Interinstitucionales (CERI)</option>
				<option value="28">Instituto de Extensión y de Educación no formal (IDEXUD)</option>
				<option value="29">Autoevaluación y Acreditación de Alta Calidad</option>
				<option value="30">Bienestar Institucional</option>
				<option value="31">Divisón de Recursos Financieros</option>
				<option value="32">Oficina Quejas, reclamos y atención al ciudadano</option>
				<option value="33">Divisón de Recursos Fisicos</option>
				<option value="34">Divisón de Talento Humano </option>
				<option value="35">Oficina Asesora de Control Interno</option>
				<option value="36">Oficina Asesora Jurídica</option>
				<option value="37">Sección Biblioteca</option>
				<option value="38">Secretaría General </option>
				<option value="39">Planeación COLCIENCIAS</option>
				<option value="40">SCIENTI </option>
				<option value="41">CvLAC </option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="renglones"  >
			<table width="100%" border="0">
						<tr>
							<td class="renglones" align="left"><b>Fuente de Información:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('FuenteInfo');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td><input type="text" name="fuente" class="texto" style="width: 90%"></td>
	</tr>
	<tr>
		<td class="renglones"  >
			<table width="100%" border="0">
						<tr>
							<td class="renglones" align="left"><b>Documentos Soporte:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('DocSop');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td><input type="text" style="width:90%" name="docsoporte" class="texto"></td>
	</tr>

	<tr>
		<td class="renglones" style="width:100px" colspan="4" ><b>Opciones de Reporte Grafico para las Variables:</b></td>
	</tr>
	<tr>
		<td colspan="2">
			<table align="center" style="width: 70%">
				<tr>
					<td colspan="4"><input name="tipografica" type="checkbox" value="Torta"/>Torta</td>
					<td colspan="4"><input name="tipografica" type="checkbox" value="Donut"/>Donut</td>
				</tr>
				<tr>
					<td colspan="4"><input name="tipografica" type="checkbox" value="Columnas Horizontales"/>Columnas Horizontales</td>
					<td colspan="4"><input name="tipografica" type="checkbox" value="Columnas Verticales"/>Columnas Verticales</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="renglones"  >
			<table width="100%" border="0">
						<tr>
							<td class="renglones" align="left"><b>Observaciones:</b></td>
							<td align="right">
							 <script type="text/javascript">
							 tooltip('Observacion');
							 </script>
							</td>
						</tr>
			</table>
		</td>
		<td class="renglones"></td>
	<tr>
		<td colspan="2"><textarea style="width:100%;height:50px" name="obervaciones" class="texto"></textarea></td>
	</tr>
	<tr>
		<td colspan="4" align="center"><img src='<c:url value="/comp/img/Siguiente.gif"/>' onclick="guardar()"></td>
	</tr>
	</table>
</form>
</body>
</html>