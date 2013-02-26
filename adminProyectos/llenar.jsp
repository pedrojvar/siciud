<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="filtroProyecto" class="cidc.proyectosGeneral.obj.FiltroGeneralProyecto" scope="session"/>
<jsp:setProperty name="filtroProyecto" property="*"/>
<c:import url="/GestionGeneralProyectos/AdminGeneralProyectos.x"/>