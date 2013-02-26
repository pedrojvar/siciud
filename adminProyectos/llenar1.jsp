<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="proyecto" class="cidc.proyectosGeneral.obj.Proyecto" scope="session"/>
<jsp:setProperty name="proyecto" property="*"/>
<%	session.setAttribute("accion",request.getParameter("accion"));
	session.setAttribute("fecha",request.getParameter("fecActa"));
	session.setAttribute("prin",request.getParameter("prin"));
	session.setAttribute("papel",request.getParameterValues("papel"));
	session.setAttribute("fecContrato",request.getParameterValues("fecContrato"));
	session.setAttribute("fecActa",request.getParameter("fecActa"));
	System.out.println("llega a esta jsp de puente");
%>
<c:import url="/GestionGeneralProyectos/documentosServlet.x"/>
