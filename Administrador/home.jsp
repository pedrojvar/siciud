<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<c:import url="/general.jsp"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<c:out value="${sessionScope.login.nick}"/>
</body >
</html>