<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="tiempo" class="cidc.proyectosGeneral.obj.Tiempos" scope="session"/>
<jsp:setProperty name="tiempo" property="*"/>
<c:import url="/GestionGeneralProyectos/AdminGeneralProyectos.x"/>