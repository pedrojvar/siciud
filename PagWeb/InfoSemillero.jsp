<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />
<link type='text/css' rel='stylesheet' href='<c:url value="/comp/css/templateCIDC.css"/>'>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<br>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td class="nombreGrupo" align="center" height="40" valign="top"><c:out value="${sessionScope.infoSemillero.nombre}" /></td>
        </tr>
        <tr>
          <td ><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="18" height="21" align="center" valign="middle" bgcolor="#CCCCCC"><strong>&raquo;</strong></td>
                <td class="datosGrupo" width="448" colspan="2" bgcolor="#CCCCCC"><strong>Datos del Semillero</strong></td>
              </tr>
              <tr>
                <td colspan="2"><img src="imagenes/spacer.gif" width="1" height="8" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="2">
                    <tr>
                      <td width="122" class="item"><strong>Nombre:</strong></td>
                      <td width="318" class="textoItem" style="text-transform: capitalize" ><c:out value="${sessionScope.infoSemillero.nombre}"/></td>
                    </tr>
                    <tr>
                      <td width="122" class="item"><strong>Sigla:</strong></td>
                      <td width="318" class="textoItem" style="text-transform:uppercase" ><c:out value="${sessionScope.infoSemillero.siglas}" /></td>
                    </tr>
                    <tr>
                      <td width="122" class="item"><strong>Director:</strong></td>
                      <td width="318" class="textoItem" style="text-transform: capitalize" ><c:out value="${sessionScope.infoSemillero.dirNombre}" /> <c:out value="${sessionScope.infoSemillero.dirApellido}" /></td>
                    </tr>
                    <tr>
                      <td width="122" class="item"><strong>Correo electr&oacute;nico:</strong></td>
                      <td class="textoItem" style="text-transform: lowercase;" ><a class="linkGrupo" href="mailto:<c:out value="${sessionScope.infoSemillero.mail}" /> "><c:out value="${sessionScope.infoSemillero.mail}" /></a></td>
                    </tr>
                    <tr>
                      <td width="122" class="item"><strong>Página Web:</strong></td>
                      <td class="textoItem" style="text-transform: lowercase;" ><a class="linkGrupo" href="<c:out value="${sessionScope.infoSemillero.web}" />" target="_blank"><c:out value="${sessionScope.infoSemillero.web}" /></a></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="2" align="center">&nbsp;</td>
              </tr>
            </table>
        
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="textos">
                <tr>
                  <td width="18" height="21" align="center" valign="middle" bgcolor="#CCCCCC" class="menuppal"><strong>&raquo;</strong></td>
                  <td class="datosGrupo" bgcolor="#CCCCCC"><strong>Descripci&oacute;n</strong></td>
                </tr>
                <tr>
                  <td><img src="imagenes/spacer.gif" width="1" height="8" /></td>
                  <td><img src="imagenes/spacer.gif" width="1" height="8" /></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="textoItem"><div align="justify"><c:out value="${sessionScope.infoSemillero.descripcion}" /></div></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td align="center">&nbsp;</td>
                </tr>
            </table>
            <!-- > 
            
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="textos">
                <tr>
                  <td width="18" height="21" align="center" valign="middle" bgcolor="#CCCCCC" class="menuppal"><strong>&raquo;</strong></td>
                  <td class="datosGrupo" bgcolor="#CCCCCC"><strong>L&iacute;neas de Investigaci&oacute;n</strong></td>
                </tr>
                <tr>
                  <td><img src="imagenes/spacer.gif" width="1" height="8" /></td>
                  <td><img src="imagenes/spacer.gif" width="1" height="8" /></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="textoItem">
                  <ul>
	                    <li>Ciencia de Superficie - Silicio 
						<li>Cálculo de propiedades estructurales de materiales 
						<li>Estudio de propiedades electrónicas de materiales 
						<li>Estudios teóricos de semiconductores 
						<li>Fundamentos de la Materia Condensada
				  </ul></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td align="center">&nbsp;</td>
                </tr>
            </table>
            -->
            
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="textos">
                <tr>
                  <td width="18" height="21" align="center" valign="middle" bgcolor="#CCCCCC" class="menuppal"><strong>&raquo;</strong></td>
                  <td class="datosGrupo" bgcolor="#CCCCCC"><strong>Integrantes del Grupo</strong></td>
                </tr>
                <tr>
                  <td><img src="imagenes/spacer.gif" width="1" height="8" /></td>
                  <td><img src="imagenes/spacer.gif" width="1" height="8" /></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>
                  <ul>
	                  <c:forEach items="${sessionScope.infoSemillero.integrantes}" begin="0" var="integrantes">
						<c:if test="${integrantes.cvlac == '' or integrantes.cvlac == null}">
							<li class="integrante" style="text-transform: capitalize" class="textoItem"><c:out value="${integrantes.nombres}"/> <c:out value="${integrantes.apellidos}"/></li>
						</c:if>
						<c:if test="${integrantes.cvlac != '' and integrantes.cvlac != null}">
							<li style="text-transform: capitalize"><a style="text-transform: capitalize" target="_blank" class="linkGrupo" href='<c:out value="${integrantes.cvlac}"/>' title="Ver CvLac"><c:out value="${integrantes.nombres}"/> <c:out value="${integrantes.apellidos}"/></a></li>
						</c:if>	
					</c:forEach>  
	              </ul></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td align="center">&nbsp;</td>
                </tr>
            </table></td>
            </tr>
           </table>
</body>
</html>