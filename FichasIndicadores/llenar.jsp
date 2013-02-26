<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:useBean id="ficha"
	class="cidc.indicadores.fichasIndicadores.obj.FichaIndicadores" scope="session" />
<jsp:setProperty name="ficha" property="*" />
<jsp:forward page="/fichasIndicadores/AdminFichas.x" />