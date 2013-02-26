<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<jsp:useBean id="filtroWebSemilleros"
	class="cidc.adminGrupos.obj.FiltroPagWebSemillero" scope="session" />
<jsp:setProperty name="filtroWebSemilleros" property="*" />
<jsp:forward page="/web/Consultas.x" />