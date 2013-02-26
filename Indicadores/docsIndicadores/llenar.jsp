<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="rae"
	class="cidc.docsIndicadores.obj.InfoRAE" scope="session" />
<jsp:setProperty name="rae" property="*" />
<jsp:forward page="/docsIndicadores/AdminRAE.x" />
