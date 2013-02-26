<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<c:import url="/general.jsp"/>
<head>
</head>
<body onLoad="mensajeAlert(document.getElementById('msg'));">
<c:if test='${requestScope.msg!=null && requestScope.msg!=""}'>
	<input type="hidden" id='msg' name="msg" value='<c:out value="${requestScope.msg}"/>'>
</c:if>
</head>
<body >
<iframe name="menuInterno" src='<c:url value="/menu.jsp"/>'width="100%" height="100%" frameborder="0">
</iframe>
</body>

</html>