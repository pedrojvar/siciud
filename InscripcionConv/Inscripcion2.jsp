<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
<c:import url="/general.jsp"/>
<jsp:useBean id="fecha" class="java.util.Date"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" type="time" timeStyle="short" pattern="yyyy" var="ano"/>
<script>
	var nav4=window.Event ? true : false;
	var mensaje="";
	function numeros(eve){
		var key=nav4?eve.which :eve.keyCode;
		return(key<=13 || (key>=48 && key<=57));
	}

	function guardar(){
//	alert("Ud="+document.nuevo.propPresPropRubroUd.length + " contr="+document.nuevo.propPresPropRubroContra.length);
		if(validar()){
			document.nuevo.action='<c:url value="/InscripcionConv/llenar.jsp"/>';
			document.nuevo.submit();
		}
	}

	function validar(){
		mensaje="";
		var k=0;
		if(document.nuevo.propProyCur.selectedIndex==0){
			mensaje=mensaje+"\n-) Proyecto Curricular";
		}
		if(document.nuevo.propInvesPrincId.selectedIndex==0){
			mensaje=mensaje+"\n-) Investigador Principal";
		}
		if(document.nuevo.propNombre.value==""){
			mensaje=mensaje+"\n-) Nombre de la Propuesta";
		}
		if(document.nuevo.propAbstract.value==""){
			mensaje=mensaje+"\n-) Abstract de la Propuesta";
		}
		if(document.nuevo.propPalClave.value==""){
			mensaje=mensaje+"\n-) Palabras Claves de la Propuesta";
		}
		if(document.nuevo.propHorasInv.value=="0" ||document.nuevo.propHorasInv.value==""){
			mensaje=mensaje+"\n-) Horas de dedicación a la semana por parte del investigador principal";
		}

		for(var i=0;i<document.getElementsByName('propCoInvHoras').length;i++){
			if(document.getElementsByName('propCoInvHoras')[i].disabled==false){
				if(document.getElementsByName('propCoInvHoras')[i].value=="")
					k=1;
			}
		}
		if(k==1)
			mensaje=mensaje+"\n-) Horas semanales de dedicación para todos los co-investigadores";
		k=0;
		if(mensaje!=""){
			mensaje="Los siguientes campos son obligatorios: "+mensaje;
			alert (mensaje);
		}else
			return true;
		return false;
	}


	function coInvest(combo){
		var cant=combo.selectedIndex;
		document.getElementById("coInv0").style.display='none';
		for (var i=1;i<10;i++){
			document.getElementById("coInv"+i).style.display='none';
	//		alert("i="+i);
			document.nuevo.propCoInvDocumento[i-1].disabled=true;
			document.nuevo.propCoInvNombres[i-1].disabled=true;
			document.nuevo.propCoInvApellidos[i-1].disabled=true;
			document.nuevo.propCoInvPapel[i-1].disabled=true;
			document.nuevo.propCoInvHoras[i-1].disabled=true;
		}
	//	alert("cantidad="+cant);
		if(cant>0){
			document.getElementById("coInv0").style.display='';
			for (var i=0;i<cant;i++){
	//		alert("i="+i);
				document.nuevo.propCoInvDocumento[i].disabled=false;
				document.nuevo.propCoInvNombres[i].disabled=false;
				document.nuevo.propCoInvApellidos[i].disabled=false;
				document.nuevo.propCoInvPapel[i].disabled=false;
				document.nuevo.propCoInvHoras[i].disabled=false;
				document.getElementById("coInv"+(i+1)).style.display='';
			}
		}
	}

	function ver(rubro,caja){
	var porcRub=0;
		if(document.valRub){
			if(document.valRub.cod.length){
				for(var a=0;a<document.valRub.cod.length;a++){
					if(rubro==document.valRub.cod[a].value){
						if(caja.value==""){
							caja.value="0";
						}
						porcRub=parseFloat(document.valRub.cuantia.value)*(parseInt(document.valRub.val[a].value)/100);
//						alert(porcRub);
						if(parseFloat(caja.value)>porcRub){
							alert("El valor de este rubro no debe ser superor a "+porcRub);
							caja.value=porcRub;
						}
					}
				}
			}else{
				if(rubro==document.valRub.cod.value){
					if(caja.value==""){
						caja.value="0";
					}
					if(parseFloat(caja.value)>parseFloat(document.valRub.val.value)){
						alert("El valor de este rubro no debe ser superor a "+document.valRub.val.value);
						caja.value=document.valRub.val.value;
					}
				}
			}
			sumaCIDC(caja);
		}
	}

	function sumaCIDC(caja){
	var suma=0;
		if(document.nuevo.propPresPropRubroCidc){
			if(document.nuevo.propPresPropRubroCidc.length){
				for(var a=0;a<document.nuevo.propPresPropRubroCidc.length;a++){
					suma=suma+parseFloat(document.nuevo.propPresPropRubroCidc[a].value);
					if(suma>parseFloat(document.valRub.cuantia.value)){
						alert("La sumatoria de los rubros supera el monto total a financiar.\nDebe reducir el valor de alguno de los rubros de modo que \nla sumatoria sea menor o igual a "+document.valRub.cuantia.value);
						suma=suma-parseFloat(caja.value);
						caja.value="0";
					}
				}
			}
			else{
				suma=suma+parseFloat(document.nuevo.propPresPropRubroCidc.value);
				if(suma>parseFloat(document.valRub.cuantia.value)){
					alert("La sumatoria de los rubros supera el monto total a financiar.\nDebe reducir el valor de alguno de los rubros de modo que \nla sumatoria sea menor o igual a "+document.valRub.cuantia.value);
					suma=suma-parseFloat(caja.value);
					caja.value="0";
				}
			}
			document.getElementById('totalCIDC').innerHTML=suma;
		}
	}



	function sumar(columna){
	var suma=0;
		if(document.nuevo){
			if(columna==1){
				if(document.nuevo.propPresPropRubroCidc){
					if(document.nuevo.propPresPropRubroCidc.length){
						for(var a=0;a<document.nuevo.propPresPropRubroCidc.length;a++){
							suma=suma+parseFloat(document.nuevo.propPresPropRubroCidc[a].value);
							parseFloat(document.valRub.cuantia.value);
						}
					}
					else{
						suma=suma+parseFloat(document.nuevo.propPresPropRubroCidc.value);
					}
				}
			}
			if(columna==2){
				if(document.nuevo.propPresPropRubroUd){
					if(document.nuevo.propPresPropRubroUd.length){
						for(var a=0;a<document.nuevo.propPresPropRubroUd.length;a++){
							if(document.nuevo.propPresPropRubroUd[a].value==""){
								document.nuevo.propPresPropRubroUd[a].value="0";
							}
							suma=suma+parseFloat(document.nuevo.propPresPropRubroUd[a].value);
						}
					}
					else{
						if(document.nuevo.propPresPropRubroUd.value==""){
							document.nuevo.propPresPropRubroUd.value="0";
						}
						suma=suma+parseFloat(document.nuevo.propPresPropRubroUd.value);
					}
				}
			}

			if(columna==3){
				if(document.nuevo.propPresPropRubroContra){
					if(document.nuevo.propPresPropRubroContra.length){
						for(var a=0;a<document.nuevo.propPresPropRubroContra.length;a++){
							if(document.nuevo.propPresPropRubroContra[a].value==""){
								document.nuevo.propPresPropRubroContra[a].value="0";
							}
							suma=suma+parseFloat(document.nuevo.propPresPropRubroContra[a].value);
						}
					}
					else{
						if(document.nuevo.propPresPropRubroContra.value==""){
							document.nuevo.propPresPropRubroContra.value="0";
						}
						suma=suma+parseFloat(document.nuevo.propPresPropRubroContra.value);
					}
				}
			}
			if(columna==1){
				document.getElementById('totalCIDC').innerHTML=suma;
			}
			if(columna==2){
				document.getElementById('totalUD').innerHTML=suma;
			}
			if(columna==3){
				document.getElementById('totalCONTRA').innerHTML=suma;
			}
		}
	}

	function calcRubPersonal(){
		var personal=0;
		var sueldo=0;
		var horas=0;
		if(document.nuevo.sueldo.value!=""){
			sueldo=parseInt(document.nuevo.sueldo.value);
		}
		if(document.nuevo.propHorasInv.value!=""){
			horas=parseInt(document.nuevo.propHorasInv.value);
		}
		if(document.nuevo.propHorasInv && document.nuevo.sueldo && document.valRub.duracion){
			personal=(sueldo/160)*(horas*4)*(parseInt(document.valRub.duracion.value))
			document.getElementById("personal").innerHTML=personal;
			document.nuevo.propPresPropRubroUd[0].value=personal;
			sumar(2);
		}
	}

	function check(){
		for(var rubro=1;rubro<document.nuevo.propPresPropRubroUd.length;rubro++){
			if(rubro==0){
				if(document.nuevo.idRubOtros_[0].checked==true){
					document.nuevo.propPresPropRubroUd[0].disabled=false;
					document.nuevo.propPresPropRubroContra[0].disabled=false;
					document.nuevo.idRubOtros[0].disabled=false;
					document.nuevo.propHorasInv.disabled=false;
					document.nuevo.sueldo.disabled=false;
					alert("true rubro 0");
				}else{
					document.nuevo.propPresPropRubroUd[0].disabled=true;
					document.nuevo.propPresPropRubroContra[0].disabled=true;
					document.nuevo.idRubOtros[0].disabled=true;
					alert("falso rubro 0");
				}
			}else{
				if(document.nuevo.idRubOtros_[rubro].checked==true){
					document.nuevo.propPresPropRubroUd[rubro].disabled=false;
					document.nuevo.propPresPropRubroContra[rubro].disabled=false;
					document.nuevo.idRubOtros[rubro].disabled=false;
		//			alert("true2 rubro X");
				}else{
					document.nuevo.propPresPropRubroUd[rubro].disabled=true;
					document.nuevo.propPresPropRubroContra[rubro].disabled=true;
					document.nuevo.idRubOtros[rubro].disabled=true;
					document.nuevo.propPresPropRubroUd[rubro].value='0';
					document.nuevo.propPresPropRubroContra[rubro].value='0';
			//		alert("falso rubro" +rubro);
				}
			}
		}
		sumar(1);
		sumar(2);
		sumar(3);
	}

	function ajaxGrupos(obj,p){
		var val=obj.value;
		if(val!=0){
			document.frmAjaxGrupo.dato[0].value=val;
			document.frmAjaxGrupo.para.value=p;
	 		document.frmAjaxGrupo.target="frameOculto";
			document.frmAjaxGrupo.submit();
		}
	}
