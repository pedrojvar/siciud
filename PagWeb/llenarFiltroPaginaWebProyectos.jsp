<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<jsp:useBean id="filtroWebProyectos"
	class="cidc.publico.obj.FiltroPagWebProyectos" scope="session" />
<jsp:setProperty name="filtroWebProyectos" property="*" />
<jsp:forward page="/web/Consultas.x" />