<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<jsp:useBean id="ParametrosOBJ" scope="page" class="cidc.convocatorias.obj.ParametrosOBJ"/>
<c:import url="/general.jsp"/>
<script>
	function guardar(item,frm){
		if(ValidarFormulario(frm)){
			document.getElementById("f"+item).style.display='none';
			document.getElementById("g"+item).style.display='none';
			document.getElementById("carga"+item+"1").style.display='';
			document.getElementById("carga"+item+"2").style.display='';
			frm.submit();
		}
	}

	function ValidarFormulario(forma){
		if(forma.fichero.value==""){
			alert("Debe seleccionar un Archivo para cargar");
			return false;
		}else{
			archi=forma.fichero.value;
			var ext=archi.substr(archi.lastIndexOf('.'),archi.length);
			if(!(ext==".pdf")){
				alert("El archivo debe ser en formato PDF");
				return false;
			}
		}
		return true;
	}

	function temina(){
		alert("At least");
		if((document.frm11.fichero!=null || document.frm11.fichero!="") && (document.frm3.fichero!=null || document.frm3.fichero!="") && (document.frm4.fichero!=null || document.frm4.fichero!="") && (document.frm5.fichero!=null || document.frm5.fichero!=""))
			document.finaliza.submit();
		else
			alert("Para terminar debe cargar los documentos faltantes");
	}
	function guardareq(caja,formulario,iddoc){
                if(ValidarFormularioDoc(caja)){
                        formulario.DocId.value=iddoc;
                        formulario.submit();
        	}
        }
        function ValidarFormularioDoc(forma){
                if(forma.value==""){
                        alert("Debe seleccionar un Archivo para cargar");
                        return false;
                }
                return true;
        }
