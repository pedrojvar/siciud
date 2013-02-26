<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:useBean id="fichaFiltro"
	class="cidc.indicadores.fichasIndicadores.obj.FiltroFichas" scope="session" />
<jsp:setProperty name="fichaFiltro" property="*" />
<jsp:forward page="/fichasIndicadores/AdminFichas.x" />