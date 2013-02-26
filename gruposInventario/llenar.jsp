<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="NuevoELementoGrupo" class="cidc.inventario.obj.Elemento" scope="session"/>
<jsp:setProperty name="NuevoELementoGrupo" property="*"/>
<c:import url="/inventario/InventarioGrupos.x"/>