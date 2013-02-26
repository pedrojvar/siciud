<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="articulosconv" class="cidc.articulos_Conv.obj.InfoGeneral" scope="session"/>
<jsp:useBean id="persona" class="cidc.inscripSistema.obj.Persona" scope="session"/>
<jsp:setProperty name="articulosconv" property="*"/>
<jsp:setProperty name="persona" property="*"/>
<c:import url="/articulos_Conv/ArticuloConv.x"/>