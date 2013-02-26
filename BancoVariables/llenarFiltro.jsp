<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="variableFiltro"
	class="cidc.indicadores.bancoVariables.obj.FiltroVariables" scope="session" />
<jsp:setProperty name="variableFiltro" property="*" />
<jsp:forward page="/bancoVariables/AdminVariables.x" />