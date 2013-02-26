<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<c:import url="/general.jsp"/>
<script>
	function ver(id,st){
		document.res.id.value=id;
		document.res.st.value=st;
		document.res.submit();
	}
</script>
</head>
<body>
	<br>
	<div align="center">
	<a href='<c:url value="/Resultados/Convocatorias/AdminResConv.x" />'><img border="0" src='<c:url value="/comp/img/Atras.gif" />'></a>
	</div>
	<br>
	<form name="res" action='<c:url value="/Resultados/Convocatorias/AdminResConv.x" />'>
	<input type="hidden" name="accion" value="2">
	<input type="hidden" name="id" value="0">
	<input type="hidden" name="st" value="3">
	<input type="hidden" name="corte" value='<c:out value="${requestScope.corte}"/>'>

	<table align="center" class="tablas" cellspacing="1" width="95%">
		<caption>Proyectos Inscritos</caption>
		<tr>
			<td class="renglones"><b>#</b></td>
			<td align="center" class="renglones"><b>Nombre Ponencia</b></td>
			<td width="170px" align="center" class="renglones"><b>Presentador</b></td>
			<td class="renglones"><b>Ver</b></td>
		</tr>
		<tr class="trb">
			<td class="texto">1</td>
			<td class="texto">Los maestros y el contradiscurso</td>
			<td width="170px" class="texto">Pedro Baquero</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(4,1)"></td>
		</tr>
		<tr>
			<td class="texto">2</td>
			<td class="texto">la representacion de los maestros en el Diario el Tiempo</td>
			<td width="170px" class="texto">Sandra  Soler Castillo</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(5,1)"></td>
		</tr>
		<tr class="trb">
			<td class="texto">3</td>
			<td class="texto">Biliteracy promoted through a technology mediated environment for Young learners</td>
			<td width="170px" class="texto">Amparo Clavijo Olarte</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(6,1)"></td>
		</tr>
		<tr >
			<td class="texto">4</td>
			<td class="texto">Anti-Spit Mechanism based on Identity SIP</td>
			<td width="170px" class="texto">Francisco Javier Puente Perez</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(7,2)"></td>
		</tr>
		<tr class="trb">
			<td class="texto">5</td>
			<td class="texto">classification of hipertext for filtrate to information in the web</td>
			<td width="170px" class="texto">Jorge Enrique Rodríguez Rodríguez</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(8,2)"></td>
		</tr>
		<tr>
			<td class="texto">6</td>
			<td class="texto">estudio comparativo de técnicas artificiales para la predicción de una serie de tiempo caótica</td>
			<td width="170px" class="texto">Luis Fernando Pedraza Martinez</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(9,2)"></td>
		</tr>
		<tr class="trb">
			<td class="texto">7</td>
			<td class="texto">Propuesta Tecnologica para la comunicación de personas en situación de discapacidad</td>
			<td width="170px" class="texto">Cesar Augusto Hernandez Suarez</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(10,1)"></td>
		</tr>
		<tr>
			<td class="texto">8</td>
			<td class="texto">Naturalization, legitimization, and circulation of discourse in the Project Colombia Bilingüe en diez años</td>
			<td width="170px" class="texto">Alvaro Quintero Polo</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(11,1)"></td>
		</tr>
		<tr class="trb">
			<td class="texto">9</td>
			<td class="texto">Laboratorio virtual de química soportado en un dispositivo electrónico de interacción</td>
			<td width="170px" class="texto">Lely Adriana Luengas</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(12,2)"></td>
		</tr>
		<tr>
			<td class="texto">10</td>
			<td class="texto">Approach to Quality of Service Evaluation Using Computational Intelligence</td>
			<td width="170px" class="texto">Octavio José Salcedo Parra</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(13,2)"></td>
		</tr>
		<tr class="trb">
			<td class="texto">11</td>
			<td class="texto">reconocimiento del lenguaje de gestos manuales alfabeticos mediante vision artificial</td>
			<td width="170px" class="texto">beatriz nathalia serrato panqueba</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(14,2)"></td>
		</tr>
		<tr>
			<td class="texto">12</td>
			<td class="texto">Diseño e implementación de sensores WS (Wireless Sensors) para la medición de variables asociadas a incendios de tipo estructural como apoyo para le Cuerpo Oficial de Bombero de Bogota</td>
			<td width="170px" class="texto">Edward Hernando Bejarano Barreto</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(15,2)"></td>
		</tr>
		<tr class="trb">
			<td class="texto">13</td>
			<td class="texto">Propuesta tecnologica para la comunicacion de personas en situacion de discapacidad</td>
			<td width="170px" class="texto">Cesar Augusto Hernandez Suarez</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(16,0)"></td>
		</tr>
		<tr>
			<td class="texto">14</td>
			<td class="texto">Virtual Learning Environment for the teaching physics support</td>
			<td width="170px" class="texto">Jeisson Alexander  Hernández Guerrero</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(17,2)"></td>
		</tr>
		<tr class="trb">
			<td class="texto">15</td>
			<td class="texto">Knowledge Portal that promotes the organizational learning in the University and the company</td>
			<td width="170px" class="texto">Gloria Milena Fernandez Nieto</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(18,2)"></td>
		</tr>
		<tr>
			<td class="texto">16</td>
			<td class="texto">Entorno de colaboración 3D basado en una red social para creación y difusión de conocimiento en grupos de investigación</td>
			<td width="170px" class="texto">Oscar Javier Angel Sánchez</td>
			<td ><img border="0" src="/Resultados/comp/img/esc.png" onclick="ver(19,2)"></td>
		</tr>
	</table>
	</form>
</body>
</html>