</script>
</head>
<body>
<br><br>CIDC
	<fieldset style="width:550px;">
    	<legend class="texto1"><b>Documento Propuesta Investigaci�n</b></legend>
			<table>
				<tr>
					<td colspan="2" align="justify">						
						La carga de estos documentos la puede hacer en cualquier momento, pero debe ser antes de la fecha de corte de la convocatoria, de lo contrario su propuesta no ser� tenida en cuenta en el proceso de evaluaci�n.
					</td>
				</tr>
				<tr>
					<td>
					<br>
						<form action='<c:url value="/inscripcionConv/Propuesta.x"/>' name="frm11" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="6">
						<input type="hidden" name="idProp" value='<c:out value="${requestScope.archivos.idPropuesta}" default="${sessionScope.inscripcionConvOBJ.propId}"/>'>
							<table width="100%">
								<tr>
									<td colspan="2" class="renglones"><b>Documento completo de propuesta de investigaci�n</td>
								</tr>
								<tr>
									<td colspan="2"><p class="texto1j">Por favor seleccione el documento correspondiente a la propuesta de investigaci�n y anexos que desea inscribir... (Tama�o m�ximo del archivo: 10 MB). <br>Diligencie las declaraciones de impacto ambiental, pertinencia  social y aporte a la educaci�n.</p><br>
									</td>
								</tr>
								<tr>
								<c:if test='${requestScope.archivos.docCompleto==null or requestScope.archivos.docCompleto==""}'>
									<td id="f1"><input size="60%" type="file" name="fichero"></td>
									<td id="g1" width="75px"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardar(1,document.frm11)"></td>

								</c:if>
								<c:if test="${requestScope.archivos.docCompleto!=null}">
									<td class="rengVerde" align="right" colspan="2"><a class="lblanca" href='<c:url value="/Documentos/Propuestas/${requestScope.archivos.docCompleto}" />'>Ver Documento</a></td>
								</c:if>
								<td id="carga11" style="display:none;"><h5>Un Momento por favor....Almacenando Archivo</h5></td>
								<td id="carga12" style="display:none;"><img  src='<c:url value="/comp/img/cargando.gif"/>'></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
				<c:if test="${sessionScope.datosConv.convAno!=2012}">
				<tr>
					<td>
						<form action='<c:url value="/inscripcionConv/Propuesta.x"/>' name="frm2" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="7">
						<input type="hidden" name="idProp" value='<c:out value="${requestScope.archivos.idPropuesta}" default="${sessionScope.inscripcionConvOBJ.propId}"/>'>
							<table width="100%">
								<tr>
									<td colspan="2" class="renglones"><b>Documentos anexos</b></td>
								</tr>
								<tr>
									<td colspan="2"><p class="texto1j">Un solo documento en formato PDF con los siguientes Datos: Carta de pertinencia social, Impacto ambiental, aporte a la educaci�n y Acta de posesi�n (El Acta de posesi�n es �NICAMENTE para propuestas que se inscriban en la convocatoria 2009-7)</p></td>
								</tr>
								<tr>
								<c:if test='${requestScope.archivos.docAnexo==null or requestScope.archivos.docAnexo==""}'>
									<td id="f2"><input size="60%" type="file" name="fichero"></td>
									<td id="g2" width="75px"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardar(2,document.frm2)"></td>
								</c:if>
								<c:if test="${requestScope.archivos.docAnexo!=null}">
									<td class="rengVerde" align="right" colspan="2"><a class="lblanca" href='<c:url value="/Documentos/Propuestas/${requestScope.archivos.docAnexo}" />'>Ver Documento</a></td>
								</c:if>
								<td id="carga21" style="display:none;"><h5>Un Momento por favor....Almacenando Archivo</h5></td>
								<td id="carga22" style="display:none;"><img  src='<c:url value="/comp/img/cargando.gif"/>'></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
				</c:if>
				<c:if test="${sessionScope.datosConv.convAno==2012 and (sessionScope.datosConv.convNumero==5 or sessionScope.datosConv.convNumero==6 or sessionScope.datosConv.convNumero==12)}">
				<tr>
					<td>
						<form action='<c:url value="/inscripcionConv/Propuesta.x"/>' name="frm3" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="8">
						<input type="hidden" name="idProp" value='<c:out value="${requestScope.archivos.idPropuesta}" default="${sessionScope.inscripcionConvOBJ.propId}"/>'>
							<table width="100%">
								<th colspan="2" align="left">Aval grupo de investigaci�n</th>
								<tr>
									<td colspan="2"><p class="texto1j">Carta de aval del grupo o semillero de investigaci�n para la presente convocatoria, firmada por el director o tutor seg�n corresponda.</p></td>
								</tr>
								<tr>
								<c:if test='${requestScope.archivos.docAvalGrupo==null or requestScope.archivos.docAvalGrupo==""}'>
									<td id="f3"><input size="60%" type="file" name="fichero"></td>
									<td id="g3" width="75px"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardar(3,document.frm3)"></td>
								</c:if>
								<c:if test="${requestScope.archivos.docAvalGrupo!=null}">
									<td class="rengVerde" align="right" colspan="2"><a class="lblanca" href='<c:url value="/Documentos/Propuestas/${requestScope.archivos.docAvalGrupo}" />'>Ver Documento</a></td>
								</c:if>
								<td id="carga31" style="display:none;"><h5>Un Momento por favor....Almacenando Archivo</h5></td>
								<td id="carga32" style="display:none;"><img  src='<c:url value="/comp/img/cargando.gif"/>'></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>				
				</c:if>	
				<c:if test="${sessionScope.datosConv.convAno==2012 and (sessionScope.datosConv.convNumero==5 or sessionScope.datosConv.convNumero==6)}">
				<tr>
					<td>
						<form action='<c:url value="/inscripcionConv/Propuesta.x"/>' name="frm4" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="9">
						<input type="hidden" name="idProp" value='<c:out value="${requestScope.archivos.idPropuesta}" default="${sessionScope.inscripcionConvOBJ.propId}"/>'>
							<table width="100%">
								<th colspan="2" align="left">Carta director del proyecto.</th>
								<tr>
									<td colspan="2"><p class="texto1j">Carta del director del proyecto de grado en donde manifieste la intenci�n de participar en la presente convocatoria.</p></td>
								</tr>
								<tr>
								<c:if test='${requestScope.archivos.docAvalDir==null or requestScope.archivos.docAvalDir==""}'>
									<td id="f4"><input size="60%" type="file" name="fichero"></td>
									<td id="g4" width="75px"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardar(4,document.frm4)"></td>
								</c:if>
								<c:if test="${requestScope.archivos.docAvalDir!=null}">
									<td class="rengVerde" align="right" colspan="2"><a class="lblanca" href='<c:url value="/Documentos/Propuestas/${requestScope.archivos.docAvalDir}" />'>Ver Documento</a></td>
								</c:if>
								<td id="carga41" style="display:none;"><h5>Un Momento por favor....Almacenando Archivo</h5></td>
								<td id="carga42" style="display:none;"><img  src='<c:url value="/comp/img/cargando.gif"/>'></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>				
				</c:if>				
				<c:if test="${sessionScope.datosConv.convAno==2012 and (sessionScope.datosConv.convNumero==5 or sessionScope.datosConv.convNumero==6)}">
				<tr>
					<td>
						<form action='<c:url value="/inscripcionConv/Propuesta.x"/>' name="frm5" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="10">
						<input type="hidden" name="idProp" value='<c:out value="${requestScope.archivos.idPropuesta}" default="${sessionScope.inscripcionConvOBJ.propId}"/>'>
							<table width="100%">
								<th colspan="2" align="left">Certificado Consejo Cirrucular.</th>
								<tr>
									<td colspan="2"><p class="texto1j">Certificado de aprobaci�n del anteproyecto de grado en modalidad investigaci�n, emitido por el Consejo Curricular al que pertenece(n) el (los) estudiante(s).</p></td>
								</tr>
								<tr>
								<c:if test='${requestScope.archivos.docCerCurr==null or requestScope.archivos.docCerCurr==""}'>
									<td id="f5"><input size="60%" type="file" name="fichero"></td>
									<td id="g5" width="75px"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardar(5,document.frm5)"></td>
								</c:if>
								<c:if test="${requestScope.archivos.docCerCurr!=null}">
									<td class="rengVerde" align="right" colspan="2"><a class="lblanca" href='<c:url value="/Documentos/Propuestas/${requestScope.archivos.docCerCurr}" />'>Ver Documento</a></td>
								</c:if>
								<td id="carga51" style="display:none;"><h5>Un Momento por favor....Almacenando Archivo</h5></td>
								<td id="carga52" style="display:none;"><img  src='<c:url value="/comp/img/cargando.gif"/>'></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>				
				</c:if>				
