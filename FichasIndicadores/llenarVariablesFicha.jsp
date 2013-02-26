<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:useBean id="variable"
	class="cidc.indicadores.bancoVariables.obj.InfoVariables" scope="session" />
<jsp:setProperty name="variable" property="*" />
<jsp:forward page="/fichasIndicadores/AdminFichas.x" />