</script>
</head>
<body>
	<fieldset style="width:550px;">
		<table cellspacing="2">
			<tr>
				<td class="texto0"><b><c:out value="${sessionScope.datosConv.convAno}"/> - <c:out value="${sessionScope.datosConv.convNumero}"/></b></td>
				<td><b><c:out value="${sessionScope.datosConv.convNombre}"/></b></td>
			</tr>
		</table>
	</fieldset>
	<form name="nuevo" method="post">
	<input type="hidden" name="accion" value="2">
	<input type="hidden" name="propConvId" value='<c:out value="${sessionScope.datosConv.convId}"/>'>
	<fieldset style="width:500px;">
    	<legend class="texto1"><b>Datos Inscripción</b></legend>
			<table class="tablas" width="100%">
				<tr>
					<td width="20%" class="renglones"><b>Facultad:</b></td>
					<td class="renglones"><b>Proyecto Curricular:</b></td>
				</tr>
				<tr>
					<td width="20%">
						<select name="propFacultad" style="width:100%" onchange="ajaxGrupos(this,'5')" >
							<option value="1" <c:if test="${sessionScope.persona.facultad==1}">selected</c:if>>Tecnológica</option>
							<option value="2" <c:if test="${sessionScope.persona.facultad==2}">selected</c:if>>Ingeniería</option>
							<option value="3" <c:if test="${sessionScope.persona.facultad==3}">selected</c:if>>Medio Ambiente</option>
							<option value="4" <c:if test="${sessionScope.persona.facultad==4}">selected</c:if>>Ciencias y Educación</option>
							<option value="5" <c:if test="${sessionScope.persona.facultad==5}">selected</c:if>>Asab</option>
						</select>
					</td>
					<td>
						<select style="width:100%" name="propProyCur">
							<option value='0'>------------------------ </option>
						<c:if test="${!empty sessionScope.ajaxProyCur}">
							<c:forEach begin="0" items="${sessionScope.ajaxProyCur}" var="proy" varStatus="st">
								<option value='<c:out value="${proy.codigo}"/>' <c:if test="${sessionScope.persona.proyCur==proy.codigo}">selected</c:if>><c:out value="${proy.nombre}"/></option>
							</c:forEach>
						</c:if>
						</select>
					</td>
				</tr>
				<tr>
					<td width="50%" class="renglones"><b><span id="para">Grupo Investigación</span></b></td>
					<td width="20%" class="renglones"><b>Investigador Principal:</b></td>
				</tr>
				<tr>
					<td width="50%">
						<select style="width:100%" name="propGrupoInv" onchange="ajaxGrupos(this,'8')">
							<option value='0'>------------------------ </option>
						<c:if test="${!empty sessionScope.ajaxGrupo}">
							<c:forEach begin="0" items="${sessionScope.ajaxGrupo}" var="grup" varStatus="st">
								<option value='<c:out value="${grup.codigo}"/>' <c:if test="${sessionScope.persona.proyCur==grup.codigo}">selected</c:if>><c:out value="${grup.nombre}"/></option>
							</c:forEach>
						</c:if>
						</select>
					</td>
					<td width="30%">
						<input type="hidden" name="propNombreInvestig" value='IEIE'>
						<select style="width:100%" name="propInvesPrincId">
							<option value='0'>------------------------ </option>
						<c:if test="${!empty sessionScope.ajaxInvest}">
							<c:forEach begin="0" items="${sessionScope.ajaxInvest}" var="proy" varStatus="st">
								<option value='<c:out value="${proy.codigo}"/>' <c:if test="${sessionScope.persona.proyCur==proy.codigo}">selected</c:if>><c:out value="${proy.nombre}"/></option>
							</c:forEach>
						</c:if>
						</select>
					</td>
				</tr>

				<tr>
					<td colspan="2" class="renglones"><b>Nombre de la Propuesta:</b></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="propNombre" rows="3" cols="65"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="renglones"><b>Abstract: (Inglés)</b></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="propAbstract" rows="3" cols="65"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="renglones"><b>Palabras Claves:</b></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="propPalClave" rows="1" cols="65"></textarea>
					</td>
				</tr>
			</table>

		</fieldset>
		<fieldset style="width:550px;">
    	<legend class="texto1"><b>Co-Investigadores</b></legend>
			<table class="tablas" width="100%">
				<tr>
					<td class="renglones"><b>Cantidad</b>
						<select name="cantidad" onchange="coInvest(this)">
							<option value='0' selected>0</option>
							<option value='1'>1</option>
							<option value='2'>2</option>
							<option value='3'>3</option>
							<option value='4'>4</option>
							<option value='5'>5</option>
							<option value='6'>6</option>
							<option value='7'>7</option>
							<option value='8'>8</option>
							<option value='9'>9</option>
							<option value='10'>10</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<table width="100%">
							<tr id="coInv0" style="display:none;">
								<td class="renglones"><b>Documento</b></td><td class="renglones"><b>Nombres</b></td><td class="renglones"><b>Apellidos</b></td><td class="renglones"><b>Horas Dedicación Semanal</b></td><td class="renglones"><b>Papel en el proyecto</b></td>
							</tr>
							<tr id="coInv1" style="display:none;">
								<td><input class="cajas10" size="12" type="text" name="propCoInvDocumento" value="" disabled onkeypress="return numeros(event)"></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvNombres" value="" disabled></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvApellidos" value="" disabled></td>
								<td align="right"><input maxlength="2" class="cajas10" size="5" type="text" name="propCoInvHoras" onkeypress="return numeros(event)"style="text-align: right" onkeypress="return numeros(event)" value="0" disabled> H/S</td>
								<td><select name="propCoInvPapel" disabled>
										<option value="Coinvestigador">Coinvestigador</option>
										<option value="Asesor">Asesor</option>
									</select>
								</td>
							</tr>
							<tr id="coInv2" style="display:none;">
								<td><input class="cajas10" size="12" type="text" name="propCoInvDocumento" value="" disabled onkeypress="return numeros(event)"></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvNombres" value="" disabled></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvApellidos" value="" disabled></td>
								<td align="right"><input maxlength="2" class="cajas10" size="5" type="text" name="propCoInvHoras" onkeypress="return numeros(event)" style="text-align: right" onkeypress="return numeros(event)" value="0" disabled> H/S</td>
								<td><select name="propCoInvPapel" disabled>
										<option value="Coinvestigador">Coinvestigador</option>
										<option value="Asesor">Asesor</option>
									</select>
								</td>
							</tr>
							<tr id="coInv3" style="display:none;">
								<td><input class="cajas10" size="12" type="text" name="propCoInvDocumento" value="" disabled onkeypress="return numeros(event)"></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvNombres" value="" disabled></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvApellidos" value="" disabled></td>
								<td align="right"><input maxlength="2" class="cajas10" size="5" type="text" name="propCoInvHoras" onkeypress="return numeros(event)" style="text-align: right"  onkeypress="return numeros(event)" value="0" disabled> H/S</td>
								<td><select name="propCoInvPapel" disabled>
										<option value="Coinvestigador">Coinvestigador</option>
										<option value="Asesor">Asesor</option>
									</select>
								</td>
							</tr>
							<tr id="coInv4" style="display:none;">
								<td><input class="cajas10" size="12" type="text" name="propCoInvDocumento" value="" disabled onkeypress="return numeros(event)"></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvNombres" value="" disabled></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvApellidos" value="" disabled></td>
								<td align="right"><input maxlength="2" class="cajas10" size="5" type="text" name="propCoInvHoras" onkeypress="return numeros(event)" style="text-align: right" onkeypress="return numeros(event)" value="0" disabled> H/S</td>
								<td><select name="propCoInvPapel" disabled>
										<option value="Coinvestigador">Coinvestigador</option>
										<option value="Asesor">Asesor</option>
									</select>
								</td>
							</tr>
							<tr id="coInv5" style="display:none;">
								<td><input class="cajas10" size="12" type="text" name="propCoInvDocumento" value="" disabled onkeypress="return numeros(event)"></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvNombres" value="" disabled></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvApellidos" value="" disabled></td>
								<td align="right"><input maxlength="2" class="cajas10" size="5" type="text" name="propCoInvHoras" onkeypress="return numeros(event)" style="text-align: right" onkeypress="return numeros(event)" value="0" disabled> H/S</td>
								<td><select name="propCoInvPapel" disabled>
										<option value="Coinvestigador">Coinvestigador</option>
										<option value="Asesor">Asesor</option>
									</select>
								</td>
							</tr>
							<tr id="coInv6" style="display:none;">
								<td><input class="cajas10" size="12" type="text" name="propCoInvDocumento" value="" disabled onkeypress="return numeros(event)"></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvNombres" value="" disabled></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvApellidos" value="" disabled></td>
								<td align="right"><input maxlength="2" class="cajas10" size="5" type="text" name="propCoInvHoras" onkeypress="return numeros(event)" style="text-align: right" onkeypress="return numeros(event)" value="0" disabled> H/S</td>
								<td><select name="propCoInvPapel" disabled>
										<option value="Coinvestigador">Coinvestigador</option>
										<option value="Asesor">Asesor</option>
									</select>
								</td>
							</tr>
							<tr id="coInv7" style="display:none;">
								<td><input class="cajas10" size="12" type="text" name="propCoInvDocumento" value="" disabled onkeypress="return numeros(event)"></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvNombres" value="" disabled></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvApellidos" value="" disabled></td>
								<td align="right"><input maxlength="2" class="cajas10" size="5" type="text" name="propCoInvHoras" onkeypress="return numeros(event)" style="text-align: right" onkeypress="return numeros(event)" value="0" disabled> H/S</td>
								<td><select name="propCoInvPapel" disabled>
										<option value="Coinvestigador">Coinvestigador</option>
										<option value="Asesor">Asesor</option>
									</select>
								</td>
							</tr>
							<tr id="coInv8" style="display:none;">
								<td><input class="cajas10" size="12" type="text" name="propCoInvDocumento" value="" disabled onkeypress="return numeros(event)"></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvNombres" value="" disabled></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvApellidos" value="" disabled></td>
								<td align="right"><input maxlength="2" class="cajas10" size="5" type="text" name="propCoInvHoras" onkeypress="return numeros(event)" style="text-align: right" onkeypress="return numeros(event)" value="0" disabled> H/S</td>
								<td><select name="propCoInvPapel" disabled>
										<option value="Coinvestigador">Coinvestigador</option>
										<option value="Asesor">Asesor</option>
									</select>
								</td>
							</tr>
							<tr id="coInv9" style="display:none;">
								<td><input class="cajas10" size="12" type="text" name="propCoInvDocumento" value="" disabled onkeypress="return numeros(event)"></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvNombres" value="" disabled></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvApellidos" value="" disabled></td>
								<td align="right"><input maxlength="2" class="cajas10" size="5" type="text" name="propCoInvHoras" onkeypress="return numeros(event)" style="text-align: right" onkeypress="return numeros(event)" value="0" disabled> H/S</td>
								<td><select name="propCoInvPapel" disabled>
										<option value="Coinvestigador">Coinvestigador</option>
										<option value="Asesor">Asesor</option>
									</select>
								</td>
							</tr>
							<tr id="coInv10" style="display:none;">
								<td><input class="cajas10" size="12" type="text" name="propCoInvDocumento" value="" disabled onkeypress="return numeros(event)"></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvNombres" value="" disabled></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvApellidos" value="" disabled></td>
								<td align="right"><input maxlength="2" class="cajas10" size="5" type="text" name="propCoInvHoras" onkeypress="return numeros(event)" style="text-align: right" onkeypress="return numeros(event)" value="0" disabled> H/S</td>
								<td><select name="propCoInvPapel" disabled>
										<option value="Coinvestigador">Coinvestigador</option>
										<option value="Asesor">Asesor</option>
									</select>
								</td>
							</tr>
							<tr id="coInv11" style="display:none;">
								<td><input class="cajas10" size="12" type="text" name="propCoInvDocumento" value="" disabled onkeypress="return numeros(event)"></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvNombres" value="" disabled></td>
								<td><input class="cajas10" size="20" type="text" name="propCoInvApellidos" value="" disabled></td>
								<td align="right"><input maxlength="2" class="cajas10" size="5" type="text"  name="propCoInvHoras" onkeypress="return numeros(event)" style="text-align: right" onkeypress="return numeros(event)" value="0" disabled> H/S</td>
								<td><select name="propCoInvPapel" disabled>
										<option value="Coinvestigador">Coinvestigador</option>
										<option value="Asesor">Asesor</option>
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset style="width:550px;">
		<legend class="p"><b>Rubros Solicitados</b></legend>
			<c:if test="${!empty requestScope.listaRubrosOBJ}">
		    		<p class="letraRoja" align="center">Favor digitar valores completos, NO en valores de mil</p>
		    		<p class="p0"><b>Observaciones: </b><c:out value="${sessionScope.datosConv.observacion}"/></p>

					<table class="tablas" width="100%">
					<caption >Rubros financiables por el CIDC</caption>
						<c:if test="${empty requestScope.listaRubrosOBJ1}">
						<tr>
							<td class="renglones" align="center"><b><b>No hay Rubros Asociados a esta convocatoria</b></b></td>
						</tr>

						</c:if>
						<c:if test="${!empty requestScope.listaRubrosOBJ1}">
							<tr>
								<td class="renglones"><b>Rubro</b></td>
								<td class="renglones" style="width:50px;" align="center"><b>Valor</b></td>
							</tr>
							<c:forEach begin="0" items="${requestScope.listaRubrosOBJ1}" var="lista">
								<tr>
									<td>
										<input type="hidden" name="idRubCidc" value="<c:out value="${lista.codigo}"/>">
										<c:out value="${lista.nombre}"/>
									</td>
									<td style="width:50px;" align="right"><input style="text-align:right" maxlength="10" size="10" type="text" onkeypress="return numeros(event)" onkeyup="ver(<c:out value="${lista.codigo}"/>,this)" name="propPresPropRubroCidc" value="0"></td>
								</tr>
							</c:forEach>
							<tr>
								<td style="width:300px;" align="right"><b>Total: $</b></td>
								<td align="right"><span id="totalCIDC">&nbsp;</span></td>
							</tr>
						</c:if>
					</table>

					<table class="tablas" border="0" width="100%">
					<caption >Rubros financiables por UD y Contrapartida</caption>
						<tr>
							<td colspan="6">
								<table width="100%">
									<tr>
										<td class="renglones"><b>Cantidad de horas semanales dedicadas por el investigador principal al proyecto de investigación</b></td>
										<td align="right"><input type="text" size="2" maxlength="2" name="propHorasInv" onkeypress="return numeros(event)" onkeyup="calcRubPersonal()"></td>
									</tr>
									<tr>
										<td class="renglones"><b>Salario mensual del investigador principal que recibe por parte de la Universidad Distrital</b></td>
										<td><input type="text" size="8" value="0" name="sueldo" onkeypress="return numeros(event)" onkeyup="calcRubPersonal()"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="renglones" style="width:30px">&nbsp;</td>
							<td class="renglones" colspan="3"><b>Rubro</b></td>
							<td class="renglones" style="width:25px" align="center"><b>UD</b></td>
							<td class="renglones" style="width:25px" align="center"><b>Contrapartida</b></td>
						</tr>
						<c:forEach begin="0" items="${requestScope.listaRubrosOBJ}" var="lista" varStatus="st">
							<tr>

								<td>
									<input type="hidden" name="idRubOtros" value="<c:out value="${lista.codigo}"/>">
									<input type="checkbox" name="idRubOtros_" onchange="check()" <c:if test="${lista.codigo==1}">disabled</c:if>>
								</td>

								<td <c:if test='${lista.codigo!=1}'> colspan='3' </c:if>
									<c:if test='${lista.codigo==1}'> style="width:300px;" </c:if>>
									<c:out value="${lista.nombre}"/>
								</td>
								<c:if test="${lista.codigo==1}">
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td align="right">
										<span id="personal">&nbsp;</span>
										<input type="hidden" name="propPresPropRubroUd" value="0">
									</td>
									<td>
										<span id="personal" >&nbsp;</span>
										<input type="hidden" name="propPresPropRubroContra" value="0">
									</td>
								</c:if>

								<c:if test="${lista.codigo!=1}">
									<td style="width:25px" align="right">
										<input style="text-align:right" maxlength="8" size="8" type="text" onkeypress="return numeros(event)" onkeyup="sumar(2)" name="propPresPropRubroUd" value="0" disabled>
									</td>
									<td style="width:25px" align="right">
										<input style="text-align:right" maxlength="8" size="8" type="text" onkeypress="return numeros(event)" onkeyup="sumar(3)" name="propPresPropRubroContra" value="0" disabled>
									</td>
								</c:if>
							</tr>
						</c:forEach>
						<tr>
							<td>&nbsp;</td>
							<td colspan="3" align="right"><b>Total: $</b></td>
							<td align="right"><span id="totalUD">&nbsp;</span></td>
							<td align="right"><span id="totalCONTRA">&nbsp;</span></td>
						</tr>
					</table>
			</c:if>
		</fieldset>
         <img src="<c:url value="/comp/img/Siguiente.gif"/>" onclick="guardar()">
	</form>
	<table>
		<tr>
			<td style="display:none"><iframe name="frameOculto" id="frameOculto"></iframe></td>
		</tr>
	</table>
	<form method="post" name="frmAjaxGrupo" action="<c:url value="/inscripcionConv/Ajax.x"/>">
		<input type="hidden" name="dato" value=''>
		<input type="hidden" name="dato" value=''>
		<input type="hidden" name="dato" value='1'>
		<input type="hidden" name="para" value=''>
	</form>
	<form name="valRub">
		<input type="hidden" name="duracion" value="<c:out value="${sessionScope.datosConv.convDuracion}"/>">
		<input type="hidden" name="cuantia" value="<c:out value="${sessionScope.datosConv.convCuantia}"/>">
		<c:forEach begin="0" items="${requestScope.listaRubrosOBJ1}" var="lista2">
		<input type="hidden" name="cod" value="<c:out value="${lista2.codigo}"/>">
		<input type="hidden" name="val" value="<c:out value="${lista2.valor}"/>">
		</c:forEach>
	</form>
</body>
<script>
	ajaxGrupos(document.nuevo.propFacultad,'5');
//	calcRubPersonal()
//	sumar(1);
//  sumar(2);
//	sumar(3);
//	coInvest(document.nuevo.cantidad);
</script>
</html>