<%-- --%>

                <tr>
                        <td>
                                <form action='<c:url value="/RequisitosArchivoProy.x"/>' name="frmDoc" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="14">
                                <input type="hidden" name="propConvId" value="${sessionScope.datosConv.convId}">
                                <input type="hidden" name="DocId" value="${lista2.codigo}">
				<input type="hidden" name="idPropuesta" value="${sessionScope.inscripcionConvOBJ.propId}">
                                        <table width="100%">
				<th colspan="2" align="center">Documentos Requeridos</th>
                                                <c:forEach begin="0" items="${sessionScope.listaDocOBJ}" var="lista2" varStatus="st">
                                                <tr>
                                                        <td colspan="2" class="renglones"><b><c:out value="${lista2.docNombre}"/>-<c:out value="${sessionScope.datosConv.convId}"/>-<c:out value="${lista2.codigo}"/></b></td>
                                                </tr>
                                                <tr>
                                                        <td colspan="2"><p class="texto1j">Formato PDF</p></td>
                                                </tr>
                                                <tr>
                                                        <td><input size="60%" type="file" name="archivo"></td>
                                                        <td width="75px"><img src='<c:url value="/comp/img/Guardar.gif"/>' onclick="guardareq(document.frmDoc.archivo,document.frmDoc,<c:out value="${lista2.codigo}" />)"></td>
                                        </tr>                                        </c:forEach>
                                                </tr>
                                        </table>
                                </form>
                        </td>
                </tr>
<%-- --%>
				<tr>
					<td align="center">
					<form action='<c:url value="/inscripcionConv/Inscripcion.x" />' method="post" name="finaliza">
						<input type="hidden" name="accion" value="1">
						<input type="hidden" name="terminar" value="si">
						<input type="hidden" name="idProp" value='<c:out value="${requestScope.archivos.idPropuesta}"/>'>				
						<img src='<c:url value="/comp/img/Terminar.gif" />' onclick='temina()'/>					
					</form>
					</td>
				</tr>

			</table>
			<br>
	</fieldset>
	<br>
</body>
</html>
