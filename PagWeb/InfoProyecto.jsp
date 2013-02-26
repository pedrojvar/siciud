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
          <td ><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="18" height="21" align="center" valign="middle" bgcolor="#CCCCCC"><strong>&raquo;</strong></td>
                <td class="datosGrupo" width="448" colspan="2" bgcolor="#CCCCCC"><strong>Datos del Proyecto de Investigación</strong></td>
              </tr>
              <tr>
                <td colspan="2"><img src="imagenes/spacer.gif" width="1" height="8" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="2">
                    <tr>
                      <td width="122" class="item"><strong>Código:</strong></td>
                      <td width="318" class="textoItem" style="text-transform: capitalize" ><c:out value="${sessionScope.infoProyecto.codigoProyecto}" /></td>
                    </tr>
                    <tr>
                      <td width="122" class="item"><strong>Nombre:</strong></td>
                      <td width="318" class="textoItem" style="text-transform: capitalize" ><c:out value="${sessionScope.infoProyecto.nombreProyecto}"/></td>
                    </tr>
                    <tr>
                      <td width="122" class="item"><strong>Director:</strong></td>
                      <c:if test="${sessionScope.infoProyecto.cvlac != null}">
                      	<td class="textoItem" style="text-transform: capitalize;" ><a class="linkGrupo" href="<c:out value="${sessionScope.infoProyecto.cvlac}" />" target="_blank"><c:out value="${sessionScope.infoProyecto.nombreCompletoDirector}" /></a></td>
                      </c:if>
                      <c:if test="${sessionScope.infoProyecto.cvlac == null}">
                      	<td class="textoItem" style="text-transform: capitalize;" ><c:out value="${sessionScope.infoProyecto.nombreCompletoDirector}" /></td>
                      </c:if>
                      
                    </tr>
                    <tr>
                      <td width="122" class="item"><strong>Facultad:</strong></td>
                      <td width="318" class="textoItem" style="text-transform: capitalize" ><c:out value="${sessionScope.infoProyecto.facultad}" /></td>
                    </tr>
                    <tr>
                      <td width="122" class="item"><strong>Fecha de Inicio:</strong></td>
                      <td width="318" class="textoItem" style="text-transform: capitalize" ><c:out value="${sessionScope.infoProyecto.fecha_inicio}" /></td>
                    </tr>
                    <tr>
                      <td width="122" class="item"><strong>Estado:</strong></td>
                      <td width="318" class="textoItem" style="text-transform: capitalize" ><c:out value="${sessionScope.infoProyecto.estado}" /></td>
                    </tr>
                    <tr>
                      <td width="122" class="item"><strong>Grupo/Semillero de Investigación:</strong></td>
                      <td class="textoItem" style="text-transform: capitalize;" ><a class="linkGrupo" href='<c:url value="/web/Consultas.x?accion=2&idGrupo=${sessionScope.infoProyecto.idGrupo}"/>' title="Información detallada del Grupo/Semillero de Investigación"><c:out value="${sessionScope.infoProyecto.nombre_grupo}"/></a></td>
                    </tr>
                    <tr>
                      <td width="122" class="item"><strong>Tipo de Proyecto:</strong></td>
                      <c:if test="${sessionScope.infoProyecto.tipo_proyecto == '1'}">
                      
                      	<td class="textoItem">Financiado por Convocatoria interna</td>
                      
                      </c:if>
                      <c:if test="${sessionScope.infoProyecto.tipo_proyecto == '2'}">
                      
                      	<td class="textoItem">Financiado en Convenio</td>
                      
                      </c:if>
                    </tr>
                 	<tr>
                      <td width="122" class="item"><strong>Nombre Convocatoria/Convenio:</strong></td>
                      <td width="318" class="textoItem" style="text-transform: capitalize" ><c:out value="${sessionScope.infoProyecto.nombre_convocatoria_convenio}" /></td>
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
                  <td class="datosGrupo" bgcolor="#CCCCCC"><strong>Resumen</strong></td>
                </tr>
                <tr>
                  <td><img src="imagenes/spacer.gif" width="1" height="8" /></td>
                  <td><img src="imagenes/spacer.gif" width="1" height="8" /></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="textoItem"><div align="justify"><c:out value="${sessionScope.infoProyecto.resumen}" /></div></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td align="center">&nbsp;</td>
                </tr>
            </table>
       </table>
</body>
</html>