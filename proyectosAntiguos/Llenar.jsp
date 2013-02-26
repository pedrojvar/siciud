<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id = "proyectos" scope = "session" class = "cidc.proyectosAntiguos.obj.ProyectoAntiguoOBJ" />
<jsp:setProperty property = "*" name = "proyectos" />

<c:import url = "/proyectosAntiguos/GestProyectos.x" />
