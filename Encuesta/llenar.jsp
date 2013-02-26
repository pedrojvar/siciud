<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="encuesta"
	class="cidc.encuestas.obj.InfoEncuesta" scope="session" />
<jsp:setProperty name="encuesta" property="*" />
<jsp:forward page="/encuestas/AdminEncuesta.x" />