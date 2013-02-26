<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<jsp:useBean id="filtroWebGrupos"
	class="cidc.adminGrupos.obj.FiltroPagWebGrupo" scope="session" />
<jsp:setProperty name="filtroWebGrupos" property="*" />
<jsp:forward page="/web/Consultas.x" />