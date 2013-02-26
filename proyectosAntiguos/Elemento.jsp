<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="loginUsuario" class="cidc.general.login.Usuario" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/general.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Elemento</title>
</head>
<body>

<table class="tablas" width="100%">
<CAPTION>Descripción General del Elemento en Inventario</CAPTION>
     <tr>  <td class="renglones" width="75px"><b>Descripción:</b></td>
           <td colspan="3"><c:out value="${requestScope.elemento.descripcion}"/></td>
     </tr>
     <tr>  <td class="renglones"><b>Valor:</b></td>
           <td width="110px"><c:out value="${requestScope.elemento.valor}"/></td>
           <td class="renglones" width="40px"><b>Placa:</b></td>
           <td ><c:out value="${requestScope.elemento.placa}"/></td>
    </tr>
    <tr>   <td class="renglones" width="40px"><b>Marca:</b></td>
           <td width="200px"><c:out value="${requestScope.elemento.marca}"/></td>
           <td class="renglones" width="40px"><b>Serie:</b></td>
           <td><c:out value="${requestScope.elemento.serie}"/></td>
     </tr>
     <tr>  <td class="renglones"><b>Observación:</b></td>
           <td colspan="3"><c:out value="${requestScope.elemento.observacion}"/></td>
     </tr>
</table>

</body>
</html